-- =====================================================
-- MyPC Database - Security Updates Migration
-- =====================================================
-- This file adds:
-- 1. Separate admin_accounts table for admin/superadmin login
-- 2. Login attempts tracking with lockout mechanism
-- 3. Enhanced audit trail table (read-only by design)
-- =====================================================

USE `mypc_db`;

-- =====================================================
-- 1. ADMIN ACCOUNTS TABLE (Separate from users)
-- =====================================================
-- This table stores admin and superadmin credentials separately
-- from regular user accounts for enhanced security

CREATE TABLE IF NOT EXISTS `admin_accounts` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50),
    role ENUM('admin', 'superadmin') NOT NULL DEFAULT 'admin',
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    last_login DATETIME NULL,
    failed_login_attempts INT NOT NULL DEFAULT 0,
    locked_until DATETIME NULL,
    password_changed_at DATETIME NULL,
    created_by BIGINT UNSIGNED NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_admin_email (email),
    INDEX idx_admin_role (role),
    INDEX idx_admin_active (is_active),
    INDEX idx_admin_locked (locked_until)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 2. LOGIN ATTEMPTS TABLE (For lockout tracking)
-- =====================================================
-- Tracks failed login attempts for both users and admins
-- After 3 failed attempts, account is locked for 15 minutes

CREATE TABLE IF NOT EXISTS `login_attempts` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    account_type ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    ip_address VARCHAR(45) NOT NULL,
    user_agent TEXT,
    attempt_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    success TINYINT(1) NOT NULL DEFAULT 0,
    failure_reason VARCHAR(255),
    INDEX idx_login_email (email),
    INDEX idx_login_type (account_type),
    INDEX idx_login_ip (ip_address),
    INDEX idx_login_time (attempt_time),
    INDEX idx_login_email_time (email, attempt_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 3. ENHANCED AUDIT TRAIL TABLE
-- =====================================================
-- Comprehensive audit trail for admin and superadmin actions
-- This table is designed to be READ-ONLY (no updates/deletes allowed)
-- Viewable by admin and superadmin only

CREATE TABLE IF NOT EXISTS `audit_trail` (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    -- Actor information (who performed the action)
    actor_id BIGINT UNSIGNED NOT NULL,
    actor_email VARCHAR(255) NOT NULL,
    actor_role ENUM('admin', 'superadmin') NOT NULL,
    actor_ip VARCHAR(45),
    actor_user_agent TEXT,
    
    -- Action information
    action_type ENUM(
        'LOGIN', 'LOGOUT', 'LOGIN_FAILED', 'ACCOUNT_LOCKED',
        'CREATE', 'UPDATE', 'DELETE', 'ARCHIVE', 'RESTORE',
        'VIEW', 'EXPORT', 'IMPORT',
        'PASSWORD_CHANGE', 'PASSWORD_RESET',
        'PERMISSION_CHANGE', 'ROLE_CHANGE',
        'SYSTEM_CONFIG', 'SECURITY_EVENT'
    ) NOT NULL,
    action_category ENUM(
        'AUTHENTICATION', 'USER_MANAGEMENT', 'ADMIN_MANAGEMENT',
        'PRODUCT_MANAGEMENT', 'ORDER_MANAGEMENT', 'EMPLOYEE_MANAGEMENT',
        'SYSTEM', 'SECURITY'
    ) NOT NULL,
    
    -- Target information (what was affected)
    target_type VARCHAR(100),
    target_id BIGINT UNSIGNED,
    target_identifier VARCHAR(255),
    
    -- Change details
    old_values JSON,
    new_values JSON,
    description TEXT NOT NULL,
    
    -- Metadata
    session_id VARCHAR(255),
    request_uri VARCHAR(500),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    -- Indexes for fast querying
    INDEX idx_audit_actor (actor_id),
    INDEX idx_audit_actor_email (actor_email),
    INDEX idx_audit_role (actor_role),
    INDEX idx_audit_action (action_type),
    INDEX idx_audit_category (action_category),
    INDEX idx_audit_target (target_type, target_id),
    INDEX idx_audit_created (created_at),
    INDEX idx_audit_ip (actor_ip)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 4. MIGRATE EXISTING ADMINS TO NEW TABLE
-- =====================================================
-- Copy existing admin/superadmin accounts from users table

INSERT IGNORE INTO `admin_accounts` (email, password_hash, first_name, last_name, phone, role, is_active, created_at)
SELECT 
    email, 
    password_hash, 
    first_name, 
    last_name, 
    phone, 
    role,
    CASE WHEN is_archived = 1 THEN 0 ELSE 1 END as is_active,
    created_at
FROM `users` 
WHERE role IN ('admin', 'superadmin');

-- =====================================================
-- 5. DEFAULT ADMIN ACCOUNTS (if not migrated)
-- =====================================================
-- Ensure we have at least one superadmin account
-- Password: @dmin123

INSERT IGNORE INTO `admin_accounts` (`email`, `password_hash`, `first_name`, `last_name`, `role`, `is_active`) VALUES
('superadmin@mypc.com', '$2y$10$0ny0qBGAh8neKbyp1I/RPOR0aqazsv4/OIWE99u03Y4.dLRCRZoQK', 'Super', 'Admin', 'superadmin', 1),
('admin@mypc.com', '$2y$10$0ny0qBGAh8neKbyp1I/RPOR0aqazsv4/OIWE99u03Y4.dLRCRZoQK', 'Admin', 'User', 'admin', 1);

-- =====================================================
-- 6. STORED PROCEDURES FOR AUDIT TRAIL
-- =====================================================

-- Procedure to log audit trail entry (ensures consistent logging)
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `log_audit_trail`(
    IN p_actor_id BIGINT,
    IN p_actor_email VARCHAR(255),
    IN p_actor_role VARCHAR(20),
    IN p_actor_ip VARCHAR(45),
    IN p_actor_user_agent TEXT,
    IN p_action_type VARCHAR(50),
    IN p_action_category VARCHAR(50),
    IN p_target_type VARCHAR(100),
    IN p_target_id BIGINT,
    IN p_target_identifier VARCHAR(255),
    IN p_old_values JSON,
    IN p_new_values JSON,
    IN p_description TEXT,
    IN p_session_id VARCHAR(255),
    IN p_request_uri VARCHAR(500)
)
BEGIN
    INSERT INTO `audit_trail` (
        actor_id, actor_email, actor_role, actor_ip, actor_user_agent,
        action_type, action_category,
        target_type, target_id, target_identifier,
        old_values, new_values, description,
        session_id, request_uri
    ) VALUES (
        p_actor_id, p_actor_email, p_actor_role, p_actor_ip, p_actor_user_agent,
        p_action_type, p_action_category,
        p_target_type, p_target_id, p_target_identifier,
        p_old_values, p_new_values, p_description,
        p_session_id, p_request_uri
    );
END$$
DELIMITER ;

-- Procedure to check and handle login lockout
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `check_login_lockout`(
    IN p_email VARCHAR(255),
    IN p_account_type VARCHAR(10),
    OUT p_is_locked TINYINT,
    OUT p_lock_remaining_seconds INT,
    OUT p_failed_attempts INT
)
BEGIN
    DECLARE v_locked_until DATETIME;
    DECLARE v_attempts INT;
    
    -- Count failed attempts in last 15 minutes
    SELECT COUNT(*) INTO v_attempts
    FROM `login_attempts`
    WHERE email = p_email 
      AND account_type = p_account_type
      AND success = 0
      AND attempt_time > DATE_SUB(NOW(), INTERVAL 15 MINUTE);
    
    SET p_failed_attempts = v_attempts;
    
    -- Check if locked (3 or more failed attempts)
    IF v_attempts >= 3 THEN
        -- Get the latest failed attempt time
        SELECT MAX(attempt_time) INTO v_locked_until
        FROM `login_attempts`
        WHERE email = p_email 
          AND account_type = p_account_type
          AND success = 0
          AND attempt_time > DATE_SUB(NOW(), INTERVAL 15 MINUTE);
        
        -- Lock expires 15 minutes after the 3rd failed attempt
        SET v_locked_until = DATE_ADD(v_locked_until, INTERVAL 15 MINUTE);
        
        IF NOW() < v_locked_until THEN
            SET p_is_locked = 1;
            SET p_lock_remaining_seconds = TIMESTAMPDIFF(SECOND, NOW(), v_locked_until);
        ELSE
            SET p_is_locked = 0;
            SET p_lock_remaining_seconds = 0;
        END IF;
    ELSE
        SET p_is_locked = 0;
        SET p_lock_remaining_seconds = 0;
    END IF;
END$$
DELIMITER ;

-- Procedure to record login attempt
DELIMITER $$
CREATE PROCEDURE IF NOT EXISTS `record_login_attempt`(
    IN p_email VARCHAR(255),
    IN p_account_type VARCHAR(10),
    IN p_ip_address VARCHAR(45),
    IN p_user_agent TEXT,
    IN p_success TINYINT,
    IN p_failure_reason VARCHAR(255)
)
BEGIN
    INSERT INTO `login_attempts` (
        email, account_type, ip_address, user_agent, success, failure_reason
    ) VALUES (
        p_email, p_account_type, p_ip_address, p_user_agent, p_success, p_failure_reason
    );
    
    -- If successful login, clear old failed attempts for this email
    IF p_success = 1 THEN
        DELETE FROM `login_attempts` 
        WHERE email = p_email 
          AND account_type = p_account_type
          AND success = 0
          AND attempt_time < DATE_SUB(NOW(), INTERVAL 15 MINUTE);
    END IF;
END$$
DELIMITER ;

-- =====================================================
-- 7. VIEWS FOR AUDIT TRAIL (READ-ONLY ACCESS)
-- =====================================================

-- View for recent audit trail (last 30 days)
CREATE OR REPLACE VIEW `v_audit_trail_recent` AS
SELECT 
    id,
    actor_id,
    actor_email,
    actor_role,
    actor_ip,
    action_type,
    action_category,
    target_type,
    target_id,
    target_identifier,
    description,
    created_at
FROM audit_trail
WHERE created_at > DATE_SUB(NOW(), INTERVAL 30 DAY)
ORDER BY created_at DESC;

-- View for login history
CREATE OR REPLACE VIEW `v_login_history` AS
SELECT 
    la.id,
    la.email,
    la.account_type,
    la.ip_address,
    la.attempt_time,
    la.success,
    la.failure_reason,
    CASE 
        WHEN la.success = 1 THEN 'Success'
        ELSE 'Failed'
    END as status
FROM login_attempts la
ORDER BY la.attempt_time DESC;

-- View for locked accounts
CREATE OR REPLACE VIEW `v_locked_accounts` AS
SELECT 
    email,
    account_type,
    COUNT(*) as failed_attempts,
    MAX(attempt_time) as last_attempt,
    DATE_ADD(MAX(attempt_time), INTERVAL 15 MINUTE) as locked_until
FROM login_attempts
WHERE success = 0
  AND attempt_time > DATE_SUB(NOW(), INTERVAL 15 MINUTE)
GROUP BY email, account_type
HAVING COUNT(*) >= 3;

-- =====================================================
-- 8. COMPREHENSIVE AUTHENTICATION ACTIVITY VIEW
-- =====================================================
-- This view combines both login_attempts and audit_trail data
-- to provide a complete picture of all authentication activities

CREATE OR REPLACE VIEW `v_authentication_activity` AS
SELECT * FROM (
    -- Admin authentication events from audit_trail
    SELECT 
        at.id,
        at.actor_email as email,
        'admin' as account_type,
        at.actor_role as role,
        at.action_type as event_type,
        CASE 
            WHEN at.action_type = 'LOGIN' THEN 'Login Success'
            WHEN at.action_type = 'LOGOUT' THEN 'Logout'
            WHEN at.action_type = 'LOGIN_FAILED' THEN 'Login Failed'
            WHEN at.action_type = 'ACCOUNT_LOCKED' THEN 'Account Locked'
            ELSE at.action_type
        END as event_description,
        at.actor_ip as ip_address,
        at.created_at as event_time,
        'audit_trail' as source
    FROM audit_trail at
    WHERE at.action_category = 'AUTHENTICATION'

    UNION ALL

    -- All login attempts from login_attempts table (both user and admin)
    SELECT 
        la.id,
        la.email,
        la.account_type,
        CASE 
            WHEN la.account_type = 'admin' THEN 'admin'
            ELSE 'user'
        END as role,
        CASE 
            WHEN la.success = 1 AND la.failure_reason = 'Logout' THEN 'LOGOUT'
            WHEN la.success = 1 THEN 'LOGIN'
            WHEN la.failure_reason LIKE '%locked%' THEN 'ACCOUNT_LOCKED'
            ELSE 'LOGIN_FAILED'
        END as event_type,
        CASE 
            WHEN la.success = 1 AND la.failure_reason = 'Logout' THEN 'Logout'
            WHEN la.success = 1 THEN 'Login Success'
            WHEN la.failure_reason LIKE '%locked%' THEN CONCAT('Account Locked - ', la.failure_reason)
            ELSE CONCAT('Login Failed - ', COALESCE(la.failure_reason, 'Unknown reason'))
        END as event_description,
        la.ip_address,
        la.attempt_time as event_time,
        'login_attempts' as source
    FROM login_attempts la
) combined_auth
ORDER BY event_time DESC;

-- View for recent authentication activity (last 7 days)
CREATE OR REPLACE VIEW `v_recent_auth_activity` AS
SELECT * FROM v_authentication_activity
WHERE event_time > DATE_SUB(NOW(), INTERVAL 7 DAY)
ORDER BY event_time DESC;

-- View for failed authentication attempts only
CREATE OR REPLACE VIEW `v_failed_auth_attempts` AS
SELECT * FROM v_authentication_activity
WHERE event_type IN ('LOGIN_FAILED', 'ACCOUNT_LOCKED')
ORDER BY event_time DESC;

-- =====================================================
-- COMPLETION MESSAGE
-- =====================================================

SELECT 'Security updates applied successfully!' as message,
       'Tables created: admin_accounts, login_attempts, audit_trail' as tables_added,
       'Views created: v_authentication_activity, v_recent_auth_activity, v_failed_auth_attempts' as views_added,
       'Existing admins migrated to new table' as migration_status;
