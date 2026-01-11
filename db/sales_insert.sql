-- =====================================================
-- MyPC Database - Sales Data (Orders & Order Items)
-- =====================================================
-- Generated: 2026-01-11 10:03:20
-- Contains 450 orders (300 from 2025, 150 from 2026)
-- Run this after mypc_complete.sql and users_insert.sql
-- =====================================================

USE mypc_db;

-- =====================================================
-- INSERT ORDERS
-- =====================================================

INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000001', u.id, 'cancelled', 75990.00, 0.00, 9118.80, 85108.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-03 20:53:00', '2025-07-03 20:53:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000002', u.id, 'completed', 53785.00, 0.00, 6454.20, 60239.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-04-10 01:32:00', '2025-04-10 01:32:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000003', u.id, 'completed', 37995.00, 0.00, 4559.40, 42554.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-03-10 11:01:00', '2025-03-10 11:01:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000004', u.id, 'completed', 62780.00, 0.00, 7533.60, 70313.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-13 05:56:00', '2025-12-13 05:56:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000005', u.id, 'completed', 54685.00, 0.00, 6562.20, 61247.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-21 12:54:00', '2025-04-21 12:54:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000006', u.id, 'completed', 124365.00, 0.00, 14923.80, 139288.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-12-17 17:30:00', '2025-12-17 17:30:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000007', u.id, 'completed', 63590.00, 0.00, 7630.80, 71220.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-08-11 02:53:00', '2025-08-11 02:53:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000008', u.id, 'completed', 19495.00, 0.00, 2339.40, 21834.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-01 10:46:00', '2025-06-01 10:46:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000009', u.id, 'completed', 45990.00, 0.00, 5518.80, 51508.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-12-11 03:48:00', '2025-12-11 03:48:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000010', u.id, 'completed', 91175.00, 0.00, 10941.00, 102116.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-14 00:05:00', '2025-06-14 00:05:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000011', u.id, 'completed', 77785.00, 0.00, 9334.20, 87119.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-03 17:02:00', '2025-11-03 17:02:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000012', u.id, 'completed', 118175.00, 0.00, 14181.00, 132356.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-08 12:10:00', '2025-05-08 12:10:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000013', u.id, 'completed', 54185.00, 0.00, 6502.20, 60687.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-08 13:34:00', '2025-01-08 13:34:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000014', u.id, 'completed', 120380.00, 0.00, 14445.60, 134825.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-11-21 16:39:00', '2025-11-21 16:39:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000015', u.id, 'completed', 72385.00, 0.00, 8686.20, 81071.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-17 08:31:00', '2025-10-17 08:31:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000016', u.id, 'completed', 76980.00, 0.00, 9237.60, 86217.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-04-30 20:09:00', '2025-04-30 20:09:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000017', u.id, 'completed', 34690.00, 0.00, 4162.80, 38852.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-30 19:55:00', '2025-12-30 19:55:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000018', u.id, 'completed', 24195.00, 0.00, 2903.40, 27098.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-27 13:32:00', '2025-04-27 13:32:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000019', u.id, 'completed', 26795.00, 0.00, 3215.40, 30010.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-04 05:02:00', '2025-01-04 05:02:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000020', u.id, 'completed', 213765.00, 0.00, 25651.80, 239416.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-09-01 07:43:00', '2025-09-01 07:43:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000021', u.id, 'cancelled', 45990.00, 0.00, 5518.80, 51508.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-15 00:17:00', '2025-01-15 00:17:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000022', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-13 12:34:00', '2025-05-13 12:34:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000023', u.id, 'completed', 79980.00, 0.00, 9597.60, 89577.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-20 12:41:00', '2025-06-20 12:41:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000024', u.id, 'completed', 15495.00, 0.00, 1859.40, 17354.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-04-30 10:09:00', '2025-04-30 10:09:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000025', u.id, 'completed', 165575.00, 0.00, 19869.00, 185444.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-03 20:00:00', '2025-05-03 20:00:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000026', u.id, 'completed', 147170.00, 0.00, 17660.40, 164830.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-21 08:52:00', '2025-03-21 08:52:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000027', u.id, 'completed', 119175.00, 0.00, 14301.00, 133476.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-17 23:05:00', '2025-08-17 23:05:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000028', u.id, 'completed', 75990.00, 0.00, 9118.80, 85108.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-12 07:36:00', '2025-10-12 07:36:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000029', u.id, 'completed', 151075.00, 0.00, 18129.00, 169204.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-07-01 19:46:00', '2025-07-01 19:46:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000030', u.id, 'completed', 60785.00, 0.00, 7294.20, 68079.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-04 01:05:00', '2025-03-04 01:05:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000031', u.id, 'completed', 245765.00, 0.00, 29491.80, 275256.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-03 05:19:00', '2025-12-03 05:19:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000032', u.id, 'completed', 128965.00, 0.00, 15475.80, 144440.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-03-22 04:40:00', '2025-03-22 04:40:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000033', u.id, 'completed', 214575.00, 0.00, 25749.00, 240324.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-04-18 22:00:00', '2025-04-18 22:00:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000034', u.id, 'cancelled', 18495.00, 0.00, 2219.40, 20714.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-16 06:52:00', '2025-06-16 06:52:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000035', u.id, 'completed', 143570.00, 0.00, 17228.40, 160798.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-24 22:06:00', '2025-12-24 22:06:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000036', u.id, 'completed', 94285.00, 0.00, 11314.20, 105599.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-07-25 04:46:00', '2025-07-25 04:46:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000037', u.id, 'completed', 63185.00, 0.00, 7582.20, 70767.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-30 08:13:00', '2025-09-30 08:13:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000038', u.id, 'completed', 125570.00, 0.00, 15068.40, 140638.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-09-08 07:11:00', '2025-09-08 07:11:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000039', u.id, 'completed', 28990.00, 0.00, 3478.80, 32468.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-08-16 18:00:00', '2025-08-16 18:00:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000040', u.id, 'cancelled', 207170.00, 0.00, 24860.40, 232030.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-04-06 03:06:00', '2025-04-06 03:06:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000041', u.id, 'completed', 88985.00, 0.00, 10678.20, 99663.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-07 05:32:00', '2025-08-07 05:32:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000042', u.id, 'completed', 63080.00, 0.00, 7569.60, 70649.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-28 06:57:00', '2025-05-28 06:57:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000043', u.id, 'completed', 176370.00, 0.00, 21164.40, 197534.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-01-30 21:35:00', '2025-01-30 21:35:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000044', u.id, 'completed', 70185.00, 0.00, 8422.20, 78607.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-12-17 03:31:00', '2025-12-17 03:31:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000045', u.id, 'completed', 64180.00, 0.00, 7701.60, 71881.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-01-19 08:44:00', '2025-01-19 08:44:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000046', u.id, 'completed', 129575.00, 0.00, 15549.00, 145124.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-10-07 03:08:00', '2025-10-07 03:08:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000047', u.id, 'completed', 167075.00, 0.00, 20049.00, 187124.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-11 22:29:00', '2025-06-11 22:29:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000048', u.id, 'cancelled', 131675.00, 0.00, 15801.00, 147476.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-30 05:37:00', '2025-04-30 05:37:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000049', u.id, 'completed', 99275.00, 0.00, 11913.00, 111188.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-10-01 18:41:00', '2025-10-01 18:41:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000050', u.id, 'completed', 92075.00, 0.00, 11049.00, 103124.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-03-04 10:21:00', '2025-03-04 10:21:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000051', u.id, 'completed', 16995.00, 0.00, 2039.40, 19034.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-01-14 13:35:00', '2025-01-14 13:35:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000052', u.id, 'completed', 153580.00, 0.00, 18429.60, 172009.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-14 02:13:00', '2025-06-14 02:13:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000053', u.id, 'cancelled', 49995.00, 0.00, 5999.40, 55994.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-04 07:16:00', '2025-12-04 07:16:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000054', u.id, 'completed', 113085.00, 0.00, 13570.20, 126655.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-15 11:54:00', '2025-07-15 11:54:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000055', u.id, 'cancelled', 180775.00, 0.00, 21693.00, 202468.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-18 04:21:00', '2025-04-18 04:21:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000056', u.id, 'completed', 165170.00, 0.00, 19820.40, 184990.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-25 13:41:00', '2025-11-25 13:41:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000057', u.id, 'completed', 62385.00, 0.00, 7486.20, 69871.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-11-06 19:55:00', '2025-11-06 19:55:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000058', u.id, 'completed', 83590.00, 0.00, 10030.80, 93620.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-10 03:56:00', '2025-12-10 03:56:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000059', u.id, 'cancelled', 118775.00, 0.00, 14253.00, 133028.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-02-24 18:24:00', '2025-02-24 18:24:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000060', u.id, 'completed', 185575.00, 0.00, 22269.00, 207844.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-12-19 10:04:00', '2025-12-19 10:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000061', u.id, 'completed', 79385.00, 0.00, 9526.20, 88911.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-01-01 05:54:00', '2025-01-01 05:54:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000062', u.id, 'completed', 133475.00, 0.00, 16017.00, 149492.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-09-15 06:25:00', '2025-09-15 06:25:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000063', u.id, 'completed', 121980.00, 0.00, 14637.60, 136617.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-03-23 20:13:00', '2025-03-23 20:13:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000064', u.id, 'completed', 67980.00, 0.00, 8157.60, 76137.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-10-17 12:32:00', '2025-10-17 12:32:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000065', u.id, 'completed', 17495.00, 0.00, 2099.40, 19594.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-18 23:36:00', '2025-07-18 23:36:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000066', u.id, 'cancelled', 99990.00, 0.00, 11998.80, 111988.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-29 21:41:00', '2025-12-29 21:41:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000067', u.id, 'cancelled', 243165.00, 0.00, 29179.80, 272344.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-11 19:15:00', '2025-06-11 19:15:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000068', u.id, 'completed', 93275.00, 0.00, 11193.00, 104468.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-28 00:04:00', '2025-11-28 00:04:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000069', u.id, 'completed', 30590.00, 0.00, 3670.80, 34260.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-01 16:16:00', '2025-04-01 16:16:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000070', u.id, 'completed', 36795.00, 0.00, 4415.40, 41210.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-08 15:36:00', '2025-12-08 15:36:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000071', u.id, 'completed', 84985.00, 0.00, 10198.20, 95183.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-05-06 09:31:00', '2025-05-06 09:31:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000072', u.id, 'completed', 111870.00, 0.00, 13424.40, 125294.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-12-26 15:38:00', '2025-12-26 15:38:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000073', u.id, 'completed', 54585.00, 0.00, 6550.20, 61135.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-07-24 17:12:00', '2025-07-24 17:12:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000074', u.id, 'completed', 26795.00, 0.00, 3215.40, 30010.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-01-08 11:24:00', '2025-01-08 11:24:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000075', u.id, 'completed', 177375.00, 0.00, 21285.00, 198660.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-30 08:46:00', '2025-11-30 08:46:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000076', u.id, 'completed', 120880.00, 0.00, 14505.60, 135385.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-10-22 13:52:00', '2025-10-22 13:52:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000077', u.id, 'completed', 220765.00, 0.00, 26491.80, 247256.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-14 22:24:00', '2025-06-14 22:24:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000078', u.id, 'completed', 154380.00, 0.00, 18525.60, 172905.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-21 11:50:00', '2025-08-21 11:50:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000079', u.id, 'completed', 27995.00, 0.00, 3359.40, 31354.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-02-07 01:43:00', '2025-02-07 01:43:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000080', u.id, 'completed', 105275.00, 0.00, 12633.00, 117908.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-25 04:14:00', '2025-12-25 04:14:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000081', u.id, 'cancelled', 118675.00, 0.00, 14241.00, 132916.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-02 06:53:00', '2025-05-02 06:53:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000082', u.id, 'completed', 33990.00, 0.00, 4078.80, 38068.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-13 12:53:00', '2025-02-13 12:53:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000083', u.id, 'completed', 198070.00, 0.00, 23768.40, 221838.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-12 17:34:00', '2025-02-12 17:34:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000084', u.id, 'completed', 82680.00, 0.00, 9921.60, 92601.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-12-17 18:42:00', '2025-12-17 18:42:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000085', u.id, 'completed', 90780.00, 0.00, 10893.60, 101673.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-29 22:40:00', '2025-05-29 22:40:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000086', u.id, 'completed', 98375.00, 0.00, 11805.00, 110180.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-01-31 10:04:00', '2025-01-31 10:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000087', u.id, 'completed', 53985.00, 0.00, 6478.20, 60463.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-08-03 09:03:00', '2025-08-03 09:03:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000088', u.id, 'cancelled', 79385.00, 0.00, 9526.20, 88911.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-24 23:44:00', '2025-06-24 23:44:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000089', u.id, 'completed', 45585.00, 0.00, 5470.20, 51055.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-09-27 00:09:00', '2025-09-27 00:09:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000090', u.id, 'completed', 31990.00, 0.00, 3838.80, 35828.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-01-03 21:24:00', '2025-01-03 21:24:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000091', u.id, 'cancelled', 105375.00, 0.00, 12645.00, 118020.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-10-29 01:01:00', '2025-10-29 01:01:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000092', u.id, 'completed', 53590.00, 0.00, 6430.80, 60020.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-16 11:05:00', '2025-06-16 11:05:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000093', u.id, 'completed', 116975.00, 0.00, 14037.00, 131012.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-20 13:13:00', '2025-06-20 13:13:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000094', u.id, 'completed', 98985.00, 0.00, 11878.20, 110863.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-27 16:42:00', '2025-07-27 16:42:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000095', u.id, 'completed', 137180.00, 0.00, 16461.60, 153641.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-20 21:10:00', '2025-06-20 21:10:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000096', u.id, 'completed', 137170.00, 0.00, 16460.40, 153630.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-08-30 21:15:00', '2025-08-30 21:15:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000097', u.id, 'completed', 80275.00, 0.00, 9633.00, 89908.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-10-27 21:23:00', '2025-10-27 21:23:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000098', u.id, 'completed', 82785.00, 0.00, 9934.20, 92719.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-09-22 09:18:00', '2025-09-22 09:18:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000099', u.id, 'cancelled', 39390.00, 0.00, 4726.80, 44116.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-03-16 07:02:00', '2025-03-16 07:02:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000100', u.id, 'completed', 99180.00, 0.00, 11901.60, 111081.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-14 11:41:00', '2025-05-14 11:41:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000101', u.id, 'completed', 223560.00, 0.00, 26827.20, 250387.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-03 15:10:00', '2025-10-03 15:10:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000102', u.id, 'completed', 104170.00, 0.00, 12500.40, 116670.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-05 12:23:00', '2025-06-05 12:23:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000103', u.id, 'completed', 49995.00, 0.00, 5999.40, 55994.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-05-01 10:07:00', '2025-05-01 10:07:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000104', u.id, 'completed', 130785.00, 0.00, 15694.20, 146479.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-15 02:44:00', '2025-11-15 02:44:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000105', u.id, 'completed', 108085.00, 0.00, 12970.20, 121055.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-08-16 12:52:00', '2025-08-16 12:52:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000106', u.id, 'completed', 71485.00, 0.00, 8578.20, 80063.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-11 07:08:00', '2025-12-11 07:08:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000107', u.id, 'completed', 160965.00, 0.00, 19315.80, 180280.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-04-21 20:14:00', '2025-04-21 20:14:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000108', u.id, 'completed', 187765.00, 0.00, 22531.80, 210296.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-23 09:07:00', '2025-10-23 09:07:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000109', u.id, 'cancelled', 153665.00, 0.00, 18439.80, 172104.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-26 16:17:00', '2025-03-26 16:17:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000110', u.id, 'completed', 81585.00, 0.00, 9790.20, 91375.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-03-20 15:33:00', '2025-03-20 15:33:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000111', u.id, 'completed', 31990.00, 0.00, 3838.80, 35828.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-18 15:40:00', '2025-04-18 15:40:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000112', u.id, 'completed', 149565.00, 0.00, 17947.80, 167512.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-08-12 23:14:00', '2025-08-12 23:14:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000113', u.id, 'cancelled', 42995.00, 0.00, 5159.40, 48154.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-05-25 06:42:00', '2025-05-25 06:42:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000114', u.id, 'completed', 135575.00, 0.00, 16269.00, 151844.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-02-20 01:25:00', '2025-02-20 01:25:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000115', u.id, 'completed', 75990.00, 0.00, 9118.80, 85108.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-05-03 00:09:00', '2025-05-03 00:09:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000116', u.id, 'completed', 117975.00, 0.00, 14157.00, 132132.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-05-02 03:24:00', '2025-05-02 03:24:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000117', u.id, 'completed', 88275.00, 0.00, 10593.00, 98868.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-04-14 18:36:00', '2025-04-14 18:36:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000118', u.id, 'completed', 97590.00, 0.00, 11710.80, 109300.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-05-23 21:26:00', '2025-05-23 21:26:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000119', u.id, 'completed', 75990.00, 0.00, 9118.80, 85108.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-11-17 14:14:00', '2025-11-17 14:14:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000120', u.id, 'cancelled', 135580.00, 0.00, 16269.60, 151849.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-01 10:10:00', '2025-07-01 10:10:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000121', u.id, 'completed', 135775.00, 0.00, 16293.00, 152068.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-23 13:00:00', '2025-03-23 13:00:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000122', u.id, 'completed', 158980.00, 0.00, 19077.60, 178057.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2025-07-24 09:05:00', '2025-07-24 09:05:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000123', u.id, 'completed', 185765.00, 0.00, 22291.80, 208056.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-26 23:20:00', '2025-08-26 23:20:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000124', u.id, 'completed', 139170.00, 0.00, 16700.40, 155870.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-28 18:24:00', '2025-09-28 18:24:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000125', u.id, 'completed', 75990.00, 0.00, 9118.80, 85108.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-07 23:17:00', '2025-06-07 23:17:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000126', u.id, 'cancelled', 137380.00, 0.00, 16485.60, 153865.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-02 00:01:00', '2025-01-02 00:01:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000127', u.id, 'completed', 151770.00, 0.00, 18212.40, 169982.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-06-07 12:26:00', '2025-06-07 12:26:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000128', u.id, 'completed', 36795.00, 0.00, 4415.40, 41210.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-12 01:28:00', '2025-02-12 01:28:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000129', u.id, 'completed', 23495.00, 0.00, 2819.40, 26314.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-18 12:19:00', '2025-06-18 12:19:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000130', u.id, 'completed', 102370.00, 0.00, 12284.40, 114654.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-12 11:51:00', '2025-08-12 11:51:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000131', u.id, 'completed', 112585.00, 0.00, 13510.20, 126095.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2025-08-29 14:34:00', '2025-08-29 14:34:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000132', u.id, 'cancelled', 194270.00, 0.00, 23312.40, 217582.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-05 16:19:00', '2025-06-05 16:19:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000133', u.id, 'completed', 114380.00, 0.00, 13725.60, 128105.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-03-23 12:42:00', '2025-03-23 12:42:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000134', u.id, 'completed', 35290.00, 0.00, 4234.80, 39524.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2025-05-21 17:47:00', '2025-05-21 17:47:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000135', u.id, 'completed', 34690.00, 0.00, 4162.80, 38852.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-08-06 14:13:00', '2025-08-06 14:13:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000136', u.id, 'completed', 193870.00, 0.00, 23264.40, 217134.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-10-14 12:20:00', '2025-10-14 12:20:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000137', u.id, 'cancelled', 107275.00, 0.00, 12873.00, 120148.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-06-30 17:02:00', '2025-06-30 17:02:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000138', u.id, 'cancelled', 49485.00, 0.00, 5938.20, 55423.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-10 18:14:00', '2025-08-10 18:14:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000139', u.id, 'completed', 131880.00, 0.00, 15825.60, 147705.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-26 06:18:00', '2025-12-26 06:18:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000140', u.id, 'completed', 87580.00, 0.00, 10509.60, 98089.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-31 07:05:00', '2025-07-31 07:05:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000141', u.id, 'completed', 139580.00, 0.00, 16749.60, 156329.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-03 08:38:00', '2025-04-03 08:38:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000142', u.id, 'completed', 49990.00, 0.00, 5998.80, 55988.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-10-31 21:01:00', '2025-10-31 21:01:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000143', u.id, 'completed', 148570.00, 0.00, 17828.40, 166398.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-16 04:12:00', '2025-03-16 04:12:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000144', u.id, 'cancelled', 136580.00, 0.00, 16389.60, 152969.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-02-05 06:18:00', '2025-02-05 06:18:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000145', u.id, 'cancelled', 144775.00, 0.00, 17373.00, 162148.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-07-22 17:23:00', '2025-07-22 17:23:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000146', u.id, 'completed', 97590.00, 0.00, 11710.80, 109300.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-01-01 15:09:00', '2025-01-01 15:09:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000147', u.id, 'completed', 30990.00, 0.00, 3718.80, 34708.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-31 16:41:00', '2025-03-31 16:41:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000148', u.id, 'cancelled', 126180.00, 0.00, 15141.60, 141321.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-25 15:22:00', '2025-11-25 15:22:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000149', u.id, 'completed', 71185.00, 0.00, 8542.20, 79727.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-21 02:18:00', '2025-02-21 02:18:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000150', u.id, 'completed', 98075.00, 0.00, 11769.00, 109844.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-01-09 14:24:00', '2025-01-09 14:24:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000151', u.id, 'completed', 98975.00, 0.00, 11877.00, 110852.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-07 11:24:00', '2025-10-07 11:24:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000152', u.id, 'completed', 15295.00, 0.00, 1835.40, 17130.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-01-18 21:27:00', '2025-01-18 21:27:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000153', u.id, 'completed', 156175.00, 0.00, 18741.00, 174916.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-20 12:13:00', '2025-06-20 12:13:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000154', u.id, 'completed', 83380.00, 0.00, 10005.60, 93385.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-03 08:43:00', '2025-02-03 08:43:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000155', u.id, 'cancelled', 207165.00, 0.00, 24859.80, 232024.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-05-31 11:00:00', '2025-05-31 11:00:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000156', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-16 17:15:00', '2025-09-16 17:15:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000157', u.id, 'completed', 97280.00, 0.00, 11673.60, 108953.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-12-08 05:25:00', '2025-12-08 05:25:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000158', u.id, 'completed', 318365.00, 0.00, 38203.80, 356568.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-03-26 17:03:00', '2025-03-26 17:03:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000159', u.id, 'completed', 45995.00, 0.00, 5519.40, 51514.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-25 15:37:00', '2025-12-25 15:37:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000160', u.id, 'completed', 120075.00, 0.00, 14409.00, 134484.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-09-18 21:08:00', '2025-09-18 21:08:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000161', u.id, 'completed', 134475.00, 0.00, 16137.00, 150612.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-26 20:18:00', '2025-06-26 20:18:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000162', u.id, 'cancelled', 49485.00, 0.00, 5938.20, 55423.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-01-15 19:57:00', '2025-01-15 19:57:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000163', u.id, 'cancelled', 29990.00, 0.00, 3598.80, 33588.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-09 14:28:00', '2025-06-09 14:28:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000164', u.id, 'cancelled', 89590.00, 0.00, 10750.80, 100340.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-21 00:24:00', '2025-05-21 00:24:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000165', u.id, 'cancelled', 183580.00, 0.00, 22029.60, 205609.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-03 21:39:00', '2025-02-03 21:39:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000166', u.id, 'completed', 158570.00, 0.00, 19028.40, 177598.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-06-01 23:47:00', '2025-06-01 23:47:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000167', u.id, 'completed', 30590.00, 0.00, 3670.80, 34260.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-02 07:30:00', '2025-11-02 07:30:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000168', u.id, 'completed', 122375.00, 0.00, 14685.00, 137060.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-07 02:23:00', '2025-09-07 02:23:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000169', u.id, 'completed', 228665.00, 0.00, 27439.80, 256104.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-09-02 21:34:00', '2025-09-02 21:34:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000170', u.id, 'completed', 30990.00, 0.00, 3718.80, 34708.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-29 08:54:00', '2025-04-29 08:54:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000171', u.id, 'completed', 49990.00, 0.00, 5998.80, 55988.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-14 06:44:00', '2025-05-14 06:44:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000172', u.id, 'completed', 66580.00, 0.00, 7989.60, 74569.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-17 22:23:00', '2025-09-17 22:23:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000173', u.id, 'completed', 101375.00, 0.00, 12165.00, 113540.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-06-12 05:45:00', '2025-06-12 05:45:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000174', u.id, 'completed', 153870.00, 0.00, 18464.40, 172334.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-29 02:32:00', '2025-03-29 02:32:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000175', u.id, 'completed', 75990.00, 0.00, 9118.80, 85108.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-21 12:44:00', '2025-08-21 12:44:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000176', u.id, 'completed', 89485.00, 0.00, 10738.20, 100223.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-12-09 06:56:00', '2025-12-09 06:56:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000177', u.id, 'cancelled', 73590.00, 0.00, 8830.80, 82420.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-01-15 04:10:00', '2025-01-15 04:10:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000178', u.id, 'completed', 128980.00, 0.00, 15477.60, 144457.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-13 19:48:00', '2025-07-13 19:48:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000179', u.id, 'completed', 59590.00, 0.00, 7150.80, 66740.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-12-30 18:58:00', '2025-12-30 18:58:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000180', u.id, 'completed', 50085.00, 0.00, 6010.20, 56095.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-07 01:55:00', '2025-10-07 01:55:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000181', u.id, 'completed', 139375.00, 0.00, 16725.00, 156100.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-10-10 08:35:00', '2025-10-10 08:35:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000182', u.id, 'completed', 36590.00, 0.00, 4390.80, 40980.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-07 13:46:00', '2025-06-07 13:46:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000183', u.id, 'completed', 122980.00, 0.00, 14757.60, 137737.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-01 10:59:00', '2025-06-01 10:59:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000184', u.id, 'completed', 38990.00, 0.00, 4678.80, 43668.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-22 23:15:00', '2025-07-22 23:15:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000185', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-09-06 13:44:00', '2025-09-06 13:44:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000186', u.id, 'completed', 55990.00, 0.00, 6718.80, 62708.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-06-16 20:55:00', '2025-06-16 20:55:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000187', u.id, 'completed', 125775.00, 0.00, 15093.00, 140868.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-10 16:06:00', '2025-08-10 16:06:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000188', u.id, 'completed', 46485.00, 0.00, 5578.20, 52063.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-09-29 06:05:00', '2025-09-29 06:05:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000189', u.id, 'completed', 34990.00, 0.00, 4198.80, 39188.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-24 16:56:00', '2025-06-24 16:56:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000190', u.id, 'completed', 182970.00, 0.00, 21956.40, 204926.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-02-23 08:41:00', '2025-02-23 08:41:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000191', u.id, 'completed', 17495.00, 0.00, 2099.40, 19594.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2025-02-28 12:35:00', '2025-02-28 12:35:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000192', u.id, 'completed', 114970.00, 0.00, 13796.40, 128766.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-05 11:23:00', '2025-11-05 11:23:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000193', u.id, 'completed', 183370.00, 0.00, 22004.40, 205374.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-23 19:57:00', '2025-08-23 19:57:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000194', u.id, 'completed', 146770.00, 0.00, 17612.40, 164382.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-02 06:44:00', '2025-06-02 06:44:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000195', u.id, 'completed', 81380.00, 0.00, 9765.60, 91145.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-20 09:51:00', '2025-09-20 09:51:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000196', u.id, 'completed', 97675.00, 0.00, 11721.00, 109396.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-12-15 00:02:00', '2025-12-15 00:02:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000197', u.id, 'completed', 153975.00, 0.00, 18477.00, 172452.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-22 12:04:00', '2025-06-22 12:04:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000198', u.id, 'completed', 109175.00, 0.00, 13101.00, 122276.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-03-29 00:39:00', '2025-03-29 00:39:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000199', u.id, 'completed', 122275.00, 0.00, 14673.00, 136948.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-22 19:28:00', '2025-07-22 19:28:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000200', u.id, 'cancelled', 222370.00, 0.00, 26684.40, 249054.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-10-12 22:49:00', '2025-10-12 22:49:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000201', u.id, 'completed', 107580.00, 0.00, 12909.60, 120489.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-07-16 02:35:00', '2025-07-16 02:35:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000202', u.id, 'completed', 80485.00, 0.00, 9658.20, 90143.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-03 22:04:00', '2025-11-03 22:04:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000203', u.id, 'completed', 110580.00, 0.00, 13269.60, 123849.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-27 05:30:00', '2025-08-27 05:30:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000204', u.id, 'cancelled', 84680.00, 0.00, 10161.60, 94841.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-04 17:04:00', '2025-06-04 17:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000205', u.id, 'completed', 36795.00, 0.00, 4415.40, 41210.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-21 21:21:00', '2025-06-21 21:21:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000206', u.id, 'completed', 157565.00, 0.00, 18907.80, 176472.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-11 07:24:00', '2025-04-11 07:24:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000207', u.id, 'completed', 58985.00, 0.00, 7078.20, 66063.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-12 12:36:00', '2025-02-12 12:36:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000208', u.id, 'cancelled', 46985.00, 0.00, 5638.20, 52623.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-12-23 19:19:00', '2025-12-23 19:19:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000209', u.id, 'completed', 125870.00, 0.00, 15104.40, 140974.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-08-26 02:28:00', '2025-08-26 02:28:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000210', u.id, 'completed', 161475.00, 0.00, 19377.00, 180852.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-08-11 15:27:00', '2025-08-11 15:27:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000211', u.id, 'cancelled', 33990.00, 0.00, 4078.80, 38068.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-02-21 00:29:00', '2025-02-21 00:29:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000212', u.id, 'completed', 64490.00, 0.00, 7738.80, 72228.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-02-04 23:54:00', '2025-02-04 23:54:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000213', u.id, 'completed', 103375.00, 0.00, 12405.00, 115780.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-12 05:12:00', '2025-06-12 05:12:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000214', u.id, 'completed', 80480.00, 0.00, 9657.60, 90137.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-10-25 19:35:00', '2025-10-25 19:35:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000215', u.id, 'completed', 222965.00, 0.00, 26755.80, 249720.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-03-12 02:49:00', '2025-03-12 02:49:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000216', u.id, 'completed', 103575.00, 0.00, 12429.00, 116004.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-05 22:42:00', '2025-07-05 22:42:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000217', u.id, 'completed', 148570.00, 0.00, 17828.40, 166398.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-09 13:17:00', '2025-05-09 13:17:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000218', u.id, 'completed', 124475.00, 0.00, 14937.00, 139412.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-23 11:01:00', '2025-05-23 11:01:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000219', u.id, 'completed', 91580.00, 0.00, 10989.60, 102569.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-12 19:54:00', '2025-12-12 19:54:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000220', u.id, 'completed', 134575.00, 0.00, 16149.00, 150724.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-12-01 20:24:00', '2025-12-01 20:24:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000221', u.id, 'completed', 202070.00, 0.00, 24248.40, 226318.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-09 22:15:00', '2025-04-09 22:15:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000222', u.id, 'completed', 18295.00, 0.00, 2195.40, 20490.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-08-02 05:56:00', '2025-08-02 05:56:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000223', u.id, 'completed', 53485.00, 0.00, 6418.20, 59903.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-01-27 00:43:00', '2025-01-27 00:43:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000224', u.id, 'cancelled', 102570.00, 0.00, 12308.40, 114878.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-02-26 05:05:00', '2025-02-26 05:05:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000225', u.id, 'cancelled', 145165.00, 0.00, 17419.80, 162584.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-20 04:28:00', '2025-05-20 04:28:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000226', u.id, 'completed', 119980.00, 0.00, 14397.60, 134377.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-15 14:27:00', '2025-04-15 14:27:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000227', u.id, 'completed', 163070.00, 0.00, 19568.40, 182638.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-07-31 20:52:00', '2025-07-31 20:52:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000228', u.id, 'completed', 42995.00, 0.00, 5159.40, 48154.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-01 10:44:00', '2025-06-01 10:44:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000229', u.id, 'completed', 183580.00, 0.00, 22029.60, 205609.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-24 08:05:00', '2025-07-24 08:05:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000230', u.id, 'completed', 123580.00, 0.00, 14829.60, 138409.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-03 01:25:00', '2025-10-03 01:25:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000231', u.id, 'completed', 188765.00, 0.00, 22651.80, 211416.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-04-19 10:04:00', '2025-04-19 10:04:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000232', u.id, 'completed', 27590.00, 0.00, 3310.80, 30900.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-09 11:00:00', '2025-11-09 11:00:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000233', u.id, 'completed', 160575.00, 0.00, 19269.00, 179844.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-15 06:07:00', '2025-04-15 06:07:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000234', u.id, 'completed', 112070.00, 0.00, 13448.40, 125518.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-20 15:54:00', '2025-10-20 15:54:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000235', u.id, 'completed', 34990.00, 0.00, 4198.80, 39188.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-03-02 16:15:00', '2025-03-02 16:15:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000236', u.id, 'completed', 58385.00, 0.00, 7006.20, 65391.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-23 02:08:00', '2025-05-23 02:08:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000237', u.id, 'completed', 59290.00, 0.00, 7114.80, 66404.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-02 14:43:00', '2025-05-02 14:43:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000238', u.id, 'completed', 115280.00, 0.00, 13833.60, 129113.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-05-23 15:17:00', '2025-05-23 15:17:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000239', u.id, 'completed', 265570.00, 0.00, 31868.40, 297438.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2025-08-01 08:05:00', '2025-08-01 08:05:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000240', u.id, 'completed', 138870.00, 0.00, 16664.40, 155534.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-26 19:31:00', '2025-11-26 19:31:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000241', u.id, 'completed', 45985.00, 0.00, 5518.20, 51503.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-01-18 04:17:00', '2025-01-18 04:17:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000242', u.id, 'completed', 158075.00, 0.00, 18969.00, 177044.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-08 16:04:00', '2025-01-08 16:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000243', u.id, 'cancelled', 86385.00, 0.00, 10366.20, 96751.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-21 16:48:00', '2025-06-21 16:48:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000244', u.id, 'completed', 32990.00, 0.00, 3958.80, 36948.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-10-08 10:55:00', '2025-10-08 10:55:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000245', u.id, 'cancelled', 92780.00, 0.00, 11133.60, 103913.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-11 00:57:00', '2025-03-11 00:57:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000246', u.id, 'cancelled', 33990.00, 0.00, 4078.80, 38068.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-31 10:49:00', '2025-07-31 10:49:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000247', u.id, 'cancelled', 131965.00, 0.00, 15835.80, 147800.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-21 02:26:00', '2025-09-21 02:26:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000248', u.id, 'completed', 50090.00, 0.00, 6010.80, 56100.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-01 06:13:00', '2025-11-01 06:13:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000249', u.id, 'completed', 159970.00, 0.00, 19196.40, 179166.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-12-01 17:38:00', '2025-12-01 17:38:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000250', u.id, 'completed', 195570.00, 0.00, 23468.40, 219038.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-12 19:47:00', '2025-07-12 19:47:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000251', u.id, 'completed', 85990.00, 0.00, 10318.80, 96308.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-02-25 07:17:00', '2025-02-25 07:17:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000252', u.id, 'completed', 53085.00, 0.00, 6370.20, 59455.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-30 22:17:00', '2025-03-30 22:17:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000253', u.id, 'completed', 106485.00, 0.00, 12778.20, 119263.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-08-06 17:42:00', '2025-08-06 17:42:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000254', u.id, 'completed', 72085.00, 0.00, 8650.20, 80735.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-01 18:45:00', '2025-05-01 18:45:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000255', u.id, 'completed', 112480.00, 0.00, 13497.60, 125977.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-02-19 11:52:00', '2025-02-19 11:52:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000256', u.id, 'completed', 71080.00, 0.00, 8529.60, 79609.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-12-30 23:29:00', '2025-12-30 23:29:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000257', u.id, 'completed', 131975.00, 0.00, 15837.00, 147812.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-02 06:23:00', '2025-03-02 06:23:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000258', u.id, 'cancelled', 38690.00, 0.00, 4642.80, 43332.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-08-03 15:49:00', '2025-08-03 15:49:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000259', u.id, 'completed', 145470.00, 0.00, 17456.40, 162926.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-20 01:33:00', '2025-10-20 01:33:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000260', u.id, 'completed', 32990.00, 0.00, 3958.80, 36948.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-09-08 16:04:00', '2025-09-08 16:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000261', u.id, 'completed', 161775.00, 0.00, 19413.00, 181188.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-01-07 03:28:00', '2025-01-07 03:28:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000262', u.id, 'completed', 81885.00, 0.00, 9826.20, 91711.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-07-18 15:12:00', '2025-07-18 15:12:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000263', u.id, 'completed', 86580.00, 0.00, 10389.60, 96969.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-08-11 15:06:00', '2025-08-11 15:06:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000264', u.id, 'completed', 272665.00, 0.00, 32719.80, 305384.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-07-08 04:16:00', '2025-07-08 04:16:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000265', u.id, 'completed', 137775.00, 0.00, 16533.00, 154308.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-02 16:53:00', '2025-10-02 16:53:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000266', u.id, 'cancelled', 136170.00, 0.00, 16340.40, 152510.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-06 16:27:00', '2025-05-06 16:27:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000267', u.id, 'completed', 92080.00, 0.00, 11049.60, 103129.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-03-06 21:44:00', '2025-03-06 21:44:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000268', u.id, 'cancelled', 153370.00, 0.00, 18404.40, 171774.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-05-17 13:23:00', '2025-05-17 13:23:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000269', u.id, 'completed', 126580.00, 0.00, 15189.60, 141769.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-05-26 13:17:00', '2025-05-26 13:17:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000270', u.id, 'completed', 101880.00, 0.00, 12225.60, 114105.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-02-12 19:04:00', '2025-02-12 19:04:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000271', u.id, 'completed', 123780.00, 0.00, 14853.60, 138633.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-13 10:32:00', '2025-05-13 10:32:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000272', u.id, 'completed', 74380.00, 0.00, 8925.60, 83305.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-27 03:17:00', '2025-09-27 03:17:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000273', u.id, 'completed', 205465.00, 0.00, 24655.80, 230120.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-25 03:00:00', '2025-07-25 03:00:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000274', u.id, 'completed', 121180.00, 0.00, 14541.60, 135721.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-02-11 09:44:00', '2025-02-11 09:44:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000275', u.id, 'completed', 17795.00, 0.00, 2135.40, 19930.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-10-23 14:36:00', '2025-10-23 14:36:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000276', u.id, 'completed', 69485.00, 0.00, 8338.20, 77823.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-02-26 06:20:00', '2025-02-26 06:20:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000277', u.id, 'completed', 136170.00, 0.00, 16340.40, 152510.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-30 01:46:00', '2025-11-30 01:46:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000278', u.id, 'completed', 30590.00, 0.00, 3670.80, 34260.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-12-01 00:01:00', '2025-12-01 00:01:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000279', u.id, 'completed', 95280.00, 0.00, 11433.60, 106713.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-08-29 20:28:00', '2025-08-29 20:28:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000280', u.id, 'completed', 32990.00, 0.00, 3958.80, 36948.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-19 05:16:00', '2025-09-19 05:16:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000281', u.id, 'completed', 160570.00, 0.00, 19268.40, 179838.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-05 03:24:00', '2025-10-05 03:24:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000282', u.id, 'cancelled', 35590.00, 0.00, 4270.80, 39860.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-08 19:16:00', '2025-03-08 19:16:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000283', u.id, 'cancelled', 36790.00, 0.00, 4414.80, 41204.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-04-10 02:21:00', '2025-04-10 02:21:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000284', u.id, 'completed', 129980.00, 0.00, 15597.60, 145577.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-01-05 12:07:00', '2025-01-05 12:07:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000285', u.id, 'cancelled', 111985.00, 0.00, 13438.20, 125423.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-04 06:26:00', '2025-10-04 06:26:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000286', u.id, 'completed', 122670.00, 0.00, 14720.40, 137390.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-23 06:21:00', '2025-11-23 06:21:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000287', u.id, 'completed', 135775.00, 0.00, 16293.00, 152068.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-28 16:19:00', '2025-11-28 16:19:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000288', u.id, 'completed', 151570.00, 0.00, 18188.40, 169758.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-29 06:15:00', '2025-04-29 06:15:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000289', u.id, 'completed', 131670.00, 0.00, 15800.40, 147470.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-18 01:36:00', '2025-07-18 01:36:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000290', u.id, 'completed', 53685.00, 0.00, 6442.20, 60127.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-03-23 20:07:00', '2025-03-23 20:07:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000291', u.id, 'completed', 201165.00, 0.00, 24139.80, 225304.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-11-08 22:07:00', '2025-11-08 22:07:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000292', u.id, 'completed', 27995.00, 0.00, 3359.40, 31354.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-20 19:39:00', '2025-03-20 19:39:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000293', u.id, 'completed', 82580.00, 0.00, 9909.60, 92489.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-04-05 17:03:00', '2025-04-05 17:03:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000294', u.id, 'completed', 111580.00, 0.00, 13389.60, 124969.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-11-12 08:03:00', '2025-11-12 08:03:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000295', u.id, 'cancelled', 156070.00, 0.00, 18728.40, 174798.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-02-06 13:57:00', '2025-02-06 13:57:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000296', u.id, 'completed', 106980.00, 0.00, 12837.60, 119817.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-10 18:22:00', '2025-06-10 18:22:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000297', u.id, 'completed', 103585.00, 0.00, 12430.20, 116015.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-24 10:02:00', '2025-11-24 10:02:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000298', u.id, 'completed', 169170.00, 0.00, 20300.40, 189470.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-18 23:05:00', '2025-04-18 23:05:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000299', u.id, 'completed', 18995.00, 0.00, 2279.40, 21274.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-21 20:47:00', '2025-07-21 20:47:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000300', u.id, 'completed', 92380.00, 0.00, 11085.60, 103465.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-04 06:59:00', '2025-05-04 06:59:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000301', u.id, 'processing', 214160.00, 0.00, 25699.20, 239859.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-05 03:40:00', '2026-01-05 03:40:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000302', u.id, 'completed', 75280.00, 0.00, 9033.60, 84313.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 01:38:00', '2026-01-04 01:38:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000303', u.id, 'completed', 31795.00, 0.00, 3815.40, 35610.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-10 16:53:00', '2026-01-10 16:53:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000304', u.id, 'completed', 36795.00, 0.00, 4415.40, 41210.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-04 09:18:00', '2026-01-04 09:18:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000305', u.id, 'completed', 16495.00, 0.00, 1979.40, 18474.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-02 15:16:00', '2026-01-02 15:16:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000306', u.id, 'completed', 75485.00, 0.00, 9058.20, 84543.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-02 09:10:00', '2026-01-02 09:10:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000307', u.id, 'completed', 18995.00, 0.00, 2279.40, 21274.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-06 18:46:00', '2026-01-06 18:46:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000308', u.id, 'processing', 96280.00, 0.00, 11553.60, 107833.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-04 00:50:00', '2026-01-04 00:50:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000309', u.id, 'completed', 217775.00, 0.00, 26133.00, 243908.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-11 06:12:00', '2026-01-11 06:12:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000310', u.id, 'shipped', 28990.00, 0.00, 3478.80, 32468.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-06 11:45:00', '2026-01-06 11:45:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000311', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 13:43:00', '2026-01-04 13:43:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000312', u.id, 'shipped', 118575.00, 0.00, 14229.00, 132804.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-06 07:19:00', '2026-01-06 07:19:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000313', u.id, 'completed', 32995.00, 0.00, 3959.40, 36954.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-06 03:07:00', '2026-01-06 03:07:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000314', u.id, 'completed', 44585.00, 0.00, 5350.20, 49935.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-09 12:26:00', '2026-01-09 12:26:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000315', u.id, 'shipped', 42995.00, 0.00, 5159.40, 48154.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 11:17:00', '2026-01-11 11:17:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000316', u.id, 'completed', 82975.00, 0.00, 9957.00, 92932.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-06 05:48:00', '2026-01-06 05:48:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000317', u.id, 'completed', 134780.00, 0.00, 16173.60, 150953.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-05 05:58:00', '2026-01-05 05:58:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000318', u.id, 'shipped', 57785.00, 0.00, 6934.20, 64719.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-04 12:38:00', '2026-01-04 12:38:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000319', u.id, 'completed', 93275.00, 0.00, 11193.00, 104468.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-03 16:15:00', '2026-01-03 16:15:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000320', u.id, 'completed', 121585.00, 0.00, 14590.20, 136175.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-04 17:13:00', '2026-01-04 17:13:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000321', u.id, 'completed', 71385.00, 0.00, 8566.20, 79951.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-02 13:47:00', '2026-01-02 13:47:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000322', u.id, 'completed', 146075.00, 0.00, 17529.00, 163604.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-01 13:43:00', '2026-01-01 13:43:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000323', u.id, 'processing', 86580.00, 0.00, 10389.60, 96969.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-08 03:26:00', '2026-01-08 03:26:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000324', u.id, 'completed', 32990.00, 0.00, 3958.80, 36948.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-03 15:19:00', '2026-01-03 15:19:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000325', u.id, 'processing', 77785.00, 0.00, 9334.20, 87119.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-07 01:14:00', '2026-01-07 01:14:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000326', u.id, 'completed', 78885.00, 0.00, 9466.20, 88351.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-02 10:08:00', '2026-01-02 10:08:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000327', u.id, 'shipped', 104775.00, 0.00, 12573.00, 117348.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-03 03:29:00', '2026-01-03 03:29:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000328', u.id, 'shipped', 53385.00, 0.00, 6406.20, 59791.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-03 07:38:00', '2026-01-03 07:38:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000329', u.id, 'completed', 63590.00, 0.00, 7630.80, 71220.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-05 21:10:00', '2026-01-05 21:10:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000330', u.id, 'completed', 193370.00, 0.00, 23204.40, 216574.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-07 14:13:00', '2026-01-07 14:13:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000331', u.id, 'completed', 53485.00, 0.00, 6418.20, 59903.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-07 07:41:00', '2026-01-07 07:41:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000332', u.id, 'completed', 18295.00, 0.00, 2195.40, 20490.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-02 15:48:00', '2026-01-02 15:48:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000333', u.id, 'processing', 85775.00, 0.00, 10293.00, 96068.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-07 02:04:00', '2026-01-07 02:04:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000334', u.id, 'completed', 185370.00, 0.00, 22244.40, 207614.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-03 08:44:00', '2026-01-03 08:44:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000335', u.id, 'shipped', 139170.00, 0.00, 16700.40, 155870.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-09 08:15:00', '2026-01-09 08:15:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000336', u.id, 'processing', 148065.00, 0.00, 17767.80, 165832.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-09 23:51:00', '2026-01-09 23:51:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000337', u.id, 'completed', 210365.00, 0.00, 25243.80, 235608.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-07 22:51:00', '2026-01-07 22:51:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000338', u.id, 'completed', 134475.00, 0.00, 16137.00, 150612.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-03 11:42:00', '2026-01-03 11:42:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000339', u.id, 'completed', 86275.00, 0.00, 10353.00, 96628.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-10 14:38:00', '2026-01-10 14:38:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000340', u.id, 'shipped', 18495.00, 0.00, 2219.40, 20714.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-10 20:20:00', '2026-01-10 20:20:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000341', u.id, 'completed', 73585.00, 0.00, 8830.20, 82415.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-06 19:13:00', '2026-01-06 19:13:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000342', u.id, 'completed', 75785.00, 0.00, 9094.20, 84879.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-07 23:18:00', '2026-01-07 23:18:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000343', u.id, 'shipped', 89480.00, 0.00, 10737.60, 100217.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-09 12:18:00', '2026-01-09 12:18:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000344', u.id, 'shipped', 29990.00, 0.00, 3598.80, 33588.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-01 21:49:00', '2026-01-01 21:49:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000345', u.id, 'processing', 81185.00, 0.00, 9742.20, 90927.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-02 06:17:00', '2026-01-02 06:17:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000346', u.id, 'completed', 57490.00, 0.00, 6898.80, 64388.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-04 01:51:00', '2026-01-04 01:51:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000347', u.id, 'completed', 119975.00, 0.00, 14397.00, 134372.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-03 06:25:00', '2026-01-03 06:25:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000348', u.id, 'shipped', 132380.00, 0.00, 15885.60, 148265.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 10:42:00', '2026-01-11 10:42:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000349', u.id, 'completed', 17495.00, 0.00, 2099.40, 19594.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-03 01:54:00', '2026-01-03 01:54:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000350', u.id, 'completed', 176780.00, 0.00, 21213.60, 197993.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-04 16:48:00', '2026-01-04 16:48:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000351', u.id, 'processing', 128970.00, 0.00, 15476.40, 144446.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-06 21:50:00', '2026-01-06 21:50:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000352', u.id, 'completed', 27590.00, 0.00, 3310.80, 30900.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-08 22:15:00', '2026-01-08 22:15:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000353', u.id, 'shipped', 97970.00, 0.00, 11756.40, 109726.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-07 16:15:00', '2026-01-07 16:15:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000354', u.id, 'completed', 210175.00, 0.00, 25221.00, 235396.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-07 01:05:00', '2026-01-07 01:05:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000355', u.id, 'shipped', 18995.00, 0.00, 2279.40, 21274.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-08 05:32:00', '2026-01-08 05:32:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000356', u.id, 'completed', 257765.00, 0.00, 30931.80, 288696.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-01 12:14:00', '2026-01-01 12:14:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000357', u.id, 'processing', 30990.00, 0.00, 3718.80, 34708.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-02 02:46:00', '2026-01-02 02:46:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000358', u.id, 'processing', 73590.00, 0.00, 8830.80, 82420.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-03 13:28:00', '2026-01-03 13:28:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000359', u.id, 'processing', 99085.00, 0.00, 11890.20, 110975.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-11 05:07:00', '2026-01-11 05:07:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000360', u.id, 'shipped', 16495.00, 0.00, 1979.40, 18474.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-01 05:48:00', '2026-01-01 05:48:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000361', u.id, 'completed', 68180.00, 0.00, 8181.60, 76361.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-07 00:39:00', '2026-01-07 00:39:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000362', u.id, 'processing', 37995.00, 0.00, 4559.40, 42554.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-09 13:30:00', '2026-01-09 13:30:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000363', u.id, 'completed', 18495.00, 0.00, 2219.40, 20714.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-11 20:06:00', '2026-01-11 20:06:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000364', u.id, 'processing', 112580.00, 0.00, 13509.60, 126089.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 23:54:00', '2026-01-04 23:54:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000365', u.id, 'completed', 188365.00, 0.00, 22603.80, 210968.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-04 08:10:00', '2026-01-04 08:10:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000366', u.id, 'shipped', 28990.00, 0.00, 3478.80, 32468.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-04 16:37:00', '2026-01-04 16:37:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000367', u.id, 'completed', 118985.00, 0.00, 14278.20, 133263.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-05 01:26:00', '2026-01-05 01:26:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000368', u.id, 'processing', 121970.00, 0.00, 14636.40, 136606.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-08 17:22:00', '2026-01-08 17:22:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000369', u.id, 'completed', 53285.00, 0.00, 6394.20, 59679.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-07 13:13:00', '2026-01-07 13:13:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000370', u.id, 'processing', 216165.00, 0.00, 25939.80, 242104.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 05:42:00', '2026-01-04 05:42:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000371', u.id, 'shipped', 102075.00, 0.00, 12249.00, 114324.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-05 17:07:00', '2026-01-05 17:07:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000372', u.id, 'shipped', 19495.00, 0.00, 2339.40, 21834.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-06 07:48:00', '2026-01-06 07:48:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000373', u.id, 'shipped', 83580.00, 0.00, 10029.60, 93609.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-10 17:33:00', '2026-01-10 17:33:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000374', u.id, 'processing', 140170.00, 0.00, 16820.40, 156990.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-08 17:10:00', '2026-01-08 17:10:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000375', u.id, 'completed', 123985.00, 0.00, 14878.20, 138863.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-11 22:04:00', '2026-01-11 22:04:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000376', u.id, 'shipped', 60485.00, 0.00, 7258.20, 67743.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-05 12:24:00', '2026-01-05 12:24:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000377', u.id, 'shipped', 109785.00, 0.00, 13174.20, 122959.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-07 16:11:00', '2026-01-07 16:11:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000378', u.id, 'completed', 53490.00, 0.00, 6418.80, 59908.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-11 11:39:00', '2026-01-11 11:39:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000379', u.id, 'completed', 46285.00, 0.00, 5554.20, 51839.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-08 10:24:00', '2026-01-08 10:24:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000380', u.id, 'processing', 81875.00, 0.00, 9825.00, 91700.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-06 16:31:00', '2026-01-06 16:31:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000381', u.id, 'shipped', 16495.00, 0.00, 1979.40, 18474.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-03 10:53:00', '2026-01-03 10:53:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000382', u.id, 'completed', 77380.00, 0.00, 9285.60, 86665.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-01 12:36:00', '2026-01-01 12:36:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000383', u.id, 'completed', 96970.00, 0.00, 11636.40, 108606.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-08 12:27:00', '2026-01-08 12:27:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000384', u.id, 'shipped', 163575.00, 0.00, 19629.00, 183204.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-08 20:57:00', '2026-01-08 20:57:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000385', u.id, 'completed', 113370.00, 0.00, 13604.40, 126974.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-03 15:45:00', '2026-01-03 15:45:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000386', u.id, 'completed', 66785.00, 0.00, 8014.20, 74799.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-06 03:05:00', '2026-01-06 03:05:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000387', u.id, 'processing', 138470.00, 0.00, 16616.40, 155086.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-06 05:24:00', '2026-01-06 05:24:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000388', u.id, 'completed', 121180.00, 0.00, 14541.60, 135721.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-10 00:26:00', '2026-01-10 00:26:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000389', u.id, 'completed', 128775.00, 0.00, 15453.00, 144228.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 06:12:00', '2026-01-11 06:12:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000390', u.id, 'completed', 41290.00, 0.00, 4954.80, 46244.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-06 14:11:00', '2026-01-06 14:11:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000391', u.id, 'completed', 137675.00, 0.00, 16521.00, 154196.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-05 22:57:00', '2026-01-05 22:57:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000392', u.id, 'completed', 56285.00, 0.00, 6754.20, 63039.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-07 12:22:00', '2026-01-07 12:22:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000393', u.id, 'completed', 113975.00, 0.00, 13677.00, 127652.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-01 10:24:00', '2026-01-01 10:24:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000394', u.id, 'shipped', 97570.00, 0.00, 11708.40, 109278.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-01 20:24:00', '2026-01-01 20:24:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000395', u.id, 'shipped', 60980.00, 0.00, 7317.60, 68297.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-05 00:57:00', '2026-01-05 00:57:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000396', u.id, 'processing', 118580.00, 0.00, 14229.60, 132809.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 12:36:00', '2026-01-01 12:36:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000397', u.id, 'processing', 159170.00, 0.00, 19100.40, 178270.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-03 05:02:00', '2026-01-03 05:02:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000398', u.id, 'completed', 135775.00, 0.00, 16293.00, 152068.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-08 18:11:00', '2026-01-08 18:11:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000399', u.id, 'completed', 123265.00, 0.00, 14791.80, 138056.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-08 20:41:00', '2026-01-08 20:41:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000400', u.id, 'completed', 18995.00, 0.00, 2279.40, 21274.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 06:35:00', '2026-01-04 06:35:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000401', u.id, 'completed', 111175.00, 0.00, 13341.00, 124516.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-09 02:47:00', '2026-01-09 02:47:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000402', u.id, 'completed', 70280.00, 0.00, 8433.60, 78713.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-05 13:01:00', '2026-01-05 13:01:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000403', u.id, 'shipped', 91990.00, 0.00, 11038.80, 103028.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-09 14:13:00', '2026-01-09 14:13:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000404', u.id, 'completed', 36990.00, 0.00, 4438.80, 41428.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-04 11:46:00', '2026-01-04 11:46:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000405', u.id, 'shipped', 106475.00, 0.00, 12777.00, 119252.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-08 02:42:00', '2026-01-08 02:42:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000406', u.id, 'processing', 284765.00, 0.00, 34171.80, 318936.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-09 05:28:00', '2026-01-09 05:28:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000407', u.id, 'completed', 88480.00, 0.00, 10617.60, 99097.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-04 14:02:00', '2026-01-04 14:02:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000408', u.id, 'processing', 60980.00, 0.00, 7317.60, 68297.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-03 13:56:00', '2026-01-03 13:56:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000409', u.id, 'completed', 191875.00, 0.00, 23025.00, 214900.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-09 15:20:00', '2026-01-09 15:20:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000410', u.id, 'shipped', 130980.00, 0.00, 15717.60, 146697.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-07 01:02:00', '2026-01-07 01:02:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000411', u.id, 'completed', 149770.00, 0.00, 17972.40, 167742.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-06 00:47:00', '2026-01-06 00:47:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000412', u.id, 'completed', 135180.00, 0.00, 16221.60, 151401.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-04 00:23:00', '2026-01-04 00:23:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000413', u.id, 'completed', 103580.00, 0.00, 12429.60, 116009.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-04 02:23:00', '2026-01-04 02:23:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000414', u.id, 'shipped', 151275.00, 0.00, 18153.00, 169428.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-06 01:05:00', '2026-01-06 01:05:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000415', u.id, 'shipped', 122475.00, 0.00, 14697.00, 137172.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-02 11:12:00', '2026-01-02 11:12:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000416', u.id, 'completed', 157365.00, 0.00, 18883.80, 176248.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-07 22:17:00', '2026-01-07 22:17:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000417', u.id, 'processing', 115375.00, 0.00, 13845.00, 129220.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-08 17:53:00', '2026-01-08 17:53:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000418', u.id, 'shipped', 145985.00, 0.00, 17518.20, 163503.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-01 06:04:00', '2026-01-01 06:04:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000419', u.id, 'completed', 82990.00, 0.00, 9958.80, 92948.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-08 03:39:00', '2026-01-08 03:39:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000420', u.id, 'completed', 113580.00, 0.00, 13629.60, 127209.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-07 01:29:00', '2026-01-07 01:29:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000421', u.id, 'completed', 49485.00, 0.00, 5938.20, 55423.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-02 06:47:00', '2026-01-02 06:47:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000422', u.id, 'completed', 87175.00, 0.00, 10461.00, 97636.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-07 03:53:00', '2026-01-07 03:53:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000423', u.id, 'completed', 208170.00, 0.00, 24980.40, 233150.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-06 22:48:00', '2026-01-06 22:48:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000424', u.id, 'shipped', 150865.00, 0.00, 18103.80, 168968.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-07 00:36:00', '2026-01-07 00:36:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000425', u.id, 'shipped', 91985.00, 0.00, 11038.20, 103023.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 08:22:00', '2026-01-01 08:22:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000426', u.id, 'completed', 14495.00, 0.00, 1739.40, 16234.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-11 21:25:00', '2026-01-11 21:25:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000427', u.id, 'processing', 229965.00, 0.00, 27595.80, 257560.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-05 05:28:00', '2026-01-05 05:28:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000428', u.id, 'processing', 85990.00, 0.00, 10318.80, 96308.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-02 08:15:00', '2026-01-02 08:15:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000429', u.id, 'shipped', 99990.00, 0.00, 11998.80, 111988.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-06 02:58:00', '2026-01-06 02:58:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000430', u.id, 'completed', 104075.00, 0.00, 12489.00, 116564.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-02 00:55:00', '2026-01-02 00:55:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000431', u.id, 'completed', 183275.00, 0.00, 21993.00, 205268.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-08 21:45:00', '2026-01-08 21:45:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000432', u.id, 'completed', 82285.00, 0.00, 9874.20, 92159.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-06 11:09:00', '2026-01-06 11:09:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000433', u.id, 'processing', 195275.00, 0.00, 23433.00, 218708.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-06 14:46:00', '2026-01-06 14:46:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000434', u.id, 'processing', 136570.00, 0.00, 16388.40, 152958.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-09 15:34:00', '2026-01-09 15:34:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000435', u.id, 'completed', 18195.00, 0.00, 2183.40, 20378.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-11 01:17:00', '2026-01-11 01:17:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000436', u.id, 'processing', 24195.00, 0.00, 2903.40, 27098.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-11 07:28:00', '2026-01-11 07:28:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000437', u.id, 'completed', 279760.00, 0.00, 33571.20, 313331.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-06 20:13:00', '2026-01-06 20:13:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000438', u.id, 'processing', 223670.00, 0.00, 26840.40, 250510.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-08 20:52:00', '2026-01-08 20:52:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000439', u.id, 'completed', 135975.00, 0.00, 16317.00, 152292.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-09 00:15:00', '2026-01-09 00:15:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000440', u.id, 'completed', 84985.00, 0.00, 10198.20, 95183.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-09 18:21:00', '2026-01-09 18:21:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000441', u.id, 'completed', 265565.00, 0.00, 31867.80, 297432.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-05 12:59:00', '2026-01-05 12:59:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000442', u.id, 'processing', 122970.00, 0.00, 14756.40, 137726.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-03 21:40:00', '2026-01-03 21:40:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000443', u.id, 'completed', 44795.00, 0.00, 5375.40, 50170.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-06 13:45:00', '2026-01-06 13:45:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000444', u.id, 'shipped', 71380.00, 0.00, 8565.60, 79945.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-11 03:45:00', '2026-01-11 03:45:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000445', u.id, 'completed', 191165.00, 0.00, 22939.80, 214104.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-11 10:00:00', '2026-01-11 10:00:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000446', u.id, 'processing', 36795.00, 0.00, 4415.40, 41210.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-10 05:01:00', '2026-01-10 05:01:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000447', u.id, 'completed', 107980.00, 0.00, 12957.60, 120937.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-03 20:08:00', '2026-01-03 20:08:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000448', u.id, 'processing', 161980.00, 0.00, 19437.60, 181417.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-01 06:02:00', '2026-01-01 06:02:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000449', u.id, 'processing', 67385.00, 0.00, 8086.20, 75471.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 16:08:00', '2026-01-01 16:08:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000450', u.id, 'processing', 68585.00, 0.00, 8230.20, 76815.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-07 10:44:00', '2026-01-07 10:44:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;

-- =====================================================
-- INSERT ORDER ITEMS
-- =====================================================

INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (1, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (2, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (2, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (2, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (3, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (4, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (4, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (4, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (5, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (5, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (5, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (6, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (6, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (6, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (6, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (7, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (8, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (9, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (10, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (10, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (10, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (11, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (11, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (12, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (12, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (12, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (12, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (13, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (13, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (13, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (14, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (14, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (14, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (15, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (15, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (16, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (16, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (16, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (16, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (17, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (17, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (18, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (19, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (20, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (20, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (20, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (20, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (21, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (22, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (23, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (23, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (23, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (24, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (25, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (25, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (25, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (26, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (26, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (26, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (26, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (27, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (27, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (27, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (28, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (28, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (29, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (29, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (29, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (30, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (30, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (31, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (31, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (31, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (31, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (32, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (32, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (32, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (32, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (33, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (33, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (33, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (33, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (34, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (35, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (35, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (35, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (35, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (36, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (36, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (37, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (37, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (38, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (38, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (38, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (38, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (39, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (40, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (40, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (40, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (40, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (41, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (41, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (41, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (42, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (42, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (42, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (43, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (43, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (43, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (43, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (44, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (44, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (45, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (45, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (46, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (46, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (46, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (47, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (47, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (47, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (47, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (48, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (48, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (48, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (48, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (49, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (49, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (49, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (49, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (50, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (50, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (50, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (50, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (51, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (52, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (52, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (52, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (53, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (54, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (54, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (55, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (55, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (55, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (56, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (56, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (56, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (56, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (57, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (57, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (58, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (59, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (59, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (59, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (60, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (60, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (60, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (60, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (61, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (61, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (62, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (62, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (62, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (62, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (63, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (63, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (64, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (64, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (65, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (66, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (67, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (67, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (67, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (67, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (68, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (68, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (68, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (68, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (69, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (70, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (71, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (71, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (72, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (72, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (72, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (72, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (73, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (73, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (74, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (75, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (75, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (75, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (75, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (76, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (76, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (76, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (77, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (77, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (77, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (77, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (78, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (78, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (78, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (79, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (80, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (80, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (80, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (81, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (81, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (81, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (81, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (82, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (83, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (83, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (83, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (83, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (84, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (84, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (84, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (85, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (85, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (85, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (86, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (86, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (86, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (87, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (87, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (88, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (88, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (89, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (89, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (90, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (90, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (91, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (91, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (91, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (91, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (92, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (93, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (93, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (93, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (93, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (94, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (94, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (94, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (95, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (95, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (96, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (96, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (96, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (96, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (97, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (97, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (97, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (97, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (98, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (98, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (99, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (100, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (100, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (100, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (101, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (101, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (101, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (101, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (102, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (102, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (102, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (102, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (103, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (104, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (104, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (105, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (105, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (106, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (106, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (107, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (107, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (107, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (107, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (108, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (108, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (108, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (108, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (109, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (109, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (109, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (109, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (110, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (110, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (110, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (111, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (111, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (112, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (112, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (112, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (112, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (113, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (114, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (114, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (114, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (115, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (116, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (116, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (116, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (117, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (117, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (117, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (117, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (118, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (119, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (120, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (120, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (121, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (121, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (121, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (121, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (122, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (122, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (122, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (123, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (123, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (123, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (123, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (124, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (124, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (124, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (124, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (125, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (126, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (126, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (126, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (127, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (127, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (127, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (127, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (128, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (129, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (130, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (130, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (130, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (130, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (131, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (131, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (132, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (132, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (132, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (132, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (133, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (133, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (133, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (133, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (134, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (134, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (135, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (135, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (136, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (136, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (136, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (136, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (137, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (137, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (137, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (137, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (138, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (138, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (139, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (139, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (139, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (139, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (140, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (140, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (140, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (141, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (141, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (142, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (142, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (143, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (143, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (143, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (143, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (144, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (144, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (145, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (145, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (145, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (145, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (146, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (147, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (148, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (148, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (149, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (149, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (150, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (150, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (150, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (150, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (151, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (151, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (151, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (152, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (153, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (153, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (153, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (154, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (154, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (154, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (155, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (155, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (155, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (155, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (156, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (157, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (157, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (157, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (158, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (158, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (158, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (158, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (159, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (160, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (160, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (160, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (161, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (161, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (161, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (162, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (162, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (163, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (164, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (165, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (165, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (166, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (166, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (166, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (166, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (167, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (168, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (168, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (168, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (168, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (169, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (169, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (169, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (169, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (170, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (171, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (171, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (172, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (172, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (173, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (173, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (173, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (174, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (174, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (174, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (174, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (175, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (176, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (176, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (177, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (178, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (178, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (179, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (179, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (180, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (180, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (181, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (181, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (181, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (182, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (183, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (183, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (184, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (185, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (185, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (186, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (187, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (187, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (187, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (188, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (188, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (189, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (190, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (190, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (190, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (190, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (191, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (192, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (192, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (192, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (193, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (193, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (193, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (193, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (194, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (194, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (194, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (194, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (195, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (195, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (196, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (196, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (196, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (196, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (197, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (197, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (197, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (198, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (198, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (198, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (199, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (199, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (199, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (200, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (200, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (200, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (200, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (201, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (201, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (202, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (202, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (203, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (203, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (203, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (204, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (204, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (204, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (205, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (206, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (206, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (206, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (206, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (207, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (207, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (208, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (208, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (209, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (209, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (209, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (209, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (210, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (210, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (210, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (211, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (212, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (212, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (213, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (213, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (213, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (214, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (214, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (214, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (215, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (215, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (215, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (215, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (216, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (216, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (216, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (216, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (217, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (217, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (217, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (217, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (218, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (218, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (218, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (219, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (219, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (219, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (220, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (220, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (220, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (220, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (221, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (221, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (221, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (221, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (222, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (223, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (223, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (224, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (224, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (224, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (225, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (225, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (225, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (225, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (226, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (226, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (227, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (227, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (227, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (227, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (228, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (229, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (229, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (230, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (230, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (230, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (231, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (231, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (231, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (231, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (232, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (233, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (233, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (233, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (234, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (234, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (234, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (234, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (235, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (235, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (236, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (236, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (237, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (237, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (238, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (238, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (238, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (239, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (239, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (239, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (240, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (240, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (240, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (240, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (241, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (241, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (242, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (242, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (242, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (242, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (243, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (243, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (244, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (245, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (245, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (245, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (246, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (247, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (247, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (247, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (247, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (248, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (248, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (249, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (249, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (249, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (249, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (250, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (250, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (250, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (251, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (252, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (252, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (253, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (253, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (253, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (254, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (254, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (255, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (255, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (255, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (256, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (256, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (256, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (257, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (257, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (257, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (258, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (258, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (259, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (259, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (259, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (259, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (260, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (261, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (261, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (261, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (262, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (262, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (263, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (263, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (264, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (264, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (264, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (264, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (265, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (265, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (265, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (265, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (266, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (266, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (266, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (266, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (267, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (267, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (267, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (268, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (268, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (268, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (268, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (269, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (269, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (270, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (270, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (270, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (271, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (271, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (271, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (272, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (272, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (273, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (273, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (273, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (273, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (274, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (274, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (274, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (275, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (276, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (276, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (276, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (277, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (277, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (277, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (277, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (278, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (279, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (279, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (279, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (280, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (281, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (281, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (281, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (282, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (283, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (283, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (284, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (284, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (285, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (285, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (285, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (286, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (286, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (286, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (286, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (287, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (287, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (287, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (288, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (288, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (288, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (289, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (289, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (289, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (289, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (290, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (290, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (291, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (291, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (291, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (291, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (292, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (293, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (293, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (294, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (294, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (295, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (295, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (295, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (295, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (296, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (296, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (297, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (297, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (298, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (298, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (298, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (298, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (299, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (300, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (300, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (300, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (301, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (301, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (301, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (301, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (302, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (302, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (302, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (303, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (304, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (305, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (306, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (306, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (307, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (308, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (308, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (308, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (309, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (309, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (309, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (310, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (311, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (312, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (312, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (312, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (312, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (313, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (314, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (314, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (315, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (316, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (316, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (316, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (317, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (317, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (317, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (317, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (318, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (318, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (318, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (319, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (319, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (319, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (319, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (320, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (320, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (320, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (321, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (321, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (322, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (322, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (322, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (322, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (323, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (323, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (324, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (325, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (325, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (326, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (326, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (327, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (327, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (327, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (327, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (328, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (328, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (329, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (330, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (330, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (330, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (330, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (331, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (331, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (332, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (333, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (333, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (333, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (334, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (334, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (334, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (334, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (335, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (335, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (335, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (336, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (336, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (336, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (336, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (337, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (337, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (337, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (337, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (338, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (338, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (338, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (338, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (339, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (339, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (339, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (340, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (341, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (341, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (342, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (342, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (343, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (343, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (343, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (344, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (345, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (345, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (345, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (346, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (346, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (347, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (347, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (347, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (347, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (348, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (348, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (348, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (349, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (350, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (350, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (350, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (351, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (351, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (351, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (351, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (352, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (353, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (353, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (353, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (354, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (354, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (354, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (354, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (355, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (356, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (356, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (356, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (356, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (357, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (358, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (359, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (359, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (360, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (361, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (361, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (361, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (362, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (363, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (364, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (364, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (365, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (365, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (365, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (365, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (366, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (367, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (367, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (368, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (368, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (368, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (369, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (369, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (369, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (370, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (370, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (370, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (370, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (371, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (371, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (371, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (372, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (373, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (373, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (373, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (374, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (374, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (374, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (374, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (375, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (375, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (376, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (376, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (377, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (377, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (378, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (378, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (379, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (379, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (380, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (380, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (380, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (381, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (382, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (382, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (383, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (383, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (383, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (384, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (384, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (384, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (385, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (385, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (385, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (386, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (386, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (387, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (387, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (387, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (387, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (388, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (388, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (388, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (388, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (389, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (389, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (389, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (389, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (390, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (390, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (391, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (391, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (391, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (391, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (392, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (392, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (393, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (393, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (393, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (393, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (394, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (394, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (394, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (395, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (395, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (396, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (396, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (397, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (397, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (397, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (398, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (398, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (398, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (399, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (399, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (399, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (399, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (400, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (401, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (401, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (401, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (401, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (402, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (402, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (402, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (403, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (404, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (405, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (405, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (405, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (406, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (406, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (406, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (406, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (407, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (407, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (407, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (408, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (408, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (409, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (409, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (409, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (409, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (410, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (410, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (411, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (411, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (411, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (411, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (412, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (412, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (412, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (413, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (413, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (414, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (414, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (414, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (414, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (415, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (415, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (415, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (415, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (416, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (416, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (416, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (416, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (417, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (417, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (417, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (418, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (418, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (419, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (419, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (420, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (420, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (421, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (421, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (422, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (422, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (422, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (422, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (423, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (423, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (423, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (423, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (424, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (424, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (424, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (424, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (425, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (425, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (426, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (427, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (427, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (427, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (427, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (428, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (429, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (430, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (430, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (430, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (431, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (431, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (431, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (431, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (432, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (432, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (432, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (433, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (433, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (433, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (434, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (434, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (434, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (435, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (436, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (437, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (437, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (437, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (437, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (438, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (438, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (438, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (438, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (439, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (439, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (439, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (440, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (440, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (441, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (441, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (441, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (441, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (442, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (442, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (442, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (442, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (443, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (444, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (444, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (445, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (445, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (445, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (445, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (446, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (447, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (447, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (447, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (448, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (448, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (448, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (449, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (449, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (450, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (450, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00);

-- =====================================================
-- COMPLETION MESSAGE
-- =====================================================

SELECT '450 orders with items added successfully!' as message,
       '300 orders from 2025 (completed/cancelled)' as note_2025,
       '150 orders from 2026 (processing/shipped/completed)' as note_2026,
       'Sales dashboard now has data to display' as status;
