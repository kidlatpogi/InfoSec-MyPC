<?php
require_once 'db_config.php';

// Test the products API to see what image URLs are being returned
$db = getDB();

// Get one product with its image
$product = $db->fetchOne(
    "SELECT p.*, c.name as category_name, c.slug as category_slug 
     FROM products p 
     LEFT JOIN categories c ON p.category_id = c.id 
     WHERE p.active = 1 
     LIMIT 1"
);

if ($product) {
    echo "Product ID: {$product['id']}\n";
    echo "Product Name: {$product['name']}\n";
    
    // Get image
    $images = $db->fetchAll(
        "SELECT id, url, alt_text, `order` 
         FROM product_images 
         WHERE product_id = ? 
         ORDER BY `order` ASC LIMIT 1",
        [$product['id']]
    );
    
    echo "\nOriginal image URL from DB:\n";
    if (!empty($images)) {
        echo $images[0]['url'] . "\n";
        
        // Apply the fix
        $url = $images[0]['url'];
        if (strpos($url, '/assets/') === 0) {
            $url = '/InfoSec-MyPC' . $url;
        }
        echo "\nFixed image URL:\n";
        echo $url . "\n";
    } else {
        echo "No images found\n";
    }
} else {
    echo "No products found\n";
}
