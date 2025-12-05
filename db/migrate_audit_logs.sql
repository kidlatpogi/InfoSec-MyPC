-- Migration: Create audit_logs table if it doesn't exist
-- This script adds the audit_logs table to support audit trail functionality

CREATE TABLE IF NOT EXISTS `audit_logs` (
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

-- Drop old admin_audit table if it exists (optional, keeping for safety)
-- DROP TABLE IF EXISTS `admin_audit`;
