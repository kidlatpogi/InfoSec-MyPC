<?php
require_once 'db_config.php';

$db = getDB();
$images = $db->fetchAll('SELECT id, product_id, url FROM product_images LIMIT 10');

echo "Image URLs in database:\n";
foreach ($images as $img) {
    echo "Product ID: {$img['product_id']} | URL: {$img['url']}\n";
}
