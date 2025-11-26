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

-- Insert sample products (using actual images from assets folder)
INSERT INTO `products` (`category_id`, `sku`, `name`, `slug`, `description`, `base_price`, `stock_quantity`, `image_url`, `is_active`) VALUES
-- Processors (Category 1)
(1, 'CPU-AMD-R5-7600X', 'AMD Ryzen 5 7600X', 'amd-ryzen-5-7600x', '6-Core 12-Thread Desktop Processor, 5.3GHz Max Boost', 13999.00, 25, '/assets/AMD CPU/AMD RYZEN 5 7600X.jpg', 1),
(1, 'CPU-AMD-R7-7800X3D', 'AMD Ryzen 7 7800X3D', 'amd-ryzen-7-7800x3d', '8-Core 16-Thread Gaming Processor with 3D V-Cache', 24999.00, 15, '/assets/AMD CPU/AMD RYZEN 7 7800 X3D.webp', 1),
(1, 'CPU-AMD-R9-7950X3D', 'AMD Ryzen 9 7950X3D', 'amd-ryzen-9-7950x3d', '16-Core 32-Thread High-End Processor with 3D V-Cache', 39999.00, 10, '/assets/AMD CPU/AMD RYZEN 9 7950 X3D.jpg', 1),
(1, 'CPU-AMD-R7-9800X3D', 'AMD Ryzen 7 9800X3D', 'amd-ryzen-7-9800x3d', 'Latest Gen 8-Core Gaming Processor with Enhanced 3D V-Cache', 29999.00, 12, '/assets/AMD CPU/AMD RYZEN 7 9800 X3D.jpg', 1),

-- Graphics Cards (Category 2)
(2, 'GPU-RTX-4060', 'NVIDIA RTX 4060', 'nvidia-rtx-4060', '8GB GDDR6 Graphics Card, Perfect for 1080p Gaming', 18999.00, 30, '/assets/NVIDIA GPU/NVIDIA RTX 4060.png', 1),
(2, 'GPU-RTX-4070-SUPER', 'NVIDIA RTX 4070 SUPER', 'nvidia-rtx-4070-super', '12GB GDDR6X Graphics Card, Excellent 1440p Performance', 34999.00, 20, '/assets/NVIDIA GPU/NVIDIA RTX 4070 SUPER.png', 1),
(2, 'GPU-RTX-4090', 'NVIDIA RTX 4090', 'nvidia-rtx-4090', '24GB GDDR6X Flagship Graphics Card, Ultimate 4K Gaming', 99999.00, 8, '/assets/NVIDIA GPU/NVIDIA RTX 4090.webp', 1),
(2, 'GPU-RX-7600', 'AMD Radeon RX 7600', 'amd-radeon-rx-7600', '8GB GDDR6 Graphics Card, Great Value for 1080p', 16999.00, 25, '/assets/AMD GPU/AMD RADEON RX 7600.webp', 1),
(2, 'GPU-RX-7800XT', 'AMD Radeon RX 7800 XT', 'amd-radeon-rx-7800-xt', '16GB GDDR6 Graphics Card, Powerful 1440p Gaming', 29999.00, 18, '/assets/AMD GPU/AMD RADEON RX 7800 XT.webp', 1),
(2, 'GPU-RX-7900XTX', 'AMD Radeon RX 7900 XTX', 'amd-radeon-rx-7900-xtx', '24GB GDDR6 High-End Graphics Card, 4K Ready', 54999.00, 12, '/assets/AMD GPU/AMD RADEON RX 7900 XTX.webp', 1),

-- Memory (Category 3)
(3, 'RAM-CORSAIR-DDR4-16GB', 'Corsair Vengeance LPX DDR4 16GB', 'corsair-vengeance-lpx-ddr4-16gb', '16GB (2x8GB) DDR4 3200MHz Low Profile Memory Kit', 3499.00, 50, '/assets/DDR4/Corsair Vengeance LPX DDR4_.webp', 1),
(3, 'RAM-GSKILL-DDR4-16GB', 'G.SKILL Ripjaws V DDR4 16GB', 'gskill-ripjaws-v-ddr4-16gb', '16GB (2x8GB) DDR4 3600MHz High Performance RAM', 3799.00, 45, '/assets/DDR4/G.SKILL Ripjaws V DDR4 RAM.webp', 1),
(3, 'RAM-KINGSTON-DDR4-32GB', 'Kingston FURY Beast DDR4 32GB', 'kingston-fury-beast-ddr4-32gb', '32GB (2x16GB) DDR4 3200MHz Gaming Memory', 6999.00, 35, '/assets/DDR4/KINGSTON FURY BEAST DDR4_.jpg', 1),
(3, 'RAM-CORSAIR-DDR5-32GB', 'Corsair Vengeance DDR5 32GB', 'corsair-vengeance-ddr5-32gb', '32GB (2x16GB) DDR5 6000MHz Next-Gen Memory', 8999.00, 30, '/assets/DDR5/Corsair Vengeance DDR5 RGB.webp', 1),
(3, 'RAM-GSKILL-DDR5-32GB', 'G.SKILL Trident Z5 DDR5 32GB', 'gskill-trident-z5-ddr5-32gb', '32GB (2x16GB) DDR5 6400MHz Premium RGB RAM', 9999.00, 25, '/assets/DDR5/G.SKILL Trident Z5 RGB DDR5.jpg', 1),

-- Storage (Category 4)
(4, 'SSD-SAMSUNG-990PRO-2TB', 'Samsung 990 PRO NVMe 2TB', 'samsung-990-pro-nvme-2tb', 'PCIe 4.0 NVMe M.2 SSD, 7450MB/s Read Speed', 9999.00, 40, '/assets/NVME/SAMSUNG 990 PRO NVME 2TB.webp', 1),
(4, 'SSD-WD-SN850X-1TB', 'WD Black SN850X NVMe 1TB', 'wd-black-sn850x-nvme-1tb', 'PCIe 4.0 NVMe Gaming SSD, 7300MB/s Performance', 6499.00, 50, '/assets/NVME/WESTERN DIGITAL SN850X NVME.webp', 1),
(4, 'SSD-KINGSTON-NV3-1TB', 'Kingston NV3 NVMe 1TB', 'kingston-nv3-nvme-1tb', 'PCIe 4.0 NVMe M.2 SSD, Budget-Friendly Performance', 3999.00, 60, '/assets/NVME/KINGSTON NV3 NVME 1TB.png', 1),
(4, 'SSD-CRUCIAL-MX500-1TB', 'Crucial MX500 SATA SSD 1TB', 'crucial-mx500-sata-1tb', '2.5" SATA III SSD, Reliable Storage Solution', 4499.00, 45, '/assets/SATA SSD/Crucial MX500 SATA SSD.jpg', 1),
(4, 'HDD-SEAGATE-4TB', 'Seagate BarraCuda 4TB', 'seagate-barracuda-4tb', '3.5" 7200RPM HDD, High Capacity Storage', 4999.00, 35, '/assets/HDD/Seagate BarraCuda HDD.jpg', 1),

-- Motherboards (Category 5)
(5, 'MB-ASUS-B650-PLUS', 'ASUS TUF Gaming B650-PLUS', 'asus-tuf-gaming-b650-plus', 'AMD B650 ATX Motherboard, PCIe 5.0 Ready', 11999.00, 20, '/assets/AMD Motherboard/ASUS TUF GAMING B650-PLUS.png', 1),
(5, 'MB-MSI-B850-TOMAHAWK', 'MSI MAG B850 Tomahawk MAX WIFI', 'msi-mag-b850-tomahawk-max-wifi', 'AMD B850 ATX Gaming Motherboard with WiFi 6E', 13999.00, 18, '/assets/AMD Motherboard/MSI MAG B850 Tomahawk MAX WIFI_.webp', 1),
(5, 'MB-GIGABYTE-X870-ELITE', 'GIGABYTE AORUS X670 Elite AX', 'gigabyte-aorus-x670-elite-ax', 'AMD X670 ATX Motherboard, Premium Features', 15999.00, 15, '/assets/AMD Motherboard/AORUS X670 ELITE AX.png', 1),
(5, 'MB-ASUS-ROG-X670E', 'ASUS ROG Strix X670E Gaming WIFI', 'asus-rog-strix-x670e-gaming-wifi', 'AMD X670E High-End Gaming Motherboard', 24999.00, 10, '/assets/AMD Motherboard/ROG STRIX X670E-GAMING WIFI.png', 1),

-- Power Supplies (Category 6)
(6, 'PSU-CORSAIR-RM750E', 'Corsair RM750e 750W', 'corsair-rm750e-750w', '80+ Gold Fully Modular ATX PSU', 6499.00, 40, '/assets/PSU/Corsair RM750e 80+ Gold.jpg', 1),
(6, 'PSU-SEASONIC-FOCUS-850W', 'Seasonic FOCUS GX-850', 'seasonic-focus-gx-850', '850W 80+ Gold Modular Power Supply', 7999.00, 30, '/assets/PSU/Seasonic FOCUS GX-850 80+ Gold.webp', 1),
(6, 'PSU-EVGA-SUPERNOVA-1000W', 'EVGA SuperNOVA 1000 G7', 'evga-supernova-1000-g7', '1000W 80+ Gold Fully Modular PSU', 9999.00, 25, '/assets/PSU/EVGA SuperNOVA 1000 G7 80+ Gold.jpg', 1),

-- Cases (Category 7)
(7, 'CASE-NZXT-H6-FLOW', 'NZXT H6 Flow RGB', 'nzxt-h6-flow-rgb', 'Compact Dual-Chamber ATX Case with RGB', 6999.00, 30, '/assets/CASE/NZXT H6 Flow RGB Compact Dual-Chamber ATX_.jpg', 1),
(7, 'CASE-LIAN-LI-O11', 'Lian Li O11 Dynamic EVO', 'lian-li-o11-dynamic-evo', 'Premium Mid-Tower ATX Case, Excellent Airflow', 8999.00, 25, '/assets/CASE/Lian-Li-O11-Dynamic-EVO-RGB-001.jpg', 1),
(7, 'CASE-FRACTAL-NORTH', 'Fractal Design North', 'fractal-design-north', 'Elegant ATX Case with Natural Aesthetics', 7999.00, 28, '/assets/CASE/Fractal Design North PC.webp', 1),
(7, 'CASE-CORSAIR-4000D', 'Corsair 4000D Airflow', 'corsair-4000d-airflow', 'Mid-Tower ATX Case with Tempered Glass', 5999.00, 35, '/assets/CASE/Corsair 4000D Airflow Tempered Glass_.webp', 1),

-- Cooling (Category 8)
(8, 'COOLER-ARCTIC-LF3', 'Arctic Liquid Freezer III 360', 'arctic-liquid-freezer-iii-360', '360mm AIO Liquid CPU Cooler, High Performance', 7999.00, 30, '/assets/CPU Coolers/ARCTIC Liquid Freezer III.jpg', 1),
(8, 'COOLER-DEEPCOOL-AK620', 'DeepCool AK620 Digital', 'deepcool-ak620-digital', 'Dual Tower Air CPU Cooler with Digital Display', 4999.00, 40, '/assets/CPU Coolers/DeepCool AK620 Digital CPU Cooler.webp', 1),
(8, 'COOLER-ID-SE214XT', 'ID-COOLING SE-214-XT ARGB', 'id-cooling-se-214-xt-argb', 'Budget-Friendly Tower Cooler with ARGB', 1999.00, 50, '/assets/CPU Coolers/ID-COOLING SE-214-XT ARGB CPU Cooler.jpg', 1),

-- Additional AMD CPUs
(1, 'CPU-AMD-R5-7600', 'AMD Ryzen 5 7600', 'amd-ryzen-5-7600', '6-Core 12-Thread Desktop Processor, 5.1GHz Max Boost', 12499.00, 30, '/assets/AMD CPU/AMD RYZEN 5 7600.webp', 1),
(1, 'CPU-AMD-R5-9600X', 'AMD Ryzen 5 9600X', 'amd-ryzen-5-9600x', 'Latest Gen 6-Core Processor with Zen 5 Architecture', 14999.00, 20, '/assets/AMD CPU/AMD RYZEN 5 9600 X.jpg', 1),
(1, 'CPU-AMD-R7-7700', 'AMD Ryzen 7 7700', 'amd-ryzen-7-7700', '8-Core 16-Thread Desktop Processor, 5.3GHz Boost', 19999.00, 18, '/assets/AMD CPU/AMD RYZEN 7 7700.jpg', 1),
(1, 'CPU-AMD-R9-7900X3D', 'AMD Ryzen 9 7900X3D', 'amd-ryzen-9-7900x3d', '12-Core 24-Thread Processor with 3D V-Cache', 34999.00, 12, '/assets/AMD CPU/AMD RYZEN 9 7900 X3D.jpg', 1),
(1, 'CPU-AMD-R9-9950X3D', 'AMD Ryzen 9 9950X3D', 'amd-ryzen-9-9950x3d', 'Flagship 16-Core Processor with Enhanced 3D V-Cache', 49999.00, 8, '/assets/AMD CPU/AMD RYZEN 9 9950 X3D.jpg', 1),
(1, 'CPU-AMD-R9-9950X', 'AMD Ryzen 9 9950X', 'amd-ryzen-9-9950x', '16-Core 32-Thread Zen 5 Processor', 44999.00, 10, '/assets/AMD CPU/AMD RYZEN 9 9950X.jpg', 1),

-- Intel CPUs
(1, 'CPU-INTEL-I5-14600K', 'Intel Core i5-14600K', 'intel-core-i5-14600k', '14-Core Desktop Processor, Up to 5.3GHz', 16999.00, 25, '/assets/Intel CPU/Intel Core i5-14600K.jpg', 1),

-- Additional NVIDIA GPUs
(2, 'GPU-RTX-4060TI', 'NVIDIA RTX 4060 Ti', 'nvidia-rtx-4060-ti', '8GB GDDR6 Graphics Card, Enhanced 1080p Gaming', 22999.00, 25, '/assets/NVIDIA GPU/NVIDIA RTX 4060 TI.jpg', 1),
(2, 'GPU-RTX-4070TI-SUPER', 'NVIDIA RTX 4070 Ti SUPER', 'nvidia-rtx-4070-ti-super', '16GB GDDR6X Graphics Card, High-End 1440p', 44999.00, 15, '/assets/NVIDIA GPU/NVIDIA RTX 4070 TI SUPER.webp', 1),
(2, 'GPU-RTX-4080-SUPER', 'NVIDIA RTX 4080 SUPER', 'nvidia-rtx-4080-super', '16GB GDDR6X Graphics Card, Premium 4K Gaming', 64999.00, 10, '/assets/NVIDIA GPU/NVIDIA RTX 4080 SUPER_.jpg', 1),
(2, 'GPU-RTX-4050', 'NVIDIA RTX 4050', 'nvidia-rtx-4050', '6GB GDDR6 Entry-Level Graphics Card', 14999.00, 35, '/assets/NVIDIA GPU/NVIDIA RTX 4050.jpg', 1),
(2, 'GPU-RTX-5070', 'NVIDIA RTX 5070', 'nvidia-rtx-5070', 'Next-Gen 12GB Graphics Card', 39999.00, 20, '/assets/NVIDIA GPU/NVIDIA RTX 5070.webp', 1),
(2, 'GPU-RTX-5080', 'NVIDIA RTX 5080', 'nvidia-rtx-5080', 'Next-Gen 16GB High-Performance GPU', 69999.00, 12, '/assets/NVIDIA GPU/NVIDIA RTX 5080.png', 1),
(2, 'GPU-RTX-5090', 'NVIDIA RTX 5090', 'nvidia-rtx-5090', 'Next-Gen Flagship 24GB Graphics Card', 119999.00, 6, '/assets/NVIDIA GPU/NVIDIA RTX 5090.webp', 1),

-- Additional AMD GPUs
(2, 'GPU-RX-6600XT', 'AMD Radeon RX 6600 XT', 'amd-radeon-rx-6600-xt', '8GB GDDR6 Graphics Card, Great 1080p Performance', 17999.00, 28, '/assets/AMD GPU/AMD RADEON RX 6600 XT.webp', 1),
(2, 'GPU-RX-6650XT', 'AMD Radeon RX 6650 XT', 'amd-radeon-rx-6650-xt', '8GB GDDR6 Enhanced Graphics Card', 19999.00, 24, '/assets/AMD GPU/AMD RADEON RX 6650 XT.webp', 1),
(2, 'GPU-RX-6700XT', 'AMD Radeon RX 6700 XT', 'amd-radeon-rx-6700-xt', '12GB GDDR6 Graphics Card, Solid 1440p', 24999.00, 20, '/assets/AMD GPU/AMD RADEON RX 6700 XT.webp', 1),
(2, 'GPU-RX-7700XT', 'AMD Radeon RX 7700 XT', 'amd-radeon-rx-7700-xt', '12GB GDDR6 Graphics Card, Excellent Value', 26999.00, 22, '/assets/AMD GPU/AMD RADEON RX 7700 XT.jpg', 1),
(2, 'GPU-RX-7900GRE', 'AMD Radeon RX 7900 GRE', 'amd-radeon-rx-7900-gre', '16GB GDDR6 Graphics Card, Great Performance', 32999.00, 16, '/assets/AMD GPU/AMD RADEON RX 7900 GRE.jpg', 1),
(2, 'GPU-RX-9070', 'AMD Radeon RX 9070', 'amd-radeon-rx-9070', 'Next-Gen 12GB Graphics Card', 29999.00, 18, '/assets/AMD GPU/AMD RADEON RX 9070.webp', 1),
(2, 'GPU-RX-9070XT', 'AMD Radeon RX 9070 XT', 'amd-radeon-rx-9070-xt', 'Next-Gen 16GB High-Performance GPU', 36999.00, 14, '/assets/AMD GPU/AMD RADEON RX 9070 XT.png', 1),

-- Intel GPUs
(2, 'GPU-INTEL-ARC-A750', 'Intel Arc A750', 'intel-arc-a750', '8GB Graphics Card, Competitive 1080p Gaming', 15999.00, 30, '/assets/Intel GPU/Intel Arc A750.jpg', 1),
(2, 'GPU-INTEL-ARC-A770', 'Intel Arc A770', 'intel-arc-a770', '16GB Graphics Card, Strong 1440p Performance', 19999.00, 25, '/assets/Intel GPU/Intel Arc A770.jpg', 1),
(2, 'GPU-INTEL-ARC-B580', 'Intel Arc B580', 'intel-arc-b580', 'Next-Gen 12GB Graphics Card', 17999.00, 28, '/assets/Intel GPU/Intel Arc B580.jpg', 1),

-- Additional DDR4 RAM
(3, 'RAM-CRUCIAL-DDR4-16GB', 'Crucial Ballistix DDR4 16GB', 'crucial-ballistix-ddr4-16gb', '16GB (2x8GB) DDR4 3200MHz Gaming RAM', 3599.00, 40, '/assets/DDR4/Crucial Ballistix DDR4.jpg', 1),
(3, 'RAM-LEXAR-DDR4-16GB', 'Lexar THOR DDR4 16GB', 'lexar-thor-ddr4-16gb', '16GB (2x8GB) DDR4 3600MHz Performance RAM', 3699.00, 38, '/assets/DDR4/Lexar THOR DDR4 UDIMM_.webp', 1),
(3, 'RAM-TEAMGROUP-DDR4-16GB', 'TeamGroup T-Force Dark Z DDR4 16GB', 'teamgroup-dark-z-ddr4-16gb', '16GB (2x8GB) DDR4 3600MHz High-Speed RAM', 3799.00, 36, '/assets/DDR4/TeamGroup T-Force Dark Z DDR4.jpg', 1),
(3, 'RAM-SPECTRIX-DDR4-16GB', 'SPECTRIX D41 DDR4 RGB 16GB', 'spectrix-d41-ddr4-16gb', '16GB (2x8GB) DDR4 3200MHz RGB RAM', 3899.00, 34, '/assets/DDR4/SPECTRIX D41 DDR4 RGB.jpg', 1),
(3, 'RAM-VIPER-DDR4-16GB', 'Viper Steel Series DDR4 16GB', 'viper-steel-ddr4-16gb', '16GB (2x8GB) DDR4 3600MHz Performance RAM', 3799.00, 35, '/assets/DDR4/Viper Steel Series DDR4 RAM.jpg', 1),
(3, 'RAM-MUSHKIN-DDR4-16GB', 'Mushkin Enhanced Redline DDR4 16GB', 'mushkin-redline-ddr4-16gb', '16GB (2x8GB) DDR4 3200MHz SODIMM', 3699.00, 32, '/assets/DDR4/MUSHKIN ENHANCED REDLINE SODIMM DDR4.jpg', 1),
(3, 'RAM-SAMSUNG-DDR4-16GB', 'Samsung DDR4 SODIMM 16GB', 'samsung-ddr4-sodimm-16gb', '16GB (2x8GB) DDR4 3200MHz Laptop RAM', 3599.00, 40, '/assets/DDR4/SAMSUNG SODIMM DDR4_.webp', 1),

-- Additional DDR5 RAM
(3, 'RAM-ADATA-DDR5-32GB', 'ADATA XPG Lancer RGB DDR5 32GB', 'adata-xpg-lancer-ddr5-32gb', '32GB (2x16GB) DDR5 6000MHz RGB RAM', 9499.00, 28, '/assets/DDR5/ADATA XPG Lancer RGB DDR5.jpg', 1),
(3, 'RAM-XPG-LANCER-DDR5-32GB', 'XPG Lancer Blade RGB DDR5 32GB', 'xpg-lancer-blade-ddr5-32gb', '32GB (2x16GB) DDR5 6400MHz Premium RAM', 9999.00, 24, '/assets/DDR5/XPG Lancer Blade RGB DDR5_.jpg', 1),
(3, 'RAM-KINGSTON-DDR5-32GB', 'Kingston FURY Beast DDR5 32GB', 'kingston-fury-beast-ddr5-32gb', '32GB (2x16GB) DDR5 5600MHz Gaming RAM', 8499.00, 30, '/assets/DDR5/KINGSTON FURY BEAST DDR5.jpg', 1),

-- Additional NVMe SSDs
(4, 'SSD-CRUCIAL-P510-2TB', 'Crucial P510 NVMe 2TB', 'crucial-p510-nvme-2tb', 'PCIe 4.0 NVMe M.2 SSD, High Performance', 8999.00, 35, '/assets/NVME/CRUCIAL P510 NVME_.webp', 1),
(4, 'SSD-KINGSTON-KC3000-2TB', 'Kingston KC3000 NVMe 2TB', 'kingston-kc3000-nvme-2tb', 'PCIe 4.0 NVMe M.2 SSD, 7000MB/s Speed', 9499.00, 32, '/assets/NVME/KINGSTON KC3000 NVME.jpg', 1),
(4, 'SSD-LEXAR-NM790-2TB', 'Lexar NM790 NVMe 2TB', 'lexar-nm790-nvme-2tb', 'PCIe 4.0 NVMe M.2 SSD, Great Value', 7999.00, 38, '/assets/NVME/LEXAR NM790 NVME_.webp', 1),
(4, 'SSD-NEXAR-NQ780-1TB', 'Nexar NQ780 NVMe 1TB', 'nexar-nq780-nvme-1tb', 'PCIe 4.0 NVMe M.2 SSD, Budget Performance', 4499.00, 45, '/assets/NVME/NEXAR NQ780 NVME.png', 1),
(4, 'SSD-SAMSUNG-9100PRO-2TB', 'Samsung 9100 PRO NVMe 2TB', 'samsung-9100-pro-nvme-2tb', 'PCIe 5.0 NVMe M.2 SSD, Next-Gen Speed', 14999.00, 25, '/assets/NVME/SAMSUNG 9100 PRO NVME 2TB.jpg', 1),
(4, 'SSD-SEAGATE-FIRECUDA-2TB', 'Seagate FireCuda 530 NVMe 2TB', 'seagate-firecuda-530-nvme-2tb', 'PCIe 4.0 NVMe M.2 SSD, Gaming Optimized', 10999.00, 28, '/assets/NVME/Seagate FireCuda 530 M.2 NVMe_.jpg', 1),
(4, 'SSD-TEAMGROUP-MP33PRO-2TB', 'TeamGroup MP33 PRO NVMe 2TB', 'teamgroup-mp33-pro-nvme-2tb', 'PCIe 3.0 NVMe M.2 SSD, Reliable Storage', 6999.00, 40, '/assets/NVME/TEAMGROUP MP33 PRO NVME 2TB.jpg', 1),

-- SATA SSDs
(4, 'SSD-ADATA-SU800-1TB', 'ADATA SU800 SATA SSD 1TB', 'adata-su800-sata-1tb', '2.5" SATA III SSD, 3D NAND Technology', 4299.00, 42, '/assets/SATA SSD/ADATA SU800 SATA SSD.webp', 1),
(4, 'SSD-KINGSTON-A400-240GB', 'Kingston A400 SATA SSD 240GB', 'kingston-a400-sata-240gb', '2.5" SATA III SSD, Entry-Level Storage', 1999.00, 60, '/assets/SATA SSD/KINGSTON A400 240GB SATA_.webp', 1),
(4, 'SSD-LEXAR-NS100-512GB', 'Lexar NS100 SATA SSD 512GB', 'lexar-ns100-sata-512gb', '2.5" SATA III SSD, Budget-Friendly', 2999.00, 55, '/assets/SATA SSD/LEXAR NS100 SATA SSD.webp', 1),
(4, 'SSD-PATRIOT-BURST-960GB', 'Patriot Burst SATA SSD 960GB', 'patriot-burst-sata-960gb', '2.5" SATA III SSD, High Capacity', 4799.00, 38, '/assets/SATA SSD/PATRIOT BURST 960GB.jpg', 1),
(4, 'SSD-SAMSUNG-870EVO-1TB', 'Samsung 870 EVO SATA SSD 1TB', 'samsung-870-evo-sata-1tb', '2.5" SATA III SSD, Premium Performance', 5499.00, 40, '/assets/SATA SSD/SAMSUNG 870 EVO 1TB.jpg', 1),
(4, 'SSD-SANDISK-ULTRA3D-1TB', 'SanDisk Ultra 3D SATA SSD 1TB', 'sandisk-ultra-3d-sata-1tb', '2.5" SATA III SSD, 3D NAND', 4699.00, 42, '/assets/SATA SSD/SANDISK ULTRA 3D SATA SSD.webp', 1),
(4, 'SSD-SEAGATE-BARRACUDA-1TB', 'Seagate BarraCuda 120 SATA SSD 1TB', 'seagate-barracuda-120-sata-1tb', '2.5" SATA III SSD, Reliable Storage', 4599.00, 40, '/assets/SATA SSD/SEAGATE BARRACUDA 120 SATA SSD.jpg', 1),
(4, 'SSD-TOSHIBA-TR200-960GB', 'Toshiba TR200 SATA SSD 960GB', 'toshiba-tr200-sata-960gb', '2.5" SATA III SSD, Value Storage', 4399.00, 38, '/assets/SATA SSD/TOSHIBA TR200 SATA SSD.jpg', 1),

-- HDDs
(4, 'HDD-SEAGATE-IRONWOLF-8TB', 'Seagate IronWolf 8TB NAS', 'seagate-ironwolf-8tb', '3.5" 7200RPM NAS HDD, High Reliability', 8999.00, 25, '/assets/HDD/Seagate IronWolf 8TB NAS HDD.jpg', 1),
(4, 'HDD-TOSHIBA-MG-10TB', 'Toshiba MG Series 10TB Enterprise', 'toshiba-mg-10tb', '3.5" 7200RPM Enterprise HDD', 11999.00, 20, '/assets/HDD/Toshiba MG Series 10TB Enterprise Capacity.jpg', 1),
(4, 'HDD-TOSHIBA-X300-22TB', 'Toshiba X300 Pro 22TB', 'toshiba-x300-22tb', '3.5" 7200RPM High-Capacity HDD', 19999.00, 15, '/assets/HDD/Toshiba X300 Pro 22 TB Performance_.webp', 1),
(4, 'HDD-WD-BLACK-8TB', 'Western Digital Black 8TB', 'wd-black-8tb', '3.5" 7200RPM Performance HDD', 9999.00, 22, '/assets/HDD/Western Digital (WD) Black 8TB.webp', 1),
(4, 'HDD-WD-BLUE-8TB', 'Western Digital Blue 8TB', 'wd-blue-8tb', '3.5" 5400RPM Desktop HDD', 7999.00, 28, '/assets/HDD/Western Digital (WD) Blue 8TB.webp', 1),
(4, 'HDD-WD-GOLD-22TB', 'Western Digital Gold 22TB', 'wd-gold-22tb', '3.5" 7200RPM Enterprise HDD', 21999.00, 12, '/assets/HDD/Western Digital (WD) Gold 22TB.webp', 1),
(4, 'HDD-WD-REDPRO-20TB', 'Western Digital Red Pro 20TB NAS', 'wd-red-pro-20tb', '3.5" 7200RPM NAS HDD', 17999.00, 18, '/assets/HDD/Western Digital (WD) Red Pro 20TB NAS_.webp', 1),

-- Additional AMD Motherboards
(5, 'MB-ASROCK-B550-PHANTOM', 'ASRock B550 Phantom Gaming 4/AC', 'asrock-b550-phantom-gaming-4-ac', 'AMD B550 ATX Motherboard with WiFi', 8999.00, 22, '/assets/AMD Motherboard/ASROCK B550 PHANTOM GAMING 4_AC.webp', 1),
(5, 'MB-ASROCK-B650M-HDV', 'ASRock B650M HDV/M.2', 'asrock-b650m-hdv-m2', 'AMD B650 Micro-ATX Motherboard', 7999.00, 25, '/assets/AMD Motherboard/ASROCK B650M HDV_M2.jpg', 1),
(5, 'MB-ASROCK-X870-STEEL', 'ASRock X870 Steel Legend WIFI', 'asrock-x870-steel-legend-wifi', 'AMD X870 ATX Motherboard, Premium Build', 17999.00, 14, '/assets/AMD Motherboard/ASROCK X870 STEEL LEGEND WIFI.webp', 1),
(5, 'MB-ASUS-ROG-B550F', 'ASUS ROG Strix B550-F Gaming', 'asus-rog-strix-b550-f-gaming', 'AMD B550 ATX Gaming Motherboard', 10999.00, 20, '/assets/AMD Motherboard/ASUS ROG Strix B550-F Gaming_.webp', 1),
(5, 'MB-GIGABYTE-B850M-GAMING', 'GIGABYTE B850M Gaming X WIFI6E', 'gigabyte-b850m-gaming-x-wifi6e', 'AMD B850 Micro-ATX Motherboard with WiFi 6E', 9999.00, 22, '/assets/AMD Motherboard/GIGABYTE B850M GAMING X WIFI6E.png', 1),
(5, 'MB-MSI-X870E-TOMAHAWK', 'MSI MAG X870E Tomahawk WIFI', 'msi-mag-x870e-tomahawk-wifi', 'AMD X870E ATX Motherboard, High-End Features', 19999.00, 12, '/assets/AMD Motherboard/MSI MAG X870E TOMAHAWK WIFI.webp', 1),

-- Intel Motherboards
(5, 'MB-ASUS-Z790-STRIX', 'ASUS ROG Strix Z790-E Gaming WIFI', 'asus-rog-strix-z790-e-gaming-wifi', 'Intel Z790 ATX Gaming Motherboard', 22999.00, 15, '/assets/Intel Motherboard/ASUS ROG Strix Z790-E Gaming WIFI.jpg', 1),
(5, 'MB-GIGABYTE-Z790-AORUS', 'GIGABYTE Z790 AORUS Elite AX', 'gigabyte-z790-aorus-elite-ax', 'Intel Z790 ATX Motherboard with WiFi', 16999.00, 18, '/assets/Intel Motherboard/GIGABYTE Z790 AORUS Elite AX.jpg', 1),
(5, 'MB-MSI-Z790-TOMAHAWK', 'MSI MAG Z790 Tomahawk WIFI', 'msi-mag-z790-tomahawk-wifi', 'Intel Z790 ATX Motherboard, Great Value', 14999.00, 20, '/assets/Intel Motherboard/MSI MAG Z790 Tomahawk WIFI.webp', 1),

-- Additional PSUs
(6, 'PSU-COOLERMASTER-V850', 'Cooler Master V850 SFX Gold', 'coolermaster-v850-sfx-gold', '850W 80+ Gold SFX Power Supply', 8999.00, 28, '/assets/PSU/Cooler Master V850 SFX Gold.jpg', 1),
(6, 'PSU-XPG-CORE-REACTOR', 'XPG Core Reactor 2 VE 850W', 'xpg-core-reactor-2-ve-850w', '850W 80+ Gold Modular PSU', 7499.00, 32, '/assets/PSU/XPG CORE REACTOR 2 VE.png', 1),

-- Additional Cases
(7, 'CASE-ANTEC-C5', 'Antec C5 ARGB', 'antec-c5-argb', 'Mid-Tower ATX Case with ARGB Fans', 4999.00, 32, '/assets/CASE/Antec C5 ARGB_.jpg', 1),
(7, 'CASE-CM-MASTERBOX-600', 'Cooler Master MasterBox 600', 'cooler-master-masterbox-600', 'Mid-Tower ATX Case, Great Airflow', 5499.00, 30, '/assets/CASE/Cooler Master MasterBox 600 PC.jpg', 1),
(7, 'CASE-CM-NR200P-V3', 'Cooler Master MasterBox NR200P V3', 'cooler-master-nr200p-v3', 'Mini-ITX Case, Compact Build', 6499.00, 25, '/assets/CASE/CoolerMaster MasterBox NR200P V3.webp', 1),
(7, 'CASE-FRACTAL-MESHIFY2', 'Fractal Design Meshify 2', 'fractal-design-meshify-2', 'Mid-Tower ATX Case, Excellent Cooling', 7499.00, 26, '/assets/CASE/Fractal Design Meshify 2.jpg', 1),
(7, 'CASE-HYTE-Y40', 'HYTE Y40 Snow White ATX', 'hyte-y40-snow-white', 'Mid-Tower ATX Case, Premium Aesthetics', 9999.00, 20, '/assets/CASE/HYTE Y40 Snow White ATX.jpg', 1),
(7, 'CASE-HYTE-Y70', 'HYTE Y70 Touch Infinite', 'hyte-y70-touch-infinite', 'Full-Tower ATX Case with Touch Screen', 14999.00, 15, '/assets/CASE/HYTE Y70 Touch Infinite.jpg', 1),
(7, 'CASE-LIAN-LI-217', 'Lian Li Lancool 217', 'lian-li-lancool-217', 'Mid-Tower ATX Case, Modern Design', 8499.00, 24, '/assets/CASE/Lian Li Lancool 217.webp', 1),
(7, 'CASE-MONTECH-KING95', 'Montech KING 95 PRO ATX', 'montech-king-95-pro', 'Mid-Tower ATX Case, Budget-Friendly', 4499.00, 35, '/assets/CASE/Montech KING 95 PRO ATX.webp', 1),
(7, 'CASE-NZXT-H7-FLOW', 'NZXT H7 Flow', 'nzxt-h7-flow', 'Mid-Tower ATX Case with Excellent Airflow', 7999.00, 28, '/assets/CASE/NZXT H7 Flow.webp', 1),
(7, 'CASE-PHANTEKS-G400A', 'Phanteks Eclipse G400A ATX', 'phanteks-eclipse-g400a', 'Mid-Tower ATX Case, Great Value', 5999.00, 30, '/assets/CASE/Phanteks Eclipse G400A ATX_.webp', 1),
(7, 'CASE-THERMALTAKE-TOWER300', 'Thermaltake The Tower 300', 'thermaltake-the-tower-300', 'Micro Tower Chassis, Unique Design', 6999.00, 22, '/assets/CASE/Thermaltake The Tower 300 Micro Tower Chassis.jpg', 1),

-- Additional Coolers
(8, 'COOLER-CM-MF140', 'Cooler Master MasterFan MF140 Halo', 'cooler-master-masterfan-mf140-halo', '140mm ARGB Case Fan', 1499.00, 60, '/assets/CPU Coolers/Cooler Master MasterFan MF140 Halo.png', 1),
(8, 'COOLER-LIAN-LI-GALAHAD', 'Lian Li Galahad II Trinity Performance', 'lian-li-galahad-ii-trinity', '360mm AIO Liquid Cooler, RGB', 8999.00, 28, '/assets/CPU Coolers/Li Galahad II Trinity Performance.jpg', 1);

-- Insert sample product variants
INSERT INTO `product_variants` (`product_id`, `label`, `price_adjustment`, `stock_quantity`, `sku_suffix`) VALUES
-- RAM variants (product_id 10 = Corsair Vengeance LPX DDR4)
(10, '8GB Kit (2x4GB)', -1000.00, 30, '8GB'),
(10, '16GB Kit (2x8GB)', 0.00, 50, '16GB'),
(10, '32GB Kit (2x16GB)', 3000.00, 25, '32GB'),
-- Storage variants (product_id 15 = Samsung 990 PRO)
(15, '1TB', -4000.00, 50, '1TB'),
(15, '2TB', 0.00, 40, '2TB'),
(15, '4TB', 10000.00, 20, '4TB');

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
