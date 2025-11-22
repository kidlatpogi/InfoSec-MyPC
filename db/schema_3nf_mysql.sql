-- =====================================================
-- MyPC Store - Complete MySQL Database Schema
-- E-commerce platform for PC components
-- =====================================================
 
DROP DATABASE IF EXISTS `mypc_store`;
CREATE DATABASE `mypc_store` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mypc_store`;
 
-- =====================================================
-- USER MANAGEMENT TABLES
-- =====================================================
 
-- Main users table (customers, admins, employees, superadmin)
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `middle_name` VARCHAR(100) DEFAULT NULL,
    `phone` VARCHAR(50) DEFAULT NULL,
    `role` ENUM('customer', 'employee', 'admin', 'superadmin') NOT NULL DEFAULT 'customer',
    `status` ENUM('active', 'inactive', 'suspended', 'deleted') NOT NULL DEFAULT 'active',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (`email`),
    INDEX idx_role (`role`),
    INDEX idx_status (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- User addresses (multiple addresses per user)
CREATE TABLE `addresses` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `label` VARCHAR(60) DEFAULT NULL COMMENT 'Home, Office, etc.',
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `middle_name` VARCHAR(100) DEFAULT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `status` ENUM('active', 'deleted') NOT NULL DEFAULT 'active',
    `address_line1` VARCHAR(255) NOT NULL,
    `address_line2` VARCHAR(255) DEFAULT NULL,
    `city` VARCHAR(120) NOT NULL,
    `state_province` VARCHAR(120) DEFAULT NULL,
    `postal_code` VARCHAR(30) NOT NULL,
    `country` VARCHAR(100) NOT NULL DEFAULT 'Philippines',
    `is_default` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_id (`user_id`),
    INDEX idx_is_default (`is_default`),
    CONSTRAINT fk_addresses_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- User sessions for authentication tracking
CREATE TABLE `user_sessions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `session_token` VARCHAR(255) NOT NULL UNIQUE,
    `ip_address` VARCHAR(45) DEFAULT NULL,
    `user_agent` VARCHAR(512) DEFAULT NULL,
    `expires_at` DATETIME NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_id (`user_id`),
    INDEX idx_session_token (`session_token`),
    INDEX idx_expires_at (`expires_at`),
    CONSTRAINT fk_sessions_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- =====================================================
-- PRODUCT CATALOG TABLES
-- =====================================================
 
-- Product categories
CREATE TABLE `categories` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(120) NOT NULL UNIQUE,
    `slug` VARCHAR(160) NOT NULL UNIQUE,
    `description` TEXT DEFAULT NULL,
    `display_order` INT NOT NULL DEFAULT 0,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    `status` ENUM('active', 'inactive', 'deleted') NOT NULL DEFAULT 'active',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_slug (`slug`),
    INDEX idx_is_active (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- Products (main product information)
CREATE TABLE `products` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` VARCHAR(100) NOT NULL UNIQUE COMMENT 'Slug/identifier like cpu-ryzen5',
    `category_id` BIGINT UNSIGNED DEFAULT NULL,
    `sku` VARCHAR(80) UNIQUE DEFAULT NULL,
    `title` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL UNIQUE,
    `short_description` VARCHAR(512) DEFAULT NULL,
    `long_description` TEXT DEFAULT NULL,
    `base_price` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `image_url` TEXT DEFAULT NULL,
    `is_active` TINYINT(1) NOT NULL DEFAULT 1,
    `is_featured` TINYINT(1) NOT NULL DEFAULT 0,
    `status` ENUM('active', 'inactive', 'deleted') NOT NULL DEFAULT 'active',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_product_id (`product_id`),
    INDEX idx_category_id (`category_id`),
    INDEX idx_slug (`slug`),
    INDEX idx_is_active (`is_active`),
    INDEX idx_is_featured (`is_featured`),
    CONSTRAINT fk_products_category FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- Product variants (e.g., Boxed vs OEM, different memory sizes)
CREATE TABLE `product_variants` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `variant_sku` VARCHAR(100) DEFAULT NULL,
    `label` VARCHAR(150) NOT NULL COMMENT 'Boxed, OEM, 8GB, etc.',
    `price_delta` DECIMAL(12,2) NOT NULL DEFAULT 0.00 COMMENT 'Price difference from base',
    `stock_quantity` INT NOT NULL DEFAULT 0,
    `weight_grams` INT DEFAULT NULL,
    `dimensions` VARCHAR(120) DEFAULT NULL,
    `is_default` TINYINT(1) NOT NULL DEFAULT 0,
    `status` ENUM('active', 'inactive', 'deleted') NOT NULL DEFAULT 'active',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY ux_variant_product_label (`product_id`, `label`),
    INDEX idx_product_id (`product_id`),
    INDEX idx_stock (`stock_quantity`),
    CONSTRAINT fk_variants_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- Product images
CREATE TABLE `product_images` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED DEFAULT NULL,
    `variant_id` BIGINT UNSIGNED DEFAULT NULL,
    `url` VARCHAR(1000) NOT NULL,
    `alt_text` VARCHAR(255) DEFAULT NULL,
    `display_order` INT NOT NULL DEFAULT 0,
    `is_primary` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_product_id (`product_id`),
    INDEX idx_variant_id (`variant_id`),
    CONSTRAINT fk_images_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_images_variant FOREIGN KEY (`variant_id`) REFERENCES `product_variants`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- Product specifications
CREATE TABLE `product_specifications` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `spec_key` VARCHAR(100) NOT NULL COMMENT 'Brand, Warranty, Model, etc.',
    `spec_value` TEXT NOT NULL,
    `display_order` INT NOT NULL DEFAULT 0,
    INDEX idx_product_id (`product_id`),
    CONSTRAINT fk_specs_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- =====================================================
-- SHOPPING CART TABLES
-- =====================================================
 
-- Shopping carts (persistent carts for logged-in users)
CREATE TABLE `carts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'NULL for guest carts',
    `session_id` VARCHAR(255) DEFAULT NULL COMMENT 'For guest carts',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_id (`user_id`),
    INDEX idx_session_id (`session_id`),
    CONSTRAINT fk_carts_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- Cart items
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
    INDEX idx_variant_id (`variant_id`),
    CONSTRAINT fk_cart_items_cart FOREIGN KEY (`cart_id`) REFERENCES `carts`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_cart_items_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_cart_items_variant FOREIGN KEY (`variant_id`) REFERENCES `product_variants`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- =====================================================
-- ORDER MANAGEMENT TABLES
-- =====================================================
 
-- Orders
CREATE TABLE `orders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_number` VARCHAR(50) NOT NULL UNIQUE,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,
    `customer_email` VARCHAR(255) NOT NULL,
    `customer_first_name` VARCHAR(100) NOT NULL,
    `customer_last_name` VARCHAR(100) NOT NULL,
    `customer_middle_name` VARCHAR(100) DEFAULT NULL,
    `customer_phone` VARCHAR(50) NOT NULL,
    `shipping_address_id` BIGINT UNSIGNED DEFAULT NULL,
    `shipping_address` TEXT NOT NULL COMMENT 'JSON or full address text',
    `billing_address` TEXT DEFAULT NULL COMMENT 'JSON or full address text',
    `status` ENUM('pending', 'processing', 'paid', 'shipped', 'delivered', 'completed', 'cancelled', 'refunded') NOT NULL DEFAULT 'pending',
    `payment_method` ENUM('cod', 'card', 'bank_transfer', 'gcash', 'paymaya') NOT NULL DEFAULT 'cod',
    `payment_status` ENUM('pending', 'paid', 'failed', 'refunded') NOT NULL DEFAULT 'pending',
    `subtotal` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `shipping_fee` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `tax` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `discount` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `total` DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    `notes` TEXT DEFAULT NULL,
    `placed_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_order_number (`order_number`),
    INDEX idx_user_id (`user_id`),
    INDEX idx_customer_email (`customer_email`),
    INDEX idx_status (`status`),
    INDEX idx_payment_status (`payment_status`),
    INDEX idx_placed_at (`placed_at`),
    CONSTRAINT fk_orders_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL,
    CONSTRAINT fk_orders_shipping_address FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- Order items (snapshot of products at time of purchase)
CREATE TABLE `order_items` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT UNSIGNED NOT NULL,
    `product_id` BIGINT UNSIGNED DEFAULT NULL,
    `variant_id` BIGINT UNSIGNED DEFAULT NULL,
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
    CONSTRAINT fk_order_items_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE SET NULL,
    CONSTRAINT fk_order_items_variant FOREIGN KEY (`variant_id`) REFERENCES `product_variants`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- Order status history (audit trail)
CREATE TABLE `order_status_history` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT UNSIGNED NOT NULL,
    `status` VARCHAR(50) NOT NULL,
    `notes` TEXT DEFAULT NULL,
    `changed_by` BIGINT UNSIGNED DEFAULT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_order_id (`order_id`),
    INDEX idx_changed_by (`changed_by`),
    CONSTRAINT fk_order_history_order FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_order_history_user FOREIGN KEY (`changed_by`) REFERENCES `users`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- =====================================================
-- PAYMENT TABLES
-- =====================================================
 
-- Payment transactions
CREATE TABLE `payments` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT UNSIGNED NOT NULL,
    `payment_method` ENUM('cod', 'card', 'bank_transfer', 'gcash', 'paymaya') NOT NULL,
    `amount` DECIMAL(12,2) NOT NULL,
    `currency` VARCHAR(10) NOT NULL DEFAULT 'PHP',
    `status` ENUM('pending', 'processing', 'completed', 'failed', 'refunded') NOT NULL DEFAULT 'pending',
    `provider_reference` VARCHAR(255) DEFAULT NULL COMMENT 'External payment gateway reference',
    `provider_response` TEXT DEFAULT NULL COMMENT 'JSON response from payment gateway',
    `paid_at` DATETIME DEFAULT NULL,
    `refunded_at` DATETIME DEFAULT NULL,
    `notes` TEXT DEFAULT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_order_id (`order_id`),
    INDEX idx_status (`status`),
    INDEX idx_provider_reference (`provider_reference`),
    CONSTRAINT fk_payments_order FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- =====================================================
-- REVIEWS AND RATINGS TABLES
-- =====================================================
 
-- Product reviews
CREATE TABLE `reviews` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT UNSIGNED NOT NULL,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,
    `order_id` BIGINT UNSIGNED DEFAULT NULL COMMENT 'Link to verified purchase',
    `rating` TINYINT UNSIGNED NOT NULL CHECK (`rating` >= 1 AND `rating` <= 5),
    `title` VARCHAR(255) DEFAULT NULL,
    `body` TEXT DEFAULT NULL,
    `is_verified_purchase` TINYINT(1) NOT NULL DEFAULT 0,
    `is_approved` TINYINT(1) NOT NULL DEFAULT 1,
    `helpful_count` INT NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_product_id (`product_id`),
    INDEX idx_user_id (`user_id`),
    INDEX idx_rating (`rating`),
    INDEX idx_is_approved (`is_approved`),
    CONSTRAINT fk_reviews_product FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
    CONSTRAINT fk_reviews_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL,
    CONSTRAINT fk_reviews_order FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- =====================================================
-- ADMIN AND AUDIT TABLES
-- =====================================================
 
-- Admin activity audit log
CREATE TABLE `admin_audit_log` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED DEFAULT NULL,
    `action` VARCHAR(255) NOT NULL COMMENT 'create_user, update_product, delete_order, etc.',
    `target_type` VARCHAR(120) DEFAULT NULL COMMENT 'user, product, order, etc.',
    `target_id` BIGINT UNSIGNED DEFAULT NULL,
    `old_values` JSON DEFAULT NULL,
    `new_values` JSON DEFAULT NULL,
    `ip_address` VARCHAR(45) DEFAULT NULL,
    `user_agent` VARCHAR(512) DEFAULT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_user_id (`user_id`),
    INDEX idx_action (`action`),
    INDEX idx_target_type (`target_type`),
    INDEX idx_created_at (`created_at`),
    CONSTRAINT fk_audit_user FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- System configuration
CREATE TABLE `system_config` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `config_key` VARCHAR(100) NOT NULL UNIQUE,
    `config_value` TEXT DEFAULT NULL,
    `description` VARCHAR(512) DEFAULT NULL,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_config_key (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
-- =====================================================
-- USEFUL VIEWS
-- =====================================================
 
-- View: Products with full details
CREATE VIEW `v_products_full` AS
SELECT
    p.id,
    p.product_id,
    p.title,
    p.slug,
    p.base_price,
    c.name AS category_name,
    c.slug AS category_slug,
    p.is_active,
    p.is_featured,
    COUNT(DISTINCT pv.id) AS variant_count,
    AVG(r.rating) AS avg_rating,
    COUNT(DISTINCT r.id) AS review_count
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
LEFT JOIN product_variants pv ON p.id = pv.product_id
LEFT JOIN reviews r ON p.id = r.product_id AND r.is_approved = 1
GROUP BY p.id;
 
-- View: Order summary
CREATE VIEW `v_orders_summary` AS
SELECT
    o.id,
    o.order_number,
    o.customer_email,
    CONCAT(o.customer_first_name, ' ', o.customer_last_name) AS customer_name,
    o.status,
    o.payment_status,
    o.total,
    o.placed_at,
    COUNT(oi.id) AS item_count,
    SUM(oi.quantity) AS total_quantity
FROM orders o
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id;
 
-- =====================================================
-- STORED PROCEDURES
-- =====================================================
 
DELIMITER //
 
-- Procedure: Get product with variants
CREATE PROCEDURE sp_get_product_with_variants(IN p_product_id VARCHAR(100))
BEGIN
    SELECT
        p.*,
        c.name AS category_name,
        c.slug AS category_slug
    FROM products p
    LEFT JOIN categories c ON p.category_id = c.id
    WHERE p.product_id = p_product_id;
   
    SELECT
        pv.*
    FROM product_variants pv
    INNER JOIN products p ON pv.product_id = p.id
    WHERE p.product_id = p_product_id;
END //
 
-- Procedure: Create order from cart
CREATE PROCEDURE sp_create_order_from_cart(
    IN p_user_id BIGINT UNSIGNED,
    IN p_cart_id BIGINT UNSIGNED,
    IN p_shipping_address_id BIGINT UNSIGNED,
    IN p_payment_method VARCHAR(50),
    OUT p_order_id BIGINT UNSIGNED
)
BEGIN
    DECLARE v_subtotal DECIMAL(12,2) DEFAULT 0.00;
    DECLARE v_order_number VARCHAR(50);
   
    -- Generate order number
    SET v_order_number = CONCAT('ORD-', DATE_FORMAT(NOW(), '%Y%m%d'), '-', LPAD(FLOOR(RAND() * 10000), 4, '0'));
   
    -- Calculate subtotal
    SELECT SUM((p.base_price + IFNULL(pv.price_delta, 0)) * ci.quantity)
    INTO v_subtotal
    FROM cart_items ci
    INNER JOIN products p ON ci.product_id = p.id
    LEFT JOIN product_variants pv ON ci.variant_id = pv.id
    WHERE ci.cart_id = p_cart_id;
   
    -- Create order
    INSERT INTO orders (
        order_number, user_id, customer_email, customer_first_name, customer_last_name,
        customer_middle_name, customer_phone, shipping_address_id, shipping_address,
        status, payment_method, subtotal, total, placed_at
    )
    SELECT
        v_order_number,
        p_user_id,
        u.email,
        u.first_name,
        u.last_name,
        u.middle_name,
        u.phone,
        p_shipping_address_id,
        CONCAT(a.address_line1, ', ', a.city, ', ', a.postal_code),
        'pending',
        p_payment_method,
        v_subtotal,
        v_subtotal,
        NOW()
    FROM users u
    LEFT JOIN addresses a ON a.id = p_shipping_address_id
    WHERE u.id = p_user_id;
   
    SET p_order_id = LAST_INSERT_ID();
   
    -- Create order items
    INSERT INTO order_items (
        order_id, product_id, variant_id, product_name, variant_label,
        unit_price, quantity, line_total
    )
    SELECT
        p_order_id,
        ci.product_id,
        ci.variant_id,
        p.title,
        pv.label,
        p.base_price + IFNULL(pv.price_delta, 0),
        ci.quantity,
        (p.base_price + IFNULL(pv.price_delta, 0)) * ci.quantity
    FROM cart_items ci
    INNER JOIN products p ON ci.product_id = p.id
    LEFT JOIN product_variants pv ON ci.variant_id = pv.id
    WHERE ci.cart_id = p_cart_id;
   
    -- Clear cart
    DELETE FROM cart_items WHERE cart_id = p_cart_id;
END //
 
DELIMITER ;
 
-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================
 
-- Additional composite indexes for common queries
CREATE INDEX idx_orders_user_status ON orders(user_id, status);
CREATE INDEX idx_products_category_active ON products(category_id, is_active);
CREATE INDEX idx_reviews_product_approved ON reviews(product_id, is_approved);
 
-- =====================================================
-- END OF SCHEMA
-- =====================================================