<?php
/**
 * Admin Authentication API
 * Handles admin/superadmin login with:
 * - Separate admin_accounts table
 * - SQL Injection Prevention (prepared statements)
 * - Login lockout after 3 failed attempts
 * - Comprehensive audit trail logging
 */

// Secure session configuration - MUST be set before session_start()
ini_set('session.cookie_httponly', 1);
ini_set('session.cookie_secure', 0); // Set to 1 for HTTPS
ini_set('session.cookie_samesite', 'Strict'); // Stricter for admin
ini_set('session.use_only_cookies', 1);
ini_set('session.use_strict_mode', 1);

// Set session cookie parameters explicitly
session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'domain' => '',
    'secure' => false, // Set to true for HTTPS
    'httponly' => true,
    'samesite' => 'Strict'
]);

session_start();

require_once 'db_config.php';

// Force JSON response for all API calls
header('Content-Type: application/json');

// Regenerate session ID on login to prevent session fixation
if (isset($_POST['action']) && $_POST['action'] === 'adminLogin' && !isset($_SESSION['admin_id'])) {
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

/**
 * Check if account is locked due to failed login attempts
 * Returns: ['locked' => bool, 'remaining_seconds' => int, 'failed_attempts' => int]
 */
function checkLoginLockout($db, $email) {
    // Count failed attempts in last 15 minutes
    $result = $db->fetchOne(
        "SELECT COUNT(*) as attempts, MAX(attempt_time) as last_attempt 
         FROM login_attempts 
         WHERE email = ? AND account_type = 'admin' AND success = 0 
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
}

/**
 * Record login attempt
 */
function recordLoginAttempt($db, $email, $success, $failureReason = null) {
    $ip = getClientIP();
    $userAgent = getUserAgent();
    
    $db->insert(
        "INSERT INTO login_attempts (email, account_type, ip_address, user_agent, success, failure_reason) 
         VALUES (?, 'admin', ?, ?, ?, ?)",
        [$email, $ip, $userAgent, $success ? 1 : 0, $failureReason]
    );
    
    // If successful, clean up old failed attempts
    if ($success) {
        $db->query(
            "DELETE FROM login_attempts 
             WHERE email = ? AND account_type = 'admin' AND success = 0 
             AND attempt_time < DATE_SUB(NOW(), INTERVAL 15 MINUTE)",
            [$email]
        );
    }
}

/**
 * Log audit trail entry
 */
function logAdminAuditTrail($db, $adminId, $adminEmail, $adminRole, $actionType, $actionCategory, $description, $targetType = null, $targetId = null, $targetIdentifier = null, $oldValues = null, $newValues = null) {
    try {
        $db->insert(
            "INSERT INTO audit_trail (
                actor_id, actor_email, actor_role, actor_ip, actor_user_agent,
                action_type, action_category,
                target_type, target_id, target_identifier,
                old_values, new_values, description,
                session_id, request_uri
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [
                $adminId,
                $adminEmail,
                $adminRole,
                getClientIP(),
                getUserAgent(),
                $actionType,
                $actionCategory,
                $targetType,
                $targetId,
                $targetIdentifier,
                $oldValues ? json_encode($oldValues) : null,
                $newValues ? json_encode($newValues) : null,
                $description,
                session_id(),
                $_SERVER['REQUEST_URI'] ?? ''
            ]
        );
    } catch (Exception $e) {
        error_log("Audit trail logging failed: " . $e->getMessage());
    }
}

try {
    $action = $_POST['action'] ?? $_GET['action'] ?? null;
    
    // Debug logging
    error_log("Admin Auth Request: Method=" . $method . ", Action=" . $action);
    error_log("POST data: " . json_encode($_POST));
    
    // ========================================
    // ADMIN LOGIN
    // ========================================
    if ($method === 'POST' && $action === 'adminLogin') {
        error_log("Processing admin login...");
        
        // Validate required fields
        $required = ['email', 'password'];
        $missing = validateRequired($required, $_POST);
        if (!empty($missing)) {
            error_log("Missing fields: " . implode(', ', $missing));
            sendError('Missing required fields: ' . implode(', ', $missing));
        }
        
        // Sanitize email (SQL injection prevention via prepared statements)
        $email = sanitizeInput($_POST['email']);
        $password = $_POST['password'];
        
        // Validate email format
        if (!validateEmail($email)) {
            sendError('Invalid email format');
        }
        
        // Check if account is locked
        $lockoutStatus = checkLoginLockout($db, $email);
        if ($lockoutStatus['locked']) {
            // Log the locked attempt
            logAdminAuditTrail(
                $db, 0, $email, 'admin',
                'ACCOUNT_LOCKED', 'SECURITY',
                "Login attempt while account locked. IP: " . getClientIP()
            );
            
            sendResponse([
                'success' => false,
                'error' => 'Account is temporarily locked due to multiple failed login attempts',
                'locked' => true,
                'remaining_seconds' => $lockoutStatus['remaining_seconds'],
                'failed_attempts' => $lockoutStatus['failed_attempts']
            ], 429);
        }
        
        // Get admin from admin_accounts table (using prepared statement - SQL injection safe)
        $admin = $db->fetchOne(
            "SELECT id, email, password_hash, first_name, last_name, role, is_active, locked_until 
             FROM admin_accounts WHERE email = ?",
            [$email]
        );
        
        error_log("Database fetch result for email '$email': " . ($admin ? 'FOUND' : 'NOT FOUND'));
        if ($admin) {
            error_log("Admin details: ID=" . $admin['id'] . ", Role=" . $admin['role'] . ", Active=" . $admin['is_active']);
        }
        
        // Check if admin exists
        if (!$admin) {
            error_log("Admin not found for email: $email");
            // Record failed attempt
            recordLoginAttempt($db, $email, false, 'Account not found');
            
            // Check if now locked
            $newLockoutStatus = checkLoginLockout($db, $email);
            
            sendResponse([
                'success' => false,
                'error' => 'Invalid email or password',
                'failed_attempts' => $newLockoutStatus['failed_attempts'],
                'locked' => $newLockoutStatus['locked'],
                'remaining_seconds' => $newLockoutStatus['remaining_seconds']
            ], 401);
        }
        
        // Check if account is active
        if (!$admin['is_active']) {
            recordLoginAttempt($db, $email, false, 'Account deactivated');
            
            logAdminAuditTrail(
                $db, $admin['id'], $email, $admin['role'],
                'LOGIN_FAILED', 'AUTHENTICATION',
                "Login attempt on deactivated account. IP: " . getClientIP()
            );
            
            sendError('This admin account has been deactivated. Please contact a superadmin.', 403);
        }
        
        // Verify password
        if (!password_verify($password, $admin['password_hash'])) {
            error_log("Password verification FAILED for: $email");
            error_log("Expected hash: " . $admin['password_hash']);
            error_log("Password provided: $password");
            
            // Record failed attempt
            recordLoginAttempt($db, $email, false, 'Invalid password');
            
            // Log failed login attempt
            logAdminAuditTrail(
                $db, $admin['id'], $email, $admin['role'],
                'LOGIN_FAILED', 'AUTHENTICATION',
                "Failed login attempt - invalid password. IP: " . getClientIP()
            );
            
            // Check if now locked
            $newLockoutStatus = checkLoginLockout($db, $email);
            
            sendResponse([
                'success' => false,
                'error' => 'Invalid email or password',
                'failed_attempts' => $newLockoutStatus['failed_attempts'],
                'locked' => $newLockoutStatus['locked'],
                'remaining_seconds' => $newLockoutStatus['remaining_seconds']
            ], 401);
        }
        
        // SUCCESS - Login successful
        recordLoginAttempt($db, $email, true);
        
        // Update last login time and reset failed attempts
        $db->query(
            "UPDATE admin_accounts SET last_login = NOW(), failed_login_attempts = 0, locked_until = NULL WHERE id = ?",
            [$admin['id']]
        );
        
        // Set admin session variables
        $_SESSION['admin_id'] = $admin['id'];
        $_SESSION['admin_email'] = $admin['email'];
        $_SESSION['admin_role'] = $admin['role'];
        $_SESSION['admin_first_name'] = $admin['first_name'];
        $_SESSION['admin_last_name'] = $admin['last_name'];
        $_SESSION['is_admin_session'] = true;
        $_SESSION['admin_login_time'] = time();
        
        // Also set user session for compatibility with existing code
        $_SESSION['user_id'] = $admin['id'];
        $_SESSION['user_email'] = $admin['email'];
        $_SESSION['user_role'] = $admin['role'];
        
        // Log successful login
        logAdminAuditTrail(
            $db, $admin['id'], $admin['email'], $admin['role'],
            'LOGIN', 'AUTHENTICATION',
            "Successful admin login. IP: " . getClientIP()
        );
        
        sendSuccess([
            'user' => [
                'id' => $admin['id'],
                'email' => $admin['email'],
                'first_name' => $admin['first_name'],
                'last_name' => $admin['last_name'],
                'role' => $admin['role']
            ]
        ], 'Admin login successful');
    }
    
    // ========================================
    // ADMIN LOGOUT
    // ========================================
    elseif ($method === 'POST' && $action === 'adminLogout') {
        if (isset($_SESSION['admin_id'])) {
            // Log logout
            logAdminAuditTrail(
                $db, 
                $_SESSION['admin_id'], 
                $_SESSION['admin_email'] ?? 'unknown',
                $_SESSION['admin_role'] ?? 'admin',
                'LOGOUT', 'AUTHENTICATION',
                "Admin logout. IP: " . getClientIP()
            );
        }
        
        // Destroy session
        session_destroy();
        sendSuccess([], 'Admin logout successful');
    }
    
    // ========================================
    // CHECK ADMIN SESSION
    // ========================================
    elseif ($method === 'GET' && $action === 'checkAdminSession') {
        if (!isset($_SESSION['admin_id']) || !isset($_SESSION['is_admin_session'])) {
            sendError('Not authenticated as admin', 401);
        }
        
        // Verify admin still exists and is active
        $admin = $db->fetchOne(
            "SELECT id, email, first_name, last_name, role, is_active 
             FROM admin_accounts WHERE id = ?",
            [$_SESSION['admin_id']]
        );
        
        if (!$admin || !$admin['is_active']) {
            session_destroy();
            sendError('Admin session invalid', 401);
        }
        
        sendSuccess([
            'admin' => [
                'id' => $admin['id'],
                'email' => $admin['email'],
                'first_name' => $admin['first_name'],
                'last_name' => $admin['last_name'],
                'role' => $admin['role']
            ]
        ]);
    }
    
    // ========================================
    // CHECK LOCKOUT STATUS (for UI feedback)
    // ========================================
    elseif ($method === 'POST' && $action === 'checkLockout') {
        $email = sanitizeInput($_POST['email'] ?? '');
        
        if (empty($email)) {
            sendError('Email required');
        }
        
        $lockoutStatus = checkLoginLockout($db, $email);
        
        sendSuccess([
            'locked' => $lockoutStatus['locked'],
            'remaining_seconds' => $lockoutStatus['remaining_seconds'],
            'failed_attempts' => $lockoutStatus['failed_attempts']
        ]);
    }
    
    // ========================================
    // INVALID ACTION
    // ========================================
    else {
        sendError('Invalid action', 400);
    }
    
} catch (Exception $e) {
    error_log("Admin Auth API Error: " . $e->getMessage());
    error_log("Stack trace: " . $e->getTraceAsString());
    sendError('An error occurred: ' . $e->getMessage(), 500);
}
?>
