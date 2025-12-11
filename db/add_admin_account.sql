-- Add admin account with email admin@mypc.com
-- Password: admin123

INSERT IGNORE INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `role`, `is_admin`) VALUES
('admin@mypc.com', '$2y$10$9ogJGajWf62VDgDyGm4i4e1r2lx0.UeI4wxff7u7ROnLlFTPbHgSS', 'Admin', '', 'admin', 1);
