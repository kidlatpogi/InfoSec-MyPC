<?php
/**
 * Database Configuration and Helpers
 * Updated to use PDO with Database class
 */

// Start output buffering to prevent any output before headers
ob_start();

require_once __DIR__ . '/Database.php';
require_once __DIR__ . '/security_headers.php';

// Apply security headers for API responses
SecurityHeaders::apply(['api' => true]);

// Set content type for API responses
header('Content-Type: application/json');

// Handle preflight OPTIONS requests
if (isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    ob_end_flush();
    exit();
}

/**
 * Get database instance
 */
function getDB() {
    return Database::getInstance();
}

/**
 * Send JSON response
 */
function sendResponse($data, $statusCode = 200) {
    // Clear any output that might have been buffered
    if (ob_get_level()) ob_clean();
    
    http_response_code($statusCode);
    echo json_encode($data);
    
    // Flush and end output buffering
    if (ob_get_level()) ob_end_flush();
    exit();
}

/**
 * Send error response
 */
function sendError($message, $statusCode = 400) {
    sendResponse(['success' => false, 'error' => $message], $statusCode);
}

/**
 * Send success response
 */
function sendSuccess($data = [], $message = null, $preserveTimestamps = false) {
    // Remove sensitive timestamp fields from response (unless explicitly preserved)
    if (!$preserveTimestamps) {
        $data = sanitizeResponseData($data);
    }
    
    $response = ['success' => true];
    if ($message) {
        $response['message'] = $message;
    }
    if (!empty($data)) {
        $response = array_merge($response, $data);
    }
    sendResponse($response);
}

/**
 * Validate email format
 */
function validateEmail($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

/**
 * Validate required fields
 */
function validateRequired($fields, $data) {
    $missing = [];
    foreach ($fields as $field) {
        if (!isset($data[$field]) || trim($data[$field]) === '') {
            $missing[] = $field;
        }
    }
    return $missing;
}

/**
 * Sanitize input string
 * Ref: Secure Coding Practices - Slide 24
 * Uses htmlspecialchars with ENT_QUOTES and UTF-8 encoding to prevent XSS.
 * strip_tags() removed — htmlspecialchars already neutralises every HTML entity.
 */
function sanitizeInput($input) {
    return htmlspecialchars(trim($input), ENT_QUOTES, 'UTF-8');
}

/**
 * Secure password hashing
 * Ref: Secure Coding Practices - Slide 89
 * Uses ARGON2ID (preferred) with recommended parameters,
 * falls back to BCRYPT cost 12 if ARGON2ID is unavailable.
 */
function securePasswordHash($password) {
    if (defined('PASSWORD_ARGON2ID')) {
        return password_hash($password, PASSWORD_ARGON2ID, [
            'memory_cost' => 65536, // 64 MB
            'time_cost'   => 4,
            'threads'     => 2,
        ]);
    }
    // Fallback: BCRYPT with cost 12
    return password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
}

/**
 * Centralised security / audit logging
 * Ref: Secure Coding Practices - Slide 140
 * Logs every critical action (login, logout, CRUD, etc.) into the
 * `security_logs` table so User AND Admin activity is tracked in one place.
 *
 * @param int|null  $user_id  Actor's user ID (null for unauthenticated events)
 * @param string    $role     Actor's role (user / admin / superadmin / employee / guest)
 * @param string    $action   Short action label, e.g. 'LOGIN', 'LOGOUT', 'CREATE_USER'
 * @param string|null $details  Optional human-readable description or JSON context
 */
function logAction($user_id, $role, $action, $details = null) {
    try {
        $db = getDB();
        $ip = filter_var(
            $_SERVER['HTTP_CLIENT_IP']
                ?? $_SERVER['HTTP_X_FORWARDED_FOR']
                ?? $_SERVER['REMOTE_ADDR']
                ?? 'unknown',
            FILTER_VALIDATE_IP
        ) ?: 'unknown';
        $userAgent = substr(
            htmlspecialchars($_SERVER['HTTP_USER_AGENT'] ?? 'unknown', ENT_QUOTES, 'UTF-8'),
            0, 500
        );

        $db->insert(
            "INSERT INTO security_logs (user_id, role, action, ip_address, user_agent, details)
             VALUES (?, ?, ?, ?, ?, ?)",
            [$user_id, $role, $action, $ip, $userAgent, $details]
        );
    } catch (Exception $e) {
        error_log("Security log failed: " . $e->getMessage());
    }
}

/**
 * Log audit event
 */
function logAuditEvent($action, $entityType, $entityId, $userId, $details = null) {
    try {
        $db = getDB();
        $db->insert(
            "INSERT INTO audit_logs (action, entity_type, entity_id, user_id, details, created_at) 
             VALUES (?, ?, ?, ?, ?, NOW())",
            [$action, $entityType, $entityId, $userId, $details ? json_encode($details) : null]
        );
    } catch (Exception $e) {
        error_log("Audit logging skipped: " . $e->getMessage());
    }
}

/**
 * Sanitize response data by removing sensitive timestamp fields
 * Prevents timestamp disclosure vulnerability
 */
function sanitizeResponseData($data) {
    if (!is_array($data)) {
        return $data;
    }
    
    // Fields to remove from responses to prevent timestamp disclosure
    // Includes common variations and field names
    $sensitiveFields = [
        'created_at', 'updated_at', 'deleted_at', 
        'last_login', 'timestamp', 'placed_at', 'archived_at',
        'created_date', 'updated_date', 'modified_date', 'modified_at',
        'date_created', 'date_updated', 'date_modified',
        'creation_date', 'modification_date',
        'last_modified', 'last_updated',
        'time', 'created_on', 'updated_on', 'expires_at',
        'expires', 'expiry_date', 'expiration_date'
    ];
    
    // Recursively process all arrays
    array_walk_recursive($data, function(&$value, $key) use ($sensitiveFields) {
        if (in_array(strtolower($key), array_map('strtolower', $sensitiveFields))) {
            $value = null;
        }
    });
    
    // Remove null values and clean up response
    function removeNulls(&$arr) {
        if (is_array($arr)) {
            foreach ($arr as $key => &$value) {
                if ($value === null) {
                    unset($arr[$key]);
                } elseif (is_array($value)) {
                    removeNulls($value);
                }
            }
        }
    }
    
    removeNulls($data);
    return $data;
}
?>
