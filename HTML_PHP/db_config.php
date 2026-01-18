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
function sendSuccess($data = [], $message = null) {
    // Remove sensitive timestamp fields from response
    $data = sanitizeResponseData($data);
    
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
 */
function sanitizeInput($input) {
    return htmlspecialchars(strip_tags(trim($input)), ENT_QUOTES, 'UTF-8');
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
        // Silently fail - don't break main operation
        error_log("Audit logging failed: " . $e->getMessage());
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
    $sensitiveFields = ['created_at', 'updated_at', 'deleted_at', 'last_login', 'timestamp'];
    
    // Recursively sanitize arrays
    array_walk_recursive($data, function(&$value, $key) use ($sensitiveFields) {
        if (in_array(strtolower($key), $sensitiveFields)) {
            $value = null;
        }
    });
    
    // Remove null values to clean up response
    $removeNulls = function(&$arr) use (&$removeNulls) {
        if (is_array($arr)) {
            foreach ($arr as $key => &$value) {
                if ($value === null) {
                    unset($arr[$key]);
                } elseif (is_array($value)) {
                    $removeNulls($value);
                }
            }
        }
    };
    $removeNulls($data);
    
    return $data;
}
?>
