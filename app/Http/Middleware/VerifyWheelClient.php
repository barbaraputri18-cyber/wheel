<?php

namespace App\Http\Middleware;

use Closure;

class VerifyWheelClient
{
    public function handle($request, Closure $next)
    {
        if (!config('wheel.client_active')) {
            return response()->json(['message' => 'Client access is inactive.'], 403);
        }

        $clientId = (string) $request->header('X-Wheel-Client', '');
        $timestamp = (string) $request->header('X-Wheel-Timestamp', '');
        $signature = (string) $request->header('X-Wheel-Signature', '');
        $expectedClientId = (string) config('wheel.client_id', '');
        $secret = (string) config('wheel.client_secret', '');
        $ttl = (int) config('wheel.signature_ttl', 300);

        if ($expectedClientId === '' || $secret === '' || !hash_equals($expectedClientId, $clientId)) {
            return response()->json(['message' => 'Invalid client credentials.'], 401);
        }

        if (!ctype_digit($timestamp) || abs(time() - (int) $timestamp) > $ttl) {
            return response()->json(['message' => 'Expired client request.'], 401);
        }

        $payload = implode("\n", [
            strtoupper($request->method()),
            $clientId,
            $timestamp,
            hash('sha256', (string) $request->getContent()),
        ]);
        $expectedSignature = hash_hmac('sha256', $payload, $secret);

        if ($signature === '' || !hash_equals($expectedSignature, $signature)) {
            return response()->json(['message' => 'Invalid client signature.'], 401);
        }

        return $next($request);
    }
}
