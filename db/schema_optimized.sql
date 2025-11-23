-- =====================================================
-- MyPC Store - Optimized 3NF Database Schema
-- Simplified e-commerce platform for PC components
-- Version: 2.0 (Optimized)
-- =====================================================

DROP DATABASE IF EXISTS `mypc_store`;
CREATE DATABASE `mypc_store` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mypc_store`;

-- =====================================================
-- CORE TABLES (3NF Normalized)
-- =====================================================

-- Users table - Customer and staff accounts
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(50) DEFAULT NULL,
    `role` ENUM('customer', 'employee', 'admin', 'superadmin') NOT NULL DEFAULT 'customer',
    `status` ENUM('active', 'suspended') NOT NULL DEFAULT 'active',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (`email`),
    INDEX idx_role (`role`),
    INDEX idx_status (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Addresses table - Shipping and billing addresses
CREATE TABLE `addresses` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `label` VARCHAR(60) DEFAULT NULL COMMENT 'Home, Office, etc.',
    `recipient_name` VARCHAR(200) NOT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `address_line1` VARCHAR(255) NOT NULL,
    `address_line2` VARCHAR(255) DEFAULT NULL,
    `city` VARCHAR(120) NOT NULL,
    `postal_code` VARCHAR(30) NOT NULL,
    `is_default` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_id (`user_id`),
    INDEX idx_is_default (`is_default`),
    CONSTRAINT fk_addresses_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Categories table - Product categories
CREATE TABLE `categories` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(120) NOT NULL UNIQUE,
    `slug` VARCHAR(160) NOT NULL UNIQUE,
    `description` TEXT DEFAULT NULL,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_slug (`slug`),
    INDEX idx_is_active (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Products table - Main product catalog
CREATE TABLE `products` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` BIGINT UNSIGNED DEFAULT NULL,
    `sku` VARCHAR(80) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL UNIQUE,
    `description` TEXT DEFAULT NULL,
    `base_price` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `stock_quantity` INT NOT NULL DEFAULT 0,
    `image_url` VARCHAR(500) DEFAULT NULL,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_category_id (`category_id`),
    INDEX idx_slug (`slug`),
    INDEX idx_sku (`sku`),
    INDEX idx_is_active (`is_active`),
    INDEX idx_category_active (`category_id`, `is_active`),
    CONSTRAINT fk_products_category FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Product variants table - Optional product variations
CREATE TABLE `product_variants` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `label` VARCHAR(150) NOT NULL COMMENT 'Boxed, OEM, 8GB, 16GB, etc.',
    `price_adjustment` DECIMAL(12,2) NOT NULL DEFAULT 0.00 COMMENT 'Price difference from base',
    `stock_quantity` INT NOT NULL DEFAULT 0,
    `sku_suffix` VARCHAR(50) DEFAULT NULL,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY ux_product_label (`product_id`, `label`),
    INDEX idx_product_id (`product_id`),
    CONSTRAINT fk_variants_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Carts table - Shopping carts (one per user)
CREATE TABLE `carts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_id (`user_id`),
    CONSTRAINT fk_carts_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cart items table - Items in shopping cart
CREATE TABLE `cart_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cart_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `variant_id` BIGINT UNSIGNED DEFAULT NULL,
    `quantity` INT NOT NULL DEFAULT 1 CHECK (`quantity` > 0),
    `added_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY ux_cart_product_variant (`cart_id`, `product_id`, `variant_id`),
    INDEX idx_cart_id (`cart_id`),
    INDEX idx_product_id (`product_id`),
    CONSTRAINT fk_cart_items_cart FOREIGN KEY (`cart_id`) REFERENCES `carts`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_cart_items_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_cart_items_variant FOREIGN KEY (`variant_id`) REFERENCES `product_variants`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Orders table - Customer orders
CREATE TABLE `orders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_number` VARCHAR(50) NOT NULL UNIQUE,
    `user_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'NULL for guest orders',
    `address_id` BIGINT UNSIGNED DEFAULT NULL,
    `customer_email` VARCHAR(255) NOT NULL,
    `customer_name` VARCHAR(200) NOT NULL,
    `customer_phone` VARCHAR(50) NOT NULL,
    `shipping_address` TEXT NOT NULL COMMENT 'Snapshot of address at order time',
    `status` ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') NOT NULL DEFAULT 'pending',
    `payment_method` ENUM('cod', 'card', 'gcash', 'paymaya', 'bank_transfer') NOT NULL DEFAULT 'cod',
    `payment_status` ENUM('pending', 'paid', 'failed') NOT NULL DEFAULT 'pending',
    `subtotal` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `shipping_fee` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `total` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `notes` TEXT DEFAULT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_order_number (`order_number`),
    INDEX idx_user_id (`user_id`),
    INDEX idx_status (`status`),
    INDEX idx_payment_status (`payment_status`),
    INDEX idx_created_at (`created_at`),
    CONSTRAINT fk_orders_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL,
    CONSTRAINT fk_orders_address FOREIGN KEY (`address_id`) REFERENCES `addresses`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Order items table - Snapshot of products at purchase time
CREATE TABLE `order_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'Reference to product, can be NULL if deleted',
    `product_name` VARCHAR(255) NOT NULL,
    `variant_label` VARCHAR(150) DEFAULT NULL,
    `sku` VARCHAR(100) DEFAULT NULL,
    `unit_price` DECIMAL(12,2) NOT NULL,
    `quantity` INT NOT NULL CHECK (`quantity` > 0),
    `line_total` DECIMAL(12,2) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_order_id (`order_id`),
    INDEX idx_product_id (`product_id`),
    CONSTRAINT fk_order_items_order FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_order_items_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Reviews table - Product reviews and ratings
CREATE TABLE `reviews` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,
    `order_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'Link to verified purchase',
    `rating` TINYINT UNSIGNED NOT NULL CHECK (`rating` >= 1 AND `rating` <= 5),
    `title` VARCHAR(255) DEFAULT NULL,
    `comment` TEXT DEFAULT NULL,
    `is_verified_purchase` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_product_id (`product_id`),
    INDEX idx_user_id (`user_id`),
    INDEX idx_rating (`rating`),
    CONSTRAINT fk_reviews_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_reviews_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL,
    CONSTRAINT fk_reviews_order FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- SAMPLE DATA FOR TESTING
-- =====================================================

-- Insert sample categories
INSERT INTO `categories` (`name`, `slug`, `description`, `is_active`) VALUES
('Processors', 'processors', 'CPUs and processors for desktop computers', 1),
('Graphics Cards', 'graphics-cards', 'GPUs and graphics cards', 1),
('Memory', 'memory', 'RAM and memory modules', 1),
('Storage', 'storage', 'SSDs, HDDs, and storage devices', 1),
('Motherboards', 'motherboards', 'Computer motherboards', 1),
('Power Supplies', 'power-supplies', 'PSUs and power supplies', 1),
('Cases', 'cases', 'Computer cases and chassis', 1),
('Cooling', 'cooling', 'CPU coolers and case fans', 1);

-- Insert sample products
INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(1, 'CPU-AMD-R5-5600X', 'AMD Ryzen 5 5600X', 'amd-ryzen-5-5600x', '6-Core 12-Thread Desktop Processor with Wraith Stealth Cooler', 12999.00, 25, '/assets/products/ryzen-5600x.jpg', 1),
(1, 'CPU-INTEL-I5-12400F', 'Intel Core i5-12400F', 'intel-core-i5-12400f', '6-Core 12-Thread Desktop Processor', 9999.00, 30, '/assets/products/i5-12400f.jpg', 1),
(2, 'GPU-RTX-3060', 'NVIDIA RTX 3060 12GB', 'nvidia-rtx-3060-12gb', 'Graphics Card with 12GB GDDR6 Memory', 24999.00, 15, '/assets/products/rtx-3060.jpg', 1),
(2, 'GPU-RX-6600', 'AMD Radeon RX 6600', 'amd-radeon-rx-6600', '8GB GDDR6 Graphics Card', 18999.00, 20, '/assets/products/rx-6600.jpg', 1),
(3, 'RAM-CORSAIR-16GB', 'Corsair Vengeance 16GB DDR4', 'corsair-vengeance-16gb-ddr4', '16GB (2x8GB) DDR4 3200MHz Memory Kit', 3999.00, 50, '/assets/products/corsair-ram.jpg', 1),
(4, 'SSD-SAMSUNG-1TB', 'Samsung 970 EVO Plus 1TB', 'samsung-970-evo-plus-1tb', 'NVMe M.2 SSD 1TB', 5999.00, 40, '/assets/products/samsung-ssd.jpg', 1),
(5, 'MB-ASUS-B550', 'ASUS ROG Strix B550-F', 'asus-rog-strix-b550-f', 'AMD B550 ATX Gaming Motherboard', 9999.00, 18, '/assets/products/asus-b550.jpg', 1),
(6, 'PSU-CORSAIR-650W', 'Corsair RM650x 650W', 'corsair-rm650x-650w', '80+ Gold Fully Modular Power Supply', 5499.00, 35, '/assets/products/corsair-psu.jpg', 1);

-- Insert sample product variants
INSERT INTO `product_variants` (`product_id`, `label`, `price_adjustment`, `stock_quantity`, `sku_suffix`) VALUES
(1, 'Boxed with Cooler', 0.00, 15, 'BOX'),
(1, 'OEM (Tray)', -500.00, 10, 'OEM'),
(5, '8GB Kit', -1000.00, 25, '8GB'),
(5, '16GB Kit', 0.00, 25, '16GB'),
(5, '32GB Kit', 2000.00, 15, '32GB');

-- Insert sample admin user (password: admin123)
INSERT INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `phone`, `role`, `status`) VALUES
('admin@mypc.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin', 'User', '09123456789', 'admin', 'active'),
('customer@test.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'John', 'Doe', '09987654321', 'customer', 'active');

-- Insert sample address for test customer
INSERT INTO `addresses` (`user_id`, `label`, `recipient_name`, `phone`, `address_line1`, `city`, `postal_code`, `is_default`) VALUES
(2, 'Home', 'John Doe', '09987654321', '123 Main Street, Barangay 1', 'Manila', '1000', 1);

-- =====================================================
-- USEFUL VIEWS FOR REPORTING
-- =====================================================

-- View: Products with category and stock info
CREATE VIEW `v_products_catalog` AS
SELECT
    p.id,
    p.sku,
    p.name,
    p.slug,
    p.base_price,
    p.stock_quantity,
    p.image_url,
    c.name AS category_name,
    c.slug AS category_slug,
    COUNT(DISTINCT pv.id) AS variant_count,
    COALESCE(AVG(r.rating), 0) AS avg_rating,
    COUNT(DISTINCT r.id) AS review_count
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
LEFT JOIN product_variants pv ON p.id = pv.product_id AND pv.is_active = 1
LEFT JOIN reviews r ON p.id = r.product_id
WHERE p.is_active = 1
GROUP BY p.id;

-- View: Order summary for admin dashboard
CREATE VIEW `v_orders_summary` AS
SELECT
    o.id,
    o.order_number,
    o.customer_name,
    o.customer_email,
    o.status,
    o.payment_status,
    o.payment_method,
    o.total,
    o.created_at,
    COUNT(oi.id) AS item_count,
    SUM(oi.quantity) AS total_items
FROM orders o
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id;

-- =====================================================
-- END OF OPTIMIZED SCHEMA
-- =====================================================
