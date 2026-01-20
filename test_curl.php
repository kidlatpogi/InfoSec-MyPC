<?php
// Direct test of the URL behavior
$url = "http://localhost/HTML_PHP/admin_auth.php";

echo "Testing URL: $url\n\n";

// Create POST data
$post_data = http_build_query([
    'action' => 'adminLogin',
    'email' => 'superadmin@mypc.com',
    'password' => '@dmin123'
]);

// Create stream context for POST request
$options = [
    'http' => [
        'method' => 'POST',
        'header' => 'Content-Type: application/x-www-form-urlencoded',
        'content' => $post_data,
        'ignore_errors' => true  // Get response even for error status codes
    ]
];

$context = stream_context_create($options);
$response = @file_get_contents($url, false, $context);

// Get response headers
if (isset($http_response_header)) {
    echo "Response Headers:\n";
    foreach ($http_response_header as $header) {
        echo "  $header\n";
    }
    echo "\n";
}

echo "Response Body:\n";
echo $response;
echo "\n\n";

// Also try to parse as JSON if it looks like JSON
if ($response && $response[0] === '{') {
    echo "Parsed as JSON:\n";
    print_r(json_decode($response, true));
}
?>
