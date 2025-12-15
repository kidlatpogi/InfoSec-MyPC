<?php
/**
 * Test login endpoint with debugging
 */
require_once 'db_config.php';
session_start();

$db = getDB();

// Log the request
error_log("=== LOGIN TEST ===");
error_log("POST data: " . print_r($_POST, true));
error_log("Session data: " . print_r($_SESSION, true));

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['email']) && isset($_POST['password'])) {
    $email = sanitizeInput($_POST['email']);
    $password = $_POST['password'];
    
    error_log("Email: " . $email);
    
    // Get user from database
    $user = $db->fetchOne(
        "SELECT id, email, password_hash, full_name, is_admin 
         FROM users WHERE email = ?",
        [$email]
    );
    
    if (!$user) {
        error_log("User not found for email: " . $email);
        sendError('User not found', 401);
    }
    
    error_log("User found: " . print_r($user, true));
    error_log("Password hash from DB: " . $user['password_hash']);
    error_log("Attempting to verify password...");
    
    // Verify password
    $verify_result = password_verify($password, $user['password_hash']);
    error_log("Password verify result: " . ($verify_result ? 'TRUE' : 'FALSE'));
    
    if (!$verify_result) {
        sendError('Invalid password', 401);
    }
    
    // Determine role based on is_admin
    $role = $user['is_admin'] ? 'admin' : 'customer';
    
    // Set session
    $_SESSION['user_id'] = $user['id'];
    $_SESSION['user_email'] = $user['email'];
    $_SESSION['user_role'] = $role;
    
    sendSuccess([
        'user' => [
            'id' => $user['id'],
            'email' => $user['email'],
            'full_name' => $user['full_name'],
            'role' => $role
        ]
    ], 'Login successful');
} else {
    sendError('Invalid request', 400);
}
?>
