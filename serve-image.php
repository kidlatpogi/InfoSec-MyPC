<?php
/**
 * Secure Image Server
 * Serves images from the assets directory with proper headers
 */

// Get the requested path
$path = isset($_GET['path']) ? $_GET['path'] : '';

// Remove leading slash if present
$path = ltrim($path, '/');

// Build the full file path
$basePath = __DIR__;
$fullPath = $basePath . '/' . $path;

// Resolve the real path to prevent directory traversal attacks
$realPath = realpath($fullPath);
$realBasePath = realpath($basePath);

// Security check: ensure the file is within the base directory
if ($realPath === false || strpos($realPath, $realBasePath) !== 0) {
    header("HTTP/1.0 404 Not Found");
    echo "File not found";
    exit;
}

// Check if file exists
if (!file_exists($realPath) || !is_file($realPath)) {
    header("HTTP/1.0 404 Not Found");
    echo "File not found";
    exit;
}

// Get file extension and set appropriate content type
$extension = strtolower(pathinfo($realPath, PATHINFO_EXTENSION));
$contentTypes = [
    'jpg'  => 'image/jpeg',
    'jpeg' => 'image/jpeg',
    'png'  => 'image/png',
    'gif'  => 'image/gif',
    'webp' => 'image/webp',
    'svg'  => 'image/svg+xml',
    'bmp'  => 'image/bmp',
    'ico'  => 'image/x-icon'
];

$contentType = isset($contentTypes[$extension]) ? $contentTypes[$extension] : 'application/octet-stream';

// Set headers
header('Content-Type: ' . $contentType);
header('Content-Length: ' . filesize($realPath));
header('Cache-Control: public, max-age=31536000'); // Cache for 1 year
header('Expires: ' . gmdate('D, d M Y H:i:s', time() + 31536000) . ' GMT');

// Output the file
readfile($realPath);
exit;
?>
