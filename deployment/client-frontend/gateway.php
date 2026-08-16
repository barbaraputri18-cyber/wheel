<?php

declare(strict_types=1);

const UPSTREAM_ORIGIN = 'https://undianspin.com';
const UPSTREAM_BASE_PATH = '/spinberkat';
const PUBLIC_ORIGIN = 'https://spinberkat.com';

$requestUri = $_SERVER['REQUEST_URI'] ?? '/';
$requestPath = rawurldecode((string) (parse_url($requestUri, PHP_URL_PATH) ?: '/'));

if ($requestPath === '/__gateway_health') {
    header('Content-Type: application/json');
    echo json_encode(['status' => 'ok']);
    exit;
}

$upstreamUrl = UPSTREAM_ORIGIN . UPSTREAM_BASE_PATH . $requestUri;
$method = strtoupper($_SERVER['REQUEST_METHOD'] ?? 'GET');
$requestBody = in_array($method, ['GET', 'HEAD'], true) ? '' : (string) file_get_contents('php://input');
$responseHeaders = [];
$contentType = '';

$forwardHeaders = [
    'Host: undianspin.com',
    'Accept: ' . ($_SERVER['HTTP_ACCEPT'] ?? '*/*'),
    'Accept-Language: ' . ($_SERVER['HTTP_ACCEPT_LANGUAGE'] ?? 'en'),
    'User-Agent: ' . ($_SERVER['HTTP_USER_AGENT'] ?? 'WheelGateway/1.0'),
    'X-Forwarded-Host: spinberkat.com',
    'X-Forwarded-Proto: https',
];

$clientIp = $_SERVER['HTTP_CF_CONNECTING_IP'] ?? $_SERVER['REMOTE_ADDR'] ?? '';
if ($clientIp !== '') {
    $forwardHeaders[] = 'X-Forwarded-For: ' . $clientIp;
}

if (!empty($_SERVER['HTTP_COOKIE'])) {
    $forwardHeaders[] = 'Cookie: ' . $_SERVER['HTTP_COOKIE'];
}

if (!empty($_SERVER['CONTENT_TYPE'])) {
    $forwardHeaders[] = 'Content-Type: ' . $_SERVER['CONTENT_TYPE'];
}

if (!empty($_SERVER['HTTP_X_REQUESTED_WITH'])) {
    $forwardHeaders[] = 'X-Requested-With: ' . $_SERVER['HTTP_X_REQUESTED_WITH'];
}

if (preg_match('#^/api/client(?:/|$)#i', $requestPath)) {
    $credentialsPath = '/home/spinberkat.com/.wheel-client.env';
    $credentials = is_file($credentialsPath)
        ? parse_ini_file($credentialsPath, false, INI_SCANNER_RAW)
        : false;

    $clientId = is_array($credentials)
        ? ($credentials['CLIENT_ID'] ?? $credentials['WHEEL_CLIENT_ID'] ?? '')
        : '';
    $clientSecret = is_array($credentials)
        ? ($credentials['CLIENT_SECRET'] ?? $credentials['WHEEL_CLIENT_SECRET'] ?? '')
        : '';

    if ($clientId === '' || $clientSecret === '') {
        error_log('Wheel gateway client credentials are missing');
        http_response_code(503);
        header('Content-Type: application/json');
        exit(json_encode(['message' => 'Client gateway is not configured.']));
    }

    $timestamp = (string) time();
    $signaturePayload = implode("\n", [
        $method,
        $clientId,
        $timestamp,
        hash('sha256', $requestBody),
    ]);
    $forwardHeaders[] = 'X-Wheel-Client: ' . $clientId;
    $forwardHeaders[] = 'X-Wheel-Timestamp: ' . $timestamp;
    $forwardHeaders[] = 'X-Wheel-Signature: ' . hash_hmac('sha256', $signaturePayload, $clientSecret);
}

$curl = curl_init($upstreamUrl);
curl_setopt_array($curl, [
    CURLOPT_CUSTOMREQUEST => $method,
    CURLOPT_HTTPHEADER => $forwardHeaders,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_FOLLOWLOCATION => false,
    CURLOPT_CONNECTTIMEOUT => 10,
    CURLOPT_TIMEOUT => 60,
    CURLOPT_ENCODING => '',
    CURLOPT_SSL_VERIFYPEER => true,
    CURLOPT_SSL_VERIFYHOST => 2,
    CURLOPT_HEADERFUNCTION => static function ($curlHandle, string $headerLine) use (&$responseHeaders, &$contentType): int {
        $length = strlen($headerLine);
        $headerLine = trim($headerLine);

        if ($headerLine === '' || stripos($headerLine, 'HTTP/') === 0) {
            return $length;
        }

        $parts = explode(':', $headerLine, 2);
        if (count($parts) !== 2) {
            return $length;
        }

        $name = trim($parts[0]);
        $value = trim($parts[1]);

        if (strcasecmp($name, 'Content-Type') === 0) {
            $contentType = $value;
        }

        $responseHeaders[] = [$name, $value];
        return $length;
    },
]);

if (!in_array($method, ['GET', 'HEAD'], true)) {
    curl_setopt($curl, CURLOPT_POSTFIELDS, $requestBody);
}

if ($method === 'HEAD') {
    curl_setopt($curl, CURLOPT_NOBODY, true);
}

$body = curl_exec($curl);
$curlError = curl_error($curl);
$statusCode = (int) curl_getinfo($curl, CURLINFO_RESPONSE_CODE);
curl_close($curl);

if ($body === false || $statusCode === 0) {
    error_log('Wheel gateway upstream error: ' . $curlError);
    http_response_code(502);
    exit('Service temporarily unavailable');
}

http_response_code($statusCode);

$blockedResponseHeaders = [
    'connection',
    'content-encoding',
    'content-length',
    'keep-alive',
    'server',
    'transfer-encoding',
    'upgrade',
];

foreach ($responseHeaders as [$name, $value]) {
    if (in_array(strtolower($name), $blockedResponseHeaders, true)) {
        continue;
    }

    if (strcasecmp($name, 'Location') === 0 || strcasecmp($name, 'Set-Cookie') === 0) {
        $value = str_ireplace(
            [
                'https://undianspin.com/spinberkat',
                'http://undianspin.com/spinberkat',
                '//undianspin.com/spinberkat',
                'domain=undianspin.com',
            ],
            [
                'https://spinberkat.com',
                'https://spinberkat.com',
                '//spinberkat.com',
                'domain=spinberkat.com',
            ],
            $value
        );
    }

    header($name . ': ' . $value, strcasecmp($name, 'Set-Cookie') !== 0);
}

$isTextResponse = preg_match('#^(text/|application/(json|javascript|xml|xhtml\+xml))#i', $contentType) === 1;
if ($isTextResponse && is_string($body)) {
    $body = str_ireplace(
        [
            'https://undianspin.com/spinberkat',
            'http://undianspin.com/spinberkat',
            '//undianspin.com/spinberkat',
        ],
        ['https://spinberkat.com', 'https://spinberkat.com', '//spinberkat.com'],
        $body
    );
}

echo $body;
