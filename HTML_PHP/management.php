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
        "SELECT id, email, role, is_admin FROM users WHERE id = ?",
        [$user_id]
    );
    
    if (!$current_user) {
        sendError('User not found', 404);
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
        
        if (strlen($password) < 6) {
            sendError('Password must be at least 6 characters');
        }
        
        $existing = $db->fetchOne("SELECT id FROM users WHERE email = ?", [$email]);
        if ($existing) {
            sendError('Email already exists');
        }
        
        $password_hash = password_hash($password, PASSWORD_BCRYPT);
        
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
            $params[] = password_hash($_POST['password'], PASSWORD_BCRYPT);
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
        
        $users = $db->fetchAll(
            "SELECT id, email, first_name, last_name, phone, role, created_at 
             FROM users WHERE role = 'user' ORDER BY created_at DESC"
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
            $params[] = password_hash($_POST['password'], PASSWORD_BCRYPT);
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
        
        $db->query("DELETE FROM users WHERE id = ? AND role = 'user'", [$target_user_id]);
        logAuditEvent('DELETE', 'user', $target_user_id, $user_id, ['action' => 'delete_user']);
        sendSuccess([], 'User deleted successfully');
    }
    
    // ========================================
    // EMPLOYEES MANAGEMENT (Admin & Superadmin)
    // ========================================
    
    elseif ($action === 'getEmployees') {
        if (!in_array($current_user['role'], ['admin', 'superadmin'])) {
            sendError('Unauthorized', 403);
        }
        
        // In the new schema, employees have role='employee'
        $employees = $db->fetchAll(
            "SELECT id, email, first_name, last_name, phone, role, created_at 
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
            $params[] = password_hash($_POST['password'], PASSWORD_BCRYPT);
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
            "SELECT id, label, line1, line2, city, state, postal_code, country, phone, created_at 
             FROM addresses WHERE user_id = ? ORDER BY created_at DESC",
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
        
        // Accept both 'line1' and 'address_line1' for backwards compatibility
        $line1 = isset($_POST['line1']) ? sanitizeInput($_POST['line1']) : 
                 (isset($_POST['address_line1']) ? sanitizeInput($_POST['address_line1']) : null);
        $line2 = isset($_POST['line2']) ? sanitizeInput($_POST['line2']) : 
                 (isset($_POST['address_line2']) ? sanitizeInput($_POST['address_line2']) : null);
        
        // Validate required fields
        if (!$line1 || !isset($_POST['city']) || !isset($_POST['postal_code'])) {
            sendError('Missing required fields: address, city, and postal code are required');
        }
        
        $label = isset($_POST['label']) ? sanitizeInput($_POST['label']) : null;
        $phone = isset($_POST['phone']) ? sanitizeInput($_POST['phone']) : null;
        $city = sanitizeInput($_POST['city']);
        $state = isset($_POST['state']) ? sanitizeInput($_POST['state']) : null;
        $postal_code = sanitizeInput($_POST['postal_code']);
        $country = isset($_POST['country']) ? sanitizeInput($_POST['country']) : 'Philippines'; // Default to Philippines
        
        $address_id = $db->insert(
            "INSERT INTO addresses (user_id, label, line1, line2, city, state, postal_code, country, phone) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
            [$target_user_id, $label, $line1, $line2, $city, $state, $postal_code, $country, $phone]
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
                $img['url'] = '/serve-image.php?path=' . urlencode($img['url']);
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
        $basePrice = isset($_POST['base_price']) ? floatval($_POST['base_price']) : 0;
        $variants = isset($_POST['variants']) ? json_decode($_POST['variants'], true) : [];
        
        if (!$name || !$category) {
            sendError('Name and category are required');
        }
        
        // Get category ID from name
        $cat = $db->fetchOne("SELECT id FROM categories WHERE name = ? OR slug = ?", [$category, strtolower(str_replace(' ', '-', $category))]);
        $categoryId = $cat['id'] ?? 1;
        
        // Create product using insert() which returns the ID
        $slug = strtolower(str_replace(' ', '-', $name)) . '-' . time();
        $productId = $db->insert(
            "INSERT INTO products (name, slug, category_id, active) VALUES (?, ?, ?, 1)",
            [$name, $slug, $categoryId]
        );
        
        // Create variants - if none provided, create a default variant
        if (!empty($variants)) {
            foreach ($variants as $variant) {
                $db->insert(
                    "INSERT INTO product_variants (product_id, title, price, stock) VALUES (?, ?, ?, ?)",
                    [$productId, $variant['title'] ?? 'Standard', $variant['price'] ?? 0, $variant['stock'] ?? 0]
                );
            }
        } else {
            // Create default variant with base price
            $db->insert(
                "INSERT INTO product_variants (product_id, title, price, stock) VALUES (?, ?, ?, ?)",
                [$productId, 'Standard', $basePrice, 0]
            );
        }
        
        // Log audit
        logAuditEvent('CREATE', 'product', $productId, $current_user['id'], ['name' => $name, 'category' => $category]);
        
        sendSuccess([
            'product_id' => $productId,
            'message' => 'Product created successfully'
        ]);
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
        $variants = isset($_POST['variants']) ? json_decode($_POST['variants'], true) : [];
        
        if (!$productId || !$name) {
            sendError('Product ID and name are required');
        }
        
        // Get category ID
        $cat = $db->fetchOne("SELECT id FROM categories WHERE name = ? OR slug = ?", [$category, strtolower(str_replace(' ', '-', $category))]);
        $categoryId = $cat['id'] ?? 1;
        
        // Update product
        $db->execute(
            "UPDATE products SET name = ?, category_id = ? WHERE id = ?",
            [$name, $categoryId, $productId]
        );
        
        // Delete old variants and create new ones
        $db->execute("DELETE FROM product_variants WHERE product_id = ?", [$productId]);
        if (!empty($variants)) {
            foreach ($variants as $variant) {
                $db->execute(
                    "INSERT INTO product_variants (product_id, title, price, stock) VALUES (?, ?, ?, ?)",
                    [$productId, $variant['title'] ?? 'Standard', $variant['price'] ?? 0, $variant['stock'] ?? 0]
                );
            }
        }
        
        // Log audit
        logAuditEvent('UPDATE', 'product', $productId, $current_user['id'], ['name' => $name]);
        
        sendSuccess(['message' => 'Product updated']);
    }

    // Update product stock (distributes across all variants)
    elseif ($action === 'updateProductStock') {
        if (!in_array($current_user['role'], ['admin', 'superadmin', 'employee'])) {
            sendError('Unauthorized', 403);
        }
        
        if ($method !== 'POST') {
            sendError('Invalid request method', 400);
        }
        
        $productId = $_POST['product_id'] ?? null;
        $newTotalStock = isset($_POST['stock_quantity']) ? intval($_POST['stock_quantity']) : null;
        
        if (!$productId || $newTotalStock === null) {
            sendError('Product ID and stock quantity are required');
        }

        if ($newTotalStock < 0) {
            sendError('Stock cannot be negative');
        }
        
        // Get all variants for this product
        $variants = $db->fetchAll(
            "SELECT id, stock FROM product_variants WHERE product_id = ?",
            [$productId]
        );

        if (empty($variants)) {
            sendError('No variants found for this product', 404);
        }

        // Calculate current total stock
        $currentTotalStock = array_sum(array_column($variants, 'stock'));
        
        // Distribute new stock proportionally across variants
        // If current total is 0, distribute equally
        if ($currentTotalStock == 0) {
            $stockPerVariant = floor($newTotalStock / count($variants));
            $remainder = $newTotalStock % count($variants);
            
            foreach ($variants as $index => $variant) {
                $newStock = $stockPerVariant + ($index < $remainder ? 1 : 0);
                $db->execute(
                    "UPDATE product_variants SET stock = ? WHERE id = ?",
                    [$newStock, $variant['id']]
                );
            }
        } else {
            // Distribute proportionally based on current distribution
            $remainder = $newTotalStock;
            foreach ($variants as $index => $variant) {
                if ($index === count($variants) - 1) {
                    // Last variant gets the remainder to avoid rounding errors
                    $newStock = $remainder;
                } else {
                    $proportion = $variant['stock'] / $currentTotalStock;
                    $newStock = floor($newTotalStock * $proportion);
                    $remainder -= $newStock;
                }
                
                $db->execute(
                    "UPDATE product_variants SET stock = ? WHERE id = ?",
                    [$newStock, $variant['id']]
                );
            }
        }
        
        // Log audit
        logAuditEvent('UPDATE', 'product_stock', $productId, $current_user['id'], 
            ['previous_total_stock' => $currentTotalStock, 'new_total_stock' => $newTotalStock]
        );
        
        sendSuccess(['message' => 'Stock updated successfully', 'total_stock' => $newTotalStock]);
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
        logAuditEvent('UPDATE', 'variant_stock', $variantId, $current_user['id'], 
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
    
    else {
        sendError('Unknown action', 400);
    }
    
} catch (Exception $e) {
    error_log("Management API Error: " . $e->getMessage());
    sendError('An error occurred: ' . $e->getMessage(), 500);
}
?>
