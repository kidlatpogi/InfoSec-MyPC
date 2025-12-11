<?php
/**
 * Test API Endpoint
 */

require_once 'db_config.php';
session_start();

// Simulate logged in user
$_SESSION['user_id'] = 1;

$db = getDB();

// Test getProducts from management.php logic
try {
    $products = $db->fetchAll(
        "SELECT p.id, p.name, p.slug, p.base_price, p.category_id, c.name as category_name, p.created_at
         FROM products p
         LEFT JOIN categories c ON p.category_id = c.id
         WHERE p.is_active = 1
         ORDER BY p.created_at DESC
         LIMIT 5"
    );
    
    echo "Found " . count($products) . " products\n";
    
    // Get variants for first product
    if (!empty($products)) {
        $product = $products[0];
        echo "\nFirst product: " . $product['name'] . "\n";
        
        $variants = $db->fetchAll(
            "SELECT id, label, price_adjustment FROM product_variants WHERE product_id = ? AND is_active = 1",
            [$product['id']]
        );
        
        echo "Variants count: " . count($variants) . "\n";
        echo "Variants: " . json_encode($variants) . "\n";
    }
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
