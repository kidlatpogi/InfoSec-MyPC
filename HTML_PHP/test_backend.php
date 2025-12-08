<?php
/**
 * Backend API Test Script
 * Tests database connection and timestamp handling after schema alignment
 */

require_once __DIR__ . '/Database.php';

// ANSI color codes for terminal output
define('GREEN', "\033[32m");
define('RED', "\033[31m");
define('YELLOW', "\033[33m");
define('BLUE', "\033[34m");
define('RESET', "\033[0m");

class BackendTester
{
    private $db;
    private $passed = 0;
    private $failed = 0;

    public function __construct()
    {
        try {
            $this->db = Database::getInstance();
            echo BLUE . "=== Backend API Test Suite ===" . RESET . "\n\n";
        } catch (Exception $e) {
            echo RED . "✗ Failed to connect to database: " . $e->getMessage() . RESET . "\n";
            exit(1);
        }
    }

    public function runAllTests()
    {
        $this->testDatabaseConnection();
        $this->testUserCreationTimestamps();
        $this->testCartCreationTimestamps();
        $this->testOrderCreationTimestamps();
        $this->testUpdateTimestamps();

        echo "\n" . BLUE . "=== Test Summary ===" . RESET . "\n";
        echo GREEN . "Passed: " . $this->passed . RESET . "\n";
        echo RED . "Failed: " . $this->failed . RESET . "\n";

        return $this->failed === 0;
    }

    private function assert($condition, $testName)
    {
        if ($condition) {
            echo GREEN . "✓ " . $testName . RESET . "\n";
            $this->passed++;
            return true;
        } else {
            echo RED . "✗ " . $testName . RESET . "\n";
            $this->failed++;
            return false;
        }
    }

    private function testDatabaseConnection()
    {
        echo YELLOW . "\n[Test 1] Database Connection" . RESET . "\n";

        try {
            $result = $this->db->fetchOne("SELECT 1 as test");
            $this->assert($result['test'] === 1, "Database connection successful");

            // Check if mypc_db database exists
            $dbCheck = $this->db->fetchOne("SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'mypc_db'");
            $this->assert($dbCheck !== false, "Database 'mypc_db' exists");

        } catch (Exception $e) {
            $this->assert(false, "Database connection failed: " . $e->getMessage());
        }
    }

    private function testUserCreationTimestamps()
    {
        echo YELLOW . "\n[Test 2] User Creation Timestamps" . RESET . "\n";

        try {
            // Create a test user
            $testEmail = 'test_' . time() . '@example.com';
            $passwordHash = password_hash('testpass123', PASSWORD_BCRYPT);

            $userId = $this->db->insert(
                "INSERT INTO users (email, password_hash, full_name, is_admin) 
                 VALUES (?, ?, ?, 0)",
                [$testEmail, $passwordHash, 'Test User']
            );

            $this->assert($userId > 0, "User created successfully");

            // Fetch the user and check timestamps
            $user = $this->db->fetchOne("SELECT created_at, updated_at FROM users WHERE id = ?", [$userId]);

            $this->assert($user['created_at'] !== null, "created_at is automatically set");
            $this->assert($user['updated_at'] !== null, "updated_at is automatically set");
            $this->assert($user['created_at'] === $user['updated_at'], "created_at equals updated_at on creation");

            // Verify timestamp is recent (within last 5 seconds)
            $createdTime = strtotime($user['created_at']);
            $now = time();
            $this->assert(abs($now - $createdTime) < 5, "Timestamp is recent (within 5 seconds)");

            // Cleanup
            $this->db->query("DELETE FROM users WHERE id = ?", [$userId]);

        } catch (Exception $e) {
            $this->assert(false, "User creation test failed: " . $e->getMessage());
        }
    }

    private function testCartCreationTimestamps()
    {
        echo YELLOW . "\n[Test 3] Cart Creation Timestamps" . RESET . "\n";

        try {
            // Create a test user first
            $testEmail = 'cart_test_' . time() . '@example.com';
            $passwordHash = password_hash('testpass123', PASSWORD_BCRYPT);

            $userId = $this->db->insert(
                "INSERT INTO users (email, password_hash, full_name, is_admin) 
                 VALUES (?, ?, ?, 0)",
                [$testEmail, $passwordHash, 'Cart Test']
            );

            // Create cart
            $cartId = $this->db->insert("INSERT INTO carts (user_id) VALUES (?)", [$userId]);
            $this->assert($cartId > 0, "Cart created successfully");

            // Check cart timestamps
            $cart = $this->db->fetchOne("SELECT created_at, updated_at FROM carts WHERE id = ?", [$cartId]);

            $this->assert($cart['created_at'] !== null, "Cart created_at is automatically set");
            $this->assert($cart['updated_at'] !== null, "Cart updated_at is automatically set");

            // Add item to cart (requires a product)
            $product = $this->db->fetchOne("SELECT id FROM products WHERE active = 1 LIMIT 1");

            if ($product) {
                $itemId = $this->db->insert(
                    "INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (?, ?, ?)",
                    [$cartId, $product['id'], 1]
                );

                $this->assert($itemId > 0, "Cart item created successfully");

                // Check cart item timestamps
                $item = $this->db->fetchOne("SELECT added_at, updated_at FROM cart_items WHERE id = ?", [$itemId]);

                $this->assert($item['added_at'] !== null, "Cart item added_at is automatically set");
                $this->assert($item['updated_at'] !== null, "Cart item updated_at is automatically set");
            } else {
                echo YELLOW . "  ⚠ Skipping cart item test - no products available" . RESET . "\n";
            }

            // Cleanup
            $this->db->query("DELETE FROM carts WHERE id = ?", [$cartId]);
            $this->db->query("DELETE FROM users WHERE id = ?", [$userId]);

        } catch (Exception $e) {
            $this->assert(false, "Cart creation test failed: " . $e->getMessage());
        }
    }

    private function testOrderCreationTimestamps()
    {
        echo YELLOW . "\n[Test 4] Order Creation Timestamps" . RESET . "\n";

        try {
            // Create a test user
            $testEmail = 'order_test_' . time() . '@example.com';
            $passwordHash = password_hash('testpass123', PASSWORD_BCRYPT);

            $userId = $this->db->insert(
                "INSERT INTO users (email, password_hash, first_name, last_name, phone, role) 
                 VALUES (?, ?, ?, ?, ?, ?)",
                [$testEmail, $passwordHash, 'Order', 'Test', '09123456789', 'customer']
            );

            // Create order
            $orderNumber = 'TEST-' . time();
            $orderId = $this->db->insert(
                "INSERT INTO orders (
                    order_number, user_id, customer_email, customer_name, customer_phone,
                    shipping_address, status, payment_method, payment_status,
                    subtotal, shipping_fee, total
                ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                [
                    $orderNumber,
                    $userId,
                    $testEmail,
                    'Order Test',
                    '09123456789',
                    'Test Address',
                    'pending',
                    'cod',
                    'pending',
                    1000.00,
                    150.00,
                    1150.00
                ]
            );

            $this->assert($orderId > 0, "Order created successfully");

            // Check order timestamps
            $order = $this->db->fetchOne("SELECT created_at, updated_at FROM orders WHERE id = ?", [$orderId]);

            $this->assert($order['created_at'] !== null, "Order created_at is automatically set");
            $this->assert($order['updated_at'] !== null, "Order updated_at is automatically set");

            // Add order item (requires a product)
            $product = $this->db->fetchOne("SELECT id, name, sku FROM products WHERE is_active = 1 LIMIT 1");

            if ($product) {
                $itemId = $this->db->insert(
                    "INSERT INTO order_items (
                        order_id, product_id, product_name, sku, unit_price, quantity, line_total
                    ) VALUES (?, ?, ?, ?, ?, ?, ?)",
                    [$orderId, $product['id'], $product['name'], $product['sku'], 1000.00, 1, 1000.00]
                );

                $this->assert($itemId > 0, "Order item created successfully");

                // Check order item timestamp
                $item = $this->db->fetchOne("SELECT created_at FROM order_items WHERE id = ?", [$itemId]);
                $this->assert($item['created_at'] !== null, "Order item created_at is automatically set");
            } else {
                echo YELLOW . "  ⚠ Skipping order item test - no products available" . RESET . "\n";
            }

            // Cleanup
            $this->db->query("DELETE FROM orders WHERE id = ?", [$orderId]);
            $this->db->query("DELETE FROM users WHERE id = ?", [$userId]);

        } catch (Exception $e) {
            $this->assert(false, "Order creation test failed: " . $e->getMessage());
        }
    }

    private function testUpdateTimestamps()
    {
        echo YELLOW . "\n[Test 5] Update Timestamps (ON UPDATE CURRENT_TIMESTAMP)" . RESET . "\n";

        try {
            // Create a test user
            $testEmail = 'update_test_' . time() . '@example.com';
            $passwordHash = password_hash('testpass123', PASSWORD_BCRYPT);

            $userId = $this->db->insert(
                "INSERT INTO users (email, password_hash, first_name, last_name, role) 
                 VALUES (?, ?, ?, ?, ?)",
                [$testEmail, $passwordHash, 'Update', 'Test', 'customer']
            );

            // Get initial timestamps
            $userBefore = $this->db->fetchOne("SELECT created_at, updated_at FROM users WHERE id = ?", [$userId]);

            // Wait 1 second to ensure timestamp difference
            sleep(1);

            // Update user
            $this->db->query("UPDATE users SET first_name = ? WHERE id = ?", ['UpdatedName', $userId]);

            // Get updated timestamps
            $userAfter = $this->db->fetchOne("SELECT created_at, updated_at FROM users WHERE id = ?", [$userId]);

            $this->assert($userAfter['created_at'] === $userBefore['created_at'], "created_at remains unchanged after update");
            $this->assert($userAfter['updated_at'] > $userBefore['updated_at'], "updated_at is automatically updated");

            // Test cart_items update
            $cartId = $this->db->insert("INSERT INTO carts (user_id) VALUES (?)", [$userId]);
            $product = $this->db->fetchOne("SELECT id FROM products WHERE is_active = 1 LIMIT 1");

            if ($product) {
                $itemId = $this->db->insert(
                    "INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (?, ?, ?)",
                    [$cartId, $product['id'], 1]
                );

                $itemBefore = $this->db->fetchOne("SELECT updated_at FROM cart_items WHERE id = ?", [$itemId]);
                sleep(1);

                $this->db->query("UPDATE cart_items SET quantity = ? WHERE id = ?", [2, $itemId]);

                $itemAfter = $this->db->fetchOne("SELECT updated_at FROM cart_items WHERE id = ?", [$itemId]);
                $this->assert($itemAfter['updated_at'] > $itemBefore['updated_at'], "Cart item updated_at is automatically updated");
            }

            // Cleanup
            $this->db->query("DELETE FROM carts WHERE id = ?", [$cartId]);
            $this->db->query("DELETE FROM users WHERE id = ?", [$userId]);

        } catch (Exception $e) {
            $this->assert(false, "Update timestamp test failed: " . $e->getMessage());
        }
    }
}

// Run tests
$tester = new BackendTester();
$success = $tester->runAllTests();

exit($success ? 0 : 1);
?>