<?php

return [
    'client_id' => env('WHEEL_CLIENT_ID'),
    'client_secret' => env('WHEEL_CLIENT_SECRET'),
    'client_active' => env('WHEEL_CLIENT_ACTIVE', true),
    'signature_ttl' => env('WHEEL_SIGNATURE_TTL', 300),
];
