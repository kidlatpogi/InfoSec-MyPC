<?php
require_once 'db_config.php';
header('Content-Type: text/plain');

$db = getDB();

echo "=== ORDERS DATA ===\n\n";

$orders = $db->fetchAll("SELECT id, user_id, placed_at, status, total FROM orders ORDER BY placed_at DESC");
echo "Total orders: " . count($orders) . "\n\n";

foreach ($orders as $order) {
    echo "Order #{$order['id']}: {$order['status']} - \${$order['total']} - {$order['placed_at']}\n";
}

echo "\n\n=== ORDER ITEMS ===\n\n";
$items = $db->fetchAll("SELECT oi.*, o.placed_at FROM order_items oi JOIN orders o ON oi.order_id = o.id");
echo "Total items: " . count($items) . "\n\n";

foreach ($items as $item) {
    echo "- {$item['product_name']} x{$item['quantity']} = \${$item['line_total']} (Order date: {$item['placed_at']})\n";
}

echo "\n\n=== YEARS IN DATABASE ===\n\n";
$years = $db->fetchAll("SELECT DISTINCT YEAR(placed_at) as year FROM orders ORDER BY year DESC");
foreach ($years as $y) {
    echo "Year: {$y['year']}\n";
}

echo "\n\n=== CURRENT YEAR (2026) ORDERS ===\n\n";
$orders2026 = $db->fetchAll("SELECT * FROM orders WHERE YEAR(placed_at) = 2026");
echo "Orders in 2026: " . count($orders2026) . "\n";
