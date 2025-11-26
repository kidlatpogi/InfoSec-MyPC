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
    
    // ========================================
    // PRODUCTS MANAGEMENT (Admin & Superadmin)
    // ========================================
    
    // Get all products (for dashboards)
    elseif ($action === 'getProducts') {
        if (!in_array($current_user['role'], ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized', 403);
        }
        
        $products = $db->fetchAll(
            "SELECT p.id, p.name, p.slug, p.base_price, p.category_id, c.name as category_name, p.created_at
             FROM products p
             LEFT JOIN categories c ON p.category_id = c.id
             WHERE p.is_active = 1
             ORDER BY p.created_at DESC"
        );
        
        // Get variants for each product
        foreach ($products as &$product) {
            $variants = $db->fetchAll(
                "SELECT id, label, price_adjustment FROM product_variants WHERE product_id = ? AND is_active = 1",
                [$product['id']]
            );
            $product['variants'] = $variants;
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
        $basePrice = $_POST['base_price'] ?? 0;
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
            "INSERT INTO products (name, slug, base_price, category_id, is_active) VALUES (?, ?, ?, ?, 1)",
            [$name, $slug, $basePrice, $categoryId]
        );
        
        $productId = $db->lastInsertId();
        
        // Create variants if provided
        if (!empty($variants)) {
            foreach ($variants as $variant) {
                $db->execute(
                    "INSERT INTO product_variants (product_id, label, price_adjustment, is_active) VALUES (?, ?, ?, 1)",
                    [$productId, $variant['label'] ?? '', $variant['priceDelta'] ?? 0]
                );
            }
        }
        
        // Log audit
        logAuditEvent($db, 'CREATE', 'product', $productId, $current_user['id'], json_encode(['name' => $name]));
        
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
        $basePrice = $_POST['base_price'] ?? 0;
        $variants = isset($_POST['variants']) ? json_decode($_POST['variants'], true) : [];
        
        if (!$productId || !$name) {
            sendError('Product ID and name are required');
        }
        
        // Get category ID
        $cat = $db->fetchOne("SELECT id FROM categories WHERE name = ? OR slug = ?", [$category, strtolower(str_replace(' ', '-', $category))]);
        $categoryId = $cat['id'] ?? 1;
        
        // Update product
        $db->execute(
            "UPDATE products SET name = ?, base_price = ?, category_id = ? WHERE id = ?",
            [$name, $basePrice, $categoryId, $productId]
        );
        
        // Delete old variants and create new ones
        $db->execute("DELETE FROM product_variants WHERE product_id = ?", [$productId]);
        if (!empty($variants)) {
            foreach ($variants as $variant) {
                $db->execute(
                    "INSERT INTO product_variants (product_id, label, price_adjustment, is_active) VALUES (?, ?, ?, 1)",
                    [$productId, $variant['label'] ?? '', $variant['priceDelta'] ?? 0]
                );
            }
        }
        
        // Log audit
        logAuditEvent($db, 'UPDATE', 'product', $productId, $current_user['id'], json_encode(['name' => $name]));
        
        sendSuccess(['message' => 'Product updated']);
    }

    // Update product stock
    elseif ($action === 'updateProductStock') {
        if (!in_array($current_user['role'], ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized', 403);
        }
        
        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }
        
        $productId = $_POST['product_id'] ?? null;
        $stockQuantity = isset($_POST['stock_quantity']) ? intval($_POST['stock_quantity']) : null;
        
        if (!$productId || $stockQuantity === null) {
            sendError('Product ID and stock quantity are required');
        }

        if ($stockQuantity < 0) {
            sendError('Stock quantity cannot be negative');
        }
        
        // Get current stock for audit logging
        $currentProduct = $db->fetchOne(
            "SELECT stock_quantity FROM products WHERE id = ?",
            [$productId]
        );

        if (!$currentProduct) {
            sendError('Product not found', 404);
        }

        // Update stock
        $db->execute(
            "UPDATE products SET stock_quantity = ? WHERE id = ?",
            [$stockQuantity, $productId]
        );
        
        // Log audit
        logAuditEvent($db, 'UPDATE', 'product_stock', $productId, $current_user['id'], 
            json_encode([
                'previous_stock' => $currentProduct['stock_quantity'],
                'new_stock' => $stockQuantity
            ])
        );
        
        sendSuccess(['message' => 'Product stock updated successfully', 'stock_quantity' => $stockQuantity]);
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
        $db->execute("UPDATE products SET is_active = 0 WHERE id = ?", [$productId]);
        
        // Log audit
        logAuditEvent($db, 'DELETE', 'product', $productId, $current_user['id'], json_encode(['product_id' => $productId]));
        
        sendSuccess(['message' => 'Product deleted']);
    }
    
    else {
        sendError('Unknown action', 400);
    }
    
} catch (Exception $e) {
    error_log("Management API Error: " . $e->getMessage());
    sendError('An error occurred: ' . $e->getMessage(), 500);
}
?>
