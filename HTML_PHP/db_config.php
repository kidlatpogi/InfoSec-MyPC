<?php
/**
 * Database Configuration and Helpers
 * Updated to use PDO with Database class
 */

// Start output buffering to prevent any output before headers
ob_start();

require_once __DIR__ . '/Database.php';

// Set headers for API responses
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
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
?>
