-- Add is_archived column to users table for soft delete functionality
-- Run this migration to enable account archiving instead of permanent deletion

ALTER TABLE users ADD COLUMN is_archived TINYINT(1) NOT NULL DEFAULT 0 AFTER is_admin;
ALTER TABLE users ADD COLUMN archived_at DATETIME NULL AFTER is_archived;

-- Create index for faster queries on archived status
CREATE INDEX idx_users_archived ON users(is_archived);
