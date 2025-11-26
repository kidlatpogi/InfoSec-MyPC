-- =====================================================
-- MyPC Store - Optimized 3NF Database Schema
-- Simplified e-commerce platform for PC components
-- Version: 2.0 (Optimized)
-- =====================================================

DROP DATABASE IF EXISTS `mypc`;
CREATE DATABASE `mypc` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mypc`;

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


-- =====================================================
-- AMD CPU PRODUCTS (10 items)
-- =====================================================

INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(1, 'CPU-AMD-R5-7600',  'AMD Ryzen 5 7600',  'amd-ryzen-5-7600',  '6-core / 12-thread Zen 4 desktop processor, 3.8 GHz base, 5.1 GHz boost, 6 MB L2 + 32 MB L3, 65 W TDP, AM5 socket. Native DDR5-5200 support and integrated Radeon Graphics deliver smooth 1080p gaming and snappy everyday performance without a discrete card. Ships as boxed (with Wraith Stealth cooler) or OEM/tray.', 14995.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%205%207600.webp', 1),
(1, 'CPU-AMD-R5-7600X', 'AMD Ryzen 5 7600X', 'amd-ryzen-5-7600x', 'Unlocked 6C/12T Zen 4 flagship, 4.7 GHz base, 5.3 GHz boost, 6 MB L2 + 32 MB L3, 105 W. Higher power headroom pushes frame rates further for competitive gaming and brisk content creation. AM5 platform, DDR5-5200, PCIe 5.0 ready; cooler not included.', 16495.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%205%207600X.jpg', 1),
(1, 'CPU-AMD-R5-9600X', 'AMD Ryzen 5 9600X', 'amd-ryzen-5-9600x', 'Next-gen 6C/12T Zen 5 chip built on 4 nm, 3.9 GHz base, up to 5.4 GHz boost, 6 MB L2 + 32 MB L3, 65 W. Faster IPC plus DDR5-5600 and RDNA 2-based graphics give creators and gamers a future-proof AM5 upgrade path.', 18995.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%205%209600%20X.jpg', 1),
(1, 'CPU-AMD-R7-7700',  'AMD Ryzen 7 7700',  'amd-ryzen-7-7700',  '8-core / 16-thread Zen 4 workhorse, 3.8 GHz base, 5.3 GHz boost, 8 MB L2 + 32 MB L3, 65 W. Extra cores slice through streaming and multitasking while onboard Radeon Graphics keep budgets lean; full AM5 feature set included.', 19495.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%207%207700.jpg', 1),
(1, 'CPU-AMD-R7-7800X3D', 'AMD Ryzen 7 7800X3D', 'amd-ryzen-7-7800x3d', 'World’s first 8C/16T gaming CPU with 3D V-Cache: 96 MB L3 stacked on top of 8 MB L2, 4.2 GHz base, 5.0 GHz boost, 120 W. Massive cache lifts average gaming FPS 10-30 % versus non-3D siblings; AM5, DDR5-5200, PCIe 5.0.', 27995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%207%207800%20X3D.webp', 1),
(1, 'CPU-AMD-R7-9800X3D', 'AMD Ryzen 7 9800X3D', 'amd-ryzen-7-9800x3d', '2nd-gen 8C/16T Zen 5 with refined 3D V-Cache, 4.7 GHz base, 5.2 GHz boost, 96 MB L3, 120 W. Higher clocks plus lower cache latency crown it the new gaming king while still crushing creator workloads on AM5 platform.', 32995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%207%209800%20X3D.jpg', 1),
(1, 'CPU-AMD-R9-7900X3D', 'AMD Ryzen 9 7900X3D', 'amd-ryzen-9-7900x3d', '12C/24T Zen 4 powerhouse fused with 128 MB 3D V-Cache, 4.4 GHz base, 5.6 GHz boost, 120 W. Ideal for high-refresh gaming and heavy production pipelines; 12 MB L2, DDR5-5200, PCIe 5.0 lanes for GPUs and NVMe SSDs.', 37995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%209%207900%20X3D.jpg', 1),
(1, 'CPU-AMD-R9-7950X3D', 'AMD Ryzen 9 7950X3D', 'amd-ryzen-9-7950x3d', 'Flagship 16C/32T Zen 4 CPU, 4.2 GHz base, 5.7 GHz boost, 16 MB L2 + 128 MB 3D V-Cache, 120 W. Top-tier gaming frame rates meet professional render, compile, and encode speed on the AM5 ecosystem.', 42995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%209%207950%20X3D.jpg', 1),
(1, 'CPU-AMD-R9-9950X3D', 'AMD Ryzen 9 9950X3D', 'amd-ryzen-9-9950x3d', 'Next-gen 16C/32T Zen 5 beast with 128 MB 3D V-Cache, 4.2 GHz base, 5.7 GHz boost, 170 W. Industry-leading cache, IPC uplift, and DDR5-5600 support deliver unmatched gaming lows and creator throughput for premium AM5 builds.', 49995.00,  8, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%209%209950%20X3D.jpg', 1),
(1, 'CPU-AMD-R9-9950X',  'AMD Ryzen 9 9950X',  'amd-ryzen-9-9950x',  'Pure-speed 16C/32T Zen 5 flagship minus vertical cache, 4.3 GHz base, 5.7 GHz boost, 16 MB L2 + 64 MB L3, 170 W. Higher sustained clocks excel in heavily threaded tasks like rendering and compilation; cooler sold separately.', 45995.00,  8, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RYZEN%209%209950X.jpg', 1);

-- -----------------------------------------------------
-- CPU variants (boxed vs oem)
-- AMD CPUs start at product_id 9 (after 8 sample products)

INSERT INTO `product_variants` (`product_id`, `label`, `price_adjustment`, `stock_quantity`, `sku_suffix`) VALUES
(9, 'Boxed with Cooler',    0.00,  15, 'BOX'),
(9, 'OEM (Tray)',       -1200.00, 10, 'OEM'),
(10, 'Boxed with Cooler',    0.00,  15, 'BOX'),
(10, 'OEM (Tray)',       -1200.00, 10, 'OEM'),
(11, 'Boxed with Cooler',    0.00,  12, 'BOX'),
(11, 'OEM (Tray)',       -1200.00,  8, 'OEM'),
(12, 'Boxed with Cooler',    0.00,  12, 'BOX'),
(12, 'OEM (Tray)',       -1200.00,  8, 'OEM'),
(13, 'Boxed',                  0.00,  10, 'BOX'),
(13, 'OEM (Tray)',       -1200.00,  5, 'OEM'),
(14, 'Boxed',                  0.00,  10, 'BOX'),
(14, 'OEM (Tray)',       -1200.00,  5, 'OEM'),
(15, 'Boxed',                  0.00,   6, 'BOX'),
(15, 'OEM (Tray)',       -1200.00,  4, 'OEM'),
(16, 'Boxed',                  0.00,   6, 'BOX'),
(16, 'OEM (Tray)',       -1200.00,  4, 'OEM'),
(17, 'Boxed',                  0.00,   5, 'BOX'),
(17, 'OEM (Tray)',       -1200.00,  3, 'OEM'),
(18, 'Boxed',                  0.00,   5, 'BOX'),
(18, 'OEM (Tray)',       -1200.00,  3, 'OEM');



-- =====================================================
-- AMD GPU PRODUCTS (10 items)
-- =====================================================

INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(2, 'GPU-RX-6600XT',  'AMD Radeon RX 6600 XT',  'amd-radeon-rx-6600xt',  'RDNA 2 2048-SP card, 1968 MHz game / 2589 MHz boost, 8 GB GDDR6 on 128-bit bus, 160 W TDP, PCIe 4.0. 1080p ultra gaming with Smart Access Memory, AV1 decode, HDMI 2.1 & DP 1.4a outputs. Fits most ITX builds.', 16995.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%206600%20XT.webp', 1),
(2, 'GPU-RX-6650XT', 'AMD Radeon RX 6650 XT', 'amd-radeon-rx-6650xt', 'Factory-binned RDNA 2 2048-SP refresh, 2055 MHz game / 2635 MHz boost, 8 GB GDDR6 at 17.5 Gbps, 180 W. Faster memory + clocks give 5-10 % lift versus RX 6600 XT while staying on 128-bit bus; ideal for high-refresh 1080p.', 18495.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%206650%20XT.webp', 1),
(2, 'GPU-RX-6700XT', 'AMD Radeon RX 6700 XT', 'amd-radeon-rx-6700xt', 'RDNA 2 2560-SP 1440p card, 2321 MHz game / 2581 MHz boost, 12 GB GDDR6 on 192-bit + 96 MB Infinity Cache, 230 W. Handles maxed 1440p or entry 4K; supports ray tracing, FSR, and USB-C output on premium boards.', 22995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%206700%20XT.webp', 1),
(2, 'GPU-RX-7600',    'AMD Radeon RX 7600',    'amd-radeon-rx-7600',    'Cutting-down-to-size RDNA 3 2048-SP GPU, 2250 MHz game / 2655 MHz boost, 8 GB GDDR6 on 128-bit, 165 W. New encode block adds AV1 hardware; sips power yet punches above RX 6600 XT levels at 1080p.', 14495.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%207600.webp', 1),
(2, 'GPU-RX-7700XT',  'AMD Radeon RX 7700 XT',  'amd-radeon-rx-7700xt',  'RDNA 3 3456-SP 1440p champ, 2276 MHz game / 2544 MHz boost, 12 GB GDDR6 on 192-bit, 245 W. Dual media engines, AI accelerators, DisplayPort 2.1 ready; 20 % faster than RX 6700 XT while drawing less board power.', 26995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%207700%20XT.jpg', 1),
(2, 'GPU-RX-7800XT',  'AMD Radeon RX 7800 XT',  'amd-radeon-rx-7800xt',  'RDNA 3 3840-SP sweet-spot 4K card, 2430 MHz game / 2430 MHz boost, 16 GB GDDR6 on 256-bit, 263 W. 64 MB Infinity Cache, AV1 encode/decode, HDMI 2.1a; trades blows with RX 6900 XT at lower wattage and price.', 32995.00, 12, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%207800%20XT.webp', 1),
(2, 'GPU-RX-7900GRE', 'AMD Radeon RX 7900 GRE', 'amd-radeon-rx-7900gre', '“Golden Rabbit” RDNA 3 5120-SP variant, 1880 MHz game / 2245 MHz boost, 16 GB GDDR6 on 256-bit, 260 W. China-origin SKU now global; 4K60 ultra with ray tracing, 20 GB/s effective cache bandwidth.', 36995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%207900%20GRE.jpg', 1),
(2, 'GPU-RX-7900XTX', 'AMD Radeon RX 7900 XTX', 'amd-radeon-rx-7900xtx', 'Top-tier RDNA 3 6144-SP flagship, 2269 MHz game / 2500 MHz boost, 24 GB GDDR6 on 384-bit, 355 W. 96 MB Infinity Cache, DisplayPort 2.1 54 Gbps, dual 8-pin; rivals RTX 4080 at 4K and excels at creator workloads.', 49995.00,  8, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%207900%20XTX.webp', 1),
(2, 'GPU-RX-9070',    'AMD Radeon RX 9070',    'amd-radeon-rx-9070',    'Early RDNA 4 4096-SP card, 2400 MHz game / 2700 MHz boost, 16 GB GDDR7 on 256-bit, 220 W. Second-gen RT + AI cores push 4K high settings; new media engine offers 8K 60 Hz encode, DP 2.1 UHBR 20.', 39995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%209070.webp', 1),
(2, 'GPU-RX-9070XT',  'AMD Radeon RX 9070 XT',  'amd-radeon-rx-9070xt',  'Factory-overclocked RDNA 4 4608-SP flagship, 2500 MHz game / 2850 MHz boost, 16 GB GDDR7 at 24 Gbps, 250 W. 15 % faster than RX 7900 XTX while drawing ~100 W less; HDMI 2.2 ready, USB-C 4K144 output.', 45995.00,  8, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AMD%20RADEON%20RX%209070%20XT.png', 1);

-- -----------------------------------------------------
-- GPU variants (cooler styles)
-- AMD GPUs start at product_id 19 (after 8 sample + 10 AMD CPUs)

INSERT INTO `product_variants` (`product_id`, `label`, `price_adjustment`, `stock_quantity`, `sku_suffix`) VALUES
(19, 'Reference',      0.00, 10, 'REF'),
(19, 'Dual-Fan',     500.00,  8, 'DUAL'),
(19, 'Triple-Fan',  1200.00,  4, 'TRIPLE'),

(20, 'Reference',      0.00, 10, 'REF'),
(20, 'Dual-Fan',     500.00,  8, 'DUAL'),
(20, 'Triple-Fan',  1200.00,  4, 'TRIPLE'),

(21, 'Reference',      0.00,  8, 'REF'),
(21, 'Dual-Fan',     500.00,  6, 'DUAL'),
(21, 'Triple-Fan',  1200.00,  3, 'TRIPLE'),

(22, 'Reference',      0.00, 12, 'REF'),
(22, 'Dual-Fan',     500.00, 10, 'DUAL'),
(22, 'Triple-Fan',  1200.00,  5, 'TRIPLE'),

(23, 'Reference',      0.00,  8, 'REF'),
(23, 'Dual-Fan',     500.00,  6, 'DUAL'),
(23, 'Triple-Fan',  1200.00,  3, 'TRIPLE'),

(24, 'Reference',      0.00,  6, 'REF'),
(24, 'Dual-Fan',     500.00,  5, 'DUAL'),
(24, 'Triple-Fan',  1200.00,  3, 'TRIPLE'),

(25, 'Reference',      0.00,  5, 'REF'),
(25, 'Dual-Fan',     500.00,  4, 'DUAL'),
(25, 'Triple-Fan',  1200.00,  2, 'TRIPLE'),

(26, 'Reference',      0.00,  4, 'REF'),
(26, 'Dual-Fan',     500.00,  3, 'DUAL'),
(26, 'Triple-Fan',  1200.00,  2, 'TRIPLE'),

(27, 'Reference',      0.00,  5, 'REF'),
(27, 'Dual-Fan',     500.00,  4, 'DUAL'),
(27, 'Triple-Fan',  1200.00,  2, 'TRIPLE'),

(28, 'Reference',      0.00,  4, 'REF'),
(28, 'Dual-Fan',     500.00,  3, 'DUAL'),
(28, 'Triple-Fan',  1200.00,  2, 'TRIPLE');


-- =====================================================
-- MOTHERBOARD PRODUCTS (10 items only)
-- =====================================================

INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(5, 'MB-AORUS-X670-ELITE-AX', 'AORUS X670 ELITE AX', 'aorus-x670-elite-ax', 'AM5 ATX board for Ryzen 7000/8000 CPUs, 16+2+2 70 A VRM, DDR5-6600+ (4 slots, 128 GB), PCIe 5.0 x16 & x4, 4×M.2 (1 PCIe 5), 2.5 GbE + Wi-Fi 6E + BT 5.3, USB-C 20 Gbps, Q-Flash Plus. Solid mid-range foundation with RGB Fusion 2.0.', 18995.00, 12, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/AORUS%20X670%20ELITE%20AX.png', 1),
(5, 'MB-ASRock-B550-PHANTOM-GAMING-4-AC', 'ASRock B550 Phantom Gaming 4 AC', 'asrock-b550-phantom-gaming-4-ac', 'AM4 ATX, 8-phase VRM, PCIe 4.0 x16, DDR4-4733+ (4×32 GB), 2×M.2 (1 PCIe 4), 2.5 GbE + 802.11ac + BT 4.2, USB-C 10 Gbps. Entry-level gaming board with Polychrome SYNC and M.2 heatsink.', 7495.00, 18, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ASROCK%20B550%20PHANTOM%20GAMING%204_AC.webp', 1),
(5, 'MB-ASRock-B650M-HDV-M2', 'ASRock B650M HDV M.2', 'asrock-b650m-hdv-m2', 'AM5 micro-ATX, 8-layer PCB, 8-phase 50 A VRM, DDR5-6400 (2 slots, 96 GB), PCIe 4.0 x16, 2×M.2 (PCIe 5 & 4), 2.5 GbE, Wi-Fi 6E optional via M.2 Key-E. Budget builder friendly with EZ M.2 latch.', 8995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ASROCK%20B650M%20HDV_M2.jpg', 1),
(5, 'MB-ASRock-X870-STEEL-LEGEND-WIFI', 'ASRock X870 Steel Legend WiFi', 'asrock-x870-steel-legend-wifi', 'Next-gen AM5 ATX, 14+2+1 90 A VRM, DDR5-8000+ (4 slots), PCIe 5.0 x16 & x4, 4×M.2 (2 PCIe 5), 5 GbE + Wi-Fi 7 + BT 5.4, USB4 40 Gbps front-C. White camo aesthetic, Polychrome RGB, graphics-card holder included.', 19995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ASROCK%20X870%20STEEL%20LEGEND%20WIFI.webp', 1),
(5, 'MB-ASUS-ROG-STRIX-B550-F-GAMING', 'ASUS ROG Strix B550-F Gaming', 'asus-rog-strix-b550-f-gaming', 'AM4 ROG ATX, 12+2 50 A VRM, DDR4-5100 (128 GB), PCIe 4.0 x16 & x4, 2×M.2 with heatsinks, 2.5 GbE, SupremeFX S1220A audio, Aura Sync. Premium gaming features minus the premium chipset price.', 11995.00, 14, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ASUS%20ROG%20Strix%20B550-F%20Gaming_.webp', 1),
(5, 'MB-ASUS-TUF-GAMING-B650-PLUS', 'ASUS TUF GAMING B650-PLUS', 'asus-tuf-gaming-b650-plus', 'AM5 TUF ATX, 12+2 DrMOS 60 A, DDR5-6400 (128 GB), PCIe 5.0 x16, 3×M.2 (1 PCIe 5), 2.5 GbE + Wi-Fi 6, USB-C 20 Gbps. Military-grade components, Realtek 7.1 audio, and two-way AI noise cancel.', 13995.00, 12, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ASUS%20TUF%20GAMING%20B650-PLUS.png', 1),
(5, 'MB-GIGABYTE-B850M-GAMING-X-WIFI6E', 'GIGABYTE B850M GAMING X WiFi 6E', 'gigabyte-b850m-gaming-x-wifi6e', 'AM5 micro-ATX, 10+2+1 55 A VRM, DDR5-7600 (2 slots, 96 GB), PCIe 4.0 x16, 2×M.2 (PCIe 5 & 4), 2.5 GbE + Wi-Fi 6E + BT 5.3, Q-Flash Plus. Black & grey heatsinks with RGB Fusion accents for compact gaming rigs.', 9995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/GIGABYTE%20B850M%20GAMING%20X%20WIFI6E.png', 1),
(5, 'MB-MSI-MAG-B850-TOMAHAWK-MAX-WIFI', 'MSI MAG B850 Tomahawk MAX WIFI', 'msi-mag-b850-tomahawk-max-wifi', 'AM5 ATX, 14+2+1 80 A VRM, DDR5-7600 (128 GB), PCIe 5.0 x16 & x4, 4×M.2 (1 PCIe 5), 2.5 GbE + Wi-Fi 6E + BT 5.3, USB-C 20 Gbps. Extended heatsink, M.2 Shield Frozr, and BIOS Flashback for bullet-proof reliability.', 15995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/MSI%20MAG%20B850%20Tomahawk%20MAX%20WIFI_.webp', 1),
(5, 'MB-MSI-MAG-X870E-TOMAHAWK-WIFI', 'MSI MAG X870E Tomahawk WIFI', 'msi-mag-x870e-tomahawk-wifi', 'AM5 high-end ATX, 16+2+1 90 A VRM, DDR5-8200+ (128 GB), PCIe 5.0 x16 & x8, 4×M.2 (2 PCIe 5), 5 GbE + Wi-Fi 7 + BT 5.4, USB4 40 Gbps rear-C. Navy-grey Tomahawk armor, fully shielded PCB for enthusiast overclocking.', 21995.00,  8, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/MSI%20MAG%20X870E%20TOMAHAWK%20WIFI.webp', 1),
(5, 'MB-ROG-STRIX-X670E-GAMING-WIFI', 'ROG STRIX X670E GAMING WIFI', 'rog-strix-x670e-gaming-wifi', 'Flagship AM5 ROG ATX, 18+2 110 A VRM, DDR5-8000+ (128 GB), PCIe 5.0 x16 & x4, 4×M.2 (2 PCIe 5 with heatsinks), 10 GbE + Wi-Fi 6E, USB4 40 Gbps front & rear. Polymo lighting, ROG Gen-Z.2 card, AI Overclocking, and SupremeFX ALC4082 audio.', 27995.00,  6, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ROG%20STRIX%20X670E-GAMING%20WIFI.png', 1);


-- =====================================================
-- CASE PRODUCTS (15 items)
-- =====================================================

INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(7, 'CASE-TT-TOWER-300', 'Thermaltake Tower 300', 'tt-tower-300', 'Mini-ITX / micro-ATX vertical “chimney” tower, 3× 120 mm ARGB fans pre-installed, 280 mm rad top, 365 mm GPU clearance, hot-swap 3.5” sled, tempered-glass front & side. Rotatable motherboard tray shows off GPU or CPU side at will.', 4995.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Thermaltake%20The%20Tower%20300%20Micro%20Tower%20Chassis.jpg', 1),
(7, 'CASE-PHANTEKS-ECLIPSE-G400A', 'Phanteks Eclipse G400A', 'phanteks-eclipse-g400a', 'Mid-tower ATX airflow specialist, mesh front, 2× 140 mm Skiron fans included, supports 360 mm front / 280 mm top radiators, 390 mm GPUs, built-in PWM fan hub. Tool-less tempered-glass side, PSU shroud, 34 mm cable space.', 3695.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Phanteks%20Eclipse%20G400A%20ATX_.webp', 1),
(7, 'CASE-NZXT-H7-FLOW', 'NZXT H7 Flow', 'nzxt-h7-flow', 'Clean ATX airflow chassis, perforated top & front, 2× 120 mm fans, fits 360 mm side / 360 mm top AIO, 381 mm GPU, 165 mm CPU cooler. Removable radiator bracket, pre-installed vertical GPU kit, USB-C 3.2 Gen 2 front.', 5495.00, 18, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/NZXT%20H7%20Flow.webp', 1),
(7, 'CASE-NZXT-H6-FLOW-RGB', 'NZXT H6 Flow RGB', 'nzxt-h6-flow-rgb', 'Compact dual-chamber ATX, 2× 140 mm RGB intake + 1× 120 mm exhaust pre-installed, 280 mm GPU basement, 360 mm top rad, 165 mm tower clearance. Swing-open glass side, cable-concealing rear chamber, USB-C front.', 4795.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/NZXT%20H6%20Flow%20RGB%20Compact%20Dual-Chamber%20ATX_jpg', 1),
(7, 'CASE-MONTECH-KING-95-PRO', 'Montech King 95 Pro', 'montech-king-95-pro', 'Premium aluminum ATX, 4 mm tempered glass, dual 200 mm ARGB front, 1× 120 mm rear, 420 mm rad support, 3-way GPU mount (horizontal, vertical, reverse). Tool-less panels, PWM/ARGB hub, USB-C 3.2 Gen 2×2.', 6995.00, 12, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Montech%20KING%2095%20PRO%20ATX.webp', 1),
(7, 'CASE-LIAN-LI-O11-DYNAMIC-EVO-RGB', 'Lian Li O11 Dynamic EVO RGB', 'lian-li-o11-dynamic-evo-rgb', 'Dual-chamber ATX icon, 3× 120 mm UniFan SL-EVO ARGB pre-mounted, 420 mm side / 360 mm top radiator, 455 mm GPU, reversible motherboard tray. Modular rails, tempered-glass front & side, USB-C 3.2 Gen 2×2.', 8495.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Lian-Li-O11-Dynamic-EVO-RGB-001.jpg', 1),
(7, 'CASE-LIAN-LI-LANCOOL-217', 'Lian Li Lancool 217', 'lian-li-lancool-217', 'Mid-range ATX airflow, mesh front, 2× 140 mm PWM fans, 360 mm top / 280 mm front rad, 392 mm GPU, 170 mm air cooler. Hinged tempered-glass side, PSU basement with removable drive cage, USB-C front.', 5995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Lian%20Li%20Lancool%20217.webp', 1),
(7, 'CASE-HYTE-Y70-TOUCH-INFINITE', 'HYTE Y70 Touch Infinite', 'hyte-y70-touch-infinite', 'Dual-chamber ATX showcase, built-in 5” 1080p touch screen on front, 3× 140 mm Infinity ARGB fans, 420 mm side rad, 422 mm GPU vertical-ready. Rotatable motherboard tray, 3× USB-C front (1 3.2 Gen 2×2).', 11995.00,  8, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/HYTE%20Y70%20Touch%20Infinite%20jpg', 1),
(7, 'CASE-HYTE-Y40-SNOW-WHITE', 'HYTE Y40 Snow White', 'hyte-y40-snow-white', 'Compact dual-chamber ATX in snowy finish, 2× 120 mm RGB fans, 360 mm top rad, 375 mm GPU, 165 mm tower. Panoramic 3 mm glass corner, PSU & cable basement, USB-C 3.2 Gen 2 front, vertical GPU bracket included.', 6495.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/HYTE%20Y40%20Snow%20White%20ATXjpg', 1),
(7, 'CASE-FRACTAL-DESIGN-NORTH', 'Fractal Design North', 'fractal-design-north', 'Scandi-inspired ATX mid-tower, real wood or vented metal front, 2× 140 mm Aspect PWM fans, 360 mm top / 280 mm front rad, 355 mm GPU. Open interior, hinged glass side, Nexus 7 fan hub pre-wired.', 6995.00, 12, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Fractal%20Design%20North%20PC.webp', 1),
(7, 'CASE-FRACTAL-DESIGN-MESHIFY-2', 'Fractal Design Meshify 2', 'fractal-design-meshify-2', 'High-airflow ATX icon, angular mesh front, 3× 140 mm Dynamic X2 GP-14 fans, 420 mm top / 360 mm front rad, 360 mm GPU with HDD cage. Modular top, reversible front door, USB-C 3.2 Gen 2, sound-damped panels.', 7995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Fractal%20Design%20Meshify%202.jpg', 1),
(7, 'CASE-CORSAIR-4000D-AIRFLOW-TG', 'Corsair 4000D Airflow TG', 'corsair-4000d-airflow-tg', 'Mid-tower ATX airflow champion, mesh front panel, 2× 120 mm AirGuide fans, 360 mm front / 280 mm top rad, 360 mm GPU, 170 mm tower. RapidRoute cable management, tempered-glass side, USB-C 3.2 Gen 2 ready.', 4495.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Corsair%204000D%20Airflow%20Tempered%20Glass_.webp', 1),
(7, 'CASE-CM-NR200P-V3', 'Cooler Master NR200P V3', 'cm-nr200p-v3', 'Updated mini-ITX SFF, 3 mm tempered-glass or vented steel side options, 3× 120 mm SickleFlow fans, 280 mm rad top, 3-slot 330 mm GPU vertical mount. Tool-less steel chassis, PCIe 4.0 riser included, USB-C 3.2 Gen 2.', 4295.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/CoolerMaster%20MasterBox%20NR200P%20V3.webp', 1),
(7, 'CASE-CM-MASTERBOX-600', 'Cooler Master MasterBox 600', 'cm-masterbox-600', 'Value ATX mid-tower, fine-mesh front, 2× 120 mm ARGB fans, 360 mm front / 280 mm top rad, 400 mm GPU, 165 mm cooler. ARGB controller built-in, tempered-glass side, PSU shroud with HDD sled, USB-C front.', 3995.00, 18, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Cooler%20Master%20MasterBox%20600%20PCjpg', 1),
(7, 'CASE-ANTEC-C5-ARGB', 'Antec C5 ARGB', 'antec-c5-argb', 'Budget ATX airflow, mesh front, 3× 120 mm ARGB fans pre-installed, 280 mm front / 240 mm top rad, 350 mm GPU, 160 mm tower. Full-length PSU shroud, magnetic tempered-glass side, ARGB sync button front I/O.', 2995.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Antec%20C5%20ARGB_jpg', 1);

-- -----------------------------------------------------
-- Case colour / finish variants
-- Cases are product IDs 39-53

INSERT INTO `product_variants` (`product_id`, `label`, `price_adjustment`, `stock_quantity`, `sku_suffix`) VALUES
(39, 'Black',        0.00,  8, 'BLACK'),
(39, 'Snow',         0.00,  6, 'SNOW'),
(39, 'Turquoise',    0.00,  4, 'TURQ'),
(39, 'Matcha Green', 0.00,  2, 'GREEN'),

(40, 'Black',        0.00, 15, 'BLACK'),
(40, 'White',        0.00, 10, 'WHITE'),

(41, 'Matte Black',  0.00, 10, 'BLACK'),
(41, 'White',        0.00,  8, 'WHITE'),

(42, 'Black',        0.00, 12, 'BLACK'),
(42, 'White',        0.00,  8, 'WHITE'),

(43, 'Black',        0.00,  7, 'BLACK'),
(43, 'White',        0.00,  5, 'WHITE'),

(44, 'Black',         0.00,  6, 'BLACK'),
(44, 'White',         0.00,  4, 'WHITE'),

(45, 'Black',         0.00,  8, 'BLACK'),
(45, 'White',         0.00,  7, 'WHITE'),

(46, 'Black',         0.00, 10, 'BLACK'),
(46, 'White',         0.00,  5, 'WHITE'),

(47, 'Black',         0.00,  5, 'BLACK'),
(47, 'White',         0.00,  3, 'WHITE'),

(48, 'Snow White',    0.00, 10, 'WHITE'),

(49, 'Black',         0.00,  6, 'BLACK'),
(49, 'White',         0.00,  4, 'WHITE'),
(49, 'Walnut front',  0.00,  2, 'WALNUT'),

(50, 'Black',         0.00,  6, 'BLACK'),
(50, 'White',         0.00,  4, 'WHITE'),

(51, 'Black',         0.00, 12, 'BLACK'),
(51, 'White',         0.00,  8, 'WHITE'),

(52, 'Black',         0.00, 10, 'BLACK'),
(52, 'White',         0.00,  6, 'WHITE'),

(53, 'Black',         0.00, 15, 'BLACK'),
(53, 'White',         0.00, 10, 'WHITE');


-- =====================================================
-- CPU COOLER PRODUCTS (10 items)
-- =====================================================

INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(8, 'COOL-THERMALRIGHT-PA120-SE', 'Thermalright Peerless Assassin 120 SE', 'thermalright-pa120-se', 'Dual-tower 120 mm SE edition, 6 heat-pipes, 2× TL-C12C PWM fans (1550 rpm, 25 dB), 165 mm height, 245 W TDP rating. Easy clip mounting for Intel 1700/AMD AM5; top-tier value for Ryzen 7 & i7 builds.', 2195.00, 30, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Thermalright%20Peerless%20Assassin%20120%20SE%20CPU%20Air%20Cooler.webp', 1),
(8, 'COOL-NOCTUA-NH-D15-G2', 'Noctua NH-D15 G2', 'noctua-nh-d15-g2', '2nd-gen flagship dual-tower, 8 heat-pipes, offset asymmetry for 100 % PCIe clearance, 2× NF-A14x25 G2 140 mm fans, 159 mm height, 280 W TDP. SecuFirm2+ for AM5/LGA1700, NT-H2 paste, 6-year warranty.', 6995.00, 12, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Noctua%20NH-D15%20G2%20CPU%20air%20cooler.webp', 1),
(8, 'COOL-NOCTUA-NH-D15', 'Noctua NH-D15', 'noctua-nh-d15', 'Legendary dual-tower classic, 6 heat-pipes, 2× NF-A15 140 mm PWM fans, 165 mm height, 250 W TDP. Whisper-quiet 24.6 dB(A), broad socket support (Intel 1700/AMD AM5), premium build and 6-year warranty.', 5495.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Noctua%20NH-D15%20CPU%20cooler.jpg', 1),
(8, 'COOL-MSI-MAG-CORE-FROZR-L-ARGB', 'MSI MAG Core Frozr L ARGB', 'msi-mag-core-frozr-l-argb', 'Single-tower 120 mm ARGB, 4 direct-touch heat-pipes, Core-Architecture fan 500-2000 rpm, 180 W TDP, 154 mm height. Mystic Light sync via 3-pin ARGB, universal Intel/AMD brackets, pre-applied thermal paste.', 2995.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/MSI%20MAG%20COREFROZR%20AA13%20ARGB%20CPUjpg', 1),
(8, 'COOL-LIAN-LI-GALAHAD-II-TRINITY-PERF', 'Lian Li Galahad II Trinity Performance', 'lian-li-galahad-ii-trinity-perf', 'AIO Trinity pump with infinity-mirror cap, 3× 120 mm high-static RGB fans (69 CFM, 2.7 mmH₂O), 400 mm sleeved tubes, 300 W TDP. Removable aluminum pump shroud, Lian-Li UNI FAN compatible, 5-year leak warranty.', 5795.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Li%20Galahad%20II%20Trinity%20Performancejpg', 1),
(8, 'COOL-ID-COOLING-SE-214XT-ARGB', 'ID-COOLING SE-214XT ARGB', 'id-cooling-se-214xt-argb', 'Budget single-tower 120 mm, 4 heat-pipes, 150 W TDP, 154 mm height. Included ARGB PWM fan 600-1800 rpm, 24 dB; supports Intel LGA1700 & AMD AM5; tool-free top-mount bracket, pre-applied paste.', 1495.00, 35, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ID-COOLING%20SE-214-XT%20ARGB%20CPU%20Cooler.jpg', 1),
(8, 'COOL-DEEPCOOL-AK620-DIGITAL', 'DeepCool AK620 Digital', 'deepcool-ak620-digital', 'Dual-tower 120 mm with status LCD on top cover, 6 nickel-plated heat-pipes, 2× FK120 PWM fans (1850 rpm, 28 dB), 260 W TDP, 160 mm height. Matrix LED shows temp/logo, wide AM5/LGA1700 coverage.', 3495.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/DeepCool%20AK620%20Digital%20CPU%20Cooler.webp', 1),
(8, 'COOL-CM-MASTERFAN-MF140-HALO', 'Cooler Master MasterFan MF140 Halo', 'cm-masterfan-mf140-halo', '140 mm hybrid-frame RGB fan (air-flow & static-pressure), 2000 rpm, 53 CFM, 2.1 mmH₂O, 30 dB. Dual-ring ARGB, MFDB bearing, daisy-chainable; ideal case or radiator upgrade, includes anti-vibration pads.', 1795.00, 40, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Cooler%20Master%20MasterFan%20MF140%20Halo.png', 1),
(8, 'COOL-BE-QUIET-DARK-ROCK-PRO-4', 'be quiet! Dark Rock Pro 4', 'be-quiet-dark-rock-pro-4', 'Flagship dual-tower silence, 7 copper heat-pipes, 2× Silent Wings 135 mm & 120 mm PWM fans, 250 W TDP, 163 mm height. Ceramic-black coating, brushed-aluminum top cover, inaudible 24 dB under load.', 5495.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/be%20quiet!%20Dark%20Rock%20Pro%204%20CPU%20coolerjpg', 1),
(8, 'COOL-ARCTIC-LIQUID-FREEZER-III', 'Arctic Liquid Freezer III', 'arctic-liquid-freezer-iii', 'Rev. 3 AIO with thicker 38 mm radiator, VRM fan on pump block, 2×/3× P14 PWM PST A-RGB, 300 W TDP. Sleeved tubing, integrated cable management, compatible with Intel 1700/AMD AM5, 6-year warranty.', 5495.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ARCTIC%20Liquid%20Freezer%20IIljpg', 1);

-- -----------------------------------------------------
-- Cooler variants (colour / size / pack)
-- Coolers are product IDs 54-63

INSERT INTO `product_variants` (`product_id`, `label`, `price_adjustment`, `stock_quantity`, `sku_suffix`) VALUES
(54, 'Black',        0.00, 20, 'BLACK'),
(54, 'White',        0.00, 10, 'WHITE'),

(55, 'Black',        0.00,  5, 'BLACK'),
(55, 'Chromax.black', 0.00,  4, 'CHRX'),
(55, 'Classic beige', 0.00,  3, 'BEIGE'),

(56, 'Brown/beige',  0.00,  9, 'BEIGE'),
(56, 'Chromax.black', 0.00,  6, 'CHRX'),

(57, 'Black top cover only', 0.00, 20, 'BLACK'),

(58, '240 mm',       0.00,  6, '240'),
(58, '360 mm',     800.00,  4, '360'),

(59, 'Black',        0.00, 20, 'BLACK'),
(59, 'White',        0.00, 15, 'WHITE'),

(60, 'Black',        0.00, 10, 'BLACK'),
(60, 'White',        0.00,  5, 'WHITE'),

(61, 'Single pack',  0.00, 25, '1PK'),
(61, 'Twin pack', 1300.00, 15, '2PK'),

(62, 'Black only',   0.00, 10, 'BLACK'),

(63, '240 mm',       0.00,  6, '240'),
(63, '360 mm',     800.00,  4, '360');


-- =====================================================
-- DDR4 MEMORY PRODUCTS (10 items)
-- =====================================================

INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(3, 'RAM-SAMSUNG-SODIMM-DDR4', 'Samsung SODIMM DDR4', 'samsung-sodimm-ddr4', 'JEDEC-standard 1.2 V DDR4-3200 CL22 SODIMM for laptops & mini-PCs; strict binning gives rock-solid stability and low power draw.', 1795.00, 40, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/SAMSUNG%20SODIMM%20DDR4_.webp', 1),
(3, 'RAM-MUSHKIN-REDLINE-SODIMM-DDR4', 'Mushkin Redline SODIMM DDR4', 'mushkin-redline-sodimm-ddr4', 'Performance DDR4-3200 CL16 SODIMM with red aluminium spreader; hand-tested chips deliver plug-and-play speed boost for gaming notebooks.', 1895.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/MUSHKIN%20ENHANCED%20REDLINE%20SODIMM%20DDR4jpg', 1),
(3, 'RAM-LEXAR-THOR-DDR4-UDIMM', 'Lexar Thor DDR4 UDIMM', 'lexar-thor-ddr4-udimm', 'Desktop DDR4-3600 CL18, wing-bolt heat-spreader, low-profile 34 mm height; XMP 2.0 one-click OC, compatible with Ryzen & Intel DDR4 boards.', 1495.00, 30, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Lexar%20THOR%20DDR4%20UDIMM_.webp', 1),
(3, 'RAM-KINGSTON-FURY-BEAST-DDR4', 'Kingston FURY Beast DDR4', 'kingston-fury-beast-ddr4', 'Iconic DDR4-3200–3733 CL15-19, black or RGB heat-spreader, XMP ready; auto-overclock to highest JEDEC profile, backed by lifetime warranty.', 1595.00, 50, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/KINGSTON%20FURY%20BEAST%20DDR4_jpg', 1),
(3, 'RAM-GSKILL-RIPJAWS-V-DDR4', 'G.SKILL Ripjaws V DDR4', 'gskill-ripjaws-v-ddr4', 'Classic dual-channel DDR4-2133–4400, 42 mm height, quad-channel validated; rippled red or black aluminium heatsink, lifetime warranty.', 1695.00, 45, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/G.SKILL%20Ripjaws%20V%20DDR4%20RAM.webp', 1),
(3, 'RAM-CRUCIAL-BALLISTIX-DDR4', 'Crucial Ballistix DDR4', 'crucial-ballistix-ddr4', 'Micron-E die DDR4-3200–4000, low-profile 39 mm or RGB models, XMP 2.0; hand-tuned timings give best-in-class latency for Ryzen 5000.', 1795.00, 35, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Crucial%20Ballistix%20DDR4.jpg', 1),
(3, 'RAM-VIPER-STEEL-DDR4', 'Viper Steel DDR4', 'viper-steel-ddr4', 'Military-grade DDR4-3000–4400, gun-metal 45 mm heat-spreader, solid aluminium shield; lifetime protection, XMP 2.0 profiles.', 1649.00, 30, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Viper%20Steel%20Series%20DDR4%20RAM.jpg', 1),
(3, 'RAM-TEAM-DARK-Z-DDR4', 'Team T-Force Dark Z DDR4', 'team-dark-z-ddr4', 'AMD-themed black & red DDR4-3200 CL16, 43 mm height, armour-style heatsink; validated for Ryzen 3000/5000, lifetime service.', 1549.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/TeamGroup%20T-Force%20Dark%20Z%20DDR4jpg', 1),
(3, 'RAM-SPECTRIX-D41-RGB-DDR4', 'Spectrix D41 RGB DDR4', 'spectrix-d41-rgb-ddr4', 'XPG DDR4-3200–4133 with diffused RGB bar, XMP 2.0; ASRock Polychrome, MSI Mystic Light sync, 46 mm height, lifetime warranty.', 1749.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/SPECTRIX%20D41%20DDR4%20RGBjpg', 1),
(3, 'RAM-CORSAIR-VENGEANCE-LPX-DDR4', 'Corsair Vengeance LPX DDR4', 'corsair-vengeance-lpx-ddr4', 'Low-profile 34 mm DDR4-2133–5000, pure aluminium spreader, XMP 2.0; hand-sorted ICs, wide compatibility, lifetime Corsair support.', 1649.00, 60, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Corsair%20Vengeance%20LPX%20DDR4_.webp', 1);

-- -----------------------------------------------------
-- Memory capacity / kit variants
-- DDR4 are product IDs 64-73

INSERT INTO `product_variants` (`product_id`, `label`, `price_adjustment`, `stock_quantity`, `sku_suffix`) VALUES
(64, '8 GB',    0.00, 20, '8G'),
(64, '16 GB', 800.00, 20, '16G'),

(65, '16 GB kit (2×8)',  0.00, 15, '16K'),
(65, '32 GB kit (2×16)', 1600.00, 10, '32K'),

(66, '8 GB',    0.00, 15, '8G'),
(66, '16 GB', 800.00, 10, '16G'),
(66, '32 GB', 1600.00,  5, '32G'),

(67, '8 GB',        0.00, 20, '8G'),
(67, '16 GB',      700.00, 20, '16G'),
(67, '32 GB',     1400.00, 10, '32G'),

(68, '4 GB',   -600.00,  5, '4G'),
(68, '8 GB',     0.00, 15, '8G'),
(68, '16 GB',  600.00, 15, '16G'),
(68, '32 GB', 1200.00, 10, '32G'),

(69, '8 GB Elite',      0.00, 10, '8E'),
(69, '16 GB Elite',   700.00, 10, '16E'),
(69, '32 GB Elite',  1400.00,  8, '32E'),
(69, '8 GB MAX',      200.00,  5, '8M'),
(69, '16 GB MAX',    900.00,  5, '16M'),

(70, '8 GB',    0.00, 10, '8G'),
(70, '16 GB', 600.00, 10, '16G'),
(70, '32 GB', 1200.00,  5, '32G'),

(71, '8 GB',    0.00, 10, '8G'),
(71, '16 GB', 600.00, 10, '16G'),
(71, '32 GB', 1200.00,  5, '32G'),

(72, '8 GB',    0.00, 10, '8G'),
(72, '16 GB', 700.00, 10, '16G'),
(72, '32 GB', 1400.00,  5, '32G'),

(73, '4 GB', -1000.00,  5, '4G'),
(73, '8 GB',    0.00, 20, '8G'),
(73, '16 GB', 800.00, 20, '16G'),
(73, '32 GB', 1600.00, 10, '32G'),
(73, '64 GB', 3200.00,  5, '64G'),
(73, '128 GB kit', 6400.00,  2, '128K');


-- =====================================================
-- DDR5 MEMORY PRODUCTS (10 items)
-- =====================================================

INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(3, 'RAM-TEAM-DELTA-RGB-DDR5', 'Team T-Force Delta RGB DDR5', 'team-delta-rgb-ddr5', '120° ARGB light-bar DDR5-5600–7200, on-die ECC, PMIC power, XMP 3.0; aluminium heat-sink, lifetime warranty, motherboard sync ready.', 3995.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/TeamGroup%20T-Force%20Delta%20RGB%20DDR5.webp', 1),
(3, 'RAM-PATRIOT-VIPER-VENOM-DDR5', 'Patriot Viper Venom DDR5', 'patriot-viper-venom-ddr5', 'Viper DDR5-5200–7400 CL30-36, forged heat-spreader, RGB top strip; on-die ECC, XMP 3.0, lifetime coverage, Intel & AMD certified.', 4195.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Patriot%20Viper%20Venom%20DDR5jpg', 1),
(3, 'RAM-LEXAR-ARES-RGB-DDR5', 'Lexar Ares RGB DDR5', 'lexar-ares-rgb-ddr5', 'DDR5-5600–6400 with mirrored RGB bar, aluminium马甲, PMIC & ECC inside; XMP 3.0 one-click, lifetime service, 1.25 V–1.35 V.', 3795.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/LEXAR%20ARES%20RGB%20DDR5.webp', 1),
(3, 'RAM-KINGSTON-FURY-BEAST-DDR5-RGB', 'Kingston FURY Beast DDR5 RGB', 'kingston-fury-beast-ddr5-rgb', 'Fury DDR5-4800–7200 CL36-40, infrared-sync RGB, XMP 3.0 & AMD EXPO profiles; plug-and-play overclock, lifetime warranty.', 3895.00, 30, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Kingston%20FURY%20Beast%20DDR5%20RGBjpg', 1),
(3, 'RAM-GSKILL-TRIDENT-Z5-RGB-DDR5', 'G.Skill Trident Z5 RGB DDR5', 'gskill-trident-z5-rgb-ddr5', 'Flagship DDR5-5600–8400, matte-black or silver body with RGB light-bar, XMP 3.0, hand-binned Hynix ICs, lifetime G.Skill warranty.', 4495.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/G.Skill%20Trident%20Z5%20RGB%20Series%20DDR5.webp', 1),
(3, 'RAM-CRUCIAL-DDR5-PRO-UDIMM', 'Crucial DDR5 Pro UDIMM', 'crucial-ddr5-pro-udimm', 'Micron原厂DDR5-4800–5600, CL40-36, on-die ECC & PMIC, JEDEC profile plus XMP 3.0; low-profile 34 mm, lifetime coverage.', 3495.00, 35, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/CRUCIAL%20DDR5%20PRO%20UDIMM.png', 1),
(3, 'RAM-CORSAIR-VENGEANCE-DDR5', 'Corsair Vengeance DDR5', 'corsair-vengeance-ddr5', 'Vengeance DDR5-4800–7000, custom PCB, XMP 3.0, PMIC for clean power; black or white spreader, lifetime Corsair support.', 3695.00, 40, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Corsair%20Vengeance%20DDR5_webp', 1),
(3, 'RAM-CORSAIR-DOMINATOR-PLATINUM-RGB-DDR5', 'Corsair Dominator Platinum RGB DDR5', 'corsair-dominator-platinum-rgb-ddr5', 'Premium DDR5-5200–8000, 12-CAP LED capellix RGB, die-cast heat-spreaders, XMP 3.0, hand-screened ICs, lifetime warranty, DHX cooling.', 5995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Corsair%20Dominator%20Platinum%20RGB_.webp', 1),
(3, 'RAM-XPG-LANCER-BLADE-RGB-DDR5', 'XPG Lancer Blade RGB DDR5', 'xpg-lancer-blade-rgb-ddr5', 'Low-profile 33 mm DDR5-5200–7200, RGB light-strip, on-die ECC, PMIC, XMP 3.0 & AMD EXPO; compatible with big air coolers, lifetime service.', 3995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/XPG%20Lancer%20Blade%20RGB%20DDR5_jpg', 1),
(3, 'RAM-ADATA-XPG-LANCER-RGB-DDR5', 'ADATA XPG Lancer RGB DDR5', 'adata-xpg-lancer-rgb-ddr5', 'XPG DDR5-5200–7200 CL36-40, sleek geometric RGB diffuser, PMIC & ECC, XMP 3.0 ready; aluminium heat-sink, lifetime ADATA warranty.', 3849.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/ADATA%20XPG%20Lancer%20RGB%20DDR5jpg', 1);

-- -----------------------------------------------------
-- DDR5 kit-size variants
-- DDR5 are product IDs 74-83

INSERT INTO `product_variants` (`product_id`, `label`, `price_adjustment`, `stock_quantity`, `sku_suffix`) VALUES
(74, '16 GB kit',    0.00, 15, '16K'),
(74, '32 GB kit', 1600.00,  8, '32K'),
(74, '64 GB kit', 3200.00,  3, '64K'),

(75, '16 GB kit',    0.00, 10, '16K'),
(75, '32 GB kit', 1700.00,  6, '32K'),
(75, '64 GB kit', 3400.00,  3, '64K'),

(76, '16 GB kit',    0.00, 12, '16K'),
(76, '32 GB kit', 1500.00,  8, '32K'),

(77, '8 GB',      -400.00, 10, '8G'),
(77, '16 GB kit',    0.00, 15, '16K'),
(77, '32 GB kit', 1500.00, 10, '32K'),
(77, '64 GB kit', 3000.00,  5, '64K'),

(78, '16 GB kit',    0.00,  8, '16K'),
(78, '32 GB kit', 1600.00,  6, '32K'),
(78, '64 GB kit', 3200.00,  3, '64K'),
(78, '96 GB kit', 4800.00,  2, '96K'),

(79, '8 GB',      -400.00, 15, '8G'),
(79, '16 GB kit',    0.00, 20, '16K'),
(79, '32 GB kit', 1200.00, 15, '32K'),
(79, '64 GB kit', 2400.00,  8, '64K'),

(80, '16 GB kit',    0.00, 20, '16K'),
(80, '32 GB kit', 1300.00, 15, '32K'),
(80, '64 GB kit', 2600.00, 10, '64K'),
(80, '96 GB kit', 3900.00,  5, '96K'),

(81, '16 GB kit',    0.00,  8, '16K'),
(81, '32 GB kit', 2300.00,  5, '32K'),
(81, '64 GB kit', 4600.00,  3, '64K'),
(81, '128 GB kit', 9200.00,  1, '128K'),

(82, '16 GB kit',    0.00, 10, '16K'),
(82, '32 GB kit', 1600.00,  8, '32K'),

(83, '16 GB kit',    0.00, 12, '16K'),
(83, '32 GB kit', 1550.00,  8, '32K'),
(83, '64 GB kit', 3100.00,  4, '64K');


-- =====================================================
-- HDD PRODUCTS (10 items)
-- =====================================================

INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
(4, 'HDD-WD-RED-PRO-20TB', 'WD Red Pro 20TB', 'wd-red-pro-20tb', 'NAS-optimized 7200 rpm CMR drive, 512 MB cache, 300 TB/year workload, 1 M-hr MTBF, 5-year warranty; NASware 3.0, 3.5-inch SATA 6 Gb/s.', 29995.00, 12, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Western%20Digital%20%28WD%29%20Red%20Pro%2020TB%20NAS_webp', 1),
(4, 'HDD-WD-GOLD-22TB', 'WD Gold 22TB', 'wd-gold-22tb', 'Enterprise-class 7200 rpm, 512 MB cache, 550 TB/year workload, 2.5 M-hr MTBF, 5-year warranty; vibration protection, 24×7 duty, SATA 6 Gb/s.', 34995.00,  8, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Western%20Digital%20%28WD%29%20Gold%2022TB.webp', 1),
(4, 'HDD-WD-BLUE-8TB', 'WD Blue 8TB', 'wd-blue-8tb', 'Mainstream 5400 rpm CMR drive, 256 MB cache, 180 TB/year rating, 2-year warranty; everyday storage, SATA 6 Gb/s, 3.5-inch form factor.', 9995.00, 25, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Western%20Digital%20%28WD%29%20Blue%208TB.webp', 1),
(4, 'HDD-TOSHIBA-X300-PRO-22TB', 'Toshiba X300 Pro 22TB', 'toshiba-x300-pro-22tb', 'Performance 7200 rpm, 512 MB cache, 300 TB/year workload, 1 M-hr MTBF, 5-year warranty; cache technology, 3.5-inch SATA 6 Gb/s.', 32995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Toshiba%20X300%20Pro%2022%20TB%20Performance_.webp', 1),
(4, 'HDD-TOSHIBA-MG-10TB', 'Toshiba MG 10TB', 'toshiba-mg-10tb', 'Enterprise 7200 rpm, 256 MB cache, 550 TB/year workload, 2 M-hr MTBF, 5-year warranty; persistent write cache, SATA 6 Gb/s, 512e sector.', 14995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Toshiba%20MG%20Series%2010TB%20Enterprise%20Capacityjpg', 1),
(4, 'HDD-SEAGATE-IRONWOLF-PRO-20TB', 'Seagate IronWolf Pro 20TB', 'seagate-ironwolf-pro-20tb', 'NAS 7200 rpm CMR, 256 MB cache, 300 TB/year, 1.2 M-hr MTBF, 5-year warranty + 3-year Rescue; AgileArray, RV sensors, SATA 6 Gb/s.', 31995.00, 10, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/SEAGATE%20IRONWOLF%20PRO%2020TBjpg', 1),
(4, 'HDD-SEAGATE-FIRECUDA-8TB', 'Seagate FireCuda 8TB', 'seagate-firecuda-8tb', 'Gaming 7200 rpm, 256 MB cache, CMR, 5-year warranty; flashes frequently-used data to onboard NAND for near-SSD feel, SATA 6 Gb/s.', 12995.00, 18, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Seagate%20FireCuda%208TBjpg', 1),
(4, 'HDD-SEAGATE-EXOS-X16-16TB', 'Seagate Exos X16 16TB', 'seagate-exos-x16-16tb', 'Data-center 7200 rpm, 256 MB cache, 550 TB/year, 2.5 M-hr MTBF, 5-year warranty; helium sealed, PowerBalance, SATA 6 Gb/s, 512e/4Kn.', 27995.00, 12, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Seagate%20Exos%20X16%20enterprise_jpg', 1),
(4, 'HDD-SEAGATE-BARRACUDA-PRO-12TB', 'Seagate BarraCuda Pro 12TB', 'seagate-barracuda-pro-12tb', 'Prosumer 7200 rpm, 256 MB cache, 300 TB/year, 5-year warranty; fastest Barracuda series, SATA 6 Gb/s, 3.5-inch, 512e sector.', 19995.00, 15, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Seagate%20BarraCuda%20Pro%2012TB_.webp', 1),
(4, 'HDD-WD-BLACK-8TB', 'WD Black 8TB', 'wd-black-8tb', 'Performance 7200 rpm, 256 MB cache, 180 TB/year, 5-year warranty; dual-core processor, dual-stage actuator, SATA 6 Gb/s, 3.5-inch.', 15995.00, 20, 'https://raw.githubusercontent.com/kidlatpogi/InfoSec-MyPC/main/assets/Western%20Digital%20%28WD%29%20Black%208TB.webp', 1);


-- Insert sample admin user (password: admin123)
-- WARNING: These are TEST credentials only. Change these passwords immediately in production!
-- To generate new password hash, use: password_hash('your_password', PASSWORD_BCRYPT)
INSERT INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `phone`, `role`, `status`) VALUES
('admin@mypc.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin', 'User', '09123456789', 'admin', 'active'),
('customer@test.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'John', 'Doe', '09987654321', 'customer', 'active');

INSERT INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `phone`, `role`, `status`) VALUES
('zeus@admin.pc', '10101831B', 'Admin', 'User', '09123456789', 'admin', 'active');

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

delete from users where id = 4;

select * from users;
