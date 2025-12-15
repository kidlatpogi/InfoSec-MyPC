<?php
require_once 'HTML_PHP/db_config.php';

$db = getDB();

// Restore AMD Ryzen 5 7600 prices
$db->execute(
    "UPDATE product_variants SET price = 14995.00, stock = 15 WHERE product_id = 1 AND title = 'Boxed with Cooler'"
);

$db->execute(
    "UPDATE product_variants SET price = 13795.00, stock = 10 WHERE product_id = 1 AND title = 'OEM (Tray)'"
);

echo "Prices restored successfully for AMD Ryzen 5 7600\n";
echo "- Boxed with Cooler: ₱14,995.00 (Stock: 15)\n";
echo "- OEM (Tray): ₱13,795.00 (Stock: 10)\n";
?>
