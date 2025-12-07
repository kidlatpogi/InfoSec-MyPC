<?php
/**
 * Test products.php endpoint
 */

require_once 'db_config.php';

$db = getDB();

// Simulate the products.php GET request
$_GET['limit'] = 5;

try {
    $limit = isset($_GET['limit']) ? min(100, max(1, intval($_GET['limit']))) : 20;
    $offset = 0;
    
    $sql = "SELECT p.id, p.sku, p.name, p.slug, p.description, p.base_price, 
                   p.stock_quantity, p.image_url, c.name as category_name, c.slug as category_slug
            FROM products p 
            LEFT JOIN categories c ON p.category_id = c.id 
            WHERE p.is_active = 1
            ORDER BY p.name ASC
            LIMIT ? OFFSET ?";
    
    $products = $db->fetchAll($sql, [$limit, $offset]);
    
    echo "Found " . count($products) . " products\n\n";
    
    // Get variants for each product
    foreach ($products as &$product) {
        $variants = $db->fetchAll(
            "SELECT id, label, price_adjustment FROM product_variants WHERE product_id = ? AND is_active = 1",
            [$product['id']]
        );
        $product['variants'] = $variants;
        
        echo $product['name'] . " - Variants: " . count($variants) . "\n";
    }
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
