<?php
/**
 * Populate stock quantities and create superadmin account
 */

require_once 'db_config.php';

$db = getDB();

try {
    echo "=== STOCK POPULATION AND SUPERADMIN SETUP ===\n\n";

    // 1. Update stock quantities for all variants
    echo "1. Populating stock quantities...\n";
    
    // Get all variants
    $variants = $db->fetchAll("SELECT id, product_id FROM product_variants");
    
    $stockCount = 0;
    foreach ($variants as $variant) {
        // Random stock 30-100
        $stock = rand(30, 100);
        
        $db->query(
            "UPDATE product_variants SET stock = ? WHERE id = ?",
            [$stock, $variant['id']]
        );
        $stockCount++;
    }
    
    echo "   ✓ Updated {$stockCount} variants with random stock quantities (30-100)\n";

    // 2. Create superadmin account
    echo "\n2. Creating superadmin account...\n";
    
    // Check if superadmin already exists
    $existingSuperadmin = $db->fetchOne(
        "SELECT id FROM users WHERE email = 'superadmin@mypc.com'"
    );
    
    if ($existingSuperadmin) {
        echo "   ! Superadmin already exists with ID: {$existingSuperadmin['id']}\n";
    } else {
        // Hash the password
        $password = '@dm1n123';
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
        
        // Create superadmin
        $superadminId = $db->insert(
            "INSERT INTO users (
                email, password_hash, full_name, phone, is_admin
            ) VALUES (?, ?, ?, ?, 1)",
            [
                'superadmin@mypc.com',
                $hashedPassword,
                'Super Administrator',
                '+63900000000'
            ]
        );
        
        echo "   ✓ Superadmin account created\n";
        echo "   • Email: superadmin@mypc.com\n";
        echo "   • Password: @dm1n123\n";
        echo "   • User ID: {$superadminId}\n";
    }

    // 3. Verify stock distribution
    echo "\n3. Stock Distribution Summary:\n";
    
    $stockStats = $db->fetchOne(
        "SELECT 
            COUNT(*) as total_variants,
            MIN(stock) as min_stock,
            MAX(stock) as max_stock,
            ROUND(AVG(stock), 0) as avg_stock
         FROM product_variants"
    );
    
    echo "   • Total Variants: {$stockStats['total_variants']}\n";
    echo "   • Min Stock: {$stockStats['min_stock']} units\n";
    echo "   • Max Stock: {$stockStats['max_stock']} units\n";
    echo "   • Avg Stock: {$stockStats['avg_stock']} units\n";

    // 4. Category stock breakdown
    echo "\n4. Stock by Category:\n";
    
    $categoryStats = $db->fetchAll(
        "SELECT c.name, COUNT(p.id) as product_count, AVG(p.stock_quantity) as avg_stock
         FROM categories c
         LEFT JOIN products p ON c.id = p.category_id AND p.is_active = 1
         WHERE c.is_active = 1
         GROUP BY c.id, c.name
         ORDER BY c.name"
    );
    
    foreach ($categoryStats as $stat) {
        if ($stat['product_count'] > 0) {
            echo "   • {$stat['name']}: {$stat['product_count']} products, Avg: " . round($stat['avg_stock'], 0) . " units\n";
        }
    }

    echo "\n=== SETUP COMPLETE ===\n";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
    exit(1);
}
?>
