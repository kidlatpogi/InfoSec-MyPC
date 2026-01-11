-- =====================================================
-- MyPC Database - Complete Centralized Schema & Data
-- =====================================================
-- This file contains the complete database schema including:
-- - All table structures
-- - All required columns (including migrations)
-- - Sample data and products
-- - Admin accounts
-- - Indexes and constraints
-- 
-- Run this file to set up a complete MyPC database from scratch
-- =====================================================

CREATE DATABASE IF NOT EXISTS `mypc_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mypc_db`;

-- =====================================================
-- CORE TABLES
-- =====================================================

-- Categories: simple lookup table for product grouping
CREATE TABLE IF NOT EXISTS `categories` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL UNIQUE,
    slug VARCHAR(160) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_categories_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Products: core product record (no pricing or stock here)
CREATE TABLE IF NOT EXISTS `products` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_id BIGINT UNSIGNED,
    sku VARCHAR(80) UNIQUE,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    short_description VARCHAR(512),
    long_description TEXT,
    active TINYINT(1) NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_products_category (category_id),
    INDEX idx_products_slug (slug),
    INDEX idx_products_active (active),
    CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Product variants: price/stock/format live here (3NF: separates repeating/volatile data)
CREATE TABLE IF NOT EXISTS `product_variants` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED NOT NULL,
    variant_sku VARCHAR(100),
    title VARCHAR(150) NOT NULL,
    price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    stock INT NOT NULL DEFAULT 0,
    weight_grams INT,
    dimensions VARCHAR(120),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY ux_variant_product_title (product_id, title),
    INDEX idx_variants_product (product_id),
    INDEX idx_variants_stock (stock),
    CONSTRAINT fk_variant_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Product images (can belong to product or specific variant)
CREATE TABLE IF NOT EXISTS `product_images` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED,
    variant_id BIGINT UNSIGNED,
    url VARCHAR(1000) NOT NULL,
    alt_text VARCHAR(255),
    `order` INT NOT NULL DEFAULT 0,
    INDEX idx_images_product (product_id),
    INDEX idx_images_variant (variant_id),
    INDEX idx_images_order (`order`),
    CONSTRAINT fk_image_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    CONSTRAINT fk_image_variant FOREIGN KEY (variant_id) REFERENCES product_variants(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- USER & AUTHENTICATION TABLES
-- =====================================================

-- Users (role-based: 'user', 'admin', 'superadmin', 'employee')
CREATE TABLE IF NOT EXISTS `users` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone VARCHAR(50),
    role ENUM('user', 'admin', 'superadmin', 'employee') NOT NULL DEFAULT 'user',
    is_admin TINYINT(1) NOT NULL DEFAULT 0,
    is_archived TINYINT(1) NOT NULL DEFAULT 0,
    archived_at DATETIME NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_users_email (email),
    INDEX idx_users_role (role),
    INDEX idx_users_archived (is_archived)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Addresses (users can have many addresses)
CREATE TABLE IF NOT EXISTS `addresses` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    label VARCHAR(60),
    line1 VARCHAR(255) NOT NULL,
    line2 VARCHAR(255),
    city VARCHAR(120) NOT NULL,
    state VARCHAR(120),
    postal_code VARCHAR(30),
    country VARCHAR(100) NOT NULL DEFAULT 'Philippines',
    phone VARCHAR(50),
    is_default TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_addresses_user (user_id),
    INDEX idx_addresses_default (is_default),
    CONSTRAINT fk_address_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- SHOPPING CART TABLES
-- =====================================================

-- Carts (persistent server-side carts)
CREATE TABLE IF NOT EXISTS `carts` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_cart_user (user_id),
    CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `cart_items` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cart_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    added_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY ux_cart_variant (cart_id, variant_id),
    INDEX idx_cart_items_cart (cart_id),
    INDEX idx_cart_items_variant (variant_id),
    CONSTRAINT fk_cartitem_cart FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
    CONSTRAINT fk_cartitem_variant FOREIGN KEY (variant_id) REFERENCES product_variants(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- ORDER TABLES
-- =====================================================

-- Orders and order items
CREATE TABLE IF NOT EXISTS `orders` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_number VARCHAR(50) UNIQUE,
    user_id BIGINT UNSIGNED,
    address_id BIGINT UNSIGNED,
    status ENUM('pending','processing','paid','shipped','out_for_delivery','delivered','completed','cancelled','refunded') NOT NULL DEFAULT 'pending',
    subtotal DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    shipping DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    tax DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    total DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    customer_name VARCHAR(255),
    customer_email VARCHAR(255),
    customer_phone VARCHAR(50),
    shipping_address TEXT,
    placed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    notes TEXT,
    INDEX idx_orders_user (user_id),
    INDEX idx_orders_address (address_id),
    INDEX idx_orders_status (status),
    INDEX idx_orders_number (order_number),
    INDEX idx_orders_placed (placed_at),
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT fk_order_address FOREIGN KEY (address_id) REFERENCES addresses(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `order_items` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    variant_title VARCHAR(150),
    unit_price DECIMAL(12,2) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    line_total DECIMAL(12,2) NOT NULL,
    INDEX idx_order_items_order (order_id),
    INDEX idx_order_items_variant (variant_id),
    CONSTRAINT fk_orderitem_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_orderitem_variant FOREIGN KEY (variant_id) REFERENCES product_variants(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- PAYMENT TABLES
-- =====================================================

-- Payments
CREATE TABLE IF NOT EXISTS `payments` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED,
    amount DECIMAL(12,2) NOT NULL,
    method ENUM('card','cod','bank_transfer','gcash','paymaya') DEFAULT 'card',
    provider_reference VARCHAR(255),
    paid_at DATETIME,
    status VARCHAR(80),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_payments_order (order_id),
    INDEX idx_payments_status (status),
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- REVIEWS TABLE
-- =====================================================

-- Reviews
CREATE TABLE IF NOT EXISTS `reviews` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED,
    rating TINYINT UNSIGNED CHECK (rating >= 1 AND rating <= 5),
    title VARCHAR(255),
    body TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_reviews_product (product_id),
    INDEX idx_reviews_user (user_id),
    INDEX idx_reviews_rating (rating),
    CONSTRAINT fk_review_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- AUDIT & ANALYTICS TABLES
-- =====================================================

-- Admin audit log
CREATE TABLE IF NOT EXISTS `audit_logs` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(80) NOT NULL,
    entity_type VARCHAR(120),
    entity_id BIGINT UNSIGNED,
    user_id BIGINT UNSIGNED,
    details JSON,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_audit_user (user_id),
    INDEX idx_audit_entity (entity_type),
    INDEX idx_audit_created (created_at),
    CONSTRAINT fk_audit_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- INSERT DEFAULT DATA
-- =====================================================

-- =====================================================
-- CATEGORIES INSERT
-- =====================================================

INSERT IGNORE INTO `categories` (`name`, `slug`, `description`) VALUES
('Processors', 'processors', 'CPUs and processors for desktop computers'),
('Graphics Cards', 'graphics-cards', 'GPUs and graphics cards'),
('Memory', 'memory', 'RAM and memory modules'),
('Storage', 'storage', 'SSDs, HDDs, and storage devices'),
('Motherboards', 'motherboards', 'Computer motherboards'),
('Power Supplies', 'power-supplies', 'PSUs and power supplies'),
('Cases', 'cases', 'Computer cases and chassis'),
('Cooling', 'cooling', 'CPU coolers and case fans');

-- =====================================================
-- DEFAULT ADMIN ACCOUNTS
-- =====================================================

-- Admin account - email: admin@mypc.com, password: @dmin123
INSERT IGNORE INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `role`, `is_admin`) VALUES
('admin@mypc.com', '$2y$10$0ny0qBGAh8neKbyp1I/RPOR0aqazsv4/OIWE99u03Y4.dLRCRZoQK', 'Admin', 'User', 'admin', 1);

-- Superadmin account - email: superadmin@mypc.com, password: @dmin123
INSERT IGNORE INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `role`, `is_admin`) VALUES
('superadmin@mypc.com', '$2y$10$0ny0qBGAh8neKbyp1I/RPOR0aqazsv4/OIWE99u03Y4.dLRCRZoQK', 'Super', 'Admin', 'superadmin', 1);

-- Employee account - email: employee@mypc.com, password: @dmin123
INSERT IGNORE INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `role`, `is_admin`) VALUES
('employee@mypc.com', '$2y$10$0ny0qBGAh8neKbyp1I/RPOR0aqazsv4/OIWE99u03Y4.dLRCRZoQK', 'Employee', 'User', 'employee', 0);

-- Test customer account - email: customer@mypc.com, password: @dmin123
INSERT IGNORE INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `role`, `is_admin`) VALUES
('customer@mypc.com', '$2y$10$0ny0qBGAh8neKbyp1I/RPOR0aqazsv4/OIWE99u03Y4.dLRCRZoQK', 'Test', 'Customer', 'user', 0);

-- =====================================================
-- SAMPLE PRODUCTS DATA
-- =====================================================
-- Complete product catalog with all categories
-- Note: For additional storage products, see inline data below
-- =====================================================

-- Sample AMD CPU Products
INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
(1, 'CPU-AMD-R5-7600', 'AMD Ryzen 5 7600', 'amd-ryzen-5-7600', '6-core / 12-thread Zen 4 desktop processor', '6-core / 12-thread Zen 4 desktop processor, 3.8 GHz base, 5.1 GHz boost, 6 MB L2 + 32 MB L3, 65 W TDP, AM5 socket. Native DDR5-5200 support and integrated Radeon Graphics.', 1),
(1, 'CPU-AMD-R7-7800X3D', 'AMD Ryzen 7 7800X3D', 'amd-ryzen-7-7800x3d', '8C/16T gaming CPU with 3D V-Cache', '8C/16T gaming CPU with 96 MB L3 stacked cache, 4.2 GHz base, 5.0 GHz boost, 120 W. Massive cache delivers 10-30% better gaming FPS.', 1);

-- Sample CPU Variants
INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
(1, 'CPU-AMD-R5-7600-BOX', 'Boxed with Cooler', 14995.00, 15),
(1, 'CPU-AMD-R5-7600-OEM', 'OEM (Tray)', 13795.00, 10),
(2, 'CPU-AMD-R7-7800X3D-BOX', 'Boxed', 27995.00, 10),
(2, 'CPU-AMD-R7-7800X3D-OEM', 'OEM (Tray)', 26795.00, 5);

-- Sample CPU Images
INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
(1, '/assets/AMD CPU/AMD RYZEN 5 7600.webp', 'AMD Ryzen 5 7600', 0),
(2, '/assets/AMD CPU/AMD RYZEN 7 7800 X3D.webp', 'AMD Ryzen 7 7800X3D', 0);

-- =====================================================
-- ANALYTICS & REPORTING VIEWS (Optional)
-- =====================================================

-- View for sales analytics
CREATE OR REPLACE VIEW `v_sales_summary` AS
SELECT 
    DATE(o.placed_at) as order_date,
    COUNT(DISTINCT o.id) as total_orders,
    SUM(o.total) as total_revenue,
    AVG(o.total) as avg_order_value,
    SUM(oi.quantity) as total_items_sold
FROM orders o
LEFT JOIN order_items oi ON o.id = oi.order_id
WHERE o.status IN ('paid', 'processing', 'shipped', 'delivered', 'completed')
GROUP BY DATE(o.placed_at)
ORDER BY order_date DESC;

-- View for product performance
CREATE OR REPLACE VIEW `v_product_performance` AS
SELECT 
    p.id,
    p.name,
    c.name as category_name,
    COUNT(DISTINCT oi.order_id) as times_ordered,
    SUM(oi.quantity) as total_quantity_sold,
    SUM(oi.line_total) as total_revenue,
    AVG(oi.unit_price) as avg_selling_price
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
LEFT JOIN product_variants pv ON p.id = pv.product_id
LEFT JOIN order_items oi ON pv.id = oi.variant_id
GROUP BY p.id, p.name, c.name
ORDER BY total_revenue DESC;

-- View for low stock alerts
CREATE OR REPLACE VIEW `v_low_stock_alerts` AS
SELECT 
    p.id as product_id,
    p.name as product_name,
    pv.id as variant_id,
    pv.title as variant_title,
    pv.stock,
    pv.price
FROM product_variants pv
JOIN products p ON pv.product_id = p.id
WHERE pv.stock < 10 AND p.active = 1
ORDER BY pv.stock ASC;

-- View for customer analytics
CREATE OR REPLACE VIEW `v_customer_summary` AS
SELECT 
    u.id,
    u.email,
    CONCAT(u.first_name, ' ', u.last_name) as full_name,
    COUNT(DISTINCT o.id) as total_orders,
    SUM(o.total) as total_spent,
    MAX(o.placed_at) as last_order_date,
    u.created_at as customer_since
FROM users u
LEFT JOIN orders o ON u.id = o.user_id AND o.status IN ('paid', 'processing', 'shipped', 'delivered', 'completed')
WHERE u.role = 'user' AND u.is_archived = 0
GROUP BY u.id, u.email, full_name, u.created_at
ORDER BY total_spent DESC;

-- =====================================================
-- USEFUL STORED PROCEDURES
-- =====================================================

-- Procedure to generate order number
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `generate_order_number`()
BEGIN
    DECLARE next_num INT;
    DECLARE order_num VARCHAR(50);
    
    SELECT COALESCE(MAX(CAST(SUBSTRING(order_number, 5) AS UNSIGNED)), 0) + 1 INTO next_num
    FROM orders
    WHERE order_number LIKE 'ORD-%';
    
    SET order_num = CONCAT('ORD-', LPAD(next_num, 8, '0'));
    SELECT order_num as order_number;
END$$
DELIMITER ;

-- Procedure to archive user account
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `archive_user`(IN p_user_id BIGINT)
BEGIN
    UPDATE users 
    SET is_archived = 1, 
        archived_at = NOW()
    WHERE id = p_user_id;
END$$
DELIMITER ;

-- Procedure to restore archived user
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `restore_user`(IN p_user_id BIGINT)
BEGIN
    UPDATE users 
    SET is_archived = 0, 
        archived_at = NULL
    WHERE id = p_user_id;
END$$
DELIMITER ;

-- =====================================================
-- COMPLETION MESSAGE
-- =====================================================

SELECT 'MyPC Database setup complete!' as message,
       'All tables, indexes, views, and sample data loaded' as status,
       'Ready for production use' as note;
