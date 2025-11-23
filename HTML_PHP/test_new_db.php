<?php
/**
 * Quick test to verify new database structure and image URLs
 */

require_once __DIR__ . '/Database.php';

try {
    $db = Database::getInstance();

    echo "=== Testing New Database Structure ===\n\n";

    // Test product count
    $stmt = $db->query("SELECT COUNT(*) as count FROM products WHERE is_active = 1");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $count = $result['count'];
    echo "✓ Total active products: {$count}\n\n";

    // Test category distribution
    echo "=== Products by Category ===\n";
    $categories = $db->fetchAll(
        "SELECT c.name, COUNT(p.id) as count 
         FROM categories c 
         LEFT JOIN products p ON c.id = p.category_id AND p.is_active = 1
         WHERE c.is_active = 1
         GROUP BY c.id 
         ORDER BY c.id"
    );

    foreach ($categories as $cat) {
        echo "- {$cat['name']}: {$cat['count']} products\n";
    }

    // Test sample products with GitHub URLs
    echo "\n=== Sample Products with Image URLs ===\n";
    $products = $db->fetchAll(
        "SELECT name, image_url 
         FROM products 
         WHERE is_active = 1 
         ORDER BY id 
         LIMIT 5"
    );

    foreach ($products as $p) {
        $urlCheck = (strpos($p['image_url'], 'github') !== false) ? '✓ GitHub' : '✗ Local';
        echo "{$urlCheck} {$p['name']}\n";
        echo "   URL: " . substr($p['image_url'], 0, 80) . "...\n\n";
    }

    // Test product variants
    $stmt = $db->query("SELECT COUNT(*) as count FROM product_variants");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $variantCount = $result['count'];
    echo "✓ Total product variants: {$variantCount}\n\n";

    echo "✓ All database tests completed!\n";

} catch (Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "\n";
    exit(1);
}
?>