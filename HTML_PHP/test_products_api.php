<?php
// Simple test to check what the products API returns
require_once 'db_config.php';

$_SERVER['REQUEST_METHOD'] = 'GET';
$_GET['page'] = 1;
$_GET['limit'] = 2;

// Capture the output
ob_start();
include 'products.php';
$output = ob_get_clean();

$data = json_decode($output, true);

echo "API Response Structure:\n";
echo "Success: " . ($data['success'] ? 'true' : 'false') . "\n";
echo "Product count: " . count($data['products'] ?? []) . "\n\n";

if (!empty($data['products'])) {
    $firstProduct = $data['products'][0];
    echo "First Product:\n";
    echo "  ID: {$firstProduct['id']}\n";
    echo "  Name: {$firstProduct['name']}\n";
    echo "  Image URL: {$firstProduct['image_url']}\n";
    echo "  Price: {$firstProduct['price']}\n";
    echo "  Stock: {$firstProduct['stock']}\n";
    echo "  Variants: " . count($firstProduct['variants']) . "\n";
}
