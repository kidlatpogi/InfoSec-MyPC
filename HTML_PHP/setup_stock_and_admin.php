<?php
/**
 * Populate stock quantities and create superadmin account
 */

require_once 'db_config.php';

$db = getDB();

try {
    echo "=== STOCK POPULATION AND SUPERADMIN SETUP ===\n\n";

    // 1. Update stock quantities for all products
    echo "1. Populating stock quantities...\n";
    
    // Get all active products
    $products = $db->fetchAll("SELECT id, name, category_id FROM products WHERE is_active = 1");
    
    $stockCount = 0;
    foreach ($products as $product) {
        // RAM and GPU categories should have lower stock (30-50)
        // Other categories: 50-100
        $categoryId = $product['category_id'];
        
        // Categories: 1=Processors, 2=Graphics Cards, 3=RAM, etc.
        // GPU is category 2, RAM is category 3
        if ($categoryId == 2 || $categoryId == 3) {
            // GPU and RAM: 30-50
            $stock = rand(30, 50);
        } else {
            // Other components: 50-100
            $stock = rand(50, 100);
        }
        
        $db->query(
            "UPDATE products SET stock_quantity = ? WHERE id = ?",
            [$stock, $product['id']]
        );
        $stockCount++;
    }
    
    echo "   ✓ Updated {$stockCount} products with random stock quantities\n";
    echo "   • GPU and RAM: 30-50 units\n";
    echo "   • Other components: 50-100 units\n";

    // 2. Create superadmin account
    echo "\n2. Creating superadmin account...\n";
    
    // Check if superadmin already exists
    $existingSuperadmin = $db->fetchOne(
        "SELECT id FROM users WHERE email = 'superadmin@gmail.com'"
    );
    
    if ($existingSuperadmin) {
        echo "   ! Superadmin already exists with ID: {$existingSuperadmin['id']}\n";
    } else {
        // Hash the password
        $password = '@dm1n123';
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
        
        // Create superadmin
        $superadminId = $db->insert(
            "INSERT INTO users (
                email, password_hash, first_name, last_name, phone, 
                role, status, created_at
            ) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())",
            [
                'superadmin@gmail.com',
                $hashedPassword,
                'Super',
                'Admin',
                '+63900000000',
                'superadmin',
                'active'
            ]
        );
        
        echo "   ✓ Superadmin account created\n";
        echo "   • Email: superadmin@gmail.com\n";
        echo "   • Password: @dm1n123\n";
        echo "   • User ID: {$superadminId}\n";
    }

    // 3. Verify stock distribution
    echo "\n3. Stock Distribution Summary:\n";
    
    $stockStats = $db->fetchOne(
        "SELECT 
            COUNT(*) as total_products,
            MIN(stock_quantity) as min_stock,
            MAX(stock_quantity) as max_stock,
            ROUND(AVG(stock_quantity), 0) as avg_stock
         FROM products WHERE is_active = 1"
    );
    
    echo "   • Total Products: {$stockStats['total_products']}\n";
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
