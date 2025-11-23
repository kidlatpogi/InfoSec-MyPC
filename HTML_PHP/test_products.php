<?php
/**
 * Quick test to verify products can be fetched with images
 */

require_once __DIR__ . '/Database.php';

try {
    $db = Database::getInstance();

    echo "=== Testing Product Fetch with Images ===\n\n";

    // Fetch all products
    $products = $db->fetchAll(
        "SELECT p.id, p.name, p.image_url, c.name as category_name 
         FROM products p 
         LEFT JOIN categories c ON p.category_id = c.id 
         WHERE p.is_active = 1 
         ORDER BY c.id, p.id 
         LIMIT 10"
    );

    echo "Found " . count($products) . " products:\n\n";

    foreach ($products as $product) {
        $imagePath = __DIR__ . '/..' . $product['image_url'];
        $imageExists = file_exists($imagePath) ? '✓' : '✗';

        echo "{$imageExists} [{$product['category_name']}] {$product['name']}\n";
        echo "   Image: {$product['image_url']}\n";
        if (!file_exists($imagePath)) {
            echo "   WARNING: Image file not found at: {$imagePath}\n";
        }
        echo "\n";
    }

    // Test categories
    echo "\n=== Categories ===\n";
    $categories = $db->fetchAll("SELECT name, slug FROM categories WHERE is_active = 1");
    foreach ($categories as $cat) {
        echo "- {$cat['name']} ({$cat['slug']})\n";
    }

    echo "\n✓ Database test completed successfully!\n";

} catch (Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "\n";
    exit(1);
}
?>