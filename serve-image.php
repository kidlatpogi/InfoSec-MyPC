<?php
/**
 * Image Serving Script
 * Handles image requests with proper URL decoding and caching
 */

// Get the requested path from query parameter
$imagePath = isset($_GET['path']) ? $_GET['path'] : '';

if (!$imagePath) {
    http_response_code(400);
    die('No image path provided');
}

// Decode the URL (handles %20 spaces and other encodings)
$imagePath = urldecode($imagePath);

// Security: prevent directory traversal
$imagePath = str_replace('..', '', $imagePath);
$imagePath = str_replace('\\', '/', $imagePath);

// Construct full file path
$baseDir = dirname(__FILE__);
$fullPath = $baseDir . $imagePath;

// Verify the file exists and is in the assets directory
if (!file_exists($fullPath) || !is_file($fullPath)) {
    http_response_code(404);
    die('Image not found: ' . htmlspecialchars($fullPath));
}

// Ensure the file is within the assets directory
$realPath = realpath($fullPath);
$realAssetsPath = realpath($baseDir . '/assets');

if ($realAssetsPath === false || strpos($realPath, $realAssetsPath) !== 0) {
    http_response_code(403);
    die('Access denied');
}

// Determine content type
$ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
$mimeTypes = [
    'jpg' => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'png' => 'image/png',
    'gif' => 'image/gif',
    'webp' => 'image/webp',
    'svg' => 'image/svg+xml'
];

$contentType = $mimeTypes[$ext] ?? 'application/octet-stream';

// Set cache headers
header('Content-Type: ' . $contentType);
header('Cache-Control: public, max-age=31536000'); // 1 year cache
header('Expires: ' . gmdate('D, d M Y H:i:s \G\M\T', time() + 31536000));

// Send the file
readfile($fullPath);
