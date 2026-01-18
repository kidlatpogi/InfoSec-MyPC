<?php
/**
 * Server Router for PHP Built-in Development Server
 * 
 * This file acts as a front controller when using PHP's built-in server.
 * It applies security headers to ALL responses including static files.
 * 
 * Usage: php -S localhost:8000 server.php
 */

// Security headers to apply to all responses
function applySecurityHeaders($isApi = false, $isImage = false) {
    // Remove potentially leaky headers
    header_remove('X-Powered-By');
    
    // Basic security headers for all responses
    header('X-Content-Type-Options: nosniff');
    header('X-Frame-Options: DENY');
    header('X-XSS-Protection: 1; mode=block');
    header('Referrer-Policy: strict-origin-when-cross-origin');
    header('Permissions-Policy: geolocation=(), microphone=(), camera=(), payment=(), usb=()');
    
    // CORS - restrictive by default
    $origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
    $allowedOrigins = [
        'http://localhost:8000',
        'http://127.0.0.1:8000',
        'http://localhost',
        'http://127.0.0.1',
    ];
    
    if (in_array($origin, $allowedOrigins)) {
        header('Access-Control-Allow-Origin: ' . $origin);
        header('Vary: Origin');
    }
    
    if ($isApi) {
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
        header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
        header('Access-Control-Allow-Credentials: true');
    }
    
    // Cache control
    if ($isImage) {
        header('Cache-Control: public, max-age=86400');
    } else {
        header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
        header('Pragma: no-cache');
    }
    
    // CSP - different for API vs HTML
    if ($isApi) {
        header("Content-Security-Policy: default-src 'none'; frame-ancestors 'none'");
    } else if (!$isImage) {
        // CSP for HTML pages - allowing unsafe-inline for styles only
        $csp = "default-src 'self'; " .
               "script-src 'self'; " .
               "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; " .
               "style-src-elem 'self' 'unsafe-inline' https://fonts.googleapis.com; " .
               "img-src 'self' data: https: blob:; " .
               "font-src 'self' https://fonts.gstatic.com; " .
               "connect-src 'self' http://localhost:8000 http://127.0.0.1:8000; " .
               "form-action 'self'; " .
               "frame-ancestors 'none'; " .
               "base-uri 'self'; " .
               "object-src 'none'";
        header("Content-Security-Policy: " . $csp);
    }
}

// Get the request URI
$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));

// Handle OPTIONS preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    applySecurityHeaders(true);
    http_response_code(204);
    exit;
}

// Block cloud metadata requests (security)
$metadataPatterns = ['169.254.169.254', 'metadata.google.internal', 'metadata.azure.com'];
foreach ($metadataPatterns as $pattern) {
    if (stripos($uri, $pattern) !== false || 
        stripos($_SERVER['QUERY_STRING'] ?? '', $pattern) !== false ||
        stripos($_SERVER['HTTP_HOST'] ?? '', $pattern) !== false) {
        http_response_code(403);
        exit('Forbidden');
    }
}

// Determine the file path
$filePath = __DIR__ . $uri;

// Check if this is a PHP file in HTML_PHP directory
if (preg_match('#^/HTML_PHP/.*\.php$#', $uri)) {
    applySecurityHeaders(true);
    include $filePath;
    return true;
}

// Handle serve-image.php requests for images
if (preg_match('#^/serve-image\.php$#', $uri)) {
    applySecurityHeaders(false, true);
    include __DIR__ . '/HTML_PHP/serve-image.php';
    return true;
}

// Check if requesting an image from assets
if (preg_match('#^/assets/#', $uri)) {
    $realPath = realpath($filePath);
    $assetsDir = realpath(__DIR__ . '/assets');
    
    if ($realPath && strpos($realPath, $assetsDir) === 0 && file_exists($realPath)) {
        $ext = strtolower(pathinfo($realPath, PATHINFO_EXTENSION));
        $mimeTypes = [
            'jpg' => 'image/jpeg',
            'jpeg' => 'image/jpeg',
            'png' => 'image/png',
            'gif' => 'image/gif',
            'webp' => 'image/webp',
            'svg' => 'image/svg+xml',
            'ico' => 'image/x-icon',
        ];
        
        if (isset($mimeTypes[$ext])) {
            applySecurityHeaders(false, true);
            header('Content-Type: ' . $mimeTypes[$ext]);
            header('Content-Length: ' . filesize($realPath));
            readfile($realPath);
            return true;
        }
    }
}

// Serve static files (CSS, JS, etc.)
if (file_exists($filePath) && is_file($filePath)) {
    $ext = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
    
    // Static file MIME types
    $staticMimes = [
        'css' => 'text/css',
        'js' => 'application/javascript',
        'json' => 'application/json',
        'html' => 'text/html',
        'htm' => 'text/html',
        'txt' => 'text/plain',
        'xml' => 'application/xml',
        'woff' => 'font/woff',
        'woff2' => 'font/woff2',
        'ttf' => 'font/ttf',
        'eot' => 'application/vnd.ms-fontobject',
        'svg' => 'image/svg+xml',
        'png' => 'image/png',
        'jpg' => 'image/jpeg',
        'jpeg' => 'image/jpeg',
        'gif' => 'image/gif',
        'webp' => 'image/webp',
        'ico' => 'image/x-icon',
    ];
    
    $isImage = in_array($ext, ['png', 'jpg', 'jpeg', 'gif', 'webp', 'ico', 'svg']);
    $isHtml = in_array($ext, ['html', 'htm']);
    
    applySecurityHeaders(false, $isImage);
    
    if (isset($staticMimes[$ext])) {
        header('Content-Type: ' . $staticMimes[$ext]);
    }
    
    if ($isImage || in_array($ext, ['css', 'js', 'woff', 'woff2', 'ttf', 'eot'])) {
        header('Cache-Control: public, max-age=31536000');
    }
    
    readfile($filePath);
    return true;
}

// Default: serve index.html with security headers
if ($uri === '/' || !file_exists($filePath)) {
    $indexFile = __DIR__ . '/index.html';
    if (file_exists($indexFile)) {
        applySecurityHeaders(false, false);
        header('Content-Type: text/html; charset=UTF-8');
        readfile($indexFile);
        return true;
    }
}

// 404 for everything else
http_response_code(404);
applySecurityHeaders();
echo '404 Not Found';
return true;
