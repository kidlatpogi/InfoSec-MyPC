<?php
require_once 'HTML_PHP/db_config.php';

$db = getDB();

// Check current variants
$variants = $db->fetchAll("SELECT * FROM product_variants WHERE product_id = 1");

if (empty($variants)) {
    echo "No variants found. Inserting now...\n";
    
    // Insert variants
    $db->execute(
        "INSERT INTO product_variants (product_id, variant_sku, title, price, stock) VALUES (?, ?, ?, ?, ?)",
        [1, 'CPU-AMD-R5-7600-BOX', 'Boxed with Cooler', 14995.00, 15]
    );
    
    $db->execute(
        "INSERT INTO product_variants (product_id, variant_sku, title, price, stock) VALUES (?, ?, ?, ?, ?)",
        [1, 'CPU-AMD-R5-7600-OEM', 'OEM (Tray)', 13795.00, 10]
    );
    
    echo "Variants inserted successfully!\n";
} else {
    echo "Variants found: " . count($variants) . "\n";
    foreach ($variants as $v) {
        echo "ID: {$v['id']}, Title: {$v['title']}, Price: {$v['price']}, Stock: {$v['stock']}\n";
    }
}

// Verify final state
$final = $db->fetchAll("SELECT * FROM product_variants WHERE product_id = 1");
echo "\nFinal state - Total variants: " . count($final) . "\n";
foreach ($final as $v) {
    echo "- {$v['title']}: ₱{$v['price']} (Stock: {$v['stock']})\n";
}
?>
