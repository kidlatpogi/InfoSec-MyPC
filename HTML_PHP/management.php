<?php
/**
 * Management API - Admin & Superadmin Operations
 * Handles user, admin, employee, and address management
 */

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
    $current_user = $db->fetchOne(
        "SELECT id, role FROM users WHERE id = ?",
        [$user_id]
    );
    
    if (!$current_user) {
        sendError('User not found', 404);
    }
    
    $action = $_GET['action'] ?? $_POST['action'] ?? null;
    
    // ========================================
    // ADMINS MANAGEMENT (Superadmin only)
    // ========================================
    
    if ($action === 'getAdmins') {
        if ($current_user['role'] !== 'superadmin') {
            sendError('Unauthorized: Only superadmins can manage admins', 403);
        }
        
        $admins = $db->fetchAll(
            "SELECT id, email, first_name, last_name, phone, status, created_at 
             FROM users WHERE role = 'admin' ORDER BY created_at DESC"
        );
        
        sendSuccess(['admins' => $admins]);
    }
    
    // Create new admin
    elseif ($action === 'createAdmin') {
        if ($current_user['role'] !== 'superadmin') {
            sendError('Unauthorized: Only superadmins can create admins', 403);
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
        
        if (strlen($password) < 6) {
            sendError('Password must be at least 6 characters');
        }
        
        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already exists');
        }
        
        $password_hash = password_hash($password, PASSWORD_BCRYPT);
        
        $admin_id = $db->insert(
            "INSERT INTO users (email, password_hash, first_name, last_name, phone, role, status) 
             VALUES (?, ?, ?, ?, ?, 'admin', 'active')",
            [$email, $password_hash, $first_name, $last_name, $phone]
        );
        logAuditEvent('CREATE', 'admin', $admin_id, $user_id, ['email' => $email, 'name' => "$first_name $last_name"]);
        
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
        
        if (isset($_POST['first_name'])) {
            $updates[] = "first_name = ?";
            $params[] = sanitizeInput($_POST['first_name']);
        }
        if (isset($_POST['last_name'])) {
            $updates[] = "last_name = ?";
            $params[] = sanitizeInput($_POST['last_name']);
        }
        if (isset($_POST['phone'])) {
            $updates[] = "phone = ?";
            $params[] = sanitizeInput($_POST['phone']);
        }
        if (isset($_POST['status'])) {
            $updates[] = "status = ?";
            $params[] = $_POST['status'];
        }
        
        if (empty($updates)) {
            sendError('No fields to update');
        }
        
        $params[] = $admin_id;
        $sql = "UPDATE users SET " . implode(", ", $updates) . " WHERE id = ? AND role = 'admin'";
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
        
        $db->query("DELETE FROM users WHERE id = ? AND role = 'admin'", [$admin_id]);
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
        
        $users = $db->fetchAll(
            "SELECT id, email, first_name, last_name, phone, role, status, created_at 
             FROM users WHERE role = 'customer' ORDER BY created_at DESC"
        );
        
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
        
        if (strlen($password) < 6) {
            sendError('Password must be at least 6 characters');
        }
        
        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already exists');
        }
        
        $password_hash = password_hash($password, PASSWORD_BCRYPT);
        
        $user_id_new = $db->insert(
            "INSERT INTO users (email, password_hash, first_name, last_name, phone, role, status) 
             VALUES (?, ?, ?, ?, ?, 'customer', 'active')",
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
        
        if (isset($_POST['first_name'])) {
            $updates[] = "first_name = ?";
            $params[] = sanitizeInput($_POST['first_name']);
        }
        if (isset($_POST['last_name'])) {
            $updates[] = "last_name = ?";
            $params[] = sanitizeInput($_POST['last_name']);
        }
        if (isset($_POST['phone'])) {
            $updates[] = "phone = ?";
            $params[] = sanitizeInput($_POST['phone']);
        }
        if (isset($_POST['status'])) {
            $updates[] = "status = ?";
            $params[] = $_POST['status'];
        }
        
        if (empty($updates)) {
            sendError('No fields to update');
        }
        
        $params[] = $target_user_id;
        $sql = "UPDATE users SET " . implode(", ", $updates) . " WHERE id = ? AND role = 'customer'";
        $db->query($sql, $params);
        
        sendSuccess([], 'User updated successfully');
    }
    
    // Delete user
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
        
        $db->query("DELETE FROM users WHERE id = ? AND role = 'customer'", [$target_user_id]);
        logAuditEvent('DELETE', 'user', $target_user_id, $user_id, ['action' => 'delete_user']);
        sendSuccess([], 'User deleted successfully');
    }
    
    // ========================================
    // EMPLOYEES MANAGEMENT (Superadmin & Admin)
    // ========================================
    
    elseif ($action === 'getEmployees') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }
        
        $employees = $db->fetchAll(
            "SELECT id, email, first_name, last_name, phone, status, created_at 
             FROM users WHERE role = 'employee' ORDER BY created_at DESC"
        );
        
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
        
        if (strlen($password) < 6) {
            sendError('Password must be at least 6 characters');
        }
        
        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already exists');
        }
        
        $password_hash = password_hash($password, PASSWORD_BCRYPT);
        
        $employee_id = $db->insert(
            "INSERT INTO users (email, password_hash, first_name, last_name, phone, role, status) 
             VALUES (?, ?, ?, ?, ?, 'employee', 'active')",
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
        
        if (isset($_POST['first_name'])) {
            $updates[] = "first_name = ?";
            $params[] = sanitizeInput($_POST['first_name']);
        }
        if (isset($_POST['last_name'])) {
            $updates[] = "last_name = ?";
            $params[] = sanitizeInput($_POST['last_name']);
        }
        if (isset($_POST['phone'])) {
            $updates[] = "phone = ?";
            $params[] = sanitizeInput($_POST['phone']);
        }
        if (isset($_POST['status'])) {
            $updates[] = "status = ?";
            $params[] = $_POST['status'];
        }
        
        if (empty($updates)) {
            sendError('No fields to update');
        }
        
        $params[] = $employee_id;
        $sql = "UPDATE users SET " . implode(", ", $updates) . " WHERE id = ? AND role = 'employee'";
        $db->query($sql, $params);
        
        sendSuccess([], 'Employee updated successfully');
    }
    
    // Delete employee
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
        
        $db->query("DELETE FROM users WHERE id = ? AND role = 'employee'", [$employee_id]);
        logAuditEvent('DELETE', 'employee', $employee_id, $user_id, ['action' => 'delete_employee']);
        sendSuccess([], 'Employee deleted successfully');
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
            "SELECT id, label, recipient_name, phone, address_line1, address_line2, city, postal_code, is_default, created_at 
             FROM addresses WHERE user_id = ? ORDER BY is_default DESC, created_at DESC",
            [$target_user_id]
        );
        
        sendSuccess(['addresses' => $addresses]);
    }
    
    elseif ($action === 'addAddress') {
        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }
        
        $target_user_id = $_POST['user_id'] ?? $user_id;
        
        // Users can only add addresses for themselves unless admin/superadmin
        if ($target_user_id != $user_id && !in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }
        
        $required = ['recipient_name', 'phone', 'address_line1', 'city', 'postal_code'];
        $missing = validateRequired($required, $_POST);
        if (!empty($missing)) {
            sendError('Missing required fields: ' . implode(', ', $missing));
        }
        
        $label = isset($_POST['label']) ? sanitizeInput($_POST['label']) : null;
        $recipient_name = sanitizeInput($_POST['recipient_name']);
        $phone = sanitizeInput($_POST['phone']);
        $address_line1 = sanitizeInput($_POST['address_line1']);
        $address_line2 = isset($_POST['address_line2']) ? sanitizeInput($_POST['address_line2']) : null;
        $city = sanitizeInput($_POST['city']);
        $postal_code = sanitizeInput($_POST['postal_code']);
        $is_default = isset($_POST['is_default']) ? (int)$_POST['is_default'] : 0;
        
        // If setting as default, unset other defaults
        if ($is_default) {
            $db->query("UPDATE addresses SET is_default = 0 WHERE user_id = ?", [$target_user_id]);
        }
        
        $address_id = $db->insert(
            "INSERT INTO addresses (user_id, label, recipient_name, phone, address_line1, address_line2, city, postal_code, is_default) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [$target_user_id, $label, $recipient_name, $phone, $address_line1, $address_line2, $city, $postal_code, $is_default]
        );
        
        sendSuccess(['address_id' => $address_id], 'Address added successfully');
    }
    
    elseif ($action === 'updateAddress') {
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
        if (isset($_POST['recipient_name'])) {
            $updates[] = "recipient_name = ?";
            $params[] = sanitizeInput($_POST['recipient_name']);
        }
        if (isset($_POST['phone'])) {
            $updates[] = "phone = ?";
            $params[] = sanitizeInput($_POST['phone']);
        }
        if (isset($_POST['address_line1'])) {
            $updates[] = "address_line1 = ?";
            $params[] = sanitizeInput($_POST['address_line1']);
        }
        if (isset($_POST['address_line2'])) {
            $updates[] = "address_line2 = ?";
            $params[] = sanitizeInput($_POST['address_line2']);
        }
        if (isset($_POST['city'])) {
            $updates[] = "city = ?";
            $params[] = sanitizeInput($_POST['city']);
        }
        if (isset($_POST['postal_code'])) {
            $updates[] = "postal_code = ?";
            $params[] = sanitizeInput($_POST['postal_code']);
        }
        if (isset($_POST['is_default'])) {
            $is_default = (int)$_POST['is_default'];
            if ($is_default) {
                $db->query("UPDATE addresses SET is_default = 0 WHERE user_id = ?", [$address['user_id']]);
            }
            $updates[] = "is_default = ?";
            $params[] = $is_default;
        }
        
        if (empty($updates)) {
            sendError('No fields to update');
        }
        
        $params[] = $address_id;
        $sql = "UPDATE addresses SET " . implode(", ", $updates) . " WHERE id = ?";
        $db->query($sql, $params);
        
        sendSuccess([], 'Address updated successfully');
    }
    
    elseif ($action === 'deleteAddress') {
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
        if ($current_user['role'] !== 'superadmin') {
            sendError('Unauthorized: Only superadmins can view audit logs', 403);
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
    
    else {
        sendError('Unknown action', 400);
    }
    
} catch (Exception $e) {
    error_log("Management API Error: " . $e->getMessage());
    sendError('An error occurred: ' . $e->getMessage(), 500);
}
?>
