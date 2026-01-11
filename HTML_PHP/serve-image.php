<?php
/**
 * Image Serving Script
 * Safely serves product images from the assets directory
 * Prevents directory traversal attacks and handles image requests
 */

// Disable output buffering for direct image streaming
if (ob_get_level()) {
    ob_end_clean();
}

// Get the image path from query parameter
$path = isset($_GET['path']) ? urldecode($_GET['path']) : null;

// Validate input
if (!$path) {
    http_response_code(400);
    header('Content-Type: image/png');
    exit;
}

// Remove leading slash for file_exists check
$cleanPath = ltrim($path, '/');

// Security: Prevent directory traversal
if (strpos($cleanPath, '..') !== false || strpos($cleanPath, '~') !== false) {
    http_response_code(403);
    header('Content-Type: image/png');
    exit;
}

// Build full file path
$filePath = __DIR__ . '/../' . $cleanPath;

// Verify file exists and is within assets directory
$realPath = realpath($filePath);
$assetsDir = realpath(__DIR__ . '/../assets');

if (!$realPath || strpos($realPath, $assetsDir) !== 0 || !file_exists($realPath)) {
    // Return placeholder if file not found
    http_response_code(404);
    header('Content-Type: image/png');
    exit;
}

// Determine MIME type from file extension
$extension = strtolower(pathinfo($realPath, PATHINFO_EXTENSION));
$mimeTypes = [
    'jpg' => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'png' => 'image/png',
    'gif' => 'image/gif',
    'webp' => 'image/webp',
    'svg' => 'image/svg+xml',
    'ico' => 'image/x-icon'
];

$mimeType = $mimeTypes[$extension] ?? 'image/jpeg';

// Set headers
header('Content-Type: ' . $mimeType);
header('Cache-Control: public, max-age=86400'); // Cache for 24 hours
header('Content-Length: ' . filesize($realPath));

// Stream the file
readfile($realPath);
exit;
?>
