<?php
/**
 * Update all GitHub image URLs to local paths
 */

try {
    $pdo = new PDO('mysql:host=localhost;dbname=mypc;charset=utf8mb4', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Updating image URLs to local paths...\n\n";

    // Get all products with GitHub URLs
    $stmt = $pdo->query("SELECT id, name, image_url FROM products WHERE image_url LIKE '%github%'");
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo "Found " . count($products) . " products with GitHub URLs\n\n";

    $updated = 0;
    foreach ($products as $product) {
        // Extract the filename from GitHub URL
        // Example: https://raw.githubusercontent.com/.../AMD%20RYZEN%205%207600.webp
        preg_match('/\/([^\/]+\.(jpg|png|webp|jpeg))$/i', urldecode($product['image_url']), $matches);

        if (isset($matches[1])) {
            $filename = $matches[1];

            // Try to find the file in assets subdirectories
            $found = false;
            $localPath = '';

            $assetDirs = [
                'AMD CPU',
                'Intel CPU',
                'NVIDIA GPU',
                'AMD GPU',
                'Intel GPU',
                'DDR4',
                'DDR5',
                'NVME',
                'SATA SSD',
                'HDD',
                'AMD Motherboard',
                'Intel Motherboard',
                'PSU',
                'CASE',
                'CPU Coolers'
            ];

            foreach ($assetDirs as $dir) {
                $fullPath = "C:\\xampp\\htdocs\\InfoSec-MyPC-4.0.0\\assets\\{$dir}\\{$filename}";
                if (file_exists($fullPath)) {
                    $localPath = "/assets/{$dir}/{$filename}";
                    $found = true;
                    break;
                }
            }

            if ($found) {
                $updateStmt = $pdo->prepare("UPDATE products SET image_url = ? WHERE id = ?");
                $updateStmt->execute([$localPath, $product['id']]);
                echo "✓ Updated: {$product['name']}\n";
                echo "  From: {$product['image_url']}\n";
                echo "  To: {$localPath}\n\n";
                $updated++;
            } else {
                echo "✗ File not found for: {$product['name']} ({$filename})\n\n";
            }
        }
    }

    echo "\n✓ Updated {$updated} products to use local images\n";

} catch (Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "\n";
    exit(1);
}
?>