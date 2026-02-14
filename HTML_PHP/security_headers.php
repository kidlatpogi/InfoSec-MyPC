<?php
/**
 * Security Headers Configuration
 * Include this file at the top of all PHP files that output responses
 * 
 * This file addresses OWASP ZAP vulnerabilities:
 * - X-Powered-By removal
 * - Content Security Policy
 * - Anti-Clickjacking headers
 * - X-Content-Type-Options
 * - Cache Control
 * - CORS configuration
 * - HSTS (only for HTTPS)
 */

// Prevent information leakage - Remove X-Powered-By header
// This should also be set in php.ini: expose_php = Off
header_remove('X-Powered-By');

// Also try to remove via ini setting (works on some configurations)
if (function_exists('ini_set')) {
    ini_set('expose_php', 'off');
}

/**
 * Security Headers Class
 * Centralizes all security header management
 */
class SecurityHeaders {
    
    // Allowed origins for CORS - add your domains here
    private static $allowedOrigins = [
        'http://localhost',
        'http://127.0.0.1',
        'https://localhost',
        'https://127.0.0.1',
        // Add your production domains here:
        // 'https://yourdomain.com',
        // 'https://www.yourdomain.com',
    ];

    /**
     * Check if an origin is from a private/local network IP
     */
    private static function isPrivateNetworkOrigin($origin) {
        $parsed = parse_url($origin);
        if (!$parsed || !isset($parsed['host'])) return false;
        $host = $parsed['host'];
        // Allow private network IPs (RFC 1918)
        return filter_var($host, FILTER_VALIDATE_IP) &&
               !filter_var($host, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE);
    }
    
    // Allowed methods for CORS
    private static $allowedMethods = 'GET, POST, PUT, DELETE, OPTIONS';
    
    // Allowed headers for CORS
    private static $allowedHeaders = 'Content-Type, Authorization, X-Requested-With';
    
    /**
     * Apply all security headers
     * Call this at the beginning of your PHP scripts
     * 
     * @param array $options Configuration options
     *   - 'api' => true/false - Whether this is an API endpoint (enables CORS)
     *   - 'cache' => true/false - Whether to allow caching (default: false for security)
     *   - 'frame' => 'DENY'|'SAMEORIGIN' - Frame options (default: DENY)
     */
    public static function apply($options = []) {
        $isApi = isset($options['api']) ? $options['api'] : false;
        $allowCache = isset($options['cache']) ? $options['cache'] : false;
        $frameOption = isset($options['frame']) ? $options['frame'] : 'DENY';
        
        // Remove potentially leaky headers
        header_remove('X-Powered-By');
        header_remove('Server');
        
        // For API endpoints, we rely on .htaccess for ALL security headers
        // including CSP. PHP handles only CORS (dynamic origin checking)
        // Note: Do NOT set CSP here - Apache sends .htaccess headers AFTER PHP,
        // causing duplicate CSP headers which ZAP flags as misconfiguration
        
        if ($isApi) {
            // Handle CORS for API
            self::handleCORS();
        }
        
        // Note: The following headers are already set by .htaccess
        // We don't duplicate them to avoid double headers:
        // - X-Frame-Options
        // - X-Content-Type-Options
        // - X-XSS-Protection
        // - Referrer-Policy
        // - Permissions-Policy
        // - Cache-Control
        // - HSTS
    }
    
    /**
     * Handle CORS with restrictive origin checking
     */
    private static function handleCORS() {
        $origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
        
        // Check if origin is allowed (explicit list or private network IP)
        if (in_array($origin, self::$allowedOrigins) || self::isPrivateNetworkOrigin($origin)) {
            header('Access-Control-Allow-Origin: ' . $origin);
            header('Access-Control-Allow-Credentials: true');
            header('Vary: Origin');
        }
        // If origin is not allowed or empty, don't set wildcard CORS headers
        // This prevents Cross-Domain Misconfiguration
        
        header('Access-Control-Allow-Methods: ' . self::$allowedMethods);
        header('Access-Control-Allow-Headers: ' . self::$allowedHeaders);
        header('Access-Control-Max-Age: 86400'); // Cache preflight for 24 hours
    }
    
    /**
     * Check if the current request is over HTTPS
     */
    private static function isHTTPS() {
        if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') {
            return true;
        }
        if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
            return true;
        }
        if (isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == 443) {
            return true;
        }
        return false;
    }
    
    /**
     * Check if request appears to be from localhost
     */
    private static function isLocalRequest() {
        $remoteAddr = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
        $localAddresses = ['127.0.0.1', '::1', 'localhost'];
        return in_array($remoteAddr, $localAddresses);
    }
    
    /**
     * Handle preflight OPTIONS requests
     * Call this early in your API scripts
     */
    public static function handlePreflight() {
        if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
            self::apply(['api' => true]);
            http_response_code(204);
            exit();
        }
    }
    
    /**
     * Generate a CSP nonce for inline scripts
     * Use this to allow specific inline scripts without 'unsafe-inline'
     * 
     * Usage in PHP:
     *   $nonce = SecurityHeaders::generateNonce();
     * 
     * Usage in HTML:
     *   <script nonce="<?php echo $nonce; ?>">...</script>
     */
    public static function generateNonce() {
        if (!isset($GLOBALS['csp_nonce'])) {
            $GLOBALS['csp_nonce'] = base64_encode(random_bytes(16));
        }
        return $GLOBALS['csp_nonce'];
    }
    
    /**
     * Get CSP with nonce for inline scripts
     * Call this instead of apply() when you need inline scripts
     */
    public static function applyWithNonce($options = []) {
        $nonce = self::generateNonce();
        
        $GLOBALS['csp_nonce'] = $nonce;
        
        // Apply standard headers first
        header_remove('X-Powered-By');
        header_remove('Server');
        
        $frameOption = isset($options['frame']) ? $options['frame'] : 'DENY';
        $allowCache = isset($options['cache']) ? $options['cache'] : false;
        
        // CSP with nonce
        $csp = [
            "default-src 'self'",
            "script-src 'self' 'nonce-{$nonce}'",
            "style-src 'self' 'nonce-{$nonce}' https://fonts.googleapis.com",
            "style-src-elem 'self' https://fonts.googleapis.com",
            "img-src 'self' data: https: blob:",
            "font-src 'self' https://fonts.gstatic.com",
            "connect-src 'self'",
            "form-action 'self'",
            "frame-ancestors 'none'",
            "base-uri 'self'",
            "object-src 'none'",
        ];
        
        header("Content-Security-Policy: " . implode('; ', $csp));
        header('X-Frame-Options: ' . $frameOption);
        header('X-Content-Type-Options: nosniff');
        header('X-XSS-Protection: 1; mode=block');
        header('Referrer-Policy: strict-origin-when-cross-origin');
        header("Permissions-Policy: geolocation=(), microphone=(), camera=(), payment=(), usb=()");
        
        if (!$allowCache) {
            header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
            header('Pragma: no-cache');
            header('Expires: 0');
        }
        
        if (self::isHTTPS()) {
            header('Strict-Transport-Security: max-age=31536000; includeSubDomains');
        }
        
        return $nonce;
    }
}

// Convenience function for quick application
function apply_security_headers($options = []) {
    SecurityHeaders::apply($options);
}

// Convenience function for preflight handling
function handle_cors_preflight() {
    SecurityHeaders::handlePreflight();
}
