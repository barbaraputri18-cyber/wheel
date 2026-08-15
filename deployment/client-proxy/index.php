<?php

declare(strict_types=1);

const UPSTREAM_ORIGIN = 'https://undianspin.com';
const PUBLIC_ORIGIN = 'https://spinberkat.com';

$requestUri = $_SERVER['REQUEST_URI'] ?? '/';
$requestPath = rawurldecode((string) (parse_url($requestUri, PHP_URL_PATH) ?: '/'));

if ($requestPath === '/__gateway_health') {
    header('Content-Type: application/json');
    echo json_encode(['status' => 'ok']);
    exit;
}

if (preg_match('#^/(admin|login|logout|password)(?:/|$)#i', $requestPath)) {
    http_response_code(404);
    exit('Not Found');
}

$upstreamUrl = UPSTREAM_ORIGIN . $requestUri;
$method = strtoupper($_SERVER['REQUEST_METHOD'] ?? 'GET');
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
    curl_setopt($curl, CURLOPT_POSTFIELDS, file_get_contents('php://input'));
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
            ['https://undianspin.com', 'http://undianspin.com', 'domain=undianspin.com'],
            ['https://spinberkat.com', 'https://spinberkat.com', 'domain=spinberkat.com'],
            $value
        );
    }

    header($name . ': ' . $value, strcasecmp($name, 'Set-Cookie') !== 0);
}

$isTextResponse = preg_match('#^(text/|application/(json|javascript|xml|xhtml\+xml))#i', $contentType) === 1;
if ($isTextResponse && is_string($body)) {
    $body = str_ireplace(
        ['https://undianspin.com', 'http://undianspin.com', '//undianspin.com'],
        ['https://spinberkat.com', 'https://spinberkat.com', '//spinberkat.com'],
        $body
    );
}

echo $body;

