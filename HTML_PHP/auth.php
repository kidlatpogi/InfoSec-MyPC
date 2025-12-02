<?php
/**
 * Authentication API
 * Handles user registration, login, and session management
 */

require_once 'db_config.php';
session_start();

$db = getDB();
$method = $_SERVER['REQUEST_METHOD'];

try {
    // Register new user
    if ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'register') {
        // Validate required fields
        $required = ['email', 'password', 'first_name', 'last_name'];
        $missing = validateRequired($required, $_POST);
        if (!empty($missing)) {
            sendError('Missing required fields: ' . implode(', ', $missing));
        }
        
        $email = sanitizeInput($_POST['email']);
        $password = $_POST['password'];
        $first_name = sanitizeInput($_POST['first_name']);
        $last_name = sanitizeInput($_POST['last_name']);
        $full_name = $first_name . ' ' . $last_name;
        $phone = isset($_POST['phone']) ? sanitizeInput($_POST['phone']) : null;
        
        // Validate email format
        if (!validateEmail($email)) {
            sendError('Invalid email format');
        }
        
        // Validate password strength (minimum 6 characters)
        if (strlen($password) < 6) {
            sendError('Password must be at least 6 characters long');
        }
        
        // Check if email already exists
        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already registered');
        }
        
        // Hash password
        $password_hash = password_hash($password, PASSWORD_BCRYPT);
        
        // Insert user
        $user_id = $db->insert(
            "INSERT INTO users (email, password_hash, full_name, phone, is_admin) 
             VALUES (?, ?, ?, ?, 0)",
            [$email, $password_hash, $full_name, $phone]
        );
        
        // Set session
        $_SESSION['user_id'] = $user_id;
        $_SESSION['user_email'] = $email;
        $_SESSION['user_role'] = 'customer';
        
        sendSuccess([
            'user' => [
                'id' => $user_id,
                'email' => $email,
                'full_name' => $full_name,
                'role' => 'customer'
            ]
        ], 'Registration successful');
    }
    
    // Login user
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'login') {
        // Validate required fields
        $required = ['email', 'password'];
        $missing = validateRequired($required, $_POST);
        if (!empty($missing)) {
            sendError('Missing required fields: ' . implode(', ', $missing));
        }
        
        $email = sanitizeInput($_POST['email']);
        $password = $_POST['password'];
        
        // Validate email format
        if (!validateEmail($email)) {
            sendError('Invalid email format');
        }
        
        // Get user from database
        $user = $db->fetchOne(
            "SELECT id, email, password_hash, full_name, is_admin 
             FROM users WHERE email = ?",
            [$email]
        );
        
        if (!$user) {
            sendError('Invalid email or password', 401);
        }
        
        // Verify password
        if (!password_verify($password, $user['password_hash'])) {
            sendError('Invalid email or password', 401);
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
    }
    
    // Logout user
    elseif ($method === 'POST' && isset($_POST['action']) && $_POST['action'] === 'logout') {
        session_destroy();
        sendSuccess([], 'Logout successful');
    }
    
    // Get current user
    elseif ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'current') {
        if (!isset($_SESSION['user_id'])) {
            sendError('Not logged in', 401);
        }
        
        $user_id = $_SESSION['user_id'];
        $user = $db->fetchOne(
            "SELECT id, email, full_name, is_admin, phone 
             FROM users WHERE id = ?",
            [$user_id]
        );
        
        if (!$user) {
            sendError('User not found', 404);
        }
        
        $user['role'] = $user['is_admin'] ? 'admin' : 'customer';
        
        sendSuccess(['user' => $user]);
    }
    
    // Update user profile
    elseif ($method === 'POST' && isset($_GET['action']) && $_GET['action'] === 'updateProfile') {
        if (!isset($_SESSION['user_id'])) {
            sendError('Not logged in', 401);
        }
        
        $user_id = $_SESSION['user_id'];
        
        // Get input data
        $first_name = isset($_POST['first_name']) ? sanitizeInput($_POST['first_name']) : null;
        $last_name = isset($_POST['last_name']) ? sanitizeInput($_POST['last_name']) : null;
        $full_name = ($first_name && $last_name) ? $first_name . ' ' . $last_name : null;
        $phone = isset($_POST['phone']) ? sanitizeInput($_POST['phone']) : null;
        $current_password = isset($_POST['current_password']) ? $_POST['current_password'] : null;
        $new_password = isset($_POST['new_password']) ? $_POST['new_password'] : null;
        
        // Get current user data
        $user = $db->fetchOne("SELECT password_hash FROM users WHERE id = ?", [$user_id]);
        if (!$user) {
            sendError('User not found', 404);
        }
        
        // If changing password, verify current password
        if (!empty($new_password)) {
            if (empty($current_password)) {
                sendError('Current password is required to set new password');
            }
            
            if (!password_verify($current_password, $user['password_hash'])) {
                sendError('Current password is incorrect');
            }
            
            if (strlen($new_password) < 6) {
                sendError('Password must be at least 6 characters long');
            }
            
            $password_hash = password_hash($new_password, PASSWORD_BCRYPT);
        } else {
            $password_hash = null;
        }
        
        // Build update query
        $updates = [];
        $params = [];
        
        if ($full_name !== null) {
            $updates[] = 'full_name = ?';
            $params[] = $full_name;
        }
        
        if ($phone !== null) {
            $updates[] = 'phone = ?';
            $params[] = $phone;
        }
        
        if ($password_hash !== null) {
            $updates[] = 'password_hash = ?';
            $params[] = $password_hash;
        }
        
        if (empty($updates)) {
            sendError('No fields to update');
        }
        
        $params[] = $user_id;
        $query = "UPDATE users SET " . implode(', ', $updates) . " WHERE id = ?";
        $db->query($query, $params);
        
        // Return updated user data
        $updated_user = $db->fetchOne(
            "SELECT id, email, first_name, last_name, role, phone, status 
             FROM users WHERE id = ?",
            [$user_id]
        );
        
        sendSuccess([
            'message' => 'Profile updated successfully',
            'user' => $updated_user
        ]);
    }
    
    // Verify password for sensitive operations
    elseif ($method === 'POST' && isset($_GET['action']) && $_GET['action'] === 'verifyPassword') {
        if (!isset($_SESSION['user_id'])) {
            sendError('Not logged in', 401);
        }
        
        if (!isset($_POST['password'])) {
            sendError('Password is required');
        }
        
        $user_id = $_SESSION['user_id'];
        $password = $_POST['password'];
        
        // Get user's password hash
        $user = $db->fetchOne("SELECT password_hash FROM users WHERE id = ?", [$user_id]);
        if (!$user) {
            sendError('User not found', 404);
        }
        
        // Verify password
        if (password_verify($password, $user['password_hash'])) {
            sendSuccess(['message' => 'Password verified']);
        } else {
            sendError('Invalid password');
        }
    }
    
    // Invalid action
    else {
        sendError('Invalid action', 400);
    }
    
} catch (Exception $e) {
    error_log("Auth API Error: " . $e->getMessage());
    sendError('An error occurred. Please try again later.', 500);
}
?>
