<?php
/**
 * Authentication API
 * Handles user registration, login, and session management
 */

// Secure session configuration - MUST be set before session_start()
// Ref: Secure Coding Practices - Slides 99-107
ini_set('session.cookie_httponly', 1);
ini_set('session.cookie_secure', 1);       // Enforce HTTPS-only cookies
ini_set('session.cookie_samesite', 'Strict'); // Prevent CSRF (Slide 106)
ini_set('session.use_only_cookies', 1);
ini_set('session.use_strict_mode', 1);

// Set session cookie parameters explicitly
session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'domain' => '',
    'secure' => true,     // Strict HTTPS (Slide 106)
    'httponly' => true,
    'samesite' => 'Strict' // CSRF protection (Slide 106)
]);

session_start();

require_once 'db_config.php';

// Force JSON response for all API calls
header('Content-Type: application/json');

// Parse JSON input if Content-Type is application/json
if ($_SERVER['REQUEST_METHOD'] === 'POST' && strpos($_SERVER['CONTENT_TYPE'] ?? '', 'application/json') !== false) {
    $rawInput = file_get_contents('php://input');
    $jsonData = json_decode($rawInput, true);
    
    if (is_array($jsonData)) {
        // Merge JSON data into $_POST so it works with existing code
        $_POST = array_merge($_POST, $jsonData);
    }
}

// Regenerate session ID on login to prevent session fixation
if (isset($_POST['action']) && $_POST['action'] === 'login' && !isset($_SESSION['user_id'])) {
    session_regenerate_id(true);
}

$db = getDB();
$method = $_SERVER['REQUEST_METHOD'];

/**
 * Get client IP address
 */
function getClientIP() {
    $ip = '';
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'] ?? 'unknown';
    }
    // Sanitize IP address
    return filter_var($ip, FILTER_VALIDATE_IP) ? $ip : 'unknown';
}

/**
 * Get user agent (sanitized)
 */
function getUserAgent() {
    $ua = $_SERVER['HTTP_USER_AGENT'] ?? 'unknown';
    return substr(htmlspecialchars($ua, ENT_QUOTES, 'UTF-8'), 0, 500);
}

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
        
        // Ref: Slide 15 — use filter_input for email validation
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
        $password = $_POST['password'];
        $first_name = sanitizeInput($_POST['first_name']);
        $last_name = sanitizeInput($_POST['last_name']);
        $full_name = $first_name . ' ' . $last_name;
        $phone = isset($_POST['phone']) ? sanitizeInput($_POST['phone']) : null;
        
        // Rate limit registration attempts by IP
        checkRateLimit('register', $_SERVER['REMOTE_ADDR'], 3, 600);
        
        // Validate email format (Slide 15)
        if (!$email || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            sendError('Invalid email format');
        }
        
        // Validate email length (maximum 100 characters)
        if (strlen($email) > 100) {
            sendError('Email must not exceed 100 characters');
        }
        
        // Validate password strength (minimum 8 characters)
        if (strlen($password) < 8) {
            sendError('Password must be at least 8 characters long');
        }
        
        // Check if email already exists
        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already registered');
        }
        
        // Hash password — Ref: Slide 89 (ARGON2ID preferred, BCRYPT cost 12 fallback)
        $password_hash = securePasswordHash($password);
        
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

        // Centralised audit log — Ref: Slide 151
        logAction($user_id, 'user', 'REGISTER', 'New user registration: ' . $email);
        
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
        
        // Ref: Slide 15 — use filter_input for email validation
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
        $password = $_POST['password'];
        
        // Validate email format (Slide 15)
        if (!$email || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
            sendError('Invalid email format');
        }
        
        // Check login lockout (3 failed attempts = 15 min lockout)
        $lockoutStatus = checkUserLoginLockout($db, $email);
        if ($lockoutStatus['locked']) {
            // Record locked account attempt in login_attempts
            recordUserLoginAttempt($db, $email, false, 'Account locked - too many failed attempts');
            
            sendResponse([
                'success' => false,
                'error' => 'Account is temporarily locked due to multiple failed login attempts',
                'locked' => true,
                'remaining_seconds' => $lockoutStatus['remaining_seconds'],
                'failed_attempts' => $lockoutStatus['failed_attempts']
            ], 429);
        }
        
        // Get user from database (exclude archived users) - uses prepared statement (SQL injection safe)
        $user = $db->fetchOne(
            "SELECT id, email, password_hash, first_name, last_name, role, is_admin, is_archived 
             FROM users WHERE email = ? AND role IN ('user', 'employee')",
            [$email]
        );
        
        if (!$user) {
            // Record failed login attempt
            recordUserLoginAttempt($db, $email, false, 'Account not found');
            $newLockoutStatus = checkUserLoginLockout($db, $email);
            
            sendResponse([
                'success' => false,
                'error' => 'Invalid email or password',
                'failed_attempts' => $newLockoutStatus['failed_attempts'],
                'locked' => $newLockoutStatus['locked'],
                'remaining_seconds' => $newLockoutStatus['remaining_seconds']
            ], 401);
        }
        
        // Check if account is archived/deactivated
        if ($user['is_archived']) {
            recordUserLoginAttempt($db, $email, false, 'Account deactivated');
            sendError('This account has been deactivated. Please contact support if you believe this is an error.', 403);
        }
        
        // Verify password
        if (!password_verify($password, $user['password_hash'])) {
            // Record failed login attempt
            recordUserLoginAttempt($db, $email, false, 'Invalid password');
            $newLockoutStatus = checkUserLoginLockout($db, $email);
            
            sendResponse([
                'success' => false,
                'error' => 'Invalid email or password',
                'failed_attempts' => $newLockoutStatus['failed_attempts'],
                'locked' => $newLockoutStatus['locked'],
                'remaining_seconds' => $newLockoutStatus['remaining_seconds']
            ], 401);
        }
        
        // SUCCESS - Record successful login
        recordUserLoginAttempt($db, $email, true);

        // Determine role from database
        $role = $user['role'] ?? ($user['is_admin'] ? 'admin' : 'user');
        
        // Set session
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_email'] = $user['email'];
        $_SESSION['user_role'] = $role;

        // Centralised audit log — Ref: Slide 151
        logAction($user['id'], $role, 'LOGIN', 'User login successful: ' . $email);
        
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
        // Centralised audit log — Ref: Slide 151
        if (isset($_SESSION['user_id'])) {
            logAction(
                $_SESSION['user_id'],
                $_SESSION['user_role'] ?? 'user',
                'LOGOUT',
                'User logout: ' . ($_SESSION['user_email'] ?? 'unknown')
            );
        }

        // Record logout in login_attempts for tracking
        if (isset($_SESSION['user_email'])) {
            try {
                $ip = getClientIP();
                $userAgent = getUserAgent();
                $db->insert(
                    "INSERT INTO login_attempts (email, account_type, ip_address, user_agent, success, failure_reason) 
                     VALUES (?, 'user', ?, ?, 1, 'Logout')",
                    [$_SESSION['user_email'], $ip, $userAgent]
                );
            } catch (Exception $e) {
                error_log("Failed to record logout: " . $e->getMessage());
            }
        }
        
        session_destroy();
        sendSuccess([], 'Logout successful');
    }
    
    // Get current user
    elseif ($method === 'GET' && isset($_GET['action']) && $_GET['action'] === 'current') {
        if (!isset($_SESSION['user_id'])) {
            sendError('Not logged in', 401);
        }
        
        $user_id = $_SESSION['user_id'];
        
        // Check if this is an admin session
        if (isset($_SESSION['is_admin_session']) && $_SESSION['is_admin_session']) {
            // Fetch from admin_accounts table
            $user = $db->fetchOne(
                "SELECT id, email, first_name, last_name, role, 'admin' as account_type
                 FROM admin_accounts WHERE id = ?",
                [$user_id]
            );
            
            if (!$user) {
                sendError('Admin account not found', 404);
            }
        } else {
            // Fetch from users table (regular user)
            $user = $db->fetchOne(
                "SELECT id, email, first_name, last_name, role, is_admin, phone 
                 FROM users WHERE id = ?",
                [$user_id]
            );
            
            if (!$user) {
                sendError('User not found', 404);
            }
            
            $user['role'] = $user['role'] ?? ($user['is_admin'] ? 'admin' : 'user');
        }
        
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
            
            if (strlen($new_password) < 8) {
                sendError('Password must be at least 8 characters long');
            }
            
            $password_hash = securePasswordHash($new_password);
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

/**
 * Check if user account is locked due to failed login attempts
 * Returns: ['locked' => bool, 'remaining_seconds' => int, 'failed_attempts' => int]
 */
function checkUserLoginLockout($db, $email) {
    try {
        // Count failed attempts in last 15 minutes
        $result = $db->fetchOne(
            "SELECT COUNT(*) as attempts, MAX(attempt_time) as last_attempt 
             FROM login_attempts 
             WHERE email = ? AND account_type = 'user' AND success = 0 
             AND attempt_time > DATE_SUB(NOW(), INTERVAL 15 MINUTE)",
            [$email]
        );
        
        $attempts = (int)($result['attempts'] ?? 0);
        $lastAttempt = $result['last_attempt'] ?? null;
        
        if ($attempts >= 2 && $lastAttempt) {
            // Calculate lock expiry (15 minutes from last failed attempt)
            $lockExpiry = strtotime($lastAttempt) + (15 * 60);
            $now = time();
            
            if ($now < $lockExpiry) {
                return [
                    'locked' => true,
                    'remaining_seconds' => $lockExpiry - $now,
                    'failed_attempts' => $attempts
                ];
            }
        }
        
        return [
            'locked' => false,
            'remaining_seconds' => 0,
            'failed_attempts' => $attempts
        ];
    } catch (Exception $e) {
        // If table doesn't exist yet, don't block login
        error_log("Login lockout check failed: " . $e->getMessage());
        return ['locked' => false, 'remaining_seconds' => 0, 'failed_attempts' => 0];
    }
}

/**
 * Record user login attempt
 */
function recordUserLoginAttempt($db, $email, $success, $failureReason = null) {
    try {
        $ip = getClientIP();
        $userAgent = getUserAgent();
        
        $db->insert(
            "INSERT INTO login_attempts (email, account_type, ip_address, user_agent, success, failure_reason) 
             VALUES (?, 'user', ?, ?, ?, ?)",
            [$email, $ip, $userAgent, $success ? 1 : 0, $failureReason]
        );
        
        // If successful, clean up old failed attempts
        if ($success) {
            $db->query(
                "DELETE FROM login_attempts 
                 WHERE email = ? AND account_type = 'user' AND success = 0 
                 AND attempt_time < DATE_SUB(NOW(), INTERVAL 15 MINUTE)",
                [$email]
            );
        }
    } catch (Exception $e) {
        // Don't fail login if audit logging fails
        error_log("Failed to record login attempt: " . $e->getMessage());
    }
}
?>
