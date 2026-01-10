<?php
/**
 * Authentication API
 * Handles user registration, login, and session management
 */

require_once 'db_config.php';

// Secure session configuration
ini_set('session.cookie_httponly', 1);
ini_set('session.cookie_secure', 0); // Set to 1 if using HTTPS
ini_set('session.cookie_samesite', 'Strict');
ini_set('session.use_only_cookies', 1);

session_start();

// Force JSON response for all API calls
header('Content-Type: application/json');

// Regenerate session ID on login to prevent session fixation
if (isset($_POST['action']) && $_POST['action'] === 'login' && !isset($_SESSION['user_id'])) {
    session_regenerate_id(true);
}

$db = getDB();
$method = $_SERVER['REQUEST_METHOD'];

try {
    // Rate limiting function
    function checkRateLimit($action, $identifier, $maxAttempts = 5, $timeWindow = 300) {
        if (!isset($_SESSION['rate_limit'])) {
            $_SESSION['rate_limit'] = [];
        }
        
        $key = $action . '_' . $identifier;
        $now = time();
        
        if (isset($_SESSION['rate_limit'][$key])) {
            $attempts = $_SESSION['rate_limit'][$key];
            // Remove old attempts outside time window
            $attempts = array_filter($attempts, function($timestamp) use ($now, $timeWindow) {
                return ($now - $timestamp) < $timeWindow;
            });
            
            if (count($attempts) >= $maxAttempts) {
                sendError('Too many attempts. Please try again later.', 429);
            }
            
            $_SESSION['rate_limit'][$key] = $attempts;
        } else {
            $_SESSION['rate_limit'][$key] = [];
        }
        
        $_SESSION['rate_limit'][$key][] = $now;
    }

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
        
        // Rate limit registration attempts by IP
        checkRateLimit('register', $_SERVER['REMOTE_ADDR'], 3, 600);
        
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
            "INSERT INTO users (email, password_hash, first_name, last_name, phone, role, is_admin) 
             VALUES (?, ?, ?, ?, ?, 'user', 0)",
            [$email, $password_hash, $first_name, $last_name, $phone]
        );
        
        // Set session
        $_SESSION['user_id'] = $user_id;
        $_SESSION['user_email'] = $email;
        $_SESSION['user_role'] = 'user';
        
        sendSuccess([
            'user' => [
                'id' => $user_id,
                'email' => $email,
                'first_name' => $first_name,
                'last_name' => $last_name,
                'role' => 'user'
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
        
        // Get user from database (exclude archived users)
        $user = $db->fetchOne(
            "SELECT id, email, password_hash, first_name, last_name, role, is_admin, is_archived 
             FROM users WHERE email = ?",
            [$email]
        );
        
        if (!$user) {
            // Rate limit failed login attempts
            checkRateLimit('login', $email, 5, 300);
            sendError('Invalid email or password', 401);
        }
        
        // Check if account is archived/deactivated
        if ($user['is_archived']) {
            sendError('This account has been deactivated. Please contact support if you believe this is an error.', 403);
        }
        
        // Verify password
        if (!password_verify($password, $user['password_hash'])) {
            // Rate limit failed login attempts
            checkRateLimit('login', $email, 5, 300);
            sendError('Invalid email or password', 401);
        }
        
        // Determine role from database
        $role = $user['role'] ?? ($user['is_admin'] ? 'admin' : 'user');
        
        // Set session
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_email'] = $user['email'];
        $_SESSION['user_role'] = $role;
        
        sendSuccess([
            'user' => [
                'id' => $user['id'],
                'email' => $user['email'],
                'first_name' => $user['first_name'],
                'last_name' => $user['last_name'],
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
            "SELECT id, email, first_name, last_name, role, is_admin, phone 
             FROM users WHERE id = ?",
            [$user_id]
        );
        
        if (!$user) {
            sendError('User not found', 404);
        }
        
        $user['role'] = $user['role'] ?? ($user['is_admin'] ? 'admin' : 'user');
        
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
        $email = isset($_POST['email']) ? sanitizeInput($_POST['email']) : null;
        $phone = isset($_POST['phone']) ? sanitizeInput($_POST['phone']) : null;
        $current_password = isset($_POST['current_password']) ? $_POST['current_password'] : null;
        $new_password = isset($_POST['new_password']) ? $_POST['new_password'] : null;
        
        // Get current user data
        $user = $db->fetchOne("SELECT password_hash, email FROM users WHERE id = ?", [$user_id]);
        if (!$user) {
            sendError('User not found', 404);
        }
        
        // If email is being changed, check if it's already in use
        if ($email !== null && $email !== $user['email']) {
            $existing = $db->fetchOne("SELECT id FROM users WHERE email = ? AND id != ?", [$email, $user_id]);
            if ($existing) {
                sendError('Email is already in use by another account');
            }
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
        
        if ($first_name !== null) {
            $updates[] = 'first_name = ?';
            $params[] = $first_name;
        }
        
        if ($last_name !== null) {
            $updates[] = 'last_name = ?';
            $params[] = $last_name;
        }
        
        if ($email !== null) {
            $updates[] = 'email = ?';
            $params[] = $email;
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
            "SELECT id, email, first_name, last_name, role, phone 
             FROM users WHERE id = ?",
            [$user_id]
        );
        
        sendSuccess([
            'message' => 'Profile updated successfully',
            'user' => $updated_user
        ]);
    }
    
    // Verify password for sensitive operations
    elseif ($method === 'POST' && (isset($_GET['action']) && $_GET['action'] === 'verifyPassword' || 
            isset($_POST['action']) && $_POST['action'] === 'verifyPassword')) {
        // Check if user is logged in
        if (!isset($_SESSION['user_id'])) {
            sendError('Not logged in', 401);
        }
        
        // Check if password is provided
        if (empty($_POST['password'])) {
            sendError('Password is required');
        }
        
        $user_id = $_SESSION['user_id'];
        $password = $_POST['password'];
        
        // Get user's password hash from database
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
    
    // Delete (archive) own account
    elseif ($method === 'POST' && (isset($_GET['action']) && $_GET['action'] === 'deleteAccount' || 
            isset($_POST['action']) && $_POST['action'] === 'deleteAccount')) {
        // Check if user is logged in
        if (!isset($_SESSION['user_id'])) {
            sendError('Not logged in', 401);
        }
        
        // Check if password is provided
        if (empty($_POST['password'])) {
            sendError('Password is required to delete account');
        }
        
        $user_id = $_SESSION['user_id'];
        $password = $_POST['password'];
        
        // Get user's data from database
        $user = $db->fetchOne("SELECT password_hash, role FROM users WHERE id = ?", [$user_id]);
        
        if (!$user) {
            sendError('User not found', 404);
        }
        
        // Verify password
        if (!password_verify($password, $user['password_hash'])) {
            sendError('Invalid password');
        }
        
        // Don't allow admins/superadmins to delete their account this way
        if (in_array($user['role'], ['admin', 'superadmin'])) {
            sendError('Admin accounts cannot be deleted through this interface. Contact support.');
        }
        
        // Archive the user instead of deleting (soft delete)
        $db->query(
            "UPDATE users SET is_archived = 1, archived_at = NOW() WHERE id = ?",
            [$user_id]
        );
        
        // Destroy the session
        session_destroy();
        
        sendSuccess(['message' => 'Account has been deactivated successfully']);
    }
    
    // Invalid action
    else {
        sendError('Invalid action', 400);
    }
    
} catch (Exception $e) {
    error_log("Auth API Error: " . $e->getMessage());
    error_log("Stack trace: " . $e->getTraceAsString());
    sendError('An error occurred: ' . $e->getMessage(), 500);
}
?>
