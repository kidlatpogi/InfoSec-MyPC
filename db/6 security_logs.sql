-- =====================================================
-- MyPC Database - Centralised Security Logs Table
-- =====================================================
-- Ref: Secure Coding Practices - Slide 127 (Logs Table Structure)
-- Ref: Slide 140 (logAction function)
-- Ref: Slide 151 (Log on every login / logout)
--
-- Purpose:
--   Single, append-only table that captures ALL critical
--   actions for BOTH regular users and admin/superadmin
--   accounts.  This complements the existing audit_trail
--   (admin-only) and login_attempts tables by providing
--   one unified view of security-relevant events.
--
-- Design principles:
--   • Append-only — no UPDATE / DELETE in application code.
--   • Minimal foreign-key coupling so logging never blocks
--     the parent transaction.
--   • Indexed for fast filtering by user, role, action,
--     IP address, and time range.
-- =====================================================

USE `mypc_db`;

-- =====================================================
-- 1. SECURITY_LOGS TABLE
-- =====================================================

CREATE TABLE IF NOT EXISTS `security_logs` (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,

    -- Who performed the action
    user_id    BIGINT UNSIGNED NULL          COMMENT 'FK to users.id (NULL for unauthenticated events)',
    role       VARCHAR(30)     NOT NULL      COMMENT 'Actor role at the time of the event (user, admin, superadmin, employee, guest)',

    -- What happened
    action     VARCHAR(80)     NOT NULL      COMMENT 'Short action label, e.g. LOGIN, LOGOUT, CREATE_USER, UPDATE_ORDER',
    details    TEXT            NULL          COMMENT 'Human-readable description or JSON context',

    -- Where / how
    ip_address VARCHAR(45)     NOT NULL DEFAULT 'unknown' COMMENT 'Client IP (supports IPv6)',
    user_agent VARCHAR(500)    NULL          COMMENT 'Truncated & sanitised User-Agent string',

    -- When
    created_at DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Indexes for common queries
    INDEX idx_seclog_user      (user_id),
    INDEX idx_seclog_role      (role),
    INDEX idx_seclog_action    (action),
    INDEX idx_seclog_ip        (ip_address),
    INDEX idx_seclog_created   (created_at),
    INDEX idx_seclog_user_time (user_id, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =====================================================
-- 2. READ-ONLY VIEW (recent 30 days)
-- =====================================================

CREATE OR REPLACE VIEW `v_security_logs_recent` AS
SELECT
    sl.id,
    sl.user_id,
    COALESCE(u.email, '[deleted / guest]') AS email,
    sl.role,
    sl.action,
    sl.details,
    sl.ip_address,
    sl.created_at
FROM security_logs sl
LEFT JOIN users u ON sl.user_id = u.id
WHERE sl.created_at > DATE_SUB(NOW(), INTERVAL 30 DAY)
ORDER BY sl.created_at DESC;

-- =====================================================
-- 3. COMPLETION MESSAGE
-- =====================================================

SELECT 'security_logs table created successfully!' AS message,
       'Run logAction() from PHP to write entries'  AS next_step;
