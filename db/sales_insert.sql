-- =====================================================
-- MyPC Database - Sales Data (Orders & Order Items)
-- =====================================================
-- Generated: 2026-01-11 10:00:09
-- Contains 450 orders (300 from 2025, 150 from 2026)
-- Run this after mypc_complete.sql and users_insert.sql
-- =====================================================

USE mypc_db;

-- =====================================================
-- INSERT ORDERS
-- =====================================================

INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000001', u.id, 'completed', 2495.00, 150.00, 299.40, 2944.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-07 02:11:00', '2025-05-07 02:11:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000002', u.id, 'completed', 24485.00, 0.00, 2938.20, 27423.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-18 23:02:00', '2025-07-18 23:02:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000003', u.id, 'completed', 6990.00, 0.00, 838.80, 7828.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-12-13 08:28:00', '2025-12-13 08:28:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000004', u.id, 'completed', 168975.00, 0.00, 20277.00, 189252.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-09-12 18:21:00', '2025-09-12 18:21:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000005', u.id, 'completed', 18995.00, 0.00, 2279.40, 21274.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-08 15:46:00', '2025-05-08 15:46:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000006', u.id, 'completed', 59980.00, 0.00, 7197.60, 67177.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-06 22:09:00', '2025-04-06 22:09:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000007', u.id, 'completed', 95980.00, 0.00, 11517.60, 107497.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-12-21 00:17:00', '2025-12-21 00:17:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000008', u.id, 'completed', 71965.00, 0.00, 8635.80, 80600.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-12-09 03:23:00', '2025-12-09 03:23:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000009', u.id, 'completed', 189970.00, 0.00, 22796.40, 212766.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-07 13:00:00', '2025-08-07 13:00:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000010', u.id, 'cancelled', 48980.00, 0.00, 5877.60, 54857.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-02-16 14:10:00', '2025-02-16 14:10:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000011', u.id, 'cancelled', 52475.00, 0.00, 6297.00, 58772.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-27 17:39:00', '2025-08-27 17:39:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000012', u.id, 'cancelled', 44985.00, 0.00, 5398.20, 50383.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-05-28 12:56:00', '2025-05-28 12:56:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000013', u.id, 'completed', 3995.00, 150.00, 479.40, 4624.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-25 16:05:00', '2025-03-25 16:05:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000014', u.id, 'completed', 74565.00, 0.00, 8947.80, 83512.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-25 06:57:00', '2025-11-25 06:57:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000015', u.id, 'completed', 19485.00, 0.00, 2338.20, 21823.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-01-17 19:22:00', '2025-01-17 19:22:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000016', u.id, 'completed', 24480.00, 0.00, 2937.60, 27417.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2025-05-05 20:07:00', '2025-05-05 20:07:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000017', u.id, 'completed', 32290.00, 0.00, 3874.80, 36164.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-01 14:44:00', '2025-01-01 14:44:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000018', u.id, 'cancelled', 83970.00, 0.00, 10076.40, 94046.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-08-11 13:27:00', '2025-08-11 13:27:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000019', u.id, 'completed', 45990.00, 0.00, 5518.80, 51508.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-01-23 04:20:00', '2025-01-23 04:20:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000020', u.id, 'completed', 8990.00, 0.00, 1078.80, 10068.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-09-24 21:37:00', '2025-09-24 21:37:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000021', u.id, 'cancelled', 39280.00, 0.00, 4713.60, 43993.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-07-09 14:42:00', '2025-07-09 14:42:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000022', u.id, 'completed', 77960.00, 0.00, 9355.20, 87315.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-10-17 03:07:00', '2025-10-17 03:07:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000023', u.id, 'completed', 69470.00, 0.00, 8336.40, 77806.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-04-07 09:58:00', '2025-04-07 09:58:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000024', u.id, 'completed', 62475.00, 0.00, 7497.00, 69972.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-04 06:49:00', '2025-09-04 06:49:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000025', u.id, 'completed', 28470.00, 0.00, 3416.40, 31886.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-02-23 00:30:00', '2025-02-23 00:30:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000026', u.id, 'completed', 52570.00, 0.00, 6308.40, 58878.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-04 03:54:00', '2025-11-04 03:54:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000027', u.id, 'cancelled', 32485.00, 0.00, 3898.20, 36383.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-03-23 22:56:00', '2025-03-23 22:56:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000028', u.id, 'completed', 27990.00, 0.00, 3358.80, 31348.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-14 06:48:00', '2025-06-14 06:48:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000029', u.id, 'completed', 121965.00, 0.00, 14635.80, 136600.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-06-15 17:01:00', '2025-06-15 17:01:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000030', u.id, 'completed', 7990.00, 0.00, 958.80, 8948.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-04 09:34:00', '2025-09-04 09:34:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000031', u.id, 'completed', 39985.00, 0.00, 4798.20, 44783.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-17 21:34:00', '2025-05-17 21:34:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000032', u.id, 'completed', 40475.00, 0.00, 4857.00, 45332.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2025-05-03 17:19:00', '2025-05-03 17:19:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000033', u.id, 'completed', 84975.00, 0.00, 10197.00, 95172.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-18 01:49:00', '2025-03-18 01:49:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000034', u.id, 'completed', 115975.00, 0.00, 13917.00, 129892.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-09 06:11:00', '2025-07-09 06:11:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000035', u.id, 'completed', 7990.00, 0.00, 958.80, 8948.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-08-30 13:43:00', '2025-08-30 13:43:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000036', u.id, 'completed', 19990.00, 0.00, 2398.80, 22388.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-10 13:59:00', '2025-01-10 13:59:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000037', u.id, 'cancelled', 79970.00, 0.00, 9596.40, 89566.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-03-08 09:26:00', '2025-03-08 09:26:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000038', u.id, 'completed', 34480.00, 0.00, 4137.60, 38617.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-28 18:17:00', '2025-07-28 18:17:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000039', u.id, 'cancelled', 81770.00, 0.00, 9812.40, 91582.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-09-25 16:43:00', '2025-09-25 16:43:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000040', u.id, 'completed', 57575.00, 0.00, 6909.00, 64484.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-12-08 16:21:00', '2025-12-08 16:21:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000041', u.id, 'completed', 126475.00, 0.00, 15177.00, 141652.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-27 09:22:00', '2025-05-27 09:22:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000042', u.id, 'completed', 10990.00, 0.00, 1318.80, 12308.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-17 06:06:00', '2025-03-17 06:06:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000043', u.id, 'completed', 58980.00, 0.00, 7077.60, 66057.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-07 03:29:00', '2025-12-07 03:29:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000044', u.id, 'completed', 51980.00, 0.00, 6237.60, 58217.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-10-20 10:47:00', '2025-10-20 10:47:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000045', u.id, 'completed', 84470.00, 0.00, 10136.40, 94606.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-07-01 10:50:00', '2025-07-01 10:50:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000046', u.id, 'completed', 92970.00, 0.00, 11156.40, 104126.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-09-30 15:20:00', '2025-09-30 15:20:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000047', u.id, 'completed', 84985.00, 0.00, 10198.20, 95183.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-01-05 09:16:00', '2025-01-05 09:16:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000048', u.id, 'completed', 51785.00, 0.00, 6214.20, 57999.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-04 21:07:00', '2025-07-04 21:07:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000049', u.id, 'cancelled', 60970.00, 0.00, 7316.40, 68286.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-01 13:57:00', '2025-07-01 13:57:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000050', u.id, 'completed', 22790.00, 0.00, 2734.80, 25524.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-10 01:41:00', '2025-04-10 01:41:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000051', u.id, 'completed', 87475.00, 0.00, 10497.00, 97972.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-04 11:11:00', '2025-12-04 11:11:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000052', u.id, 'completed', 53980.00, 0.00, 6477.60, 60457.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-26 11:13:00', '2025-07-26 11:13:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000053', u.id, 'cancelled', 26480.00, 0.00, 3177.60, 29657.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-05-23 09:44:00', '2025-05-23 09:44:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000054', u.id, 'completed', 10485.00, 0.00, 1258.20, 11743.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-09-15 11:53:00', '2025-09-15 11:53:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000055', u.id, 'cancelled', 119980.00, 0.00, 14397.60, 134377.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-15 20:14:00', '2025-05-15 20:14:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000056', u.id, 'completed', 31780.00, 0.00, 3813.60, 35593.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-10 12:50:00', '2025-08-10 12:50:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000057', u.id, 'completed', 3495.00, 150.00, 419.40, 4064.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-10-12 11:27:00', '2025-10-12 11:27:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000058', u.id, 'completed', 156970.00, 0.00, 18836.40, 175806.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-09-10 21:05:00', '2025-09-10 21:05:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000059', u.id, 'completed', 3995.00, 150.00, 479.40, 4624.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-14 09:14:00', '2025-02-14 09:14:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000060', u.id, 'completed', 98985.00, 0.00, 11878.20, 110863.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-14 11:24:00', '2025-11-14 11:24:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000061', u.id, 'completed', 7990.00, 0.00, 958.80, 8948.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-12 14:28:00', '2025-04-12 14:28:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000062', u.id, 'completed', 10985.00, 0.00, 1318.20, 12303.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-19 19:02:00', '2025-03-19 19:02:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000063', u.id, 'completed', 48470.00, 0.00, 5816.40, 54286.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-09-02 11:04:00', '2025-09-02 11:04:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000064', u.id, 'cancelled', 75975.00, 0.00, 9117.00, 85092.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-10-23 18:12:00', '2025-10-23 18:12:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000065', u.id, 'completed', 38985.00, 0.00, 4678.20, 43663.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-26 13:14:00', '2025-03-26 13:14:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000066', u.id, 'completed', 78070.00, 0.00, 9368.40, 87438.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-01-10 18:57:00', '2025-01-10 18:57:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000067', u.id, 'completed', 18995.00, 0.00, 2279.40, 21274.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-05 10:12:00', '2025-03-05 10:12:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000068', u.id, 'completed', 71485.00, 0.00, 8578.20, 80063.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-05-30 09:00:00', '2025-05-30 09:00:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000069', u.id, 'cancelled', 21485.00, 0.00, 2578.20, 24063.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-11 18:23:00', '2025-03-11 18:23:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000070', u.id, 'completed', 22490.00, 0.00, 2698.80, 25188.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-05-18 00:17:00', '2025-05-18 00:17:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000071', u.id, 'completed', 28485.00, 0.00, 3418.20, 31903.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-17 12:12:00', '2025-07-17 12:12:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000072', u.id, 'completed', 39980.00, 0.00, 4797.60, 44777.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-13 23:58:00', '2025-08-13 23:58:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000073', u.id, 'completed', 50080.00, 0.00, 6009.60, 56089.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-09 12:47:00', '2025-06-09 12:47:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000074', u.id, 'completed', 62980.00, 0.00, 7557.60, 70537.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-10-03 03:32:00', '2025-10-03 03:32:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000075', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-18 06:08:00', '2025-03-18 06:08:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000076', u.id, 'completed', 47990.00, 0.00, 5758.80, 53748.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-10 10:48:00', '2025-12-10 10:48:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000077', u.id, 'completed', 3495.00, 150.00, 419.40, 4064.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-10-15 22:03:00', '2025-10-15 22:03:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000078', u.id, 'completed', 42485.00, 0.00, 5098.20, 47583.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-07 09:44:00', '2025-05-07 09:44:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000079', u.id, 'cancelled', 5495.00, 0.00, 659.40, 6154.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-11-22 18:03:00', '2025-11-22 18:03:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000080', u.id, 'completed', 98970.00, 0.00, 11876.40, 110846.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-29 18:34:00', '2025-08-29 18:34:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000081', u.id, 'completed', 88470.00, 0.00, 10616.40, 99086.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-01 17:37:00', '2025-11-01 17:37:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000082', u.id, 'completed', 88975.00, 0.00, 10677.00, 99652.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-09-25 23:07:00', '2025-09-25 23:07:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000083', u.id, 'completed', 66980.00, 0.00, 8037.60, 75017.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-07-05 06:50:00', '2025-07-05 06:50:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000084', u.id, 'completed', 16990.00, 0.00, 2038.80, 19028.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-11 00:58:00', '2025-05-11 00:58:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000085', u.id, 'cancelled', 19975.00, 0.00, 2397.00, 22372.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-08-07 05:50:00', '2025-08-07 05:50:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000086', u.id, 'completed', 66470.00, 0.00, 7976.40, 74446.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-02 05:29:00', '2025-02-02 05:29:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000087', u.id, 'completed', 115470.00, 0.00, 13856.40, 129326.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-29 16:22:00', '2025-06-29 16:22:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000088', u.id, 'cancelled', 2495.00, 150.00, 299.40, 2944.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-21 21:18:00', '2025-04-21 21:18:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000089', u.id, 'completed', 64970.00, 0.00, 7796.40, 72766.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-08 09:26:00', '2025-06-08 09:26:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000090', u.id, 'completed', 51475.00, 0.00, 6177.00, 57652.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-15 05:13:00', '2025-06-15 05:13:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000091', u.id, 'cancelled', 80980.00, 0.00, 9717.60, 90697.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-08-31 09:46:00', '2025-08-31 09:46:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000092', u.id, 'cancelled', 29990.00, 0.00, 3598.80, 33588.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-04 12:19:00', '2025-08-04 12:19:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000093', u.id, 'completed', 12985.00, 0.00, 1558.20, 14543.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2025-06-08 19:24:00', '2025-06-08 19:24:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000094', u.id, 'completed', 79965.00, 0.00, 9595.80, 89560.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-01-17 05:44:00', '2025-01-17 05:44:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000095', u.id, 'completed', 38485.00, 0.00, 4618.20, 43103.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-09-25 16:17:00', '2025-09-25 16:17:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000096', u.id, 'completed', 5990.00, 0.00, 718.80, 6708.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-03-08 04:40:00', '2025-03-08 04:40:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000097', u.id, 'completed', 66070.00, 0.00, 7928.40, 73998.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-23 06:12:00', '2025-01-23 06:12:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000098', u.id, 'cancelled', 53480.00, 0.00, 6417.60, 59897.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-07 17:53:00', '2025-08-07 17:53:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000099', u.id, 'cancelled', 43980.00, 0.00, 5277.60, 49257.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-03 05:19:00', '2025-04-03 05:19:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000100', u.id, 'completed', 32975.00, 0.00, 3957.00, 36932.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-03-14 13:45:00', '2025-03-14 13:45:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000101', u.id, 'completed', 80965.00, 0.00, 9715.80, 90680.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-03 10:52:00', '2025-11-03 10:52:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000102', u.id, 'completed', 68475.00, 0.00, 8217.00, 76692.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-10 21:45:00', '2025-01-10 21:45:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000103', u.id, 'completed', 19485.00, 0.00, 2338.20, 21823.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-02-02 14:35:00', '2025-02-02 14:35:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000104', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-08-03 21:46:00', '2025-08-03 21:46:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000105', u.id, 'completed', 25990.00, 0.00, 3118.80, 29108.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-05-30 17:13:00', '2025-05-30 17:13:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000106', u.id, 'cancelled', 67475.00, 0.00, 8097.00, 75572.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-10-07 10:17:00', '2025-10-07 10:17:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000107', u.id, 'completed', 5495.00, 0.00, 659.40, 6154.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-10-07 02:48:00', '2025-10-07 02:48:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000108', u.id, 'completed', 38475.00, 0.00, 4617.00, 43092.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-19 20:14:00', '2025-03-19 20:14:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000109', u.id, 'completed', 34585.00, 0.00, 4150.20, 38735.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-09-13 03:14:00', '2025-09-13 03:14:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000110', u.id, 'completed', 88275.00, 0.00, 10593.00, 98868.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-02-06 23:21:00', '2025-02-06 23:21:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000111', u.id, 'completed', 62575.00, 0.00, 7509.00, 70084.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-10-01 23:37:00', '2025-10-01 23:37:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000112', u.id, 'completed', 46480.00, 0.00, 5577.60, 52057.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-03-29 13:06:00', '2025-03-29 13:06:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000113', u.id, 'completed', 60475.00, 0.00, 7257.00, 67732.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-01-11 09:32:00', '2025-01-11 09:32:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000114', u.id, 'completed', 55775.00, 0.00, 6693.00, 62468.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-15 18:09:00', '2025-05-15 18:09:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000115', u.id, 'completed', 80965.00, 0.00, 9715.80, 90680.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-27 12:10:00', '2025-07-27 12:10:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000116', u.id, 'completed', 119965.00, 0.00, 14395.80, 134360.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-19 20:37:00', '2025-04-19 20:37:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000117', u.id, 'completed', 37980.00, 0.00, 4557.60, 42537.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-23 17:05:00', '2025-09-23 17:05:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000118', u.id, 'completed', 45480.00, 0.00, 5457.60, 50937.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-08-17 04:49:00', '2025-08-17 04:49:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000119', u.id, 'completed', 46960.00, 0.00, 5635.20, 52595.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-01-24 22:36:00', '2025-01-24 22:36:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000120', u.id, 'completed', 47975.00, 0.00, 5757.00, 53732.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-04 08:42:00', '2025-01-04 08:42:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000121', u.id, 'completed', 68770.00, 0.00, 8252.40, 77022.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-03-22 08:49:00', '2025-03-22 08:49:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000122', u.id, 'completed', 71980.00, 0.00, 8637.60, 80617.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-08-05 16:06:00', '2025-08-05 16:06:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000123', u.id, 'completed', 26995.00, 0.00, 3239.40, 30234.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-08-15 18:23:00', '2025-08-15 18:23:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000124', u.id, 'completed', 13990.00, 0.00, 1678.80, 15668.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-11 03:19:00', '2025-04-11 03:19:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000125', u.id, 'completed', 44470.00, 0.00, 5336.40, 49806.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-14 20:26:00', '2025-09-14 20:26:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000126', u.id, 'completed', 8990.00, 0.00, 1078.80, 10068.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-09-14 12:45:00', '2025-09-14 12:45:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000127', u.id, 'completed', 62485.00, 0.00, 7498.20, 69983.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-03-06 18:26:00', '2025-03-06 18:26:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000128', u.id, 'completed', 42995.00, 0.00, 5159.40, 48154.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-16 21:15:00', '2025-06-16 21:15:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000129', u.id, 'completed', 29470.00, 0.00, 3536.40, 33006.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-27 07:16:00', '2025-06-27 07:16:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000130', u.id, 'completed', 67975.00, 0.00, 8157.00, 76132.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-11-26 08:31:00', '2025-11-26 08:31:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000131', u.id, 'cancelled', 36985.00, 0.00, 4438.20, 41423.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-03-09 03:44:00', '2025-03-09 03:44:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000132', u.id, 'cancelled', 6995.00, 0.00, 839.40, 7834.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-02-13 01:09:00', '2025-02-13 01:09:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000133', u.id, 'completed', 47480.00, 0.00, 5697.60, 53177.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-15 05:50:00', '2025-10-15 05:50:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000134', u.id, 'completed', 45980.00, 0.00, 5517.60, 51497.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-29 02:04:00', '2025-11-29 02:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000135', u.id, 'completed', 58985.00, 0.00, 7078.20, 66063.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-11 06:25:00', '2025-12-11 06:25:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000136', u.id, 'completed', 123960.00, 0.00, 14875.20, 138835.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-06-04 14:59:00', '2025-06-04 14:59:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000137', u.id, 'completed', 35985.00, 0.00, 4318.20, 40303.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-14 22:02:00', '2025-07-14 22:02:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000138', u.id, 'completed', 36975.00, 0.00, 4437.00, 41412.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-03-07 02:17:00', '2025-03-07 02:17:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000139', u.id, 'completed', 38975.00, 0.00, 4677.00, 43652.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-12 18:38:00', '2025-12-12 18:38:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000140', u.id, 'cancelled', 13795.00, 0.00, 1655.40, 15450.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-02-18 03:47:00', '2025-02-18 03:47:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000141', u.id, 'completed', 103480.00, 0.00, 12417.60, 115897.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-03-30 16:40:00', '2025-03-30 16:40:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000142', u.id, 'completed', 24475.00, 0.00, 2937.00, 27412.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-21 00:31:00', '2025-11-21 00:31:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000143', u.id, 'completed', 71980.00, 0.00, 8637.60, 80617.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2025-01-25 12:18:00', '2025-01-25 12:18:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000144', u.id, 'completed', 15980.00, 0.00, 1917.60, 17897.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-05-20 23:16:00', '2025-05-20 23:16:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000145', u.id, 'cancelled', 18985.00, 0.00, 2278.20, 21263.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-13 09:54:00', '2025-10-13 09:54:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000146', u.id, 'completed', 36990.00, 0.00, 4438.80, 41428.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-09-14 09:22:00', '2025-09-14 09:22:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000147', u.id, 'completed', 74970.00, 0.00, 8996.40, 83966.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-26 22:02:00', '2025-07-26 22:02:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000148', u.id, 'cancelled', 98470.00, 0.00, 11816.40, 110286.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-12-27 06:01:00', '2025-12-27 06:01:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000149', u.id, 'completed', 24490.00, 0.00, 2938.80, 27428.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-08-27 22:47:00', '2025-08-27 22:47:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000150', u.id, 'completed', 88470.00, 0.00, 10616.40, 99086.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-04-23 23:18:00', '2025-04-23 23:18:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000151', u.id, 'completed', 42995.00, 0.00, 5159.40, 48154.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-03 14:36:00', '2025-06-03 14:36:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000152', u.id, 'completed', 38080.00, 0.00, 4569.60, 42649.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-10-23 12:59:00', '2025-10-23 12:59:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000153', u.id, 'completed', 94970.00, 0.00, 11396.40, 106366.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-17 00:28:00', '2025-12-17 00:28:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000154', u.id, 'completed', 41475.00, 0.00, 4977.00, 46452.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-04-22 11:50:00', '2025-04-22 11:50:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000155', u.id, 'completed', 60985.00, 0.00, 7318.20, 68303.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-17 20:29:00', '2025-10-17 20:29:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000156', u.id, 'completed', 27995.00, 0.00, 3359.40, 31354.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-27 23:57:00', '2025-05-27 23:57:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000157', u.id, 'completed', 11990.00, 0.00, 1438.80, 13428.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-12-19 19:17:00', '2025-12-19 19:17:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000158', u.id, 'completed', 76280.00, 0.00, 9153.60, 85433.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-10 11:02:00', '2025-02-10 11:02:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000159', u.id, 'cancelled', 23995.00, 0.00, 2879.40, 26874.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-02-12 15:20:00', '2025-02-12 15:20:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000160', u.id, 'completed', 92965.00, 0.00, 11155.80, 104120.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-13 13:49:00', '2025-06-13 13:49:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000161', u.id, 'completed', 96975.00, 0.00, 11637.00, 108612.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-01-05 20:53:00', '2025-01-05 20:53:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000162', u.id, 'cancelled', 15985.00, 0.00, 1918.20, 17903.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-06-30 09:21:00', '2025-06-30 09:21:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000163', u.id, 'completed', 34985.00, 0.00, 4198.20, 39183.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-07-27 19:42:00', '2025-07-27 19:42:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000164', u.id, 'completed', 11980.00, 0.00, 1437.60, 13417.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-17 20:19:00', '2025-04-17 20:19:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000165', u.id, 'completed', 62980.00, 0.00, 7557.60, 70537.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-16 16:31:00', '2025-07-16 16:31:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000166', u.id, 'completed', 124975.00, 0.00, 14997.00, 139972.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-22 23:47:00', '2025-12-22 23:47:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000167', u.id, 'completed', 53470.00, 0.00, 6416.40, 59886.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-01-29 00:29:00', '2025-01-29 00:29:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000168', u.id, 'completed', 17485.00, 0.00, 2098.20, 19583.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-28 21:54:00', '2025-11-28 21:54:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000169', u.id, 'cancelled', 102980.00, 0.00, 12357.60, 115337.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-03-14 20:17:00', '2025-03-14 20:17:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000170', u.id, 'completed', 35480.00, 0.00, 4257.60, 39737.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-06 06:20:00', '2025-11-06 06:20:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000171', u.id, 'completed', 23995.00, 0.00, 2879.40, 26874.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-03-19 16:02:00', '2025-03-19 16:02:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000172', u.id, 'completed', 57970.00, 0.00, 6956.40, 64926.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-12-01 15:31:00', '2025-12-01 15:31:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000173', u.id, 'cancelled', 87470.00, 0.00, 10496.40, 97966.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-05-23 11:33:00', '2025-05-23 11:33:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000174', u.id, 'completed', 26995.00, 0.00, 3239.40, 30234.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-07 08:14:00', '2025-06-07 08:14:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000175', u.id, 'completed', 29990.00, 0.00, 3598.80, 33588.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-19 04:06:00', '2025-07-19 04:06:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000176', u.id, 'completed', 35965.00, 0.00, 4315.80, 40280.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-23 07:12:00', '2025-07-23 07:12:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000177', u.id, 'completed', 49465.00, 0.00, 5935.80, 55400.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-11-24 01:58:00', '2025-11-24 01:58:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000178', u.id, 'completed', 73480.00, 0.00, 8817.60, 82297.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-24 17:37:00', '2025-08-24 17:37:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000179', u.id, 'completed', 10990.00, 0.00, 1318.80, 12308.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-11 00:58:00', '2025-06-11 00:58:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000180', u.id, 'completed', 18495.00, 0.00, 2219.40, 20714.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-08-08 05:09:00', '2025-08-08 05:09:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000181', u.id, 'completed', 56980.00, 0.00, 6837.60, 63817.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-24 11:56:00', '2025-08-24 11:56:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000182', u.id, 'completed', 27780.00, 0.00, 3333.60, 31113.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-22 01:48:00', '2025-06-22 01:48:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000183', u.id, 'completed', 43985.00, 0.00, 5278.20, 49263.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-21 01:22:00', '2025-06-21 01:22:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000184', u.id, 'cancelled', 70985.00, 0.00, 8518.20, 79503.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-30 08:37:00', '2025-03-30 08:37:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000185', u.id, 'cancelled', 54770.00, 0.00, 6572.40, 61342.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-29 03:03:00', '2025-08-29 03:03:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000186', u.id, 'completed', 12995.00, 0.00, 1559.40, 14554.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-11 06:52:00', '2025-03-11 06:52:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000187', u.id, 'completed', 39470.00, 0.00, 4736.40, 44206.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-08 19:01:00', '2025-04-08 19:01:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000188', u.id, 'completed', 76980.00, 0.00, 9237.60, 86217.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-29 08:38:00', '2025-09-29 08:38:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000189', u.id, 'cancelled', 9490.00, 0.00, 1138.80, 10628.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-20 15:05:00', '2025-09-20 15:05:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000190', u.id, 'completed', 88980.00, 0.00, 10677.60, 99657.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-07-03 20:45:00', '2025-07-03 20:45:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000191', u.id, 'completed', 49980.00, 0.00, 5997.60, 55977.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-10-07 21:01:00', '2025-10-07 21:01:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000192', u.id, 'completed', 2495.00, 150.00, 299.40, 2944.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-08 12:54:00', '2025-04-08 12:54:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000193', u.id, 'completed', 28970.00, 0.00, 3476.40, 32446.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-26 06:44:00', '2025-06-26 06:44:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000194', u.id, 'completed', 74470.00, 0.00, 8936.40, 83406.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-05-28 09:04:00', '2025-05-28 09:04:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000195', u.id, 'completed', 27995.00, 0.00, 3359.40, 31354.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-19 10:05:00', '2025-07-19 10:05:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000196', u.id, 'cancelled', 26790.00, 0.00, 3214.80, 30004.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-01-08 01:03:00', '2025-01-08 01:03:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000197', u.id, 'completed', 23995.00, 0.00, 2879.40, 26874.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-21 12:02:00', '2025-08-21 12:02:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000198', u.id, 'completed', 187965.00, 0.00, 22555.80, 210520.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-30 18:49:00', '2025-06-30 18:49:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000199', u.id, 'completed', 54970.00, 0.00, 6596.40, 61566.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-08-28 07:42:00', '2025-08-28 07:42:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000200', u.id, 'completed', 45470.00, 0.00, 5456.40, 50926.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-05-07 08:49:00', '2025-05-07 08:49:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000201', u.id, 'cancelled', 135470.00, 0.00, 16256.40, 151726.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-12-08 06:17:00', '2025-12-08 06:17:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000202', u.id, 'completed', 43980.00, 0.00, 5277.60, 49257.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-17 02:30:00', '2025-07-17 02:30:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000203', u.id, 'completed', 40980.00, 0.00, 4917.60, 45897.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-12 22:44:00', '2025-03-12 22:44:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000204', u.id, 'completed', 23975.00, 0.00, 2877.00, 26852.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-12 10:34:00', '2025-10-12 10:34:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000205', u.id, 'cancelled', 11985.00, 0.00, 1438.20, 13423.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-19 00:06:00', '2025-11-19 00:06:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000206', u.id, 'completed', 56785.00, 0.00, 6814.20, 63599.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-09 21:51:00', '2025-03-09 21:51:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000207', u.id, 'completed', 10985.00, 0.00, 1318.20, 12303.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-19 11:55:00', '2025-07-19 11:55:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000208', u.id, 'completed', 135470.00, 0.00, 16256.40, 151726.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-07-20 21:10:00', '2025-07-20 21:10:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000209', u.id, 'completed', 44985.00, 0.00, 5398.20, 50383.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-08-11 13:03:00', '2025-08-11 13:03:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000210', u.id, 'completed', 109970.00, 0.00, 13196.40, 123166.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-03 11:16:00', '2025-06-03 11:16:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000211', u.id, 'completed', 48975.00, 0.00, 5877.00, 54852.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-07-19 13:16:00', '2025-07-19 13:16:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000212', u.id, 'cancelled', 56980.00, 0.00, 6837.60, 63817.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-13 20:29:00', '2025-03-13 20:29:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000213', u.id, 'completed', 14485.00, 0.00, 1738.20, 16223.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-10-29 10:51:00', '2025-10-29 10:51:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000214', u.id, 'completed', 17990.00, 0.00, 2158.80, 20148.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-08-13 10:52:00', '2025-08-13 10:52:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000215', u.id, 'cancelled', 184465.00, 0.00, 22135.80, 206600.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-07-03 08:13:00', '2025-07-03 08:13:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000216', u.id, 'completed', 13990.00, 0.00, 1678.80, 15668.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-10 20:37:00', '2025-11-10 20:37:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000217', u.id, 'completed', 107970.00, 0.00, 12956.40, 120926.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-02-25 01:04:00', '2025-02-25 01:04:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000218', u.id, 'cancelled', 6995.00, 0.00, 839.40, 7834.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-14 01:48:00', '2025-10-14 01:48:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000219', u.id, 'completed', 126465.00, 0.00, 15175.80, 141640.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-05 16:37:00', '2025-06-05 16:37:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000220', u.id, 'completed', 40475.00, 0.00, 4857.00, 45332.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-03 00:02:00', '2025-01-03 00:02:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000221', u.id, 'completed', 41980.00, 0.00, 5037.60, 47017.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-09-17 04:24:00', '2025-09-17 04:24:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000222', u.id, 'completed', 38985.00, 0.00, 4678.20, 43663.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-22 08:35:00', '2025-11-22 08:35:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000223', u.id, 'completed', 28480.00, 0.00, 3417.60, 31897.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-05-10 21:51:00', '2025-05-10 21:51:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000224', u.id, 'completed', 39975.00, 0.00, 4797.00, 44772.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-20 23:21:00', '2025-11-20 23:21:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000225', u.id, 'completed', 23995.00, 0.00, 2879.40, 26874.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-05-28 20:46:00', '2025-05-28 20:46:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000226', u.id, 'completed', 5495.00, 0.00, 659.40, 6154.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-26 06:16:00', '2025-03-26 06:16:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000227', u.id, 'cancelled', 33990.00, 0.00, 4078.80, 38068.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-12 16:50:00', '2025-11-12 16:50:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000228', u.id, 'completed', 73965.00, 0.00, 8875.80, 82840.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-07-14 00:54:00', '2025-07-14 00:54:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000229', u.id, 'completed', 45965.00, 0.00, 5515.80, 51480.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-05 00:06:00', '2025-04-05 00:06:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000230', u.id, 'completed', 95960.00, 0.00, 11515.20, 107475.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-03 07:48:00', '2025-05-03 07:48:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000231', u.id, 'completed', 67980.00, 0.00, 8157.60, 76137.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-04-05 10:01:00', '2025-04-05 10:01:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000232', u.id, 'completed', 57080.00, 0.00, 6849.60, 63929.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-20 07:30:00', '2025-10-20 07:30:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000233', u.id, 'cancelled', 49475.00, 0.00, 5937.00, 55412.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-23 01:16:00', '2025-06-23 01:16:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000234', u.id, 'completed', 18995.00, 0.00, 2279.40, 21274.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-10-01 19:56:00', '2025-10-01 19:56:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000235', u.id, 'completed', 22985.00, 0.00, 2758.20, 25743.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-28 08:31:00', '2025-12-28 08:31:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000236', u.id, 'completed', 44475.00, 0.00, 5337.00, 49812.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-06-15 11:29:00', '2025-06-15 11:29:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000237', u.id, 'completed', 6990.00, 0.00, 838.80, 7828.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-11-08 11:19:00', '2025-11-08 11:19:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000238', u.id, 'cancelled', 56770.00, 0.00, 6812.40, 63582.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-23 03:43:00', '2025-04-23 03:43:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000239', u.id, 'completed', 74960.00, 0.00, 8995.20, 83955.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-05 02:26:00', '2025-12-05 02:26:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000240', u.id, 'completed', 46975.00, 0.00, 5637.00, 52612.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-02 22:36:00', '2025-09-02 22:36:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000241', u.id, 'completed', 37970.00, 0.00, 4556.40, 42526.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-03-06 20:01:00', '2025-03-06 20:01:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000242', u.id, 'completed', 27985.00, 0.00, 3358.20, 31343.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-23 10:30:00', '2025-09-23 10:30:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000243', u.id, 'completed', 47990.00, 0.00, 5758.80, 53748.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-04-14 01:37:00', '2025-04-14 01:37:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000244', u.id, 'completed', 4990.00, 150.00, 598.80, 5738.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-05 15:57:00', '2025-02-05 15:57:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000245', u.id, 'cancelled', 33990.00, 0.00, 4078.80, 38068.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-02-22 17:01:00', '2025-02-22 17:01:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000246', u.id, 'completed', 16485.00, 0.00, 1978.20, 18463.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-08-03 06:30:00', '2025-08-03 06:30:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000247', u.id, 'cancelled', 56075.00, 0.00, 6729.00, 62804.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-27 12:25:00', '2025-06-27 12:25:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000248', u.id, 'completed', 116575.00, 0.00, 13989.00, 130564.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-11-20 23:02:00', '2025-11-20 23:02:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000249', u.id, 'completed', 39475.00, 0.00, 4737.00, 44212.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-11-25 16:18:00', '2025-11-25 16:18:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000250', u.id, 'completed', 6990.00, 0.00, 838.80, 7828.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-10-06 11:38:00', '2025-10-06 11:38:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000251', u.id, 'completed', 105965.00, 0.00, 12715.80, 118680.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-04-06 10:25:00', '2025-04-06 10:25:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000252', u.id, 'completed', 70470.00, 0.00, 8456.40, 78926.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2025-06-13 19:48:00', '2025-06-13 19:48:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000253', u.id, 'completed', 72475.00, 0.00, 8697.00, 81172.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-11-07 22:59:00', '2025-11-07 22:59:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000254', u.id, 'completed', 5990.00, 0.00, 718.80, 6708.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-08 15:19:00', '2025-06-08 15:19:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000255', u.id, 'completed', 13795.00, 0.00, 1655.40, 15450.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-10-07 12:27:00', '2025-10-07 12:27:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000256', u.id, 'cancelled', 53475.00, 0.00, 6417.00, 59892.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-20 07:07:00', '2025-09-20 07:07:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000257', u.id, 'completed', 4495.00, 150.00, 539.40, 5184.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-10-10 14:48:00', '2025-10-10 14:48:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000258', u.id, 'completed', 70475.00, 0.00, 8457.00, 78932.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-01 17:13:00', '2025-05-01 17:13:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000259', u.id, 'completed', 31285.00, 0.00, 3754.20, 35039.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-30 21:35:00', '2025-06-30 21:35:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000260', u.id, 'completed', 68485.00, 0.00, 8218.20, 76703.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-05-10 01:37:00', '2025-05-10 01:37:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000261', u.id, 'completed', 38975.00, 0.00, 4677.00, 43652.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-13 07:59:00', '2025-07-13 07:59:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000262', u.id, 'completed', 73975.00, 0.00, 8877.00, 82852.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-11-24 02:36:00', '2025-11-24 02:36:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000263', u.id, 'completed', 64980.00, 0.00, 7797.60, 72777.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-18 20:02:00', '2025-05-18 20:02:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000264', u.id, 'completed', 21480.00, 0.00, 2577.60, 24057.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-09-12 08:39:00', '2025-09-12 08:39:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000265', u.id, 'completed', 27990.00, 0.00, 3358.80, 31348.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-09-05 12:24:00', '2025-09-05 12:24:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000266', u.id, 'completed', 19990.00, 0.00, 2398.80, 22388.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-12 18:35:00', '2025-05-12 18:35:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000267', u.id, 'completed', 20990.00, 0.00, 2518.80, 23508.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-15 19:06:00', '2025-08-15 19:06:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000268', u.id, 'completed', 11990.00, 0.00, 1438.80, 13428.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-11-19 06:38:00', '2025-11-19 06:38:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000269', u.id, 'completed', 25975.00, 0.00, 3117.00, 29092.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-11 11:21:00', '2025-07-11 11:21:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000270', u.id, 'completed', 56970.00, 0.00, 6836.40, 63806.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-19 18:44:00', '2025-11-19 18:44:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000271', u.id, 'completed', 26980.00, 0.00, 3237.60, 30217.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-12-07 18:39:00', '2025-12-07 18:39:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000272', u.id, 'completed', 96470.00, 0.00, 11576.40, 108046.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-26 01:24:00', '2025-03-26 01:24:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000273', u.id, 'completed', 118960.00, 0.00, 14275.20, 133235.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-12-22 12:53:00', '2025-12-22 12:53:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000274', u.id, 'completed', 34985.00, 0.00, 4198.20, 39183.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-24 08:12:00', '2025-03-24 08:12:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000275', u.id, 'cancelled', 22975.00, 0.00, 2757.00, 25732.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-01 06:23:00', '2025-07-01 06:23:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000276', u.id, 'completed', 10985.00, 0.00, 1318.20, 12303.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-21 13:13:00', '2025-02-21 13:13:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000277', u.id, 'completed', 126970.00, 0.00, 15236.40, 142206.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-29 02:01:00', '2025-04-29 02:01:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000278', u.id, 'completed', 60575.00, 0.00, 7269.00, 67844.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-03-16 07:00:00', '2025-03-16 07:00:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000279', u.id, 'completed', 93980.00, 0.00, 11277.60, 105257.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-08-08 03:24:00', '2025-08-08 03:24:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000280', u.id, 'completed', 5495.00, 0.00, 659.40, 6154.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-31 13:45:00', '2025-03-31 13:45:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000281', u.id, 'completed', 49570.00, 0.00, 5948.40, 55518.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-01-25 00:01:00', '2025-01-25 00:01:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000282', u.id, 'completed', 42470.00, 0.00, 5096.40, 47566.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-10-02 06:51:00', '2025-10-02 06:51:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000283', u.id, 'completed', 70960.00, 0.00, 8515.20, 79475.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-13 07:42:00', '2025-07-13 07:42:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000284', u.id, 'completed', 25985.00, 0.00, 3118.20, 29103.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-07-03 06:43:00', '2025-07-03 06:43:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000285', u.id, 'cancelled', 80560.00, 0.00, 9667.20, 90227.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 923 789 0123', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-10-20 10:58:00', '2025-10-20 10:58:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000286', u.id, 'completed', 80985.00, 0.00, 9718.20, 90703.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-11-21 16:40:00', '2025-11-21 16:40:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000287', u.id, 'completed', 61485.00, 0.00, 7378.20, 68863.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-02 11:22:00', '2025-02-02 11:22:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000288', u.id, 'completed', 17485.00, 0.00, 2098.20, 19583.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-03-25 01:06:00', '2025-03-25 01:06:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000289', u.id, 'completed', 98985.00, 0.00, 11878.20, 110863.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-12-17 03:30:00', '2025-12-17 03:30:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000290', u.id, 'completed', 36975.00, 0.00, 4437.00, 41412.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-22 11:01:00', '2025-10-22 11:01:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000291', u.id, 'completed', 66475.00, 0.00, 7977.00, 74452.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-08-31 14:50:00', '2025-08-31 14:50:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000292', u.id, 'cancelled', 33990.00, 0.00, 4078.80, 38068.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-03-27 20:12:00', '2025-03-27 20:12:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000293', u.id, 'completed', 65990.00, 0.00, 7918.80, 73908.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-02-10 02:53:00', '2025-02-10 02:53:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000294', u.id, 'completed', 58480.00, 0.00, 7017.60, 65497.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-05-26 11:21:00', '2025-05-26 11:21:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000295', u.id, 'completed', 13990.00, 0.00, 1678.80, 15668.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-10-25 03:32:00', '2025-10-25 03:32:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000296', u.id, 'completed', 110475.00, 0.00, 13257.00, 123732.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-03 15:06:00', '2025-01-03 15:06:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000297', u.id, 'completed', 14995.00, 0.00, 1799.40, 16794.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-10-27 05:35:00', '2025-10-27 05:35:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000298', u.id, 'completed', 53990.00, 0.00, 6478.80, 60468.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-02-15 04:37:00', '2025-02-15 04:37:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000299', u.id, 'completed', 35990.00, 0.00, 4318.80, 40308.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-22 12:15:00', '2025-04-22 12:15:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000300', u.id, 'completed', 9490.00, 0.00, 1138.80, 10628.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-04-08 20:59:00', '2025-04-08 20:59:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000301', u.id, 'completed', 69965.00, 0.00, 8395.80, 78360.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-02 21:14:00', '2026-01-02 21:14:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000302', u.id, 'shipped', 68965.00, 0.00, 8275.80, 77240.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-11 23:49:00', '2026-01-11 23:49:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000303', u.id, 'completed', 95975.00, 0.00, 11517.00, 107492.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-09 07:18:00', '2026-01-09 07:18:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000304', u.id, 'completed', 67980.00, 0.00, 8157.60, 76137.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-01 12:12:00', '2026-01-01 12:12:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000305', u.id, 'completed', 56980.00, 0.00, 6837.60, 63817.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-09 04:00:00', '2026-01-09 04:00:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000306', u.id, 'completed', 55080.00, 0.00, 6609.60, 61689.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-10 16:26:00', '2026-01-10 16:26:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000307', u.id, 'completed', 73970.00, 0.00, 8876.40, 82846.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-04 21:21:00', '2026-01-04 21:21:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000308', u.id, 'shipped', 138960.00, 0.00, 16675.20, 155635.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-09 20:05:00', '2026-01-09 20:05:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000309', u.id, 'processing', 71980.00, 0.00, 8637.60, 80617.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-02 15:51:00', '2026-01-02 15:51:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000310', u.id, 'completed', 33970.00, 0.00, 4076.40, 38046.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-07 08:23:00', '2026-01-07 08:23:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000311', u.id, 'processing', 5995.00, 0.00, 719.40, 6714.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-01 02:17:00', '2026-01-01 02:17:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000312', u.id, 'processing', 3995.00, 150.00, 479.40, 4624.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 01:33:00', '2026-01-11 01:33:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000313', u.id, 'shipped', 7985.00, 0.00, 958.20, 8943.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-10 19:05:00', '2026-01-10 19:05:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000314', u.id, 'completed', 73470.00, 0.00, 8816.40, 82286.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-08 04:58:00', '2026-01-08 04:58:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000315', u.id, 'completed', 47990.00, 0.00, 5758.80, 53748.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-11 00:49:00', '2026-01-11 00:49:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000316', u.id, 'completed', 19990.00, 0.00, 2398.80, 22388.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-02 19:52:00', '2026-01-02 19:52:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000317', u.id, 'completed', 80475.00, 0.00, 9657.00, 90132.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-04 12:04:00', '2026-01-04 12:04:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000318', u.id, 'completed', 118985.00, 0.00, 14278.20, 133263.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-06 04:22:00', '2026-01-06 04:22:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000319', u.id, 'completed', 25990.00, 0.00, 3118.80, 29108.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-09 18:40:00', '2026-01-09 18:40:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000320', u.id, 'completed', 50485.00, 0.00, 6058.20, 56543.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-09 16:35:00', '2026-01-09 16:35:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000321', u.id, 'completed', 21985.00, 0.00, 2638.20, 24623.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-02 10:32:00', '2026-01-02 10:32:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000322', u.id, 'completed', 75565.00, 0.00, 9067.80, 84632.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-03 17:18:00', '2026-01-03 17:18:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000323', u.id, 'processing', 19785.00, 0.00, 2374.20, 22159.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-08 01:05:00', '2026-01-08 01:05:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000324', u.id, 'completed', 14995.00, 0.00, 1799.40, 16794.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-09 14:12:00', '2026-01-09 14:12:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000325', u.id, 'completed', 29975.00, 0.00, 3597.00, 33572.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-11 23:55:00', '2026-01-11 23:55:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000326', u.id, 'completed', 6490.00, 0.00, 778.80, 7268.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-06 02:58:00', '2026-01-06 02:58:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000327', u.id, 'completed', 63975.00, 0.00, 7677.00, 71652.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-09 21:10:00', '2026-01-09 21:10:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000328', u.id, 'processing', 89965.00, 0.00, 10795.80, 100760.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-09 13:36:00', '2026-01-09 13:36:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000329', u.id, 'completed', 84480.00, 0.00, 10137.60, 94617.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-02 15:24:00', '2026-01-02 15:24:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000330', u.id, 'processing', 9995.00, 0.00, 1199.40, 11194.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-08 08:36:00', '2026-01-08 08:36:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000331', u.id, 'completed', 13485.00, 0.00, 1618.20, 15103.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-01 18:21:00', '2026-01-01 18:21:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000332', u.id, 'processing', 66975.00, 0.00, 8037.00, 75012.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-10 00:20:00', '2026-01-10 00:20:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000333', u.id, 'processing', 14485.00, 0.00, 1738.20, 16223.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-02 17:27:00', '2026-01-02 17:27:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000334', u.id, 'processing', 21990.00, 0.00, 2638.80, 24628.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-01 03:18:00', '2026-01-01 03:18:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000335', u.id, 'processing', 91475.00, 0.00, 10977.00, 102452.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-01 11:24:00', '2026-01-01 11:24:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000336', u.id, 'shipped', 40975.00, 0.00, 4917.00, 45892.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-02 10:37:00', '2026-01-02 10:37:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000337', u.id, 'processing', 72980.00, 0.00, 8757.60, 81737.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-05 17:53:00', '2026-01-05 17:53:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000338', u.id, 'completed', 10485.00, 0.00, 1258.20, 11743.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-08 14:35:00', '2026-01-08 14:35:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000339', u.id, 'completed', 72475.00, 0.00, 8697.00, 81172.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-11 17:23:00', '2026-01-11 17:23:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000340', u.id, 'processing', 31990.00, 0.00, 3838.80, 35828.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-10 13:55:00', '2026-01-10 13:55:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000341', u.id, 'completed', 9990.00, 0.00, 1198.80, 11188.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-03 06:49:00', '2026-01-03 06:49:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000342', u.id, 'completed', 43275.00, 0.00, 5193.00, 48468.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-03 12:54:00', '2026-01-03 12:54:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000343', u.id, 'processing', 22485.00, 0.00, 2698.20, 25183.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-01 16:45:00', '2026-01-01 16:45:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000344', u.id, 'shipped', 74970.00, 0.00, 8996.40, 83966.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-01 13:39:00', '2026-01-01 13:39:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000345', u.id, 'completed', 76975.00, 0.00, 9237.00, 86212.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-01 21:14:00', '2026-01-01 21:14:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000346', u.id, 'completed', 47990.00, 0.00, 5758.80, 53748.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-01 19:05:00', '2026-01-01 19:05:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000347', u.id, 'completed', 5995.00, 0.00, 719.40, 6714.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-03 15:26:00', '2026-01-03 15:26:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000348', u.id, 'shipped', 61980.00, 0.00, 7437.60, 69417.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-06 04:48:00', '2026-01-06 04:48:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000349', u.id, 'processing', 38985.00, 0.00, 4678.20, 43663.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-01 15:54:00', '2026-01-01 15:54:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000350', u.id, 'shipped', 74975.00, 0.00, 8997.00, 83972.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-05 11:41:00', '2026-01-05 11:41:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000351', u.id, 'processing', 95475.00, 0.00, 11457.00, 106932.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-07 04:06:00', '2026-01-07 04:06:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000352', u.id, 'completed', 77970.00, 0.00, 9356.40, 87326.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-06 05:00:00', '2026-01-06 05:00:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000353', u.id, 'completed', 57475.00, 0.00, 6897.00, 64372.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-08 16:26:00', '2026-01-08 16:26:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000354', u.id, 'shipped', 91980.00, 0.00, 11037.60, 103017.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-06 16:56:00', '2026-01-06 16:56:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000355', u.id, 'completed', 7990.00, 0.00, 958.80, 8948.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-02 20:04:00', '2026-01-02 20:04:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000356', u.id, 'completed', 17980.00, 0.00, 2157.60, 20137.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-08 00:30:00', '2026-01-08 00:30:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000357', u.id, 'completed', 42985.00, 0.00, 5158.20, 48143.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-10 16:42:00', '2026-01-10 16:42:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000358', u.id, 'completed', 45470.00, 0.00, 5456.40, 50926.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-03 03:42:00', '2026-01-03 03:42:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000359', u.id, 'shipped', 58980.00, 0.00, 7077.60, 66057.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-08 23:45:00', '2026-01-08 23:45:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000360', u.id, 'processing', 89480.00, 0.00, 10737.60, 100217.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-06 09:36:00', '2026-01-06 09:36:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000361', u.id, 'completed', 115465.00, 0.00, 13855.80, 129320.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-07 06:58:00', '2026-01-07 06:58:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000362', u.id, 'shipped', 11990.00, 0.00, 1438.80, 13428.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-04 21:30:00', '2026-01-04 21:30:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000363', u.id, 'completed', 55990.00, 0.00, 6718.80, 62708.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-07 02:40:00', '2026-01-07 02:40:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000364', u.id, 'shipped', 32485.00, 0.00, 3898.20, 36383.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-08 12:12:00', '2026-01-08 12:12:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000365', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-03 21:46:00', '2026-01-03 21:46:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000366', u.id, 'completed', 59970.00, 0.00, 7196.40, 67166.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-05 22:10:00', '2026-01-05 22:10:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000367', u.id, 'shipped', 39980.00, 0.00, 4797.60, 44777.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-07 06:50:00', '2026-01-07 06:50:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000368', u.id, 'shipped', 101475.00, 0.00, 12177.00, 113652.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-11 00:59:00', '2026-01-11 00:59:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000369', u.id, 'completed', 35480.00, 0.00, 4257.60, 39737.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 04:52:00', '2026-01-04 04:52:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000370', u.id, 'completed', 92985.00, 0.00, 11158.20, 104143.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 10:11:00', '2026-01-04 10:11:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000371', u.id, 'completed', 9990.00, 0.00, 1198.80, 11188.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-11 10:51:00', '2026-01-11 10:51:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000372', u.id, 'completed', 24490.00, 0.00, 2938.80, 27428.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-02 14:22:00', '2026-01-02 14:22:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000373', u.id, 'processing', 15985.00, 0.00, 1918.20, 17903.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-05 22:14:00', '2026-01-05 22:14:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000374', u.id, 'completed', 62980.00, 0.00, 7557.60, 70537.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-03 03:40:00', '2026-01-03 03:40:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000375', u.id, 'completed', 118985.00, 0.00, 14278.20, 133263.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-10 21:04:00', '2026-01-10 21:04:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000376', u.id, 'completed', 16995.00, 0.00, 2039.40, 19034.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-05 22:07:00', '2026-01-05 22:07:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000377', u.id, 'completed', 100975.00, 0.00, 12117.00, 113092.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-03 06:35:00', '2026-01-03 06:35:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000378', u.id, 'completed', 55990.00, 0.00, 6718.80, 62708.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-05 07:57:00', '2026-01-05 07:57:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000379', u.id, 'shipped', 73980.00, 0.00, 8877.60, 82857.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-10 02:28:00', '2026-01-10 02:28:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000380', u.id, 'completed', 24980.00, 0.00, 2997.60, 27977.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-06 05:29:00', '2026-01-06 05:29:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000381', u.id, 'shipped', 138965.00, 0.00, 16675.80, 155640.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-09 03:48:00', '2026-01-09 03:48:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000382', u.id, 'completed', 46985.00, 0.00, 5638.20, 52623.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-07 19:26:00', '2026-01-07 19:26:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000383', u.id, 'completed', 31980.00, 0.00, 3837.60, 35817.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-08 13:36:00', '2026-01-08 13:36:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000384', u.id, 'processing', 131965.00, 0.00, 15835.80, 147800.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-06 04:01:00', '2026-01-06 04:01:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000385', u.id, 'completed', 42995.00, 0.00, 5159.40, 48154.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-10 15:04:00', '2026-01-10 15:04:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000386', u.id, 'shipped', 7990.00, 0.00, 958.80, 8948.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-06 16:47:00', '2026-01-06 16:47:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000387', u.id, 'completed', 66990.00, 0.00, 8038.80, 75028.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 18:33:00', '2026-01-11 18:33:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000388', u.id, 'completed', 17985.00, 0.00, 2158.20, 20143.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 10:19:00', '2026-01-01 10:19:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000389', u.id, 'completed', 24485.00, 0.00, 2938.20, 27423.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-08 07:48:00', '2026-01-08 07:48:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000390', u.id, 'shipped', 8990.00, 0.00, 1078.80, 10068.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-07 20:36:00', '2026-01-07 20:36:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000391', u.id, 'completed', 14485.00, 0.00, 1738.20, 16223.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-06 13:55:00', '2026-01-06 13:55:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000392', u.id, 'shipped', 22990.00, 0.00, 2758.80, 25748.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 17:00:00', '2026-01-04 17:00:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000393', u.id, 'completed', 50475.00, 0.00, 6057.00, 56532.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 04:05:00', '2026-01-01 04:05:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000394', u.id, 'completed', 46975.00, 0.00, 5637.00, 52612.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-03 23:58:00', '2026-01-03 23:58:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000395', u.id, 'completed', 26975.00, 0.00, 3237.00, 30212.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-06 22:38:00', '2026-01-06 22:38:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000396', u.id, 'shipped', 87965.00, 0.00, 10555.80, 98520.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-09 19:33:00', '2026-01-09 19:33:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000397', u.id, 'shipped', 40970.00, 0.00, 4916.40, 45886.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-08 03:45:00', '2026-01-08 03:45:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000398', u.id, 'completed', 46470.00, 0.00, 5576.40, 52046.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-01 02:32:00', '2026-01-01 02:32:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000399', u.id, 'processing', 39480.00, 0.00, 4737.60, 44217.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-09 13:25:00', '2026-01-09 13:25:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000400', u.id, 'processing', 16985.00, 0.00, 2038.20, 19023.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-04 19:59:00', '2026-01-04 19:59:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000401', u.id, 'completed', 96970.00, 0.00, 11636.40, 108606.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-10 23:10:00', '2026-01-10 23:10:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000402', u.id, 'shipped', 69570.00, 0.00, 8348.40, 77918.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-07 21:41:00', '2026-01-07 21:41:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000403', u.id, 'completed', 57470.00, 0.00, 6896.40, 64366.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-03 05:31:00', '2026-01-03 05:31:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000404', u.id, 'completed', 57465.00, 0.00, 6895.80, 64360.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 15:16:00', '2026-01-01 15:16:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000405', u.id, 'completed', 68965.00, 0.00, 8275.80, 77240.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 04:01:00', '2026-01-11 04:01:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000406', u.id, 'completed', 37470.00, 0.00, 4496.40, 41966.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-02 06:31:00', '2026-01-02 06:31:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000407', u.id, 'processing', 85990.00, 0.00, 10318.80, 96308.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-05 17:43:00', '2026-01-05 17:43:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000408', u.id, 'completed', 6990.00, 0.00, 838.80, 7828.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-02 09:57:00', '2026-01-02 09:57:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000409', u.id, 'processing', 30975.00, 0.00, 3717.00, 34692.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-09 23:43:00', '2026-01-09 23:43:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000410', u.id, 'completed', 29975.00, 0.00, 3597.00, 33572.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-06 13:53:00', '2026-01-06 13:53:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000411', u.id, 'shipped', 160970.00, 0.00, 19316.40, 180286.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-03 04:56:00', '2026-01-03 04:56:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000412', u.id, 'completed', 31475.00, 0.00, 3777.00, 35252.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-03 08:59:00', '2026-01-03 08:59:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000413', u.id, 'completed', 144965.00, 0.00, 17395.80, 162360.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 04:45:00', '2026-01-11 04:45:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000414', u.id, 'processing', 53990.00, 0.00, 6478.80, 60468.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-11 14:05:00', '2026-01-11 14:05:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000415', u.id, 'completed', 33990.00, 0.00, 4078.80, 38068.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-09 21:59:00', '2026-01-09 21:59:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000416', u.id, 'completed', 40985.00, 0.00, 4918.20, 45903.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-10 03:42:00', '2026-01-10 03:42:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000417', u.id, 'completed', 80975.00, 0.00, 9717.00, 90692.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-05 05:49:00', '2026-01-05 05:49:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000418', u.id, 'shipped', 43980.00, 0.00, 5277.60, 49257.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-08 12:12:00', '2026-01-08 12:12:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000419', u.id, 'completed', 58980.00, 0.00, 7077.60, 66057.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-06 08:19:00', '2026-01-06 08:19:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000420', u.id, 'shipped', 11990.00, 0.00, 1438.80, 13428.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-08 10:44:00', '2026-01-08 10:44:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000421', u.id, 'completed', 90480.00, 0.00, 10857.60, 101337.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-10 12:29:00', '2026-01-10 12:29:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000422', u.id, 'processing', 32975.00, 0.00, 3957.00, 36932.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-03 15:30:00', '2026-01-03 15:30:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000423', u.id, 'processing', 8990.00, 0.00, 1078.80, 10068.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-06 02:19:00', '2026-01-06 02:19:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000424', u.id, 'completed', 63475.00, 0.00, 7617.00, 71092.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-10 04:35:00', '2026-01-10 04:35:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000425', u.id, 'shipped', 19290.00, 0.00, 2314.80, 21604.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-10 15:00:00', '2026-01-10 15:00:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000426', u.id, 'completed', 28990.00, 0.00, 3478.80, 32468.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-07 10:12:00', '2026-01-07 10:12:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000427', u.id, 'processing', 88970.00, 0.00, 10676.40, 99646.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 19:18:00', '2026-01-11 19:18:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000428', u.id, 'completed', 5990.00, 0.00, 718.80, 6708.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-05 16:25:00', '2026-01-05 16:25:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000429', u.id, 'shipped', 104975.00, 0.00, 12597.00, 117572.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-10 13:53:00', '2026-01-10 13:53:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000430', u.id, 'processing', 10990.00, 0.00, 1318.80, 12308.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-09 01:31:00', '2026-01-09 01:31:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000431', u.id, 'completed', 43485.00, 0.00, 5218.20, 48703.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 04:39:00', '2026-01-01 04:39:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000432', u.id, 'completed', 33970.00, 0.00, 4076.40, 38046.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-06 21:38:00', '2026-01-06 21:38:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000433', u.id, 'processing', 50975.00, 0.00, 6117.00, 57092.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 923 789 0123', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-03 18:34:00', '2026-01-03 18:34:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000434', u.id, 'processing', 8995.00, 0.00, 1079.40, 10074.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-07 09:24:00', '2026-01-07 09:24:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000435', u.id, 'completed', 74985.00, 0.00, 8998.20, 83983.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-09 02:15:00', '2026-01-09 02:15:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000436', u.id, 'processing', 34990.00, 0.00, 4198.80, 39188.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-09 00:12:00', '2026-01-09 00:12:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000437', u.id, 'shipped', 68780.00, 0.00, 8253.60, 77033.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-08 15:02:00', '2026-01-08 15:02:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000438', u.id, 'processing', 33990.00, 0.00, 4078.80, 38068.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-04 16:04:00', '2026-01-04 16:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000439', u.id, 'completed', 6990.00, 0.00, 838.80, 7828.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-04 10:23:00', '2026-01-04 10:23:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000440', u.id, 'shipped', 19485.00, 0.00, 2338.20, 21823.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-02 15:51:00', '2026-01-02 15:51:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000441', u.id, 'shipped', 54475.00, 0.00, 6537.00, 61012.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-03 10:38:00', '2026-01-03 10:38:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000442', u.id, 'completed', 86965.00, 0.00, 10435.80, 97400.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-07 02:49:00', '2026-01-07 02:49:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000443', u.id, 'completed', 69970.00, 0.00, 8396.40, 78366.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-09 10:48:00', '2026-01-09 10:48:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000444', u.id, 'completed', 110965.00, 0.00, 13315.80, 124280.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-09 21:12:00', '2026-01-09 21:12:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000445', u.id, 'completed', 88975.00, 0.00, 10677.00, 99652.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-09 12:31:00', '2026-01-09 12:31:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000446', u.id, 'completed', 62975.00, 0.00, 7557.00, 70532.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-08 10:31:00', '2026-01-08 10:31:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000447', u.id, 'completed', 104275.00, 0.00, 12513.00, 116788.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-10 15:47:00', '2026-01-10 15:47:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000448', u.id, 'completed', 54470.00, 0.00, 6536.40, 61006.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-01 23:42:00', '2026-01-01 23:42:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000449', u.id, 'shipped', 94960.00, 0.00, 11395.20, 106355.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-01 01:39:00', '2026-01-01 01:39:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000450', u.id, 'completed', 47470.00, 0.00, 5696.40, 53166.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-10 10:36:00', '2026-01-10 10:36:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;

-- =====================================================
-- INSERT ORDER ITEMS
-- =====================================================

INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (1, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (2, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (2, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (3, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (4, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (4, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (4, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (5, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (6, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (6, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (7, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (7, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (8, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (8, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (8, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (8, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (9, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (9, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (9, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (10, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (10, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (11, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (11, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (11, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (12, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (12, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (12, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (13, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (14, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (14, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (14, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (14, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (15, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (15, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (16, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (16, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (16, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (16, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (17, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (17, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (18, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (18, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (18, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (19, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (19, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (20, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (21, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (21, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (21, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (22, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (22, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (22, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (22, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (23, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (23, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (23, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (23, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (24, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (24, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (24, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (25, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (25, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (25, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (25, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (26, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (26, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (26, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (27, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (27, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (28, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (28, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (29, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (29, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (29, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (29, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (30, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (31, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (31, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (32, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (32, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (32, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (33, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (33, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (33, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (34, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (34, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (34, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (34, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (35, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (36, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (37, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (37, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (37, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (38, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (38, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (38, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (39, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (39, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (39, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (39, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (40, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (40, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (40, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (40, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (41, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (41, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (41, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (41, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (42, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (43, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (43, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (43, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (44, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (44, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (44, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (45, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (45, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (45, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (45, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (46, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (46, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (46, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (46, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (47, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (47, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (48, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (48, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (49, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (49, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (49, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (49, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (50, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (50, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (51, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (51, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (51, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (51, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (52, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (52, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (52, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (53, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (53, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (53, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (54, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (54, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (55, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (55, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (56, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (56, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (56, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (57, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (58, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (58, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (58, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (58, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (59, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (60, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (60, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (61, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (62, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (62, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (63, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (63, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (63, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (63, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (64, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (64, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (64, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (65, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (65, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (66, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (66, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (66, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (66, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (67, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (68, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (68, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (69, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (69, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (70, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (70, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (71, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (71, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (72, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (72, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (73, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (73, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (73, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (74, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (74, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (74, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (75, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (76, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (77, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (78, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (78, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (79, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (80, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (80, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (80, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (80, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (81, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (81, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (81, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (81, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (82, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (82, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (82, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (83, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (83, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (84, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (85, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (85, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (85, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (86, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (86, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (86, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (86, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (87, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (87, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (87, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (87, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (88, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (89, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (89, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (89, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (89, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (90, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (90, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (90, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (90, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (91, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (91, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (91, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (92, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (92, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (93, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (93, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (93, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (94, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (94, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (94, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (94, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (95, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (95, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (96, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (97, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (97, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (97, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (97, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (98, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (98, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (98, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (99, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (99, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (99, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (99, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (100, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (100, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (100, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (101, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (101, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (101, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (101, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (102, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (102, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (102, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (102, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (103, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (103, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (104, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (105, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (106, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (106, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (106, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (106, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (107, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (108, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (108, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (108, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (108, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (109, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (109, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (110, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (110, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (110, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (110, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (111, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (111, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (111, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (112, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (112, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (112, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (113, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (113, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (113, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (113, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (114, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (114, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (114, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (114, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (115, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (115, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (115, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (115, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (116, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (116, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (116, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (116, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (117, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (117, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (118, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (118, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (118, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (119, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (119, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (119, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (119, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (120, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (120, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (120, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (121, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (121, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (121, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (121, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (122, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (122, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (123, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (124, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (125, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (125, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (125, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (125, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (126, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (127, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (127, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (128, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (129, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (129, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (129, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (129, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (130, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (130, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (130, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (131, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (131, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (132, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (133, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (133, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (133, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (134, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (134, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (134, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (135, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (135, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (136, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (136, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (136, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (136, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (137, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (137, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (137, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (138, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (138, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (138, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (139, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (139, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (139, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (140, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (141, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (141, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (141, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (142, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (142, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (142, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (143, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (143, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (144, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (144, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (144, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (145, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (145, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (145, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (146, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (147, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (147, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (147, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (147, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (148, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (148, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (148, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (148, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (149, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (149, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (150, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (150, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (150, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (150, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (151, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (152, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (152, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (152, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (153, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (153, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (153, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (153, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (154, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (154, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (154, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (154, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (155, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (155, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (156, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (157, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (158, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (158, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (158, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (159, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (160, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (160, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (160, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (160, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (161, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (161, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (161, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (162, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (162, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (163, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (163, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (164, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (164, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (165, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (165, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (166, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (166, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (166, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (167, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (167, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (167, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (167, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (168, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (168, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (169, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (169, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (169, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (170, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (170, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (170, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (171, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (172, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (172, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (172, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (173, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (173, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (173, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (173, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (174, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (175, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (176, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (176, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (176, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (176, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (177, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (177, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (177, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (177, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (178, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (178, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (178, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (179, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (180, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (181, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (181, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (181, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (182, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (182, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (182, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (183, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (183, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (184, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (184, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (185, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (185, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (185, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (185, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (186, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (187, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (187, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (187, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (187, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (188, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (188, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (188, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (189, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (189, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (190, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (190, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (190, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (191, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (191, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (191, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (192, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (193, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (193, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (193, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (194, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (194, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (194, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (194, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (195, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (196, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (196, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (197, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (198, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (198, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (198, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (198, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (199, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (199, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (199, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (199, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (200, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (200, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (200, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (200, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (201, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (201, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (201, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (201, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (202, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (202, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (202, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (203, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (203, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (204, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (204, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (204, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (205, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (205, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (206, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (206, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (206, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (207, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (207, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (208, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (208, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (208, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (208, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (209, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (209, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (210, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (210, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (210, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (211, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (211, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (211, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (211, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (212, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (212, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (212, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (213, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (213, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (214, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (215, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (215, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (215, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (215, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (216, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (217, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (217, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (217, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (217, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (218, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (219, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (219, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (219, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (219, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (220, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (220, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (220, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (221, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (221, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (222, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (222, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (223, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (223, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (223, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (224, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (224, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (224, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (224, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (225, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (226, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (227, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (227, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (228, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (228, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (228, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (228, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (229, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (229, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (229, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (229, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (230, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (230, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (230, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (230, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (231, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (231, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (231, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (232, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (232, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (232, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (233, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (233, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (233, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (233, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (234, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (235, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (235, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (236, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (236, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (236, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (236, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (237, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (238, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (238, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (238, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (238, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (239, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (239, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (239, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (239, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (240, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (240, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (240, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (240, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (241, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (241, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (241, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (242, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (242, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (243, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (244, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (245, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (245, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (246, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (246, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (247, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (247, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (247, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (247, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (248, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (248, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (248, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (248, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (249, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (249, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (249, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (250, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (251, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (251, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (251, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (251, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (252, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (252, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (252, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (252, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (253, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (253, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (253, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (253, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (254, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (254, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (255, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (256, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (256, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (256, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (257, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (258, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (258, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (258, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (259, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (259, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (259, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (260, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (260, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (261, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (261, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (261, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (262, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (262, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (262, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (262, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (263, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (263, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (264, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (264, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (264, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (265, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (265, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (266, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (266, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (267, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (267, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (268, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (269, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (269, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (269, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (269, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (270, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (270, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (270, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (271, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (271, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (272, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (272, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (272, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (272, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (273, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (273, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (273, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (273, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (274, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (274, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (275, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (275, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (275, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (276, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (276, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (276, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (277, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (277, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (277, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (278, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (278, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (278, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (278, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (279, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (279, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (280, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (281, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (281, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (281, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (281, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (282, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (282, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (282, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (282, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (283, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (283, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (283, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (283, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (284, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (284, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (285, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (285, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (285, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (285, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (286, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (286, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (287, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (287, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (287, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (288, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (288, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (289, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (289, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (290, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (290, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (290, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (291, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (291, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (291, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (291, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (292, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (293, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (294, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (294, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (294, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (295, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (296, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (296, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (296, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (296, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (297, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (298, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (299, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (299, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (300, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (300, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (301, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (301, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (301, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (301, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (302, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (302, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (302, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (302, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (303, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (303, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (303, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (304, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (304, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (305, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (305, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (305, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (306, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (306, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (306, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (307, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (307, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (307, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (307, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (308, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (308, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (308, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (308, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (309, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (309, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (309, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (310, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (310, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (310, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (310, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (311, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (312, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (313, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (313, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (314, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (314, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (314, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (314, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (315, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (316, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (317, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (317, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (317, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (318, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (318, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (319, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (320, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (320, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (320, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (321, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (321, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (322, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (322, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (322, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (322, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (323, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (323, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (324, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (325, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (325, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (325, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (326, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (326, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (327, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (327, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (327, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (328, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (328, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (328, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (328, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (329, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (329, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (329, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (330, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (331, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (331, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (331, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (332, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (332, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (332, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (332, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (333, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (333, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (334, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (334, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (335, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (335, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (335, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (336, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (336, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (336, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (337, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (337, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (337, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (337, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (338, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (338, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (339, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (339, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (339, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (340, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (340, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (341, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (342, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (342, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (342, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (342, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (343, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (343, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (344, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (344, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (344, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (345, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (345, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (345, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (345, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (346, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (347, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (348, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (348, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (349, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (349, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (349, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (350, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (350, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (350, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (350, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (351, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (351, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (351, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (351, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (352, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (352, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (352, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (353, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (353, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (353, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (353, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (354, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (354, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (355, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (355, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (356, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (356, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (357, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (357, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (358, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (358, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (358, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (358, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (359, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (359, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (360, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (360, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (360, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (361, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (361, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (361, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (361, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (362, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (363, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (364, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (364, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (365, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (366, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (366, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (366, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (366, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (367, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (367, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (368, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (368, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (368, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (369, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (369, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (369, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (370, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (370, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (371, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (372, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (372, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (373, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (373, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (374, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (374, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (374, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (375, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (375, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (376, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (377, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (377, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (377, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (377, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (378, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (379, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (379, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (379, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (380, 139, 'Noctua NH-D15', 'Standard', 4495.00, 1, 4495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (380, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 2, 17990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (380, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (381, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (381, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (381, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (381, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (382, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (382, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (383, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (383, 229, 'Samsung 980 PRO', '1TB', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (383, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (383, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (384, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (384, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (384, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (384, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (385, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (386, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (387, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (387, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (388, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (388, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (389, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (389, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (390, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (391, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (391, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (392, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (392, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (393, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (393, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (393, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (393, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (394, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (394, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (394, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (394, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (395, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (395, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (395, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (396, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (396, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (396, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (396, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (397, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (397, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (397, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (397, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (398, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (398, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (398, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (398, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (399, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (399, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (399, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (400, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (400, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (401, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (401, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (401, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (402, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (402, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (402, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (402, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (403, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (403, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (403, 91, 'NZXT H510 Elite', 'Black', 4995.00, 2, 9990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (403, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (404, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (404, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (404, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (404, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (405, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (405, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (405, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (405, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (406, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (406, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (406, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (406, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (407, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (408, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (409, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (409, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (409, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (410, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (410, 142, 'NZXT Kraken X63', 'Black', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (410, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (410, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (411, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (411, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (411, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (411, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (412, 256, 'Crucial MX500', '512GB', 2495.00, 1, 2495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (412, 232, 'WD Black SN850X', '2TB', 9995.00, 2, 19990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (412, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (413, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (413, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (413, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (413, 24, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (414, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (415, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (416, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (416, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 1, 26995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (416, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (417, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (417, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (417, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (418, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (418, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (419, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (419, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (419, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (420, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (421, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (421, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (421, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (422, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (422, 259, 'Samsung 870 EVO', '1TB', 3995.00, 1, 3995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (422, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (423, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (424, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (424, 232, 'WD Black SN850X', '2TB', 9995.00, 1, 9995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (424, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (424, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (425, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (425, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (426, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (427, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (427, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (427, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (427, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (428, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (429, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (429, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (429, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (430, 256, 'Corsair RM850x', '750W', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (431, 256, 'Corsair RM850x', '750W', 5495.00, 1, 5495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (431, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (432, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (432, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 2, 5990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (432, 259, 'EVGA SuperNOVA 1000 P5', '850W', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (433, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (433, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (433, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (434, 196, 'Corsair Vengeance DDR5-5600', '32GB (2x16GB)', 8995.00, 1, 8995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (435, 5, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (435, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 1, 12995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (435, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (436, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (436, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (437, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (437, 142, 'NZXT Kraken X63', 'Black', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (437, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (438, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (439, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (440, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (440, 256, 'Crucial MX500', '512GB', 2495.00, 2, 4990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (441, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (441, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (441, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 1, 5995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (441, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 1, 8495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (442, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (442, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (442, 136, 'Cooler Master Hyper 212', 'Standard', 2995.00, 1, 2995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (442, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (443, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (443, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (443, 229, 'Samsung 980 PRO', '1TB', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (443, 91, 'NZXT H510 Elite', 'Black', 4995.00, 1, 4995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (444, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (444, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (444, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 2, 13990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (444, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (445, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (445, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 1, 23995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (445, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (446, 139, 'Noctua NH-D15', 'Standard', 4495.00, 2, 8990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (446, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (446, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 2, 36990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (447, 9, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (447, 31, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (447, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 23995.00, 2, 47990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (447, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (448, 61, 'ASUS TUF Gaming B550-PLUS', 'Standard', 8495.00, 2, 16990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (448, 169, 'G.Skill Trident Z DDR4-3600', '32GB (2x16GB)', 5995.00, 2, 11990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (448, 67, 'ASUS ROG STRIX X670E-E', 'Standard', 18495.00, 1, 18495.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (448, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (449, 259, 'Samsung 870 EVO', '1TB', 3995.00, 2, 7990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (449, 37, 'AMD Radeon RX 7800 XT', 'Reference', 26995.00, 2, 53990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (449, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (449, 226, 'Samsung 970 EVO Plus', '512GB', 3495.00, 2, 6990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (450, 94, 'Corsair 4000D Airflow', 'White', 5495.00, 2, 10990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (450, 97, 'Lian Li O11 Dynamic', 'Black', 6995.00, 1, 6995.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (450, 64, 'MSI MAG B650 TOMAHAWK', 'Standard', 12995.00, 2, 25990.00);
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
VALUES (450, 166, 'Corsair Vengeance LPX DDR4-3200', '16GB (2x8GB)', 3495.00, 1, 3495.00);

-- =====================================================
-- COMPLETION MESSAGE
-- =====================================================

SELECT '450 orders with items added successfully!' as message,
       '300 orders from 2025 (completed/cancelled)' as note_2025,
       '150 orders from 2026 (processing/shipped/completed)' as note_2026,
       'Sales dashboard now has data to display' as status;
