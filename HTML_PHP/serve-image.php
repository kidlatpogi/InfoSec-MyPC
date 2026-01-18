<?php
/**
 * Image Serving Script
 * Safely serves product images from the assets directory
 * Prevents directory traversal attacks and handles image requests
 * 
 * Note: Security headers (CSP, X-Frame-Options, etc.) are set by .htaccess
 * to avoid duplicate headers
 */

// Remove potentially leaky headers
header_remove('X-Powered-By');

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
    // Log missing file
    error_log("Image not found: " . $path . " | Real: " . $realPath . " | Assets: " . $assetsDir);
    
    // Try to find a placeholder or return 404
    // For now, return placeholder color
    http_response_code(404);
    
    // Return a simple 1x1 transparent PNG
    header('Content-Type: image/png');
    echo base64_decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==');
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
