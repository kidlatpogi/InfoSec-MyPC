<?php
/**
 * Management API - Admin & Superadmin Operations
 * Handles user, admin, employee, and address management
 */

// Session configuration must be set before session_start()
// Ref: Secure Coding Practices - Slides 99-107
session_set_cookie_params([
    'lifetime' => 0,
    'path' => '/',
    'domain' => '',
    'secure' => true,     // Strict HTTPS (Slide 106)
    'httponly' => true,
    'samesite' => 'Strict' // CSRF protection (Slide 106)
]);

require_once 'db_config.php';
session_start();

$db = getDB();
$method = $_SERVER['REQUEST_METHOD'];

try {
    // Check if user is logged in and has appropriate role
    if (!isset($_SESSION['user_id'])) {
        sendError('Not authenticated', 401);
    }

    $user_id = $_SESSION['user_id'];

    // Check if this is an admin session (from admin_accounts table)
    if (isset($_SESSION['is_admin_session']) && $_SESSION['is_admin_session']) {
        // Fetch from admin_accounts table
        $current_user = $db->fetchOne(
            "SELECT id, email, first_name, last_name, role FROM admin_accounts WHERE id = ?",
            [$user_id]
        );

        if (!$current_user) {
            sendError('Admin account not found', 404);
        }

        // Admin accounts don't have is_admin field, they always have admin/superadmin role
        $current_user['is_admin'] = 1;
    } else {
        // Fetch from users table (regular user or legacy admin)
        $current_user = $db->fetchOne(
            "SELECT id, email, role, is_admin FROM users WHERE id = ?",
            [$user_id]
        );

        if (!$current_user) {
            sendError('User not found', 404);
        }
    }

    // Determine role for logic
    $current_user_role = $current_user['role'] ?? ($current_user['is_admin'] ? 'admin' : 'user');
    // Check if superadmin using database role field
    $is_superadmin = ($current_user['role'] === 'superadmin');

    $action = $_GET['action'] ?? $_POST['action'] ?? null;

    // ========================================
    // ADMINS MANAGEMENT (Superadmin only)
    // ========================================

    if ($action === 'getAdmins') {
        // Only superadmin and admins can list other admins
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        $admins = $db->fetchAll(
            "SELECT id, email, first_name, last_name, phone, role, created_at 
             FROM users WHERE role IN ('admin', 'superadmin') AND id != ? ORDER BY created_at DESC",
            [$user_id]
        );

        sendSuccess(['admins' => $admins]);
    }

    // Create new admin (superadmin only)
    elseif ($action === 'createAdmin') {
        if ($current_user['role'] !== 'superadmin') {
            sendError('Unauthorized - Superadmin only', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

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

        if (!validateEmail($email)) {
            sendError('Invalid email format');
        }

        // Validate email length (maximum 100 characters)
        if (strlen($email) > 100) {
            sendError('Email must not exceed 100 characters');
        }

        if (strlen($password) < 8) {
            sendError('Password must be at least 8 characters');
        }

        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already exists');
        }

        $password_hash = securePasswordHash($password);

        $admin_id = $db->insert(
            "INSERT INTO users (email, password_hash, first_name, last_name, phone, role, is_admin) 
             VALUES (?, ?, ?, ?, ?, 'admin', 1)",
            [$email, $password_hash, $first_name, $last_name, $phone]
        );
        logAuditEvent('CREATE', 'admin', $admin_id, $user_id, ['email' => $email, 'first_name' => $first_name, 'last_name' => $last_name]);

        sendSuccess(['admin_id' => $admin_id], 'Admin created successfully');
    }

    // Update admin
    elseif ($action === 'updateAdmin') {
        if ($current_user['role'] !== 'superadmin') {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $admin_id = $_POST['admin_id'] ?? null;
        if (!$admin_id) {
            sendError('Admin ID required');
        }

        $updates = [];
        $params = [];

        if (isset($_POST['first_name']) && trim($_POST['first_name']) !== '') {
            $updates[] = "first_name = ?";
            $params[] = sanitizeInput($_POST['first_name']);
        }
        if (isset($_POST['last_name']) && trim($_POST['last_name']) !== '') {
            $updates[] = "last_name = ?";
            $params[] = sanitizeInput($_POST['last_name']);
        }
        if (isset($_POST['phone'])) {
            $updates[] = "phone = ?";
            $params[] = sanitizeInput($_POST['phone']);
        }
        if (isset($_POST['password']) && trim($_POST['password']) !== '') {
            $updates[] = "password_hash = ?";
            $params[] = securePasswordHash($_POST['password']);
        }

        if (empty($updates)) {
            sendError('No fields to update');
        }

        $params[] = $admin_id;
        $sql = "UPDATE users SET " . implode(", ", $updates) . " WHERE id = ? AND role IN ('admin', 'superadmin')";
        $db->query($sql, $params);
        logAuditEvent('UPDATE', 'admin', $admin_id, $user_id, $updates);

        sendSuccess([], 'Admin updated successfully');
    }

    // Delete admin
    elseif ($action === 'deleteAdmin') {
        if ($current_user['role'] !== 'superadmin') {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $admin_id = $_POST['admin_id'] ?? null;
        if (!$admin_id) {
            sendError('Admin ID required');
        }

        if ($admin_id == $user_id) {
            sendError('Cannot delete yourself');
        }

        $db->query("DELETE FROM users WHERE id = ? AND role IN ('admin', 'superadmin')", [$admin_id]);
        logAuditEvent('DELETE', 'admin', $admin_id, $user_id, ['action' => 'delete_admin']);
        sendSuccess([], 'Admin deleted successfully');
    }

    // ========================================
    // USERS MANAGEMENT (Admin & Superadmin)
    // ========================================
    elseif ($action === 'getUsers') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        // Optional filter: include_archived=1 to show all, include_archived=2 to show only archived
        $includeArchived = isset($_GET['include_archived']) ? (int) $_GET['include_archived'] : 0;

        if ($includeArchived === 2) {
            // Only archived users
            $users = $db->fetchAll(
                "SELECT id, email, first_name, last_name, phone, role, is_archived, archived_at, created_at 
                 FROM users WHERE role = 'user' AND is_archived = 1 ORDER BY archived_at DESC"
            );
        } elseif ($includeArchived === 1) {
            // All users (active and archived)
            $users = $db->fetchAll(
                "SELECT id, email, first_name, last_name, phone, role, is_archived, archived_at, created_at 
                 FROM users WHERE role = 'user' ORDER BY created_at DESC"
            );
        } else {
            // Only active users (default)
            $users = $db->fetchAll(
                "SELECT id, email, first_name, last_name, phone, role, is_archived, archived_at, created_at 
                 FROM users WHERE role = 'user' AND (is_archived = 0 OR is_archived IS NULL) ORDER BY created_at DESC"
            );
        }

        sendSuccess(['users' => $users]);
    }

    // Create new user (for admin)
    elseif ($action === 'createUser') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $required = ['email', 'password', 'first_name', 'last_name'];
        $missing = validateRequired($required, $_POST);
        if (!empty($missing)) {
            sendError('Missing required fields: ' . implode(', ', $missing));
        }

        $email = sanitizeInput($_POST['email']);
        $password = $_POST['password'];
        $first_name = sanitizeInput($_POST['first_name']);
        $last_name = sanitizeInput($_POST['last_name']);
        $phone = isset($_POST['phone']) ? sanitizeInput($_POST['phone']) : null;

        if (!validateEmail($email)) {
            sendError('Invalid email format');
        }

        // Validate email length (maximum 100 characters)
        if (strlen($email) > 100) {
            sendError('Email must not exceed 100 characters');
        }

        if (strlen($password) < 8) {
            sendError('Password must be at least 8 characters');
        }

        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already exists');
        }

        $password_hash = securePasswordHash($password);

        $user_id_new = $db->insert(
            "INSERT INTO users (email, password_hash, first_name, last_name, phone, role, is_admin) 
             VALUES (?, ?, ?, ?, ?, 'user', 0)",
            [$email, $password_hash, $first_name, $last_name, $phone]
        );

        sendSuccess(['user_id' => $user_id_new], 'User created successfully');
    }

    // Update user
    elseif ($action === 'updateUser') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $target_user_id = $_POST['user_id'] ?? null;
        if (!$target_user_id) {
            sendError('User ID required');
        }

        $updates = [];
        $params = [];

        if (isset($_POST['first_name']) && trim($_POST['first_name']) !== '') {
            $updates[] = "first_name = ?";
            $params[] = sanitizeInput($_POST['first_name']);
        }
        if (isset($_POST['last_name']) && trim($_POST['last_name']) !== '') {
            $updates[] = "last_name = ?";
            $params[] = sanitizeInput($_POST['last_name']);
        }
        if (isset($_POST['phone'])) {
            $updates[] = "phone = ?";
            $params[] = sanitizeInput($_POST['phone']);
        }
        if (isset($_POST['password']) && trim($_POST['password']) !== '') {
            $updates[] = "password_hash = ?";
            $params[] = securePasswordHash($_POST['password']);
        }

        if (empty($updates)) {
            sendError('No fields to update');
        }

        $params[] = $target_user_id;
        $sql = "UPDATE users SET " . implode(", ", $updates) . " WHERE id = ? AND role = 'user'";
        $db->query($sql, $params);

        logAuditEvent('UPDATE', 'user', $target_user_id, $user_id, ['fields' => array_keys($_POST)]);
        sendSuccess([], 'User updated successfully');
    }

    // Delete user (actually archives them - soft delete)
    elseif ($action === 'deleteUser') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $target_user_id = $_POST['user_id'] ?? null;
        if (!$target_user_id) {
            sendError('User ID required');
        }

        // Archive the user instead of deleting (soft delete)
        $db->query(
            "UPDATE users SET is_archived = 1, archived_at = NOW() WHERE id = ? AND role = 'user'",
            [$target_user_id]
        );
        logAuditEvent('ARCHIVE', 'user', $target_user_id, $user_id, ['action' => 'archive_user']);
        sendSuccess([], 'User archived successfully');
    }

    // Reactivate user (un-archive)
    elseif ($action === 'reactivateUser') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $target_user_id = $_POST['user_id'] ?? null;
        if (!$target_user_id) {
            sendError('User ID required');
        }

        // Reactivate the user (set is_archived = 0)
        $db->query(
            "UPDATE users SET is_archived = 0, archived_at = NULL WHERE id = ? AND role = 'user'",
            [$target_user_id]
        );
        logAuditEvent('REACTIVATE', 'user', $target_user_id, $user_id, ['action' => 'reactivate_user']);
        sendSuccess([], 'User reactivated successfully');
    }

    // Unlock user account (clear failed login attempts)
    elseif ($action === 'unlockAccount') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $email = isset($_POST['email']) ? sanitizeInput($_POST['email']) : null;
        $account_type = isset($_POST['account_type']) ? $_POST['account_type'] : 'user';

        if (!$email) {
            sendError('Email required');
        }

        // Validate account_type
        if (!in_array($account_type, ['user', 'admin'])) {
            sendError('Invalid account type');
        }

        // Delete all failed login attempts for this email and account type
        $db->query(
            "DELETE FROM login_attempts 
             WHERE email = ? AND account_type = ? AND success = 0",
            [$email, $account_type]
        );

        logAuditEvent('UNLOCK', 'account', 0, $user_id, ['email' => $email, 'account_type' => $account_type]);
        sendSuccess([], 'Account unlocked successfully');
    }

    // ========================================
    // EMPLOYEES MANAGEMENT (Admin & Superadmin)
    // ========================================
    elseif ($action === 'getEmployees') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        // Optional filter: include_archived=1 to show all, include_archived=2 to show only archived
        $includeArchived = isset($_GET['include_archived']) ? (int) $_GET['include_archived'] : 0;

        // In the new schema, employees have role='employee'
        if ($includeArchived === 2) {
            // Only archived employees
            $employees = $db->fetchAll(
                "SELECT id, email, first_name, last_name, phone, role, is_archived, archived_at, created_at 
                 FROM users WHERE role = 'employee' AND is_archived = 1 ORDER BY archived_at DESC"
            );
        } elseif ($includeArchived === 1) {
            // All employees (active and archived)
            $employees = $db->fetchAll(
                "SELECT id, email, first_name, last_name, phone, role, is_archived, archived_at, created_at 
                 FROM users WHERE role = 'employee' ORDER BY created_at DESC"
            );
        } else {
            // Only active employees (default)
            $employees = $db->fetchAll(
                "SELECT id, email, first_name, last_name, phone, role, is_archived, archived_at, created_at 
                 FROM users WHERE role = 'employee' AND (is_archived = 0 OR is_archived IS NULL) ORDER BY created_at DESC"
            );
        }

        sendSuccess(['employees' => $employees]);
    }

    // Create new employee
    elseif ($action === 'createEmployee') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $required = ['email', 'password', 'first_name', 'last_name'];
        $missing = validateRequired($required, $_POST);
        if (!empty($missing)) {
            sendError('Missing required fields: ' . implode(', ', $missing));
        }

        $email = sanitizeInput($_POST['email']);
        $password = $_POST['password'];
        $first_name = sanitizeInput($_POST['first_name']);
        $last_name = sanitizeInput($_POST['last_name']);
        $phone = isset($_POST['phone']) ? sanitizeInput($_POST['phone']) : null;

        if (!validateEmail($email)) {
            sendError('Invalid email format');
        }

        // Validate email length (maximum 100 characters)
        if (strlen($email) > 100) {
            sendError('Email must not exceed 100 characters');
        }

        if (strlen($password) < 8) {
            sendError('Password must be at least 8 characters');
        }

        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already exists');
        }

        $password_hash = securePasswordHash($password);

        $employee_id = $db->insert(
            "INSERT INTO users (email, password_hash, first_name, last_name, phone, role, is_admin) 
             VALUES (?, ?, ?, ?, ?, 'employee', 0)",
            [$email, $password_hash, $first_name, $last_name, $phone]
        );

        sendSuccess(['employee_id' => $employee_id], 'Employee created successfully');
    }

    // Update employee
    elseif ($action === 'updateEmployee') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $employee_id = $_POST['employee_id'] ?? null;
        if (!$employee_id) {
            sendError('Employee ID required');
        }

        $updates = [];
        $params = [];

        if (isset($_POST['first_name']) && trim($_POST['first_name']) !== '') {
            $updates[] = "first_name = ?";
            $params[] = sanitizeInput($_POST['first_name']);
        }
        if (isset($_POST['last_name']) && trim($_POST['last_name']) !== '') {
            $updates[] = "last_name = ?";
            $params[] = sanitizeInput($_POST['last_name']);
        }
        if (isset($_POST['phone'])) {
            $updates[] = "phone = ?";
            $params[] = sanitizeInput($_POST['phone']);
        }
        if (isset($_POST['password']) && trim($_POST['password']) !== '') {
            $updates[] = "password_hash = ?";
            $params[] = securePasswordHash($_POST['password']);
        }

        if (empty($updates)) {
            sendError('No fields to update');
        }

        $params[] = $employee_id;
        $sql = "UPDATE users SET " . implode(", ", $updates) . " WHERE id = ? AND role = 'employee'";
        $db->query($sql, $params);

        logAuditEvent('UPDATE', 'employee', $employee_id, $user_id, ['fields' => array_keys($_POST)]);
        sendSuccess([], 'Employee updated successfully');
    }

    // Delete employee (actually archives them - soft delete)
    elseif ($action === 'deleteEmployee') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $employee_id = $_POST['employee_id'] ?? null;
        if (!$employee_id) {
            sendError('Employee ID required');
        }

        // Archive the employee instead of deleting (soft delete)
        $db->query(
            "UPDATE users SET is_archived = 1, archived_at = NOW() WHERE id = ? AND role = 'employee'",
            [$employee_id]
        );
        logAuditEvent('ARCHIVE', 'employee', $employee_id, $user_id, ['action' => 'archive_employee']);
        sendSuccess([], 'Employee archived successfully');
    }

    // Reactivate employee (un-archive)
    elseif ($action === 'reactivateEmployee') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $employee_id = $_POST['employee_id'] ?? null;
        if (!$employee_id) {
            sendError('Employee ID required');
        }

        // Reactivate the employee (set is_archived = 0)
        $db->query(
            "UPDATE users SET is_archived = 0, archived_at = NULL WHERE id = ? AND role = 'employee'",
            [$employee_id]
        );
        logAuditEvent('REACTIVATE', 'employee', $employee_id, $user_id, ['action' => 'reactivate_employee']);
        sendSuccess([], 'Employee reactivated successfully');
    }

    // ========================================
    // ADDRESS MANAGEMENT (All authenticated users)
    // ========================================
    elseif ($action === 'getAddresses') {
        $target_user_id = $_GET['user_id'] ?? $user_id;

        // Users can only fetch their own addresses unless admin/superadmin
        if ($target_user_id != $user_id && !in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        $addresses = $db->fetchAll(
            "SELECT id, label, line1, line2, city, state, postal_code, country, phone, is_default, created_at 
             FROM addresses WHERE user_id = ? ORDER BY created_at DESC",
            [$target_user_id]
        );

        sendSuccess(['addresses' => $addresses]);
    } elseif ($action === 'addAddress') {
        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $target_user_id = $_POST['user_id'] ?? $user_id;

        // Users can only add addresses for themselves unless admin/superadmin
        if ($target_user_id != $user_id && !in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        $required = ['line1', 'city', 'postal_code', 'country'];
        $missing = validateRequired($required, $_POST);
        if (!empty($missing)) {
            sendError('Missing required fields: ' . implode(', ', $missing));
        }

        $label = isset($_POST['label']) ? sanitizeInput($_POST['label']) : null;
        $phone = isset($_POST['phone']) ? sanitizeInput($_POST['phone']) : null;
        $line1 = sanitizeInput($_POST['line1']);
        $line2 = isset($_POST['line2']) ? sanitizeInput($_POST['line2']) : null;
        $city = sanitizeInput($_POST['city']);
        $state = isset($_POST['state']) ? sanitizeInput($_POST['state']) : null;
        $postal_code = sanitizeInput($_POST['postal_code']);
        $country = sanitizeInput($_POST['country']);
        $is_default = isset($_POST['is_default']) ? (int) $_POST['is_default'] : 0;

        // If setting as default, unset any existing default for this user
        if ($is_default) {
            $db->execute(
                "UPDATE addresses SET is_default = 0 WHERE user_id = ? AND is_default = 1",
                [$target_user_id]
            );
        }

        $address_id = $db->insert(
            "INSERT INTO addresses (user_id, label, line1, line2, city, state, postal_code, country, phone, is_default) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [$target_user_id, $label, $line1, $line2, $city, $state, $postal_code, $country, $phone, $is_default]
        );

        sendSuccess(['address_id' => $address_id], 'Address added successfully');
    } elseif ($action === 'updateAddress') {
        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $address_id = $_POST['address_id'] ?? null;
        if (!$address_id) {
            sendError('Address ID required');
        }

        // Verify address belongs to user (or user is admin/superadmin)
        $address = $db->fetchOne("SELECT user_id FROM addresses WHERE id = ?", [$address_id]);
        if (!$address) {
            sendError('Address not found', 404);
        }

        if ($address['user_id'] != $user_id && !in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        $updates = [];
        $params = [];

        if (isset($_POST['label'])) {
            $updates[] = "label = ?";
            $params[] = sanitizeInput($_POST['label']);
        }
        if (isset($_POST['phone'])) {
            $updates[] = "phone = ?";
            $params[] = sanitizeInput($_POST['phone']);
        }
        if (isset($_POST['line1'])) {
            $updates[] = "line1 = ?";
            $params[] = sanitizeInput($_POST['line1']);
        }
        if (isset($_POST['line2'])) {
            $updates[] = "line2 = ?";
            $params[] = sanitizeInput($_POST['line2']);
        }
        if (isset($_POST['city'])) {
            $updates[] = "city = ?";
            $params[] = sanitizeInput($_POST['city']);
        }
        if (isset($_POST['state'])) {
            $updates[] = "state = ?";
            $params[] = sanitizeInput($_POST['state']);
        }
        if (isset($_POST['postal_code'])) {
            $updates[] = "postal_code = ?";
            $params[] = sanitizeInput($_POST['postal_code']);
        }
        if (isset($_POST['country'])) {
            $updates[] = "country = ?";
            $params[] = sanitizeInput($_POST['country']);
        }
        if (isset($_POST['is_default'])) {
            $is_default = (int) $_POST['is_default'];
            $updates[] = "is_default = ?";
            $params[] = $is_default;

            // If setting this address as default, unset other defaults for this user
            if ($is_default) {
                $db->execute(
                    "UPDATE addresses SET is_default = 0 WHERE user_id = ? AND id != ?",
                    [$address['user_id'], $address_id]
                );
            }
        }

        if (empty($updates)) {
            sendError('No fields to update');
        }

        $params[] = $address_id;
        $sql = "UPDATE addresses SET " . implode(", ", $updates) . " WHERE id = ?";
        $db->query($sql, $params);

        sendSuccess([], 'Address updated successfully');
    } elseif ($action === 'deleteAddress') {
        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $address_id = $_POST['address_id'] ?? null;
        if (!$address_id) {
            sendError('Address ID required');
        }

        // Verify address belongs to user
        $address = $db->fetchOne("SELECT user_id FROM addresses WHERE id = ?", [$address_id]);
        if (!$address) {
            sendError('Address not found', 404);
        }

        if ($address['user_id'] != $user_id && !in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }

        $db->query("DELETE FROM addresses WHERE id = ?", [$address_id]);
        sendSuccess([], 'Address deleted successfully');
    }

    // ========================================
    // AUDIT LOGS (Superadmin only)
    // ========================================
    elseif ($action === 'getAuditLogs') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized: Only admins can view audit logs', 403);
        }

        $limit = $_GET['limit'] ?? 100;
        $offset = $_GET['offset'] ?? 0;

        $logs = $db->fetchAll(
            "SELECT al.*, u.email, u.first_name, u.last_name 
             FROM audit_logs al
             LEFT JOIN users u ON al.user_id = u.id
             ORDER BY al.created_at DESC
             LIMIT ? OFFSET ?",
            [$limit, $offset]
        );

        sendSuccess(['audit_logs' => $logs]);
    }

    // ========================================
    // PRODUCTS MANAGEMENT (Admin & Superadmin)
    // ========================================

    // Get all products (for dashboards)
    elseif ($action === 'getProducts') {
        if (!in_array($current_user['role'], ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized', 403);
        }

        $products = $db->fetchAll(
            "SELECT p.id, p.name, p.slug, p.category_id, c.name as category_name, p.created_at
             FROM products p
             LEFT JOIN categories c ON p.category_id = c.id
             WHERE p.active = 1
             ORDER BY p.created_at DESC"
        );

        // Get variants and images for each product
        foreach ($products as &$product) {
            $variants = $db->fetchAll(
                "SELECT id, title, price, stock FROM product_variants WHERE product_id = ?",
                [$product['id']]
            );
            $product['variants'] = $variants;

            // Get product images
            $images = $db->fetchAll(
                "SELECT id, url, alt_text, `order` 
                 FROM product_images 
                 WHERE product_id = ? 
                 ORDER BY `order` ASC LIMIT 1",
                [$product['id']]
            );

            // Convert image URLs to use image serving script
            foreach ($images as &$img) {
                $img['url'] = '/HTML_PHP/serve-image.php?path=' . urlencode($img['url']);
            }
            unset($img);

            $product['images'] = $images;
            $product['image_url'] = !empty($images) ? $images[0]['url'] : null;
        }

        sendSuccess(['products' => $products]);
    }

    // Create new product
    elseif ($action === 'createProduct') {
        if (!in_array($current_user['role'], ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $name = $_POST['name'] ?? null;
        $category = $_POST['category'] ?? null;
        $variants = isset($_POST['variants']) ? json_decode($_POST['variants'], true) : [];

        if (!$name || !$category) {
            sendError('Name and category are required');
        }

        // Get category ID from name
        $cat = $db->fetchOne("SELECT id FROM categories WHERE name = ? OR slug = ?", [$category, strtolower(str_replace(' ', '-', $category))]);
        $categoryId = $cat['id'] ?? 1;

        // Create product
        $slug = strtolower(str_replace(' ', '-', $name)) . '-' . time();
        $db->execute(
            "INSERT INTO products (name, slug, category_id, active) VALUES (?, ?, ?, 1)",
            [$name, $slug, $categoryId]
        );

        $productId = $db->lastInsertId();

        // Create variants if provided
        if (!empty($variants)) {
            foreach ($variants as $variant) {
                $db->execute(
                    "INSERT INTO product_variants (product_id, title, price, stock) VALUES (?, ?, ?, ?)",
                    [$productId, $variant['title'] ?? 'Standard', $variant['price'] ?? 0, $variant['stock'] ?? 0]
                );
            }
        }

        // Log audit
        logAuditEvent('CREATE', 'product', $productId, $current_user['id'], ['name' => $name]);

        sendSuccess(['product_id' => $productId]);
    }

    // Update product
    elseif ($action === 'updateProduct') {
        if (!in_array($current_user['role'], ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $productId = $_POST['product_id'] ?? null;
        $name = $_POST['name'] ?? null;
        $category = $_POST['category'] ?? null;
        $basePrice = isset($_POST['base_price']) ? floatval($_POST['base_price']) : 0;
        $variants = isset($_POST['variants']) ? json_decode($_POST['variants'], true) : [];

        if (!$productId || !$name) {
            sendError('Product ID and name are required');
        }

        // Get category ID
        $cat = $db->fetchOne("SELECT id FROM categories WHERE name = ? OR slug = ?", [$category, strtolower(str_replace(' ', '-', $category))]);
        $categoryId = $cat['id'] ?? 1;

        // Update product (no base_price column in products table)
        $db->execute(
            "UPDATE products SET name = ?, category_id = ? WHERE id = ?",
            [$name, $categoryId, $productId]
        );

        // Handle variant updates/inserts
        // Get existing variants
        $existingVariants = $db->fetchAll("SELECT id, title FROM product_variants WHERE product_id = ?", [$productId]);
        $existingVariantTitles = array_column($existingVariants, 'title', 'id');

        // Collect new variant titles
        $newVariantTitles = array_column($variants, 'title');

        // Update or insert variants
        if (!empty($variants)) {
            foreach ($variants as $variant) {
                $variantTitle = $variant['title'] ?? 'Standard';
                $variantPrice = $variant['price'] ?? 0;
                $variantStock = $variant['stock'] ?? 0;

                // Check if variant with this title exists
                $existingId = null;
                foreach ($existingVariantTitles as $id => $title) {
                    if ($title === $variantTitle) {
                        $existingId = $id;
                        break;
                    }
                }

                if ($existingId) {
                    // Update existing variant
                    $db->execute(
                        "UPDATE product_variants SET price = ?, stock = ? WHERE id = ?",
                        [$variantPrice, $variantStock, $existingId]
                    );
                } else {
                    // Insert new variant
                    $db->execute(
                        "INSERT INTO product_variants (product_id, title, price, stock) VALUES (?, ?, ?, ?)",
                        [$productId, $variantTitle, $variantPrice, $variantStock]
                    );
                }
            }
        }

        // Log audit
        logAuditEvent('UPDATE', 'product', $productId, $current_user['id'], ['name' => $name]);

        sendSuccess(['message' => 'Product updated']);
    }

    // Update variant stock
    elseif ($action === 'updateVariantStock') {
        if (!in_array($current_user['role'], ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $variantId = $_POST['variant_id'] ?? null;
        $stock = isset($_POST['stock']) ? intval($_POST['stock']) : null;

        if (!$variantId || $stock === null) {
            sendError('Variant ID and stock are required');
        }

        if ($stock < 0) {
            sendError('Stock cannot be negative');
        }

        // Get current stock for audit logging
        $currentVariant = $db->fetchOne(
            "SELECT stock FROM product_variants WHERE id = ?",
            [$variantId]
        );

        if (!$currentVariant) {
            sendError('Variant not found', 404);
        }

        // Update stock
        $db->execute(
            "UPDATE product_variants SET stock = ? WHERE id = ?",
            [$stock, $variantId]
        );

        // Log audit
        logAuditEvent(
            'UPDATE',
            'variant_stock',
            $variantId,
            $current_user['id'],
            ['previous_stock' => $currentVariant['stock'], 'new_stock' => $stock]
        );

        sendSuccess(['message' => 'Stock updated successfully', 'stock' => $stock]);
    }

    // Delete product
    elseif ($action === 'deleteProduct') {
        if (!in_array($current_user['role'], ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized', 403);
        }

        $productId = $_GET['product_id'] ?? $_POST['product_id'] ?? null;

        if (!$productId) {
            sendError('Product ID is required');
        }

        // Soft delete - mark as inactive
        $db->execute("UPDATE products SET active = 0 WHERE id = ?", [$productId]);

        // Log audit
        logAuditEvent('DELETE', 'product', $productId, $current_user['id'], ['product_id' => $productId]);

        sendSuccess(['message' => 'Product deleted']);
    }

    // ========================================
    // AUDIT TRAIL MANAGEMENT (Admin & Superadmin)
    // ========================================

    // Get audit trail logs (paginated)
    elseif ($action === 'getAuditTrail') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized - Admin access required', 403);
        }

        // Pagination parameters
        $page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
        $perPage = isset($_GET['per_page']) ? min(100, max(10, intval($_GET['per_page']))) : 25;
        $offset = ($page - 1) * $perPage;

        // Filter parameters
        $actorEmail = isset($_GET['actor_email']) ? sanitizeInput($_GET['actor_email']) : null;
        $actionType = isset($_GET['action_type']) ? sanitizeInput($_GET['action_type']) : null;
        $actionCategory = isset($_GET['action_category']) ? sanitizeInput($_GET['action_category']) : null;
        $dateFrom = isset($_GET['date_from']) ? sanitizeInput($_GET['date_from']) : null;
        $dateTo = isset($_GET['date_to']) ? sanitizeInput($_GET['date_to']) : null;

        // Build combined query from audit_trail (all categories) + login_attempts (authentication)
        // This union ensures all CRUD, auth, and system events appear in the audit log
        $baseSql = "SELECT * FROM (
            -- All entries from audit_trail table (CRUD, auth, system, etc.)
            SELECT 
                at.id,
                at.actor_email,
                at.actor_role,
                at.action_type,
                at.action_category,
                at.description,
                at.actor_ip,
                at.created_at,
                'audit_trail' as source
            FROM audit_trail at

            UNION ALL

            -- Login attempts not already in audit_trail (authentication events from users)
            SELECT 
                la.id + 1000000 as id,
                la.email as actor_email,
                CASE 
                    WHEN la.account_type = 'admin' THEN 'admin'
                    ELSE 'admin'
                END as actor_role,
                CASE 
                    WHEN la.success = 1 AND la.failure_reason = 'Logout' THEN 'LOGOUT'
                    WHEN la.success = 1 THEN 'LOGIN'
                    WHEN la.failure_reason LIKE '%locked%' THEN 'ACCOUNT_LOCKED'
                    ELSE 'LOGIN_FAILED'
                END as action_type,
                'AUTHENTICATION' as action_category,
                CASE 
                    WHEN la.success = 1 AND la.failure_reason = 'Logout' THEN 'Logout'
                    WHEN la.success = 1 THEN CONCAT('Login Success (', la.account_type, ')')
                    WHEN la.failure_reason LIKE '%locked%' THEN CONCAT('Account Locked - ', la.failure_reason)
                    ELSE CONCAT('Login Failed - ', COALESCE(la.failure_reason, 'Unknown reason'))
                END as description,
                la.ip_address as actor_ip,
                la.attempt_time as created_at,
                'login_attempts' as source
            FROM login_attempts la
            WHERE NOT EXISTS (
                SELECT 1 FROM audit_trail at2 
                WHERE at2.actor_email = la.email 
                AND at2.action_category = 'AUTHENTICATION'
                AND at2.created_at = la.attempt_time
            )
        ) combined";

        // Build WHERE conditions on the combined result
        $whereConditions = [];
        $params = [];

        if ($actorEmail) {
            $whereConditions[] = "actor_email LIKE ?";
            $params[] = "%$actorEmail%";
        }
        if ($actionType) {
            $whereConditions[] = "action_type = ?";
            $params[] = $actionType;
        }
        if ($actionCategory) {
            $whereConditions[] = "action_category = ?";
            $params[] = $actionCategory;
        }
        if ($dateFrom) {
            $whereConditions[] = "created_at >= ?";
            $params[] = $dateFrom . ' 00:00:00';
        }
        if ($dateTo) {
            $whereConditions[] = "created_at <= ?";
            $params[] = $dateTo . ' 23:59:59';
        }

        $whereClause = !empty($whereConditions) ? ' WHERE ' . implode(' AND ', $whereConditions) : '';

        // Get total count
        $countSql = "SELECT COUNT(*) as total FROM ($baseSql $whereClause) as counted";
        $countResult = $db->fetchOne($countSql, $params);
        $totalItems = $countResult['total'] ?? 0;

        // Get paginated results
        $sql = "$baseSql $whereClause ORDER BY created_at DESC LIMIT ? OFFSET ?";
        $paginatedParams = array_merge($params, [$perPage, $offset]);

        $logs = $db->fetchAll($sql, $paginatedParams);

        // Send response with timestamps preserved (audit logs NEED timestamps!)
        sendSuccess([
            'audit_logs' => $logs,
            'pagination' => [
                'current_page' => $page,
                'per_page' => $perPage,
                'total_items' => $totalItems,
                'total_pages' => max(1, ceil($totalItems / $perPage))
            ]
        ], null, true); // true = preserve timestamps for audit logs
    }

    // Get audit trail statistics
    elseif ($action === 'getAuditStats') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized - Admin access required', 403);
        }

        // Get action type counts
        $actionTypeCounts = $db->fetchAll(
            "SELECT action_type, COUNT(*) as count 
             FROM audit_trail 
             WHERE created_at > DATE_SUB(NOW(), INTERVAL 30 DAY)
             GROUP BY action_type 
             ORDER BY count DESC"
        );

        // Get daily activity for last 7 days
        $dailyActivity = $db->fetchAll(
            "SELECT DATE(created_at) as date, COUNT(*) as count 
             FROM audit_trail 
             WHERE created_at > DATE_SUB(NOW(), INTERVAL 7 DAY)
             GROUP BY DATE(created_at) 
             ORDER BY date DESC"
        );

        // Get top actors
        $topActors = $db->fetchAll(
            "SELECT actor_email, actor_role, COUNT(*) as action_count 
             FROM audit_trail 
             WHERE created_at > DATE_SUB(NOW(), INTERVAL 30 DAY)
             GROUP BY actor_email, actor_role 
             ORDER BY action_count DESC 
             LIMIT 10"
        );

        sendSuccess([
            'action_type_counts' => $actionTypeCounts,
            'daily_activity' => $dailyActivity,
            'top_actors' => $topActors
        ]);
    }

    // Get login history (paginated, read-only)
    elseif ($action === 'getLoginHistory') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized - Admin access required', 403);
        }

        // Pagination parameters
        $page = isset($_GET['page']) ? max(1, intval($_GET['page'])) : 1;
        $perPage = isset($_GET['per_page']) ? min(100, max(10, intval($_GET['per_page']))) : 25;
        $offset = ($page - 1) * $perPage;

        // Filter by account type
        $accountType = isset($_GET['account_type']) ? sanitizeInput($_GET['account_type']) : null;

        $whereClause = $accountType ? "WHERE account_type = ?" : "";
        $params = $accountType ? [$accountType] : [];

        // Get total count
        $countSql = "SELECT COUNT(*) as total FROM login_attempts $whereClause";
        $countResult = $db->fetchOne($countSql, $params);
        $totalItems = $countResult['total'] ?? 0;

        // Get paginated results
        $sql = "SELECT id, email, account_type, ip_address, attempt_time, success, failure_reason 
                FROM login_attempts 
                $whereClause 
                ORDER BY attempt_time DESC 
                LIMIT ? OFFSET ?";

        $params[] = $perPage;
        $params[] = $offset;

        $logs = $db->fetchAll($sql, $params);

        sendSuccess([
            'login_history' => $logs,
            'pagination' => [
                'current_page' => $page,
                'per_page' => $perPage,
                'total_items' => $totalItems,
                'total_pages' => ceil($totalItems / $perPage)
            ]
        ]);
    }

    // Get currently locked accounts
    elseif ($action === 'getLockedAccounts') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized - Admin access required', 403);
        }

        $lockedAccounts = $db->fetchAll(
            "SELECT 
                email,
                account_type,
                COUNT(*) as failed_attempts,
                MAX(attempt_time) as last_attempt,
                DATE_ADD(MAX(attempt_time), INTERVAL 15 MINUTE) as locked_until
             FROM login_attempts
             WHERE success = 0
               AND attempt_time > DATE_SUB(NOW(), INTERVAL 15 MINUTE)
             GROUP BY email, account_type
             HAVING COUNT(*) >= 3"
        );

        sendSuccess(['locked_accounts' => $lockedAccounts]);
    }

    // Unlock an account (superadmin only)
    elseif ($action === 'unlockAccount') {
        if ($current_user['role'] !== 'superadmin') {
            sendError('Unauthorized - Superadmin access required', 403);
        }

        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }

        $email = isset($_POST['email']) ? sanitizeInput($_POST['email']) : null;
        $accountType = isset($_POST['account_type']) ? sanitizeInput($_POST['account_type']) : 'admin';

        if (!$email) {
            sendError('Email is required');
        }

        // Delete failed login attempts to unlock
        $db->query(
            "DELETE FROM login_attempts 
             WHERE email = ? AND account_type = ? AND success = 0",
            [$email, $accountType]
        );

        // Log this action to audit trail
        logAuditTrailEntry(
            $db,
            $current_user['id'],
            $current_user['email'],
            $current_user['role'],
            'SECURITY_EVENT',
            'SECURITY',
            "Manually unlocked account: $email ($accountType)",
            'account',
            null,
            $email
        );

        sendSuccess(['message' => "Account $email has been unlocked"]);
    } else {
        sendError('Unknown action', 400);
    }

} catch (Exception $e) {
    error_log("Management API Error: " . $e->getMessage());
    sendError('An error occurred: ' . $e->getMessage(), 500);
}

// Helper function to log audit trail view
function logAuditTrailView($db, $userId, $email, $role)
{
    try {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'] ?? $_SERVER['REMOTE_ADDR'] ?? 'unknown';
        $ua = substr($_SERVER['HTTP_USER_AGENT'] ?? 'unknown', 0, 500);

        $db->insert(
            "INSERT INTO audit_trail (
                actor_id, actor_email, actor_role, actor_ip, actor_user_agent,
                action_type, action_category, description, session_id, request_uri
            ) VALUES (?, ?, ?, ?, ?, 'VIEW', 'SYSTEM', 'Viewed audit trail logs', ?, ?)",
            [$userId, $email, $role, $ip, $ua, session_id(), $_SERVER['REQUEST_URI'] ?? '']
        );
    } catch (Exception $e) {
        // Silently fail - don't break the main request
        error_log("Failed to log audit view: " . $e->getMessage());
    }
}

// Helper function to log audit trail entry
function logAuditTrailEntry($db, $userId, $email, $role, $actionType, $category, $description, $targetType = null, $targetId = null, $targetIdentifier = null)
{
    try {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'] ?? $_SERVER['REMOTE_ADDR'] ?? 'unknown';
        $ua = substr($_SERVER['HTTP_USER_AGENT'] ?? 'unknown', 0, 500);

        $db->insert(
            "INSERT INTO audit_trail (
                actor_id, actor_email, actor_role, actor_ip, actor_user_agent,
                action_type, action_category, target_type, target_id, target_identifier,
                description, session_id, request_uri
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [$userId, $email, $role, $ip, $ua, $actionType, $category, $targetType, $targetId, $targetIdentifier, $description, session_id(), $_SERVER['REQUEST_URI'] ?? '']
        );
    } catch (Exception $e) {
        error_log("Failed to log audit entry: " . $e->getMessage());
    }
}
?>