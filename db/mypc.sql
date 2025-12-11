
CREATE DATABASE IF NOT EXISTS `mypc_db` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mypc_db`;

-- Categories: simple lookup table for product grouping
CREATE TABLE IF NOT EXISTS categories (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL UNIQUE,
    slug VARCHAR(160) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Products: core product record (no pricing or stock here)
CREATE TABLE IF NOT EXISTS products (
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
    INDEX (category_id),
    CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Product variants: price/stock/format live here (3NF: separates repeating/volatile data)
CREATE TABLE IF NOT EXISTS product_variants (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED NOT NULL,
    variant_sku VARCHAR(100),
    title VARCHAR(150) NOT NULL, -- e.g. "Boxed", "Reference", "8GB"
    price DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    stock INT NOT NULL DEFAULT 0,
    weight_grams INT,
    dimensions VARCHAR(120),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY ux_variant_product_title (product_id, title),
    INDEX (product_id),
    CONSTRAINT fk_variant_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Product images (can belong to product or specific variant)
CREATE TABLE IF NOT EXISTS product_images (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED,
    variant_id BIGINT UNSIGNED,
    url VARCHAR(1000) NOT NULL,
    alt_text VARCHAR(255),
    `order` INT NOT NULL DEFAULT 0,
    INDEX (product_id),
    INDEX (variant_id),
    CONSTRAINT fk_image_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    CONSTRAINT fk_image_variant FOREIGN KEY (variant_id) REFERENCES product_variants(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Users (role-based: 'user', 'admin', 'superadmin', 'employee')
CREATE TABLE IF NOT EXISTS users (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone VARCHAR(50),
    role ENUM('user', 'admin', 'superadmin', 'employee') NOT NULL DEFAULT 'user',
    is_admin TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Addresses (users can have many addresses)
CREATE TABLE IF NOT EXISTS addresses (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    label VARCHAR(60), -- Home, Office
    line1 VARCHAR(255) NOT NULL,
    line2 VARCHAR(255),
    city VARCHAR(120) NOT NULL,
    state VARCHAR(120),
    postal_code VARCHAR(30),
    country VARCHAR(100) NOT NULL DEFAULT 'Philippines',
    phone VARCHAR(50),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (user_id),
    CONSTRAINT fk_address_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Carts (persistent server-side carts)
CREATE TABLE IF NOT EXISTS carts (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED, -- nullable for guest carts
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX (user_id),
    CONSTRAINT fk_cart_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS cart_items (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cart_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    added_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY ux_cart_variant (cart_id, variant_id),
    INDEX (cart_id),
    INDEX (variant_id),
    CONSTRAINT fk_cartitem_cart FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
    CONSTRAINT fk_cartitem_variant FOREIGN KEY (variant_id) REFERENCES product_variants(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Orders and order items
CREATE TABLE IF NOT EXISTS orders (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    address_id BIGINT UNSIGNED,
    status ENUM('pending','processing','paid','shipped','completed','cancelled','refunded') NOT NULL DEFAULT 'pending',
    subtotal DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    shipping DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    tax DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    total DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    placed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    notes TEXT,
    INDEX (user_id),
    INDEX (address_id),
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    CONSTRAINT fk_order_address FOREIGN KEY (address_id) REFERENCES addresses(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS order_items (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    variant_id BIGINT UNSIGNED NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    variant_title VARCHAR(150),
    unit_price DECIMAL(12,2) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    line_total DECIMAL(12,2) NOT NULL,
    INDEX (order_id),
    INDEX (variant_id),
    CONSTRAINT fk_orderitem_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_orderitem_variant FOREIGN KEY (variant_id) REFERENCES product_variants(id) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Payments
CREATE TABLE IF NOT EXISTS payments (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED,
    amount DECIMAL(12,2) NOT NULL,
    method ENUM('card','cod','bank_transfer','gcash','paymaya') DEFAULT 'card',
    provider_reference VARCHAR(255),
    paid_at DATETIME,
    status VARCHAR(80),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (order_id),
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Reviews
CREATE TABLE IF NOT EXISTS reviews (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED,
    rating TINYINT UNSIGNED CHECK (rating >= 1 AND rating <= 5),
    title VARCHAR(255),
    body TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (product_id),
    INDEX (user_id),
    CONSTRAINT fk_review_product FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Admin audit log
CREATE TABLE IF NOT EXISTS audit_logs (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(80) NOT NULL,
    entity_type VARCHAR(120),
    entity_id BIGINT UNSIGNED,
    user_id BIGINT UNSIGNED,
    details JSON,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX (user_id),
    INDEX (entity_type),
    INDEX (created_at),
    CONSTRAINT fk_audit_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Useful indexes
CREATE INDEX idx_products_category ON products (category_id);
CREATE INDEX idx_variants_product ON product_variants (product_id);
CREATE INDEX idx_cart_user ON carts (user_id);
CREATE INDEX idx_orders_user ON orders (user_id);
CREATE INDEX idx_order_items_order ON order_items (order_id);
CREATE INDEX idx_reviews_product ON reviews (product_id);