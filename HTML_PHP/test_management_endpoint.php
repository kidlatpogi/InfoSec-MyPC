<?php
/**
 * Test management.php endpoint directly
 */

require_once 'db_config.php';
session_start();

// Simulate an employee login
$_SESSION['user_id'] = 1;  // Assuming user 1 exists and is an employee

$db = getDB();

try {
    // Verify user exists and has proper role
    $current_user = $db->fetchOne(
        "SELECT id, role FROM users WHERE id = ?",
        [1]
    );
    
    if (!$current_user) {
        echo "Error: User not found\n";
        exit;
    }
    
    echo "User role: " . $current_user['role'] . "\n";
    echo "User authorized for getProducts: " . (in_array($current_user['role'], ['admin', 'superadmin', 'employee']) ? "YES" : "NO") . "\n\n";
    
    // Test getProducts query
    $products = $db->fetchAll(
        "SELECT p.id, p.name, p.slug, p.base_price, p.category_id, c.name as category_name, p.created_at
         FROM products p
         LEFT JOIN categories c ON p.category_id = c.id
         WHERE p.is_active = 1
         ORDER BY p.created_at DESC
         LIMIT 5"
    );
    
    echo "Found " . count($products) . " products\n\n";
    
    // Get variants for each product
    foreach ($products as &$product) {
        $variants = $db->fetchAll(
            "SELECT id, label, price_adjustment FROM product_variants WHERE product_id = ? AND is_active = 1",
            [$product['id']]
        );
        $product['variants'] = $variants;
        
        echo "Product: " . $product['name'] . " - Variants: " . count($variants) . "\n";
    }
    
    // Output JSON response
    echo "\n\nJSON Response:\n";
    echo json_encode(['success' => true, 'products' => $products], JSON_PRETTY_PRINT) . "\n";
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
    echo "\nStack: " . $e->getTraceAsString();
}
?>
