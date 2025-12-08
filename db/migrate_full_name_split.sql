-- Migration: Split full_name into first_name and last_name
-- This migration updates the users table schema to use separate first_name and last_name columns
-- instead of a combined full_name column for better data consistency and frontend compatibility

USE mypc_db;

-- Add new columns if they don't exist
ALTER TABLE users 
ADD COLUMN first_name VARCHAR(255) AFTER password_hash,
ADD COLUMN last_name VARCHAR(255) AFTER first_name;

-- Migrate data from full_name to first_name and last_name
UPDATE users 
SET 
  first_name = SUBSTRING_INDEX(TRIM(COALESCE(full_name, '')), ' ', 1),
  last_name = TRIM(SUBSTR(TRIM(COALESCE(full_name, '')), LENGTH(SUBSTRING_INDEX(TRIM(COALESCE(full_name, '')), ' ', 1)) + 2))
WHERE full_name IS NOT NULL AND full_name != '';

-- For empty full_name, set defaults
UPDATE users
SET first_name = 'User', last_name = 'Account'
WHERE (first_name IS NULL OR first_name = '') 
  AND (last_name IS NULL OR last_name = '');

-- Drop the old full_name column (commented out for safety - uncomment after verifying data)
-- ALTER TABLE users DROP COLUMN full_name;

-- Verify the migration
SELECT id, email, first_name, last_name, role FROM users LIMIT 5;
