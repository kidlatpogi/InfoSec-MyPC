-- =====================================================
-- MyPC Database - Sales Data (Orders & Order Items)
-- =====================================================
-- Generated: 2026-01-11 10:08:20
-- Contains 450 orders (300 from 2025, 150 from 2026)
-- Run this after mypc_complete.sql and users_insert.sql
-- =====================================================

USE mypc_db;

SET FOREIGN_KEY_CHECKS = 0;

-- =====================================================
-- INSERT ORDERS
-- =====================================================

INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000001', u.id, 'completed', 162370.00, 0.00, 19484.40, 181854.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-11-10 09:32:00', '2025-11-10 09:32:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000002', u.id, 'completed', 101470.00, 0.00, 12176.40, 113646.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-23 01:32:00', '2025-11-23 01:32:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000003', u.id, 'completed', 141775.00, 0.00, 17013.00, 158788.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-01-17 15:28:00', '2025-01-17 15:28:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000004', u.id, 'completed', 121185.00, 0.00, 14542.20, 135727.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-11-12 09:38:00', '2025-11-12 09:38:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000005', u.id, 'completed', 60490.00, 0.00, 7258.80, 67748.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-25 10:19:00', '2025-12-25 10:19:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000006', u.id, 'completed', 112280.00, 0.00, 13473.60, 125753.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-22 14:25:00', '2025-12-22 14:25:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000007', u.id, 'completed', 176470.00, 0.00, 21176.40, 197646.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-31 19:52:00', '2025-03-31 19:52:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000008', u.id, 'completed', 85985.00, 0.00, 10318.20, 96303.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-03-27 12:18:00', '2025-03-27 12:18:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000009', u.id, 'cancelled', 16995.00, 0.00, 2039.40, 19034.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-01-29 02:21:00', '2025-01-29 02:21:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000010', u.id, 'cancelled', 190465.00, 0.00, 22855.80, 213320.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-06-09 01:49:00', '2025-06-09 01:49:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000011', u.id, 'cancelled', 159180.00, 0.00, 19101.60, 178281.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-14 17:51:00', '2025-04-14 17:51:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000012', u.id, 'completed', 105680.00, 0.00, 12681.60, 118361.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-11 11:50:00', '2025-05-11 11:50:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000013', u.id, 'completed', 177375.00, 0.00, 21285.00, 198660.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-04-08 21:25:00', '2025-04-08 21:25:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000014', u.id, 'completed', 84980.00, 0.00, 10197.60, 95177.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-10 09:54:00', '2025-11-10 09:54:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000015', u.id, 'completed', 226365.00, 0.00, 27163.80, 253528.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-12-20 07:45:00', '2025-12-20 07:45:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000016', u.id, 'completed', 173380.00, 0.00, 20805.60, 194185.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-02 15:17:00', '2025-10-02 15:17:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000017', u.id, 'completed', 172170.00, 0.00, 20660.40, 192830.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-01-25 12:04:00', '2025-01-25 12:04:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000018', u.id, 'completed', 110980.00, 0.00, 13317.60, 124297.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-22 10:59:00', '2025-08-22 10:59:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000019', u.id, 'completed', 130075.00, 0.00, 15609.00, 145684.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-10 01:25:00', '2025-03-10 01:25:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000020', u.id, 'completed', 108075.00, 0.00, 12969.00, 121044.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-12-12 00:51:00', '2025-12-12 00:51:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000021', u.id, 'cancelled', 188870.00, 0.00, 22664.40, 211534.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-05 18:00:00', '2025-05-05 18:00:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000022', u.id, 'cancelled', 198175.00, 0.00, 23781.00, 221956.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-15 14:01:00', '2025-06-15 14:01:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000023', u.id, 'completed', 53585.00, 0.00, 6430.20, 60015.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-02 15:16:00', '2025-02-02 15:16:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000024', u.id, 'cancelled', 95480.00, 0.00, 11457.60, 106937.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-18 12:15:00', '2025-01-18 12:15:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000025', u.id, 'cancelled', 75990.00, 0.00, 9118.80, 85108.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-04-12 04:34:00', '2025-04-12 04:34:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000026', u.id, 'completed', 63285.00, 0.00, 7594.20, 70879.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-26 14:55:00', '2025-09-26 14:55:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000027', u.id, 'completed', 193975.00, 0.00, 23277.00, 217252.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-11-08 19:47:00', '2025-11-08 19:47:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000028', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-02-10 16:51:00', '2025-02-10 16:51:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000029', u.id, 'completed', 46495.00, 0.00, 5579.40, 52074.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-09 00:13:00', '2025-06-09 00:13:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000030', u.id, 'completed', 129585.00, 0.00, 15550.20, 145135.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-26 01:30:00', '2025-11-26 01:30:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000031', u.id, 'completed', 217170.00, 0.00, 26060.40, 243230.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-30 10:34:00', '2025-11-30 10:34:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000032', u.id, 'completed', 216575.00, 0.00, 25989.00, 242564.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-23 07:02:00', '2025-09-23 07:02:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000033', u.id, 'completed', 38990.00, 0.00, 4678.80, 43668.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-10-23 23:35:00', '2025-10-23 23:35:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000034', u.id, 'completed', 51195.00, 0.00, 6143.40, 57338.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-06 16:00:00', '2025-06-06 16:00:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000035', u.id, 'completed', 34990.00, 0.00, 4198.80, 39188.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-23 06:05:00', '2025-01-23 06:05:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000036', u.id, 'completed', 235365.00, 0.00, 28243.80, 263608.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-08-16 22:33:00', '2025-08-16 22:33:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000037', u.id, 'completed', 111785.00, 0.00, 13414.20, 125199.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-02-20 19:49:00', '2025-02-20 19:49:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000038', u.id, 'completed', 79085.00, 0.00, 9490.20, 88575.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-11 09:48:00', '2025-03-11 09:48:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000039', u.id, 'completed', 125680.00, 0.00, 15081.60, 140761.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-04-05 19:53:00', '2025-04-05 19:53:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000040', u.id, 'completed', 229370.00, 0.00, 27524.40, 256894.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-01-21 04:39:00', '2025-01-21 04:39:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000041', u.id, 'completed', 204375.00, 0.00, 24525.00, 228900.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-01-11 20:37:00', '2025-01-11 20:37:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000042', u.id, 'completed', 268765.00, 0.00, 32251.80, 301016.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-30 07:49:00', '2025-09-30 07:49:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000043', u.id, 'completed', 180975.00, 0.00, 21717.00, 202692.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-04-03 17:48:00', '2025-04-03 17:48:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000044', u.id, 'completed', 136465.00, 0.00, 16375.80, 152840.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-19 18:11:00', '2025-11-19 18:11:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000045', u.id, 'completed', 196170.00, 0.00, 23540.40, 219710.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-02-24 21:46:00', '2025-02-24 21:46:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000046', u.id, 'cancelled', 84985.00, 0.00, 10198.20, 95183.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-17 02:28:00', '2025-10-17 02:28:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000047', u.id, 'cancelled', 184275.00, 0.00, 22113.00, 206388.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-10 14:16:00', '2025-04-10 14:16:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000048', u.id, 'completed', 27995.00, 0.00, 3359.40, 31354.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-02-28 09:22:00', '2025-02-28 09:22:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000049', u.id, 'completed', 73485.00, 0.00, 8818.20, 82303.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-02-21 23:58:00', '2025-02-21 23:58:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000050', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-05 20:29:00', '2025-09-05 20:29:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000051', u.id, 'completed', 132175.00, 0.00, 15861.00, 148036.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-07-24 02:12:00', '2025-07-24 02:12:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000052', u.id, 'completed', 149180.00, 0.00, 17901.60, 167081.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-09-08 04:49:00', '2025-09-08 04:49:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000053', u.id, 'completed', 177875.00, 0.00, 21345.00, 199220.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-11-23 05:53:00', '2025-11-23 05:53:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000054', u.id, 'completed', 193870.00, 0.00, 23264.40, 217134.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-08-19 22:27:00', '2025-08-19 22:27:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000055', u.id, 'completed', 100990.00, 0.00, 12118.80, 113108.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-12-31 14:36:00', '2025-12-31 14:36:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000056', u.id, 'completed', 121185.00, 0.00, 14542.20, 135727.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-30 20:34:00', '2025-12-30 20:34:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000057', u.id, 'completed', 157680.00, 0.00, 18921.60, 176601.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-05 23:42:00', '2025-04-05 23:42:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000058', u.id, 'completed', 89085.00, 0.00, 10690.20, 99775.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-10-09 00:44:00', '2025-10-09 00:44:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000059', u.id, 'cancelled', 165875.00, 0.00, 19905.00, 185780.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-24 10:00:00', '2025-10-24 10:00:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000060', u.id, 'completed', 83590.00, 0.00, 10030.80, 93620.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-04-21 03:05:00', '2025-04-21 03:05:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000061', u.id, 'completed', 165770.00, 0.00, 19892.40, 185662.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-16 16:44:00', '2025-10-16 16:44:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000062', u.id, 'cancelled', 115285.00, 0.00, 13834.20, 129119.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-25 05:55:00', '2025-06-25 05:55:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000063', u.id, 'completed', 141165.00, 0.00, 16939.80, 158104.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-06 22:33:00', '2025-03-06 22:33:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000064', u.id, 'cancelled', 137275.00, 0.00, 16473.00, 153748.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-28 02:31:00', '2025-03-28 02:31:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000065', u.id, 'completed', 165275.00, 0.00, 19833.00, 185108.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-09-27 06:50:00', '2025-09-27 06:50:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000066', u.id, 'completed', 16995.00, 0.00, 2039.40, 19034.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-06 18:05:00', '2025-09-06 18:05:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000067', u.id, 'completed', 204965.00, 0.00, 24595.80, 229560.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-08-17 20:52:00', '2025-08-17 20:52:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000068', u.id, 'cancelled', 39390.00, 0.00, 4726.80, 44116.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-03-03 12:00:00', '2025-03-03 12:00:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000069', u.id, 'cancelled', 16995.00, 0.00, 2039.40, 19034.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-23 06:45:00', '2025-05-23 06:45:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000070', u.id, 'completed', 132070.00, 0.00, 15848.40, 147918.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-01-26 02:01:00', '2025-01-26 02:01:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000071', u.id, 'completed', 107380.00, 0.00, 12885.60, 120265.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-17 06:56:00', '2025-09-17 06:56:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000072', u.id, 'cancelled', 113085.00, 0.00, 13570.20, 126655.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-14 20:54:00', '2025-04-14 20:54:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000073', u.id, 'cancelled', 94380.00, 0.00, 11325.60, 105705.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-02-27 11:12:00', '2025-02-27 11:12:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000074', u.id, 'completed', 194675.00, 0.00, 23361.00, 218036.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-05-18 06:11:00', '2025-05-18 06:11:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000075', u.id, 'completed', 175370.00, 0.00, 21044.40, 196414.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2025-08-25 03:27:00', '2025-08-25 03:27:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000076', u.id, 'completed', 122380.00, 0.00, 14685.60, 137065.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-10-04 11:46:00', '2025-10-04 11:46:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000077', u.id, 'completed', 157465.00, 0.00, 18895.80, 176360.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-03-25 17:42:00', '2025-03-25 17:42:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000078', u.id, 'completed', 31795.00, 0.00, 3815.40, 35610.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2025-02-26 13:26:00', '2025-02-26 13:26:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000079', u.id, 'completed', 84190.00, 0.00, 10102.80, 94292.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-07 12:28:00', '2025-05-07 12:28:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000080', u.id, 'completed', 105785.00, 0.00, 12694.20, 118479.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-24 13:42:00', '2025-11-24 13:42:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000081', u.id, 'completed', 73990.00, 0.00, 8878.80, 82868.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-04-17 23:33:00', '2025-04-17 23:33:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000082', u.id, 'completed', 30990.00, 0.00, 3718.80, 34708.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-03 10:31:00', '2025-04-03 10:31:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000083', u.id, 'completed', 102185.00, 0.00, 12262.20, 114447.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-18 04:26:00', '2025-06-18 04:26:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000084', u.id, 'completed', 131970.00, 0.00, 15836.40, 147806.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-21 05:08:00', '2025-11-21 05:08:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000085', u.id, 'cancelled', 49985.00, 0.00, 5998.20, 55983.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-12 13:22:00', '2025-09-12 13:22:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000086', u.id, 'completed', 235370.00, 0.00, 28244.40, 263614.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-10-30 07:00:00', '2025-10-30 07:00:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000087', u.id, 'completed', 109975.00, 0.00, 13197.00, 123172.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-11-12 00:28:00', '2025-11-12 00:28:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000088', u.id, 'completed', 219970.00, 0.00, 26396.40, 246366.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-05-11 13:39:00', '2025-05-11 13:39:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000089', u.id, 'completed', 70280.00, 0.00, 8433.60, 78713.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-12-19 13:52:00', '2025-12-19 13:52:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000090', u.id, 'completed', 115380.00, 0.00, 13845.60, 129225.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-06 05:39:00', '2025-05-06 05:39:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000091', u.id, 'completed', 33190.00, 0.00, 3982.80, 37172.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-11-24 14:39:00', '2025-11-24 14:39:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000092', u.id, 'completed', 203770.00, 0.00, 24452.40, 228222.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-01-27 04:28:00', '2025-01-27 04:28:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000093', u.id, 'cancelled', 37990.00, 0.00, 4558.80, 42548.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-16 10:36:00', '2025-06-16 10:36:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000094', u.id, 'completed', 145780.00, 0.00, 17493.60, 163273.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-06-12 08:15:00', '2025-06-12 08:15:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000095', u.id, 'completed', 91775.00, 0.00, 11013.00, 102788.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-02-02 15:55:00', '2025-02-02 15:55:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000096', u.id, 'cancelled', 245970.00, 0.00, 29516.40, 275486.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-05-02 18:18:00', '2025-05-02 18:18:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000097', u.id, 'completed', 153975.00, 0.00, 18477.00, 172452.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-10-14 10:43:00', '2025-10-14 10:43:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000098', u.id, 'completed', 71185.00, 0.00, 8542.20, 79727.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-12 15:55:00', '2025-07-12 15:55:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000099', u.id, 'completed', 37290.00, 0.00, 4474.80, 41764.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-01 06:13:00', '2025-09-01 06:13:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000100', u.id, 'completed', 33990.00, 0.00, 4078.80, 38068.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-07-31 14:28:00', '2025-07-31 14:28:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000101', u.id, 'completed', 130485.00, 0.00, 15658.20, 146143.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-09-19 05:17:00', '2025-09-19 05:17:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000102', u.id, 'completed', 185470.00, 0.00, 22256.40, 207726.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-22 17:43:00', '2025-06-22 17:43:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000103', u.id, 'completed', 145980.00, 0.00, 17517.60, 163497.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-23 16:02:00', '2025-12-23 16:02:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000104', u.id, 'completed', 200775.00, 0.00, 24093.00, 224868.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-10-02 08:39:00', '2025-10-02 08:39:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000105', u.id, 'cancelled', 19495.00, 0.00, 2339.40, 21834.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-28 04:54:00', '2025-07-28 04:54:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000106', u.id, 'completed', 102785.00, 0.00, 12334.20, 115119.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-06-28 01:48:00', '2025-06-28 01:48:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000107', u.id, 'completed', 73990.00, 0.00, 8878.80, 82868.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-15 22:36:00', '2025-07-15 22:36:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000108', u.id, 'completed', 30990.00, 0.00, 3718.80, 34708.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-28 21:51:00', '2025-01-28 21:51:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000109', u.id, 'completed', 24195.00, 0.00, 2903.40, 27098.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-04-08 11:04:00', '2025-04-08 11:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000110', u.id, 'completed', 247765.00, 0.00, 29731.80, 277496.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-11-18 14:17:00', '2025-11-18 14:17:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000111', u.id, 'cancelled', 84285.00, 0.00, 10114.20, 94399.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-09-14 15:53:00', '2025-09-14 15:53:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000112', u.id, 'completed', 26795.00, 0.00, 3215.40, 30010.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-18 03:16:00', '2025-07-18 03:16:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000113', u.id, 'completed', 167475.00, 0.00, 20097.00, 187572.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-14 14:32:00', '2025-01-14 14:32:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000114', u.id, 'completed', 15295.00, 0.00, 1835.40, 17130.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-20 08:03:00', '2025-11-20 08:03:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000115', u.id, 'cancelled', 88985.00, 0.00, 10678.20, 99663.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-01-11 08:54:00', '2025-01-11 08:54:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000116', u.id, 'completed', 53990.00, 0.00, 6478.80, 60468.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-02-18 08:56:00', '2025-02-18 08:56:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000117', u.id, 'completed', 83590.00, 0.00, 10030.80, 93620.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-09-22 08:42:00', '2025-09-22 08:42:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000118', u.id, 'completed', 46990.00, 0.00, 5638.80, 52628.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-21 06:58:00', '2025-03-21 06:58:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000119', u.id, 'completed', 148270.00, 0.00, 17792.40, 166062.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-02 02:03:00', '2025-03-02 02:03:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000120', u.id, 'cancelled', 134975.00, 0.00, 16197.00, 151172.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-06-10 10:26:00', '2025-06-10 10:26:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000121', u.id, 'completed', 123180.00, 0.00, 14781.60, 137961.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-10-09 10:00:00', '2025-10-09 10:00:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000122', u.id, 'completed', 95570.00, 0.00, 11468.40, 107038.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-09 06:52:00', '2025-05-09 06:52:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000123', u.id, 'completed', 65490.00, 0.00, 7858.80, 73348.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-28 15:27:00', '2025-01-28 15:27:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000124', u.id, 'completed', 85985.00, 0.00, 10318.20, 96303.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-08-09 14:21:00', '2025-08-09 14:21:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000125', u.id, 'completed', 97590.00, 0.00, 11710.80, 109300.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-05-01 16:57:00', '2025-05-01 16:57:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000126', u.id, 'completed', 104380.00, 0.00, 12525.60, 116905.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-10-26 18:42:00', '2025-10-26 18:42:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000127', u.id, 'completed', 18295.00, 0.00, 2195.40, 20490.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-07-20 10:21:00', '2025-07-20 10:21:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000128', u.id, 'cancelled', 116475.00, 0.00, 13977.00, 130452.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-15 03:33:00', '2025-04-15 03:33:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000129', u.id, 'completed', 58990.00, 0.00, 7078.80, 66068.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-05 13:29:00', '2025-06-05 13:29:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000130', u.id, 'completed', 111080.00, 0.00, 13329.60, 124409.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-17 22:15:00', '2025-06-17 22:15:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000131', u.id, 'completed', 104980.00, 0.00, 12597.60, 117577.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-09-21 15:21:00', '2025-09-21 15:21:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000132', u.id, 'completed', 28990.00, 0.00, 3478.80, 32468.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-04-24 14:04:00', '2025-04-24 14:04:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000133', u.id, 'cancelled', 47985.00, 0.00, 5758.20, 53743.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-05 04:03:00', '2025-11-05 04:03:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000134', u.id, 'completed', 18995.00, 0.00, 2279.40, 21274.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-17 00:30:00', '2025-07-17 00:30:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000135', u.id, 'completed', 275560.00, 0.00, 33067.20, 308627.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-22 08:26:00', '2025-08-22 08:26:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000136', u.id, 'completed', 129785.00, 0.00, 15574.20, 145359.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-11-11 09:43:00', '2025-11-11 09:43:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000137', u.id, 'cancelled', 44795.00, 0.00, 5375.40, 50170.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-11-04 03:13:00', '2025-11-04 03:13:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000138', u.id, 'completed', 259270.00, 0.00, 31112.40, 290382.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-19 12:41:00', '2025-04-19 12:41:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000139', u.id, 'completed', 51990.00, 0.00, 6238.80, 58228.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-01-19 08:10:00', '2025-01-19 08:10:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000140', u.id, 'cancelled', 54485.00, 0.00, 6538.20, 61023.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-16 21:01:00', '2025-06-16 21:01:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000141', u.id, 'completed', 57990.00, 0.00, 6958.80, 64948.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-17 21:34:00', '2025-06-17 21:34:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000142', u.id, 'completed', 165865.00, 0.00, 19903.80, 185768.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-12-03 07:22:00', '2025-12-03 07:22:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000143', u.id, 'completed', 124975.00, 0.00, 14997.00, 139972.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-02-20 04:18:00', '2025-02-20 04:18:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000144', u.id, 'completed', 65990.00, 0.00, 7918.80, 73908.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-03-24 05:51:00', '2025-03-24 05:51:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000145', u.id, 'completed', 45995.00, 0.00, 5519.40, 51514.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-06-22 13:40:00', '2025-06-22 13:40:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000146', u.id, 'cancelled', 158180.00, 0.00, 18981.60, 177161.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-16 08:48:00', '2025-12-16 08:48:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000147', u.id, 'completed', 263170.00, 0.00, 31580.40, 294750.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-12 07:35:00', '2025-01-12 07:35:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000148', u.id, 'cancelled', 162570.00, 0.00, 19508.40, 182078.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-07 15:56:00', '2025-11-07 15:56:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000149', u.id, 'completed', 134985.00, 0.00, 16198.20, 151183.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-04-06 19:49:00', '2025-04-06 19:49:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000150', u.id, 'completed', 244165.00, 0.00, 29299.80, 273464.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-04 19:28:00', '2025-02-04 19:28:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000151', u.id, 'completed', 95990.00, 0.00, 11518.80, 107508.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2025-02-10 14:44:00', '2025-02-10 14:44:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000152', u.id, 'completed', 44795.00, 0.00, 5375.40, 50170.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-01-11 02:33:00', '2025-01-11 02:33:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000153', u.id, 'completed', 28990.00, 0.00, 3478.80, 32468.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-08-23 10:46:00', '2025-08-23 10:46:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000154', u.id, 'completed', 68390.00, 0.00, 8206.80, 76596.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-02-23 13:35:00', '2025-02-23 13:35:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000155', u.id, 'cancelled', 126875.00, 0.00, 15225.00, 142100.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-18 22:23:00', '2025-01-18 22:23:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000156', u.id, 'completed', 30590.00, 0.00, 3670.80, 34260.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-12-14 18:07:00', '2025-12-14 18:07:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000157', u.id, 'completed', 122575.00, 0.00, 14709.00, 137284.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-07-02 21:02:00', '2025-07-02 21:02:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000158', u.id, 'completed', 178770.00, 0.00, 21452.40, 200222.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-09-20 08:55:00', '2025-09-20 08:55:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000159', u.id, 'completed', 136370.00, 0.00, 16364.40, 152734.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-02 14:30:00', '2025-07-02 14:30:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000160', u.id, 'completed', 46495.00, 0.00, 5579.40, 52074.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-06-08 19:34:00', '2025-06-08 19:34:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000161', u.id, 'cancelled', 50495.00, 0.00, 6059.40, 56554.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-01-16 04:26:00', '2025-01-16 04:26:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000162', u.id, 'completed', 83590.00, 0.00, 10030.80, 93620.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-11-21 10:51:00', '2025-11-21 10:51:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000163', u.id, 'completed', 169975.00, 0.00, 20397.00, 190372.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-08-08 20:36:00', '2025-08-08 20:36:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000164', u.id, 'completed', 49995.00, 0.00, 5999.40, 55994.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2025-02-02 08:53:00', '2025-02-02 08:53:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000165', u.id, 'completed', 135775.00, 0.00, 16293.00, 152068.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '369 Session Road, Baguio City, Benguet, 2600', '2025-05-14 06:22:00', '2025-05-14 06:22:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000166', u.id, 'completed', 117480.00, 0.00, 14097.60, 131577.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-23 21:26:00', '2025-06-23 21:26:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000167', u.id, 'completed', 85485.00, 0.00, 10258.20, 95743.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-16 23:43:00', '2025-12-16 23:43:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000168', u.id, 'completed', 26795.00, 0.00, 3215.40, 30010.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-05-14 03:19:00', '2025-05-14 03:19:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000169', u.id, 'completed', 113380.00, 0.00, 13605.60, 126985.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-10-14 20:49:00', '2025-10-14 20:49:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000170', u.id, 'completed', 131780.00, 0.00, 15813.60, 147593.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-22 03:43:00', '2025-06-22 03:43:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000171', u.id, 'completed', 74990.00, 0.00, 8998.80, 83988.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-01-23 08:31:00', '2025-01-23 08:31:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000172', u.id, 'cancelled', 257970.00, 0.00, 30956.40, 288926.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-11-08 06:45:00', '2025-11-08 06:45:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000173', u.id, 'completed', 72190.00, 0.00, 8662.80, 80852.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-10-19 23:02:00', '2025-10-19 23:02:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000174', u.id, 'completed', 73985.00, 0.00, 8878.20, 82863.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-11-29 09:07:00', '2025-11-29 09:07:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000175', u.id, 'completed', 126180.00, 0.00, 15141.60, 141321.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-10-05 06:59:00', '2025-10-05 06:59:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000176', u.id, 'cancelled', 209770.00, 0.00, 25172.40, 234942.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-16 22:17:00', '2025-05-16 22:17:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000177', u.id, 'completed', 52585.00, 0.00, 6310.20, 58895.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-09-12 20:20:00', '2025-09-12 20:20:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000178', u.id, 'completed', 64785.00, 0.00, 7774.20, 72559.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-17 20:44:00', '2025-02-17 20:44:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000179', u.id, 'completed', 156075.00, 0.00, 18729.00, 174804.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-04-14 01:38:00', '2025-04-14 01:38:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000180', u.id, 'cancelled', 121380.00, 0.00, 14565.60, 135945.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-01-25 17:07:00', '2025-01-25 17:07:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000181', u.id, 'completed', 86480.00, 0.00, 10377.60, 96857.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-10 11:16:00', '2025-01-10 11:16:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000182', u.id, 'completed', 87985.00, 0.00, 10558.20, 98543.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-11-27 07:51:00', '2025-11-27 07:51:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000183', u.id, 'completed', 29990.00, 0.00, 3598.80, 33588.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-26 18:14:00', '2025-12-26 18:14:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000184', u.id, 'completed', 196370.00, 0.00, 23564.40, 219934.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-01-18 21:20:00', '2025-01-18 21:20:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000185', u.id, 'cancelled', 112570.00, 0.00, 13508.40, 126078.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-08-09 12:00:00', '2025-08-09 12:00:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000186', u.id, 'completed', 123980.00, 0.00, 14877.60, 138857.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-29 12:46:00', '2025-11-29 12:46:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000187', u.id, 'cancelled', 105780.00, 0.00, 12693.60, 118473.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-30 04:15:00', '2025-03-30 04:15:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000188', u.id, 'completed', 90585.00, 0.00, 10870.20, 101455.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-04 19:49:00', '2025-05-04 19:49:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000189', u.id, 'completed', 77385.00, 0.00, 9286.20, 86671.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-12-03 09:08:00', '2025-12-03 09:08:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000190', u.id, 'completed', 193070.00, 0.00, 23168.40, 216238.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 917 123 4567', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-03-05 15:48:00', '2025-03-05 15:48:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000191', u.id, 'completed', 68480.00, 0.00, 8217.60, 76697.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-01-30 07:18:00', '2025-01-30 07:18:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000192', u.id, 'completed', 30990.00, 0.00, 3718.80, 34708.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-04-23 20:16:00', '2025-04-23 20:16:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000193', u.id, 'cancelled', 134480.00, 0.00, 16137.60, 150617.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-06-13 00:11:00', '2025-06-13 00:11:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000194', u.id, 'completed', 132075.00, 0.00, 15849.00, 147924.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-02 02:27:00', '2025-11-02 02:27:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000195', u.id, 'completed', 48790.00, 0.00, 5854.80, 54644.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-17 18:19:00', '2025-05-17 18:19:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000196', u.id, 'completed', 86880.00, 0.00, 10425.60, 97305.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-05-03 05:00:00', '2025-05-03 05:00:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000197', u.id, 'completed', 14995.00, 0.00, 1799.40, 16794.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-04 14:57:00', '2025-07-04 14:57:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000198', u.id, 'completed', 40790.00, 0.00, 4894.80, 45684.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-13 19:31:00', '2025-07-13 19:31:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000199', u.id, 'completed', 224170.00, 0.00, 26900.40, 251070.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-21 15:01:00', '2025-05-21 15:01:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000200', u.id, 'completed', 156765.00, 0.00, 18811.80, 175576.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-10-02 22:07:00', '2025-10-02 22:07:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000201', u.id, 'completed', 70980.00, 0.00, 8517.60, 79497.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-09-30 03:30:00', '2025-09-30 03:30:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000202', u.id, 'completed', 135985.00, 0.00, 16318.20, 152303.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-16 17:55:00', '2025-07-16 17:55:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000203', u.id, 'completed', 145875.00, 0.00, 17505.00, 163380.00, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-09-04 17:40:00', '2025-09-04 17:40:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000204', u.id, 'completed', 257770.00, 0.00, 30932.40, 288702.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-08 22:06:00', '2025-06-08 22:06:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000205', u.id, 'completed', 198570.00, 0.00, 23828.40, 222398.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-12 03:56:00', '2025-05-12 03:56:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000206', u.id, 'completed', 57685.00, 0.00, 6922.20, 64607.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-05-13 05:51:00', '2025-05-13 05:51:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000207', u.id, 'completed', 66190.00, 0.00, 7942.80, 74132.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-10 05:26:00', '2025-06-10 05:26:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000208', u.id, 'completed', 190070.00, 0.00, 22808.40, 212878.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-13 04:28:00', '2025-08-13 04:28:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000209', u.id, 'completed', 88075.00, 0.00, 10569.00, 98644.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-11-20 15:19:00', '2025-11-20 15:19:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000210', u.id, 'completed', 255570.00, 0.00, 30668.40, 286238.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-12 10:34:00', '2025-02-12 10:34:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000211', u.id, 'completed', 201165.00, 0.00, 24139.80, 225304.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-11 06:54:00', '2025-12-11 06:54:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000212', u.id, 'completed', 50685.00, 0.00, 6082.20, 56767.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-08 06:01:00', '2025-09-08 06:01:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000213', u.id, 'completed', 183775.00, 0.00, 22053.00, 205828.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-02-08 02:11:00', '2025-02-08 02:11:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000214', u.id, 'cancelled', 29990.00, 0.00, 3598.80, 33588.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-12 14:48:00', '2025-06-12 14:48:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000215', u.id, 'completed', 79990.00, 0.00, 9598.80, 89588.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-27 00:53:00', '2025-11-27 00:53:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000216', u.id, 'completed', 217170.00, 0.00, 26060.40, 243230.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-20 15:42:00', '2025-09-20 15:42:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000217', u.id, 'cancelled', 151375.00, 0.00, 18165.00, 169540.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-04-09 00:23:00', '2025-04-09 00:23:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000218', u.id, 'completed', 117280.00, 0.00, 14073.60, 131353.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-09-23 05:42:00', '2025-09-23 05:42:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000219', u.id, 'cancelled', 15495.00, 0.00, 1859.40, 17354.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-05-31 23:54:00', '2025-05-31 23:54:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000220', u.id, 'completed', 232165.00, 0.00, 27859.80, 260024.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-13 08:58:00', '2025-09-13 08:58:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000221', u.id, 'completed', 70980.00, 0.00, 8517.60, 79497.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-02-05 14:00:00', '2025-02-05 14:00:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000222', u.id, 'cancelled', 91990.00, 0.00, 11038.80, 103028.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-04-13 01:05:00', '2025-04-13 01:05:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000223', u.id, 'completed', 139375.00, 0.00, 16725.00, 156100.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-10-04 23:19:00', '2025-10-04 23:19:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000224', u.id, 'completed', 186875.00, 0.00, 22425.00, 209300.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-09-24 13:39:00', '2025-09-24 13:39:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000225', u.id, 'completed', 125775.00, 0.00, 15093.00, 140868.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-10-03 00:21:00', '2025-10-03 00:21:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000226', u.id, 'cancelled', 138380.00, 0.00, 16605.60, 154985.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-03-29 21:20:00', '2025-03-29 21:20:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000227', u.id, 'completed', 179375.00, 0.00, 21525.00, 200900.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-10-25 08:45:00', '2025-10-25 08:45:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000228', u.id, 'completed', 96880.00, 0.00, 11625.60, 108505.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-07-14 07:52:00', '2025-07-14 07:52:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000229', u.id, 'completed', 160375.00, 0.00, 19245.00, 179620.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-08 09:51:00', '2025-04-08 09:51:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000230', u.id, 'cancelled', 89590.00, 0.00, 10750.80, 100340.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-01 13:05:00', '2025-06-01 13:05:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000231', u.id, 'cancelled', 94390.00, 0.00, 11326.80, 105716.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-01-01 07:43:00', '2025-01-01 07:43:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000232', u.id, 'completed', 149365.00, 0.00, 17923.80, 167288.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-07-28 07:56:00', '2025-07-28 07:56:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000233', u.id, 'completed', 95785.00, 0.00, 11494.20, 107279.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-09-28 22:30:00', '2025-09-28 22:30:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000234', u.id, 'completed', 203970.00, 0.00, 24476.40, 228446.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-12-31 05:53:00', '2025-12-31 05:53:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000235', u.id, 'completed', 47195.00, 0.00, 5663.40, 52858.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-02-22 19:43:00', '2025-02-22 19:43:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000236', u.id, 'completed', 81690.00, 0.00, 9802.80, 91492.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2025-03-20 22:09:00', '2025-03-20 22:09:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000237', u.id, 'completed', 36995.00, 0.00, 4439.40, 41434.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-08-28 12:44:00', '2025-08-28 12:44:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000238', u.id, 'completed', 144470.00, 0.00, 17336.40, 161806.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-05 05:29:00', '2025-06-05 05:29:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000239', u.id, 'completed', 83985.00, 0.00, 10078.20, 94063.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-06-03 12:57:00', '2025-06-03 12:57:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000240', u.id, 'completed', 29990.00, 0.00, 3598.80, 33588.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-11-13 14:05:00', '2025-11-13 14:05:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000241', u.id, 'completed', 37990.00, 0.00, 4558.80, 42548.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-18 13:06:00', '2025-12-18 13:06:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000242', u.id, 'completed', 32790.00, 0.00, 3934.80, 36724.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-04-07 04:22:00', '2025-04-07 04:22:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000243', u.id, 'completed', 16495.00, 0.00, 1979.40, 18474.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-02-01 23:08:00', '2025-02-01 23:08:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000244', u.id, 'completed', 237560.00, 0.00, 28507.20, 266067.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2025-06-01 05:07:00', '2025-06-01 05:07:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000245', u.id, 'cancelled', 168480.00, 0.00, 20217.60, 188697.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 923 789 0123', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-08-08 06:38:00', '2025-08-08 06:38:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000246', u.id, 'completed', 76390.00, 0.00, 9166.80, 85556.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-01 08:58:00', '2025-06-01 08:58:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000247', u.id, 'completed', 65985.00, 0.00, 7918.20, 73903.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2025-01-02 15:05:00', '2025-01-02 15:05:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000248', u.id, 'completed', 98375.00, 0.00, 11805.00, 110180.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-06-13 06:13:00', '2025-06-13 06:13:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000249', u.id, 'completed', 188975.00, 0.00, 22677.00, 211652.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-23 22:42:00', '2025-12-23 22:42:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000250', u.id, 'completed', 170965.00, 0.00, 20515.80, 191480.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-03-11 02:33:00', '2025-03-11 02:33:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000251', u.id, 'completed', 115080.00, 0.00, 13809.60, 128889.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-09-22 10:48:00', '2025-09-22 10:48:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000252', u.id, 'cancelled', 100980.00, 0.00, 12117.60, 113097.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '369 Session Road, Baguio City, Benguet, 2600', '2025-02-10 05:05:00', '2025-02-10 05:05:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000253', u.id, 'completed', 26995.00, 0.00, 3239.40, 30234.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-04 04:03:00', '2025-07-04 04:03:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000254', u.id, 'completed', 74685.00, 0.00, 8962.20, 83647.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-07-20 11:59:00', '2025-07-20 11:59:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000255', u.id, 'completed', 49990.00, 0.00, 5998.80, 55988.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-02-16 13:18:00', '2025-02-16 13:18:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000256', u.id, 'completed', 26795.00, 0.00, 3215.40, 30010.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-06-19 04:26:00', '2025-06-19 04:26:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000257', u.id, 'cancelled', 172765.00, 0.00, 20731.80, 193496.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2025-04-13 10:33:00', '2025-04-13 10:33:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000258', u.id, 'completed', 192865.00, 0.00, 23143.80, 216008.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-01-06 03:56:00', '2025-01-06 03:56:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000259', u.id, 'cancelled', 233360.00, 0.00, 28003.20, 261363.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-02-06 19:54:00', '2025-02-06 19:54:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000260', u.id, 'completed', 224565.00, 0.00, 26947.80, 251512.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-02-22 00:19:00', '2025-02-22 00:19:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000261', u.id, 'completed', 112365.00, 0.00, 13483.80, 125848.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-07-11 21:55:00', '2025-07-11 21:55:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000262', u.id, 'completed', 221070.00, 0.00, 26528.40, 247598.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-09-22 19:41:00', '2025-09-22 19:41:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000263', u.id, 'cancelled', 143580.00, 0.00, 17229.60, 160809.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-06-04 18:53:00', '2025-06-04 18:53:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000264', u.id, 'cancelled', 44795.00, 0.00, 5375.40, 50170.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-08-09 20:30:00', '2025-08-09 20:30:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000265', u.id, 'completed', 41795.00, 0.00, 5015.40, 46810.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 922 678 9012', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-03-30 15:52:00', '2025-03-30 15:52:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000266', u.id, 'completed', 112585.00, 0.00, 13510.20, 126095.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-06-30 20:09:00', '2025-06-30 20:09:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000267', u.id, 'completed', 24195.00, 0.00, 2903.40, 27098.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-07-03 11:10:00', '2025-07-03 11:10:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000268', u.id, 'completed', 79385.00, 0.00, 9526.20, 88911.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-12-24 03:44:00', '2025-12-24 03:44:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000269', u.id, 'completed', 115980.00, 0.00, 13917.60, 129897.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-06-18 07:00:00', '2025-06-18 07:00:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000270', u.id, 'completed', 143580.00, 0.00, 17229.60, 160809.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-12-29 08:10:00', '2025-12-29 08:10:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000271', u.id, 'completed', 110780.00, 0.00, 13293.60, 124073.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-05-07 15:12:00', '2025-05-07 15:12:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000272', u.id, 'completed', 136780.00, 0.00, 16413.60, 153193.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2025-02-04 05:29:00', '2025-02-04 05:29:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000273', u.id, 'completed', 76390.00, 0.00, 9166.80, 85556.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-27 21:25:00', '2025-10-27 21:25:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000274', u.id, 'completed', 193475.00, 0.00, 23217.00, 216692.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-10-03 15:02:00', '2025-10-03 15:02:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000275', u.id, 'completed', 119485.00, 0.00, 14338.20, 133823.20, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-12-03 13:19:00', '2025-12-03 13:19:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000276', u.id, 'completed', 229770.00, 0.00, 27572.40, 257342.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2025-09-16 19:29:00', '2025-09-16 19:29:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000277', u.id, 'completed', 69990.00, 0.00, 8398.80, 78388.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-10-05 21:00:00', '2025-10-05 21:00:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000278', u.id, 'completed', 86980.00, 0.00, 10437.60, 97417.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-02-02 23:49:00', '2025-02-02 23:49:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000279', u.id, 'completed', 138485.00, 0.00, 16618.20, 155103.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-18 19:48:00', '2025-08-18 19:48:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000280', u.id, 'completed', 203970.00, 0.00, 24476.40, 228446.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '369 Session Road, Baguio City, Benguet, 2600', '2025-11-06 10:48:00', '2025-11-06 10:48:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000281', u.id, 'completed', 111285.00, 0.00, 13354.20, 124639.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-08-27 16:19:00', '2025-08-27 16:19:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000282', u.id, 'completed', 133180.00, 0.00, 15981.60, 149161.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-09-05 00:55:00', '2025-09-05 00:55:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000283', u.id, 'completed', 279360.00, 0.00, 33523.20, 312883.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2025-12-09 18:26:00', '2025-12-09 18:26:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000284', u.id, 'completed', 14995.00, 0.00, 1799.40, 16794.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2025-01-15 08:39:00', '2025-01-15 08:39:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000285', u.id, 'completed', 56390.00, 0.00, 6766.80, 63156.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-08-30 21:43:00', '2025-08-30 21:43:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000286', u.id, 'completed', 30590.00, 0.00, 3670.80, 34260.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2025-06-26 00:38:00', '2025-06-26 00:38:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000287', u.id, 'completed', 100780.00, 0.00, 12093.60, 112873.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-07-05 10:25:00', '2025-07-05 10:25:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000288', u.id, 'completed', 235560.00, 0.00, 28267.20, 263827.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-06-23 05:03:00', '2025-06-23 05:03:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000289', u.id, 'completed', 199470.00, 0.00, 23936.40, 223406.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-05-26 02:04:00', '2025-05-26 02:04:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000290', u.id, 'completed', 56185.00, 0.00, 6742.20, 62927.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-03-10 11:05:00', '2025-03-10 11:05:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000291', u.id, 'completed', 142375.00, 0.00, 17085.00, 159460.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-04-11 12:10:00', '2025-04-11 12:10:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000292', u.id, 'completed', 207360.00, 0.00, 24883.20, 232243.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2025-12-26 03:47:00', '2025-12-26 03:47:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000293', u.id, 'completed', 17495.00, 0.00, 2099.40, 19594.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-12-22 15:49:00', '2025-12-22 15:49:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000294', u.id, 'cancelled', 91690.00, 0.00, 11002.80, 102692.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-12-05 15:48:00', '2025-12-05 15:48:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000295', u.id, 'completed', 185175.00, 0.00, 22221.00, 207396.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-12-14 22:11:00', '2025-12-14 22:11:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000296', u.id, 'completed', 192370.00, 0.00, 23084.40, 215454.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2025-07-29 22:34:00', '2025-07-29 22:34:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000297', u.id, 'completed', 138870.00, 0.00, 16664.40, 155534.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2025-04-06 04:45:00', '2025-04-06 04:45:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000298', u.id, 'completed', 123080.00, 0.00, 14769.60, 137849.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2025-03-28 05:04:00', '2025-03-28 05:04:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000299', u.id, 'completed', 93580.00, 0.00, 11229.60, 104809.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2025-06-15 16:42:00', '2025-06-15 16:42:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000300', u.id, 'completed', 162665.00, 0.00, 19519.80, 182184.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2025-10-16 08:44:00', '2025-10-16 08:44:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000301', u.id, 'processing', 179575.00, 0.00, 21549.00, 201124.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-11 03:01:00', '2026-01-11 03:01:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000302', u.id, 'processing', 153180.00, 0.00, 18381.60, 171561.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-09 22:43:00', '2026-01-09 22:43:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000303', u.id, 'completed', 115980.00, 0.00, 13917.60, 129897.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 22:49:00', '2026-01-01 22:49:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000304', u.id, 'completed', 143370.00, 0.00, 17204.40, 160574.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 926 012 3456', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-05 19:00:00', '2026-01-05 19:00:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000305', u.id, 'completed', 108585.00, 0.00, 13030.20, 121615.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-01 11:41:00', '2026-01-01 11:41:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000306', u.id, 'shipped', 156970.00, 0.00, 18836.40, 175806.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-08 23:20:00', '2026-01-08 23:20:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000307', u.id, 'completed', 36995.00, 0.00, 4439.40, 41434.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-04 16:56:00', '2026-01-04 16:56:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000308', u.id, 'completed', 192965.00, 0.00, 23155.80, 216120.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-07 06:13:00', '2026-01-07 06:13:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000309', u.id, 'completed', 53590.00, 0.00, 6430.80, 60020.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 923 789 0123', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-04 03:39:00', '2026-01-04 03:39:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000310', u.id, 'completed', 196770.00, 0.00, 23612.40, 220382.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-01 16:02:00', '2026-01-01 16:02:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000311', u.id, 'processing', 141780.00, 0.00, 17013.60, 158793.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-06 10:29:00', '2026-01-06 10:29:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000312', u.id, 'completed', 59985.00, 0.00, 7198.20, 67183.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-04 22:30:00', '2026-01-04 22:30:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000313', u.id, 'completed', 130785.00, 0.00, 15694.20, 146479.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 923 789 0123', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-08 14:24:00', '2026-01-08 14:24:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000314', u.id, 'completed', 152775.00, 0.00, 18333.00, 171108.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-11 10:46:00', '2026-01-11 10:46:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000315', u.id, 'completed', 33190.00, 0.00, 3982.80, 37172.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-07 01:10:00', '2026-01-07 01:10:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000316', u.id, 'completed', 26995.00, 0.00, 3239.40, 30234.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-10 09:42:00', '2026-01-10 09:42:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000317', u.id, 'completed', 135175.00, 0.00, 16221.00, 151396.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-03 22:15:00', '2026-01-03 22:15:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000318', u.id, 'processing', 45995.00, 0.00, 5519.40, 51514.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-05 21:29:00', '2026-01-05 21:29:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000319', u.id, 'processing', 141470.00, 0.00, 16976.40, 158446.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-09 20:03:00', '2026-01-09 20:03:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000320', u.id, 'completed', 173275.00, 0.00, 20793.00, 194068.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-06 22:21:00', '2026-01-06 22:21:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000321', u.id, 'shipped', 187870.00, 0.00, 22544.40, 210414.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-03 22:09:00', '2026-01-03 22:09:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000322', u.id, 'shipped', 54990.00, 0.00, 6598.80, 61588.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-03 21:35:00', '2026-01-03 21:35:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000323', u.id, 'shipped', 152475.00, 0.00, 18297.00, 170772.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-03 11:40:00', '2026-01-03 11:40:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000324', u.id, 'completed', 41195.00, 0.00, 4943.40, 46138.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-10 09:48:00', '2026-01-10 09:48:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000325', u.id, 'completed', 13795.00, 0.00, 1655.40, 15450.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 918 234 5678', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-11 06:17:00', '2026-01-11 06:17:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000326', u.id, 'shipped', 124985.00, 0.00, 14998.20, 139983.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-02 13:30:00', '2026-01-02 13:30:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000327', u.id, 'processing', 34990.00, 0.00, 4198.80, 39188.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-09 12:23:00', '2026-01-09 12:23:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000328', u.id, 'completed', 86385.00, 0.00, 10366.20, 96751.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-03 09:21:00', '2026-01-03 09:21:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000329', u.id, 'completed', 148475.00, 0.00, 17817.00, 166292.00, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-07 01:48:00', '2026-01-07 01:48:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000330', u.id, 'completed', 157465.00, 0.00, 18895.80, 176360.80, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-05 08:57:00', '2026-01-05 08:57:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000331', u.id, 'completed', 91080.00, 0.00, 10929.60, 102009.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-06 00:25:00', '2026-01-06 00:25:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000332', u.id, 'shipped', 152170.00, 0.00, 18260.40, 170430.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-11 23:35:00', '2026-01-11 23:35:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000333', u.id, 'completed', 122585.00, 0.00, 14710.20, 137295.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-08 19:42:00', '2026-01-08 19:42:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000334', u.id, 'shipped', 172580.00, 0.00, 20709.60, 193289.60, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 922 678 9012', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-06 07:50:00', '2026-01-06 07:50:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000335', u.id, 'completed', 219470.00, 0.00, 26336.40, 245806.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-11 11:11:00', '2026-01-11 11:11:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000336', u.id, 'completed', 190470.00, 0.00, 22856.40, 213326.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-03 13:04:00', '2026-01-03 13:04:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000337', u.id, 'completed', 70685.00, 0.00, 8482.20, 79167.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-08 08:09:00', '2026-01-08 08:09:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000338', u.id, 'completed', 140780.00, 0.00, 16893.60, 157673.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-01 16:23:00', '2026-01-01 16:23:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000339', u.id, 'shipped', 37990.00, 0.00, 4558.80, 42548.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 921 567 8901', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-11 15:38:00', '2026-01-11 15:38:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000340', u.id, 'completed', 134485.00, 0.00, 16138.20, 150623.20, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-01 02:57:00', '2026-01-01 02:57:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000341', u.id, 'shipped', 199470.00, 0.00, 23936.40, 223406.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 921 567 8901', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-02 06:16:00', '2026-01-02 06:16:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000342', u.id, 'completed', 132475.00, 0.00, 15897.00, 148372.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-07 05:23:00', '2026-01-07 05:23:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000343', u.id, 'shipped', 79990.00, 0.00, 9598.80, 89588.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 918 234 5678', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-10 08:19:00', '2026-01-10 08:19:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000344', u.id, 'completed', 36390.00, 0.00, 4366.80, 40756.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-07 19:17:00', '2026-01-07 19:17:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000345', u.id, 'processing', 80885.00, 0.00, 9706.20, 90591.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-04 05:07:00', '2026-01-04 05:07:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000346', u.id, 'completed', 75990.00, 0.00, 9118.80, 85108.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-10 13:38:00', '2026-01-10 13:38:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000347', u.id, 'completed', 69585.00, 0.00, 8350.20, 77935.20, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-07 18:51:00', '2026-01-07 18:51:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000348', u.id, 'completed', 164570.00, 0.00, 19748.40, 184318.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-06 21:46:00', '2026-01-06 21:46:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000349', u.id, 'completed', 187475.00, 0.00, 22497.00, 209972.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-06 14:08:00', '2026-01-06 14:08:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000350', u.id, 'completed', 139980.00, 0.00, 16797.60, 156777.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-10 07:12:00', '2026-01-10 07:12:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000351', u.id, 'completed', 76390.00, 0.00, 9166.80, 85556.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-08 05:49:00', '2026-01-08 05:49:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000352', u.id, 'completed', 39390.00, 0.00, 4726.80, 44116.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-03 21:24:00', '2026-01-03 21:24:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000353', u.id, 'completed', 197570.00, 0.00, 23708.40, 221278.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 919 345 6789', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-08 17:53:00', '2026-01-08 17:53:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000354', u.id, 'completed', 106585.00, 0.00, 12790.20, 119375.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-02 10:14:00', '2026-01-02 10:14:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000355', u.id, 'shipped', 250265.00, 0.00, 30031.80, 280296.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-03 02:45:00', '2026-01-03 02:45:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000356', u.id, 'shipped', 181765.00, 0.00, 21811.80, 203576.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-02 00:40:00', '2026-01-02 00:40:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000357', u.id, 'processing', 168175.00, 0.00, 20181.00, 188356.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-07 01:10:00', '2026-01-07 01:10:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000358', u.id, 'processing', 94390.00, 0.00, 11326.80, 105716.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-04 03:30:00', '2026-01-04 03:30:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000359', u.id, 'completed', 175580.00, 0.00, 21069.60, 196649.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-08 03:09:00', '2026-01-08 03:09:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000360', u.id, 'shipped', 266960.00, 0.00, 32035.20, 298995.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-08 21:51:00', '2026-01-08 21:51:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000361', u.id, 'shipped', 179770.00, 0.00, 21572.40, 201342.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-05 15:36:00', '2026-01-05 15:36:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000362', u.id, 'shipped', 39995.00, 0.00, 4799.40, 44794.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-01 23:35:00', '2026-01-01 23:35:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000363', u.id, 'completed', 252970.00, 0.00, 30356.40, 283326.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 924 890 1234', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-05 20:29:00', '2026-01-05 20:29:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000364', u.id, 'shipped', 71980.00, 0.00, 8637.60, 80617.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 922 678 9012', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-05 19:29:00', '2026-01-05 19:29:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000365', u.id, 'completed', 150075.00, 0.00, 18009.00, 168084.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 919 345 6789', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-06 21:43:00', '2026-01-06 21:43:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000366', u.id, 'completed', 122870.00, 0.00, 14744.40, 137614.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-10 10:57:00', '2026-01-10 10:57:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000367', u.id, 'shipped', 49995.00, 0.00, 5999.40, 55994.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 926 012 3456', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-10 17:57:00', '2026-01-10 17:57:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000368', u.id, 'processing', 45995.00, 0.00, 5519.40, 51514.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-10 23:50:00', '2026-01-10 23:50:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000369', u.id, 'processing', 29990.00, 0.00, 3598.80, 33588.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-05 03:01:00', '2026-01-05 03:01:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000370', u.id, 'completed', 63790.00, 0.00, 7654.80, 71444.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-10 07:16:00', '2026-01-10 07:16:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000371', u.id, 'processing', 76590.00, 0.00, 9190.80, 85780.80, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-04 13:59:00', '2026-01-04 13:59:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000372', u.id, 'completed', 64990.00, 0.00, 7798.80, 72788.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-07 18:17:00', '2026-01-07 18:17:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000373', u.id, 'completed', 165375.00, 0.00, 19845.00, 185220.00, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-02 01:20:00', '2026-01-02 01:20:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000374', u.id, 'completed', 140980.00, 0.00, 16917.60, 157897.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-07 15:58:00', '2026-01-07 15:58:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000375', u.id, 'shipped', 177670.00, 0.00, 21320.40, 198990.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-08 10:16:00', '2026-01-08 10:16:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000376', u.id, 'completed', 108780.00, 0.00, 13053.60, 121833.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-02 17:39:00', '2026-01-02 17:39:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000377', u.id, 'shipped', 81985.00, 0.00, 9838.20, 91823.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-05 10:49:00', '2026-01-05 10:49:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000378', u.id, 'completed', 132370.00, 0.00, 15884.40, 148254.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-01 14:53:00', '2026-01-01 14:53:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000379', u.id, 'completed', 57490.00, 0.00, 6898.80, 64388.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 919 345 6789', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-03 17:49:00', '2026-01-03 17:49:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000380', u.id, 'completed', 118980.00, 0.00, 14277.60, 133257.60, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-07 22:20:00', '2026-01-07 22:20:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000381', u.id, 'shipped', 148380.00, 0.00, 17805.60, 166185.60, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 921 567 8901', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-07 05:56:00', '2026-01-07 05:56:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000382', u.id, 'completed', 14995.00, 0.00, 1799.40, 16794.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-03 16:01:00', '2026-01-03 16:01:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000383', u.id, 'completed', 111285.00, 0.00, 13354.20, 124639.20, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-05 18:43:00', '2026-01-05 18:43:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000384', u.id, 'shipped', 48795.00, 0.00, 5855.40, 54650.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-10 20:15:00', '2026-01-10 20:15:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000385', u.id, 'shipped', 209970.00, 0.00, 25196.40, 235166.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-03 00:49:00', '2026-01-03 00:49:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000386', u.id, 'processing', 59785.00, 0.00, 7174.20, 66959.20, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 924 890 1234', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-09 23:35:00', '2026-01-09 23:35:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000387', u.id, 'processing', 36590.00, 0.00, 4390.80, 40980.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-01 17:01:00', '2026-01-01 17:01:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000388', u.id, 'completed', 132280.00, 0.00, 15873.60, 148153.60, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-09 09:27:00', '2026-01-09 09:27:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000389', u.id, 'processing', 265565.00, 0.00, 31867.80, 297432.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-07 15:31:00', '2026-01-07 15:31:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000390', u.id, 'completed', 194575.00, 0.00, 23349.00, 217924.00, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-09 11:01:00', '2026-01-09 11:01:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000391', u.id, 'completed', 169375.00, 0.00, 20325.00, 189700.00, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-08 04:36:00', '2026-01-08 04:36:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000392', u.id, 'shipped', 108385.00, 0.00, 13006.20, 121391.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-02 09:44:00', '2026-01-02 09:44:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000393', u.id, 'completed', 135375.00, 0.00, 16245.00, 151620.00, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-05 03:08:00', '2026-01-05 03:08:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000394', u.id, 'processing', 27590.00, 0.00, 3310.80, 30900.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 918 234 5678', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-10 00:17:00', '2026-01-10 00:17:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000395', u.id, 'completed', 81790.00, 0.00, 9814.80, 91604.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 925 901 2345', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-10 12:28:00', '2026-01-10 12:28:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000396', u.id, 'completed', 168970.00, 0.00, 20276.40, 189246.40, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 922 678 9012', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-09 01:44:00', '2026-01-09 01:44:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000397', u.id, 'completed', 161365.00, 0.00, 19363.80, 180728.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-11 12:07:00', '2026-01-11 12:07:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000398', u.id, 'completed', 158270.00, 0.00, 18992.40, 177262.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 918 234 5678', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-09 01:28:00', '2026-01-09 01:28:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000399', u.id, 'completed', 118680.00, 0.00, 14241.60, 132921.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-09 01:41:00', '2026-01-09 01:41:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000400', u.id, 'shipped', 14995.00, 0.00, 1799.40, 16794.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-09 07:52:00', '2026-01-09 07:52:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000401', u.id, 'completed', 143165.00, 0.00, 17179.80, 160344.80, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-06 10:22:00', '2026-01-06 10:22:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000402', u.id, 'processing', 82390.00, 0.00, 9886.80, 92276.80, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-07 21:47:00', '2026-01-07 21:47:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000403', u.id, 'processing', 209170.00, 0.00, 25100.40, 234270.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-06 08:09:00', '2026-01-06 08:09:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000404', u.id, 'completed', 116470.00, 0.00, 13976.40, 130446.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-03 02:19:00', '2026-01-03 02:19:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000405', u.id, 'shipped', 228165.00, 0.00, 27379.80, 255544.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 922 678 9012', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-05 12:26:00', '2026-01-05 12:26:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000406', u.id, 'completed', 83580.00, 0.00, 10029.60, 93609.60, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 925 901 2345', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-04 13:59:00', '2026-01-04 13:59:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000407', u.id, 'completed', 150575.00, 0.00, 18069.00, 168644.00, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-09 21:38:00', '2026-01-09 21:38:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000408', u.id, 'completed', 82390.00, 0.00, 9886.80, 92276.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-04 15:18:00', '2026-01-04 15:18:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000409', u.id, 'shipped', 47195.00, 0.00, 5663.40, 52858.40, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-11 06:38:00', '2026-01-11 06:38:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000410', u.id, 'processing', 73990.00, 0.00, 8878.80, 82868.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 919 345 6789', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-04 22:47:00', '2026-01-04 22:47:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000411', u.id, 'completed', 100990.00, 0.00, 12118.80, 113108.80, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-04 03:57:00', '2026-01-04 03:57:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000412', u.id, 'processing', 178970.00, 0.00, 21476.40, 200446.40, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 923 789 0123', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-02 09:46:00', '2026-01-02 09:46:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000413', u.id, 'completed', 27995.00, 0.00, 3359.40, 31354.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 923 789 0123', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-11 01:18:00', '2026-01-11 01:18:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000414', u.id, 'completed', 155565.00, 0.00, 18667.80, 174232.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 925 901 2345', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-03 18:16:00', '2026-01-03 18:16:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000415', u.id, 'completed', 103380.00, 0.00, 12405.60, 115785.60, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 926 012 3456', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-09 03:51:00', '2026-01-09 03:51:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000416', u.id, 'completed', 77680.00, 0.00, 9321.60, 87001.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 925 901 2345', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-10 05:38:00', '2026-01-10 05:38:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000417', u.id, 'completed', 95980.00, 0.00, 11517.60, 107497.60, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 926 012 3456', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-08 15:45:00', '2026-01-08 15:45:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000418', u.id, 'completed', 181580.00, 0.00, 21789.60, 203369.60, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 925 901 2345', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-10 16:05:00', '2026-01-10 16:05:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000419', u.id, 'completed', 48285.00, 0.00, 5794.20, 54079.20, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 924 890 1234', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-02 18:17:00', '2026-01-02 18:17:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000420', u.id, 'completed', 168175.00, 0.00, 20181.00, 188356.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 921 567 8901', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-07 06:15:00', '2026-01-07 06:15:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000421', u.id, 'shipped', 150670.00, 0.00, 18080.40, 168750.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-01 06:51:00', '2026-01-01 06:51:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000422', u.id, 'completed', 115185.00, 0.00, 13822.20, 129007.20, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 919 345 6789', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-03 02:18:00', '2026-01-03 02:18:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000423', u.id, 'shipped', 16995.00, 0.00, 2039.40, 19034.40, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-06 16:57:00', '2026-01-06 16:57:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000424', u.id, 'shipped', 45995.00, 0.00, 5519.40, 51514.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 926 012 3456', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-08 03:50:00', '2026-01-08 03:50:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000425', u.id, 'completed', 30590.00, 0.00, 3670.80, 34260.80, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-01 07:51:00', '2026-01-01 07:51:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000426', u.id, 'completed', 45995.00, 0.00, 5519.40, 51514.40, 'Araceli Miranda', 'araceli.miranda5@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-06 20:26:00', '2026-01-06 20:26:00'
FROM users u WHERE u.email = 'araceli.miranda5@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000427', u.id, 'completed', 234770.00, 0.00, 28172.40, 262942.40, 'Antonio Gonzalez', 'antonio.gonzalez1@mypc.com', '+63 926 012 3456', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-11 04:51:00', '2026-01-11 04:51:00'
FROM users u WHERE u.email = 'antonio.gonzalez1@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000428', u.id, 'processing', 195365.00, 0.00, 23443.80, 218808.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 925 901 2345', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-01 19:03:00', '2026-01-01 19:03:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000429', u.id, 'processing', 144175.00, 0.00, 17301.00, 161476.00, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 921 567 8901', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-04 13:59:00', '2026-01-04 13:59:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000430', u.id, 'completed', 266965.00, 0.00, 32035.80, 299000.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 920 456 7890', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-10 06:24:00', '2026-01-10 06:24:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000431', u.id, 'shipped', 104185.00, 0.00, 12502.20, 116687.20, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 921 567 8901', '789 Mabini Street, Manila, Metro Manila, 1000', '2026-01-06 15:34:00', '2026-01-06 15:34:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000432', u.id, 'shipped', 23495.00, 0.00, 2819.40, 26314.40, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 920 456 7890', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-06 23:52:00', '2026-01-06 23:52:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000433', u.id, 'shipped', 155375.00, 0.00, 18645.00, 174020.00, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 920 456 7890', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-03 12:50:00', '2026-01-03 12:50:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000434', u.id, 'processing', 85990.00, 0.00, 10318.80, 96308.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 919 345 6789', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-06 11:40:00', '2026-01-06 11:40:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000435', u.id, 'completed', 36990.00, 0.00, 4438.80, 41428.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 918 234 5678', '456 Bonifacio Avenue, Quezon City, Metro Manila, 1100', '2026-01-04 08:42:00', '2026-01-04 08:42:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000436', u.id, 'processing', 53085.00, 0.00, 6370.20, 59455.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 920 456 7890', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-04 20:48:00', '2026-01-04 20:48:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000437', u.id, 'completed', 62985.00, 0.00, 7558.20, 70543.20, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-09 11:51:00', '2026-01-09 11:51:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000438', u.id, 'processing', 27590.00, 0.00, 3310.80, 30900.80, 'Rosa Solntseff', 'rosa.solntseff7@mypc.com', '+63 924 890 1234', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-03 21:56:00', '2026-01-03 21:56:00'
FROM users u WHERE u.email = 'rosa.solntseff7@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000439', u.id, 'completed', 171370.00, 0.00, 20564.40, 191934.40, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 918 234 5678', '654 Aguinaldo Highway, Cavite City, Cavite, 4100', '2026-01-01 08:59:00', '2026-01-01 08:59:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000440', u.id, 'processing', 68380.00, 0.00, 8205.60, 76585.60, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 926 012 3456', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-08 00:18:00', '2026-01-08 00:18:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000441', u.id, 'processing', 222765.00, 0.00, 26731.80, 249496.80, 'Margarita Soto', 'margarita.soto9@mypc.com', '+63 925 901 2345', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-08 10:22:00', '2026-01-08 10:22:00'
FROM users u WHERE u.email = 'margarita.soto9@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000442', u.id, 'completed', 255770.00, 0.00, 30692.40, 286462.40, 'Gregorio Reyes', 'gregorio.reyes11@mypc.com', '+63 924 890 1234', '123 Rizal Street, Makati City, Metro Manila, 1200', '2026-01-03 05:23:00', '2026-01-03 05:23:00'
FROM users u WHERE u.email = 'gregorio.reyes11@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000443', u.id, 'completed', 83085.00, 0.00, 9970.20, 93055.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 922 678 9012', '987 MacArthur Highway, Angeles City, Pampanga, 2009', '2026-01-01 01:32:00', '2026-01-01 01:32:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000444', u.id, 'processing', 92990.00, 0.00, 11158.80, 104148.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-06 07:05:00', '2026-01-06 07:05:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000445', u.id, 'completed', 14995.00, 0.00, 1799.40, 16794.40, 'Ana Soliz', 'ana.soliz6@mypc.com', '+63 917 123 4567', '321 Del Pilar Street, Pasig City, Metro Manila, 1600', '2026-01-05 05:36:00', '2026-01-05 05:36:00'
FROM users u WHERE u.email = 'ana.soliz6@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000446', u.id, 'completed', 47985.00, 0.00, 5758.20, 53743.20, 'Rosalinda Campanilla', 'rosalinda.campanilla10@mypc.com', '+63 917 123 4567', '741 Burgos Street, Iloilo City, Iloilo, 5000', '2026-01-05 06:27:00', '2026-01-05 06:27:00'
FROM users u WHERE u.email = 'rosalinda.campanilla10@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000447', u.id, 'processing', 148775.00, 0.00, 17853.00, 166628.00, 'Estanislao Voitlexner', 'estanislao.voitlexner4@mypc.com', '+63 921 567 8901', '369 Session Road, Baguio City, Benguet, 2600', '2026-01-07 00:40:00', '2026-01-07 00:40:00'
FROM users u WHERE u.email = 'estanislao.voitlexner4@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000448', u.id, 'completed', 56990.00, 0.00, 6838.80, 63828.80, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 917 123 4567', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-04 21:09:00', '2026-01-04 21:09:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000449', u.id, 'completed', 73590.00, 0.00, 8830.80, 82420.80, 'Ana Sollus', 'ana.sollus2@mypc.com', '+63 920 456 7890', '258 Araneta Avenue, Davao City, Davao del Sur, 8000', '2026-01-02 00:54:00', '2026-01-02 00:54:00'
FROM users u WHERE u.email = 'ana.sollus2@mypc.com' LIMIT 1;
INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT 'ORD-00000450', u.id, 'completed', 121180.00, 0.00, 14541.60, 135721.60, 'Miguel Sollner', 'miguel.sollner3@mypc.com', '+63 924 890 1234', '147 Osmeña Boulevard, Cebu City, Cebu, 6000', '2026-01-04 07:19:00', '2026-01-04 07:19:00'
FROM users u WHERE u.email = 'miguel.sollner3@mypc.com' LIMIT 1;

-- =====================================================
-- INSERT ORDER ITEMS (using order_number lookup)
-- =====================================================

INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000001' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000001' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000001' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000001' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000002' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 1, 27495.00
FROM orders o WHERE o.order_number = 'ORD-00000002' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000002' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000002' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000003' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00
FROM orders o WHERE o.order_number = 'ORD-00000003' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00
FROM orders o WHERE o.order_number = 'ORD-00000003' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00
FROM orders o WHERE o.order_number = 'ORD-00000003' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000004' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000004' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 1, 27495.00
FROM orders o WHERE o.order_number = 'ORD-00000005' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000005' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000006' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000006' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000006' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000007' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000007' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000007' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000007' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000008' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000008' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000009' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000010' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000010' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000010' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000010' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00
FROM orders o WHERE o.order_number = 'ORD-00000011' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000011' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000011' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000012' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000012' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000012' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000013' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000013' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000013' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000014' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000014' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00
FROM orders o WHERE o.order_number = 'ORD-00000014' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 1, 51195.00
FROM orders o WHERE o.order_number = 'ORD-00000015' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000015' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000015' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000015' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000016' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000016' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 2, 102390.00
FROM orders o WHERE o.order_number = 'ORD-00000016' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000017' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000017' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000017' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000017' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000018' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000018' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000018' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000019' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000019' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000019' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000019' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00
FROM orders o WHERE o.order_number = 'ORD-00000020' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000020' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000020' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000021' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000021' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000021' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000021' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00
FROM orders o WHERE o.order_number = 'ORD-00000022' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000022' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000022' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000023' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000023' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000024' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000024' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000024' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000025' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000025' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000026' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000026' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000026' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000027' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000027' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000027' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000028' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000029' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000030' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000030' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00
FROM orders o WHERE o.order_number = 'ORD-00000031' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000031' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000031' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000032' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000032' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000032' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000033' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 1, 51195.00
FROM orders o WHERE o.order_number = 'ORD-00000034' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000035' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000036' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000036' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000036' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000036' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000037' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000037' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000038' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000038' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000038' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000039' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000039' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000039' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00
FROM orders o WHERE o.order_number = 'ORD-00000039' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000040' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000040' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000040' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000041' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000041' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000041' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000042' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000042' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000042' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000042' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000043' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000043' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000043' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000044' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000044' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000044' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00
FROM orders o WHERE o.order_number = 'ORD-00000044' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000045' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000045' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000045' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000046' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000046' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000047' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000047' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000047' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00
FROM orders o WHERE o.order_number = 'ORD-00000048' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000049' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00
FROM orders o WHERE o.order_number = 'ORD-00000049' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000050' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000051' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000051' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000051' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00
FROM orders o WHERE o.order_number = 'ORD-00000051' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000052' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 1, 27495.00
FROM orders o WHERE o.order_number = 'ORD-00000052' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000052' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000052' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000053' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000053' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000053' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000053' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000054' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000054' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000054' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000054' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000055' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000056' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000056' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 1, 51195.00
FROM orders o WHERE o.order_number = 'ORD-00000057' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000057' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000057' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00
FROM orders o WHERE o.order_number = 'ORD-00000058' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00
FROM orders o WHERE o.order_number = 'ORD-00000058' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000059' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000059' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000059' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000060' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000061' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000061' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000061' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000061' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000062' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000062' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000063' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000063' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00
FROM orders o WHERE o.order_number = 'ORD-00000063' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000063' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000064' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000064' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000064' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000065' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000065' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000065' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000065' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000066' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000067' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 1, 36995.00
FROM orders o WHERE o.order_number = 'ORD-00000067' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000067' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00
FROM orders o WHERE o.order_number = 'ORD-00000067' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000068' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000069' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000070' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000070' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00
FROM orders o WHERE o.order_number = 'ORD-00000070' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000070' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000071' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000071' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000071' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000072' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000072' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000072' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000073' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000073' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000074' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 1, 36995.00
FROM orders o WHERE o.order_number = 'ORD-00000074' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000074' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000074' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000075' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000075' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000075' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000076' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000076' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000077' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000077' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000077' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000077' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000078' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000079' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000079' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000080' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000080' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000080' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000081' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000082' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000083' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000083' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000084' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000084' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000084' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000084' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000085' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000085' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000086' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000086' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000086' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000086' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000087' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000087' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000087' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000088' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000088' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 2, 102390.00
FROM orders o WHERE o.order_number = 'ORD-00000088' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000089' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000089' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000089' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000090' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000090' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000090' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000091' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000091' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000092' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000092' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000092' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000092' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000093' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000094' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000094' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 2, 80990.00
FROM orders o WHERE o.order_number = 'ORD-00000094' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000095' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000095' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000095' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000096' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 2, 80990.00
FROM orders o WHERE o.order_number = 'ORD-00000096' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00
FROM orders o WHERE o.order_number = 'ORD-00000096' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000096' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000097' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000097' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000097' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000098' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000098' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000099' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000099' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000100' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000101' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000101' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000101' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000102' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000102' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000102' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00
FROM orders o WHERE o.order_number = 'ORD-00000102' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000103' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000103' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000104' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000104' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000104' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00
FROM orders o WHERE o.order_number = 'ORD-00000105' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000106' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00
FROM orders o WHERE o.order_number = 'ORD-00000106' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000107' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000108' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00
FROM orders o WHERE o.order_number = 'ORD-00000109' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000110' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000110' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000110' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000110' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000111' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000111' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000112' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000113' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 1, 33495.00
FROM orders o WHERE o.order_number = 'ORD-00000113' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000113' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000114' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000115' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000115' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000116' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000117' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000118' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000119' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000119' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000119' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000119' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000120' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000120' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000120' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000120' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 1, 47195.00
FROM orders o WHERE o.order_number = 'ORD-00000121' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000121' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000121' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000121' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000122' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000122' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000122' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000122' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000123' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00
FROM orders o WHERE o.order_number = 'ORD-00000123' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000124' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000124' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000124' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000125' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000126' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000126' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000126' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000127' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000128' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000128' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000128' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000129' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000129' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00
FROM orders o WHERE o.order_number = 'ORD-00000130' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000130' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000130' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000131' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000131' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000132' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000133' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000133' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000134' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000135' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000135' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000135' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000135' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00
FROM orders o WHERE o.order_number = 'ORD-00000136' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 2, 80990.00
FROM orders o WHERE o.order_number = 'ORD-00000136' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000137' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000138' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000138' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000138' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000138' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000139' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 1, 36995.00
FROM orders o WHERE o.order_number = 'ORD-00000139' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000140' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00
FROM orders o WHERE o.order_number = 'ORD-00000140' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000141' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000141' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000142' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000142' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00
FROM orders o WHERE o.order_number = 'ORD-00000142' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 2, 80990.00
FROM orders o WHERE o.order_number = 'ORD-00000142' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000143' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000143' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00
FROM orders o WHERE o.order_number = 'ORD-00000143' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000144' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000145' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000146' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000146' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000146' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000147' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00
FROM orders o WHERE o.order_number = 'ORD-00000147' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000147' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000148' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000148' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000148' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000149' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000149' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000150' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000150' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000150' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000150' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000151' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000151' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000152' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000153' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000154' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00
FROM orders o WHERE o.order_number = 'ORD-00000155' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000155' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000155' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000156' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00
FROM orders o WHERE o.order_number = 'ORD-00000157' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000157' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00
FROM orders o WHERE o.order_number = 'ORD-00000157' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000158' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000158' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000158' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000159' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000159' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000159' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000160' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000161' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000162' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000163' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000163' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000163' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000164' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000165' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00
FROM orders o WHERE o.order_number = 'ORD-00000165' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000165' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000166' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000166' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000166' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000166' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000167' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00
FROM orders o WHERE o.order_number = 'ORD-00000167' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000168' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000169' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000169' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000170' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000170' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000170' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000171' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00
FROM orders o WHERE o.order_number = 'ORD-00000172' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000172' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000172' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000173' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000173' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000174' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000174' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000174' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000175' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000175' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000176' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000176' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000176' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 1, 27495.00
FROM orders o WHERE o.order_number = 'ORD-00000176' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000177' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00
FROM orders o WHERE o.order_number = 'ORD-00000177' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000178' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000178' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000179' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000179' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000179' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000179' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000180' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000180' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000181' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000181' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000181' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000182' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000182' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000183' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00
FROM orders o WHERE o.order_number = 'ORD-00000184' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000184' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000184' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00
FROM orders o WHERE o.order_number = 'ORD-00000184' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000185' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000185' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000185' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000185' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00
FROM orders o WHERE o.order_number = 'ORD-00000186' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000186' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000187' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000187' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000187' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000187' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000188' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000188' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000189' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 2, 35590.00
FROM orders o WHERE o.order_number = 'ORD-00000189' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000190' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000190' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000190' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000190' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000191' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000191' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00
FROM orders o WHERE o.order_number = 'ORD-00000191' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000192' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000193' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000193' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000193' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000194' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000194' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000194' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 1, 33495.00
FROM orders o WHERE o.order_number = 'ORD-00000195' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000195' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00
FROM orders o WHERE o.order_number = 'ORD-00000196' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000196' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000196' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000197' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000198' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000198' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000199' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000199' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000199' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000199' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000200' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000200' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000200' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000200' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000201' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000201' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000202' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000202' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000203' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000203' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000203' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 1, 33495.00
FROM orders o WHERE o.order_number = 'ORD-00000203' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000204' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000204' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000204' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000204' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000205' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000205' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000205' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000205' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000206' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000206' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 1, 47195.00
FROM orders o WHERE o.order_number = 'ORD-00000207' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000207' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 1, 33495.00
FROM orders o WHERE o.order_number = 'ORD-00000208' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000208' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000208' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000208' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000209' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000209' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000209' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 1, 47195.00
FROM orders o WHERE o.order_number = 'ORD-00000210' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00
FROM orders o WHERE o.order_number = 'ORD-00000210' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000210' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000210' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000211' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000211' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000211' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000211' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000212' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000212' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000213' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000213' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000213' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000214' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000215' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 2, 102390.00
FROM orders o WHERE o.order_number = 'ORD-00000216' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000216' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000216' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000216' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000217' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000217' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000217' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000218' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000218' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000218' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000218' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00
FROM orders o WHERE o.order_number = 'ORD-00000219' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000220' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000220' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000220' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00
FROM orders o WHERE o.order_number = 'ORD-00000220' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000221' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000221' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000222' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00
FROM orders o WHERE o.order_number = 'ORD-00000223' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000223' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000223' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 2, 80990.00
FROM orders o WHERE o.order_number = 'ORD-00000224' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000224' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000224' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000225' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00
FROM orders o WHERE o.order_number = 'ORD-00000225' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000225' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000226' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000226' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000227' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000227' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000227' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000228' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 1, 47195.00
FROM orders o WHERE o.order_number = 'ORD-00000228' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000228' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000229' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000229' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000229' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000229' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000230' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000231' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000232' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000232' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000232' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000232' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000233' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000233' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000234' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000234' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000234' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 1, 47195.00
FROM orders o WHERE o.order_number = 'ORD-00000235' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000236' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000236' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 1, 36995.00
FROM orders o WHERE o.order_number = 'ORD-00000237' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000238' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000238' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000238' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000238' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000239' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000239' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000240' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000241' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000242' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000242' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00
FROM orders o WHERE o.order_number = 'ORD-00000243' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000244' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000244' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000244' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000244' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000245' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000245' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00
FROM orders o WHERE o.order_number = 'ORD-00000245' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000246' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000247' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000247' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000248' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000248' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000248' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000248' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000249' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 2, 80990.00
FROM orders o WHERE o.order_number = 'ORD-00000249' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000249' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000250' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000250' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00
FROM orders o WHERE o.order_number = 'ORD-00000250' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000250' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000251' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000251' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000251' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000252' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000252' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000253' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000254' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000254' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000255' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000255' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000256' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000257' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000257' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000257' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000257' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000258' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000258' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000258' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000258' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000259' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000259' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000259' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000259' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000260' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000260' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000260' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00
FROM orders o WHERE o.order_number = 'ORD-00000260' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000261' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000261' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000261' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000261' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000262' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000262' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000262' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000262' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000263' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000263' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000263' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000264' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000265' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000266' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000266' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00
FROM orders o WHERE o.order_number = 'ORD-00000267' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000268' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000268' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000268' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000269' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000269' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000269' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000270' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000270' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000271' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000271' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000271' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00
FROM orders o WHERE o.order_number = 'ORD-00000272' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000272' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000272' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000273' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000274' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000274' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00
FROM orders o WHERE o.order_number = 'ORD-00000274' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00
FROM orders o WHERE o.order_number = 'ORD-00000274' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000275' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00
FROM orders o WHERE o.order_number = 'ORD-00000275' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000276' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000276' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000276' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000276' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000277' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000277' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000278' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000278' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000279' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000279' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000280' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000280' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000280' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000281' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000281' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000282' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000282' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000282' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000283' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000283' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000283' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000283' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000284' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000285' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000286' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000287' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000287' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00
FROM orders o WHERE o.order_number = 'ORD-00000287' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000288' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000288' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000288' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000288' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00
FROM orders o WHERE o.order_number = 'ORD-00000289' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 2, 102390.00
FROM orders o WHERE o.order_number = 'ORD-00000289' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000289' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000289' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000290' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000290' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000291' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000291' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000291' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000292' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000292' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000292' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000292' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00
FROM orders o WHERE o.order_number = 'ORD-00000293' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000294' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000294' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000295' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000295' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 1, 47195.00
FROM orders o WHERE o.order_number = 'ORD-00000295' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000295' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00
FROM orders o WHERE o.order_number = 'ORD-00000296' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000296' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000296' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000296' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000297' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000297' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000297' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000297' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 1, 33495.00
FROM orders o WHERE o.order_number = 'ORD-00000298' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000298' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000298' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000299' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000299' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000299' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000300' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000300' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000300' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000300' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000301' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 1, 47195.00
FROM orders o WHERE o.order_number = 'ORD-00000301' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00
FROM orders o WHERE o.order_number = 'ORD-00000301' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000302' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000302' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000303' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000303' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000303' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000304' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000304' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000304' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000305' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000305' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000306' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000306' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000306' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 1, 36995.00
FROM orders o WHERE o.order_number = 'ORD-00000307' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000308' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000308' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000308' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000308' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000309' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000310' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000310' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000310' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000310' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000311' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000311' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000311' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000312' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000312' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000313' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000313' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000314' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000314' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000314' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000315' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000315' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000316' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000317' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000317' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000317' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000317' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000318' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000319' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000319' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00
FROM orders o WHERE o.order_number = 'ORD-00000319' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000319' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00
FROM orders o WHERE o.order_number = 'ORD-00000320' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000320' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000320' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000320' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000321' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000321' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000321' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000321' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000322' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000323' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000323' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000323' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000323' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000324' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000325' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000326' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000326' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000327' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000328' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000328' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000329' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000329' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000329' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 2, 46990.00
FROM orders o WHERE o.order_number = 'ORD-00000330' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000330' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000330' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00
FROM orders o WHERE o.order_number = 'ORD-00000330' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000331' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000331' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 1, 14495.00
FROM orders o WHERE o.order_number = 'ORD-00000331' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000332' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000332' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000332' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000332' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000333' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000333' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000334' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000334' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000335' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000335' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000335' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000335' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000336' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000336' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000336' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000336' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00
FROM orders o WHERE o.order_number = 'ORD-00000337' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000337' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000337' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000338' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000338' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000338' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000339' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 1, 33495.00
FROM orders o WHERE o.order_number = 'ORD-00000340' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000340' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000341' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000341' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000341' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000341' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000342' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000342' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000342' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000343' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000344' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000345' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000345' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000345' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00
FROM orders o WHERE o.order_number = 'ORD-00000346' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000347' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000347' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000348' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000348' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000348' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000349' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00
FROM orders o WHERE o.order_number = 'ORD-00000349' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000349' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000349' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00
FROM orders o WHERE o.order_number = 'ORD-00000350' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000350' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 2, 76390.00
FROM orders o WHERE o.order_number = 'ORD-00000351' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000352' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000353' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000353' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000353' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000353' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000354' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000354' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 2, 56390.00
FROM orders o WHERE o.order_number = 'ORD-00000355' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 1, 33495.00
FROM orders o WHERE o.order_number = 'ORD-00000355' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000355' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000355' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000356' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000356' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000356' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000356' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 1, 18495.00
FROM orders o WHERE o.order_number = 'ORD-00000357' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000357' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 1, 34195.00
FROM orders o WHERE o.order_number = 'ORD-00000357' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000357' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000358' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000359' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 2, 83590.00
FROM orders o WHERE o.order_number = 'ORD-00000359' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00
FROM orders o WHERE o.order_number = 'ORD-00000360' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 2, 80990.00
FROM orders o WHERE o.order_number = 'ORD-00000360' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000360' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000360' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000361' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000361' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00
FROM orders o WHERE o.order_number = 'ORD-00000361' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000361' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000362' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000363' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 1, 40495.00
FROM orders o WHERE o.order_number = 'ORD-00000363' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000363' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000363' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00
FROM orders o WHERE o.order_number = 'ORD-00000364' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000364' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00
FROM orders o WHERE o.order_number = 'ORD-00000364' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000365' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000365' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 1, 50495.00
FROM orders o WHERE o.order_number = 'ORD-00000365' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000365' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00
FROM orders o WHERE o.order_number = 'ORD-00000366' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000366' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000366' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000366' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000367' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000368' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000369' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000370' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 1, 36995.00
FROM orders o WHERE o.order_number = 'ORD-00000370' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000371' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000371' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000372' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000372' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000373' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000373' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00
FROM orders o WHERE o.order_number = 'ORD-00000373' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 2, 92990.00
FROM orders o WHERE o.order_number = 'ORD-00000374' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000374' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000374' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000375' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 1, 27495.00
FROM orders o WHERE o.order_number = 'ORD-00000375' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000375' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000375' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000376' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000376' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000376' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000377' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000377' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 34, 'AMD Radeon RX 7700 XT', 'Dual-Fan', 27495.00, 2, 54990.00
FROM orders o WHERE o.order_number = 'ORD-00000378' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000378' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000378' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 1, 39995.00
FROM orders o WHERE o.order_number = 'ORD-00000379' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00
FROM orders o WHERE o.order_number = 'ORD-00000379' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000380' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000380' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000381' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000381' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000382' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000383' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00
FROM orders o WHERE o.order_number = 'ORD-00000383' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000383' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00
FROM orders o WHERE o.order_number = 'ORD-00000384' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000385' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000385' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000385' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 1, 37995.00
FROM orders o WHERE o.order_number = 'ORD-00000385' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000386' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000386' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000387' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 1, 22995.00
FROM orders o WHERE o.order_number = 'ORD-00000388' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000388' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000388' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000389' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 2, 102390.00
FROM orders o WHERE o.order_number = 'ORD-00000389' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000389' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000389' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000390' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000390' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000390' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000391' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000391' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000391' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000392' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 1, 44795.00
FROM orders o WHERE o.order_number = 'ORD-00000392' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000393' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000393' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000393' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00
FROM orders o WHERE o.order_number = 'ORD-00000394' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 1, 31795.00
FROM orders o WHERE o.order_number = 'ORD-00000395' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 17, 'AMD Ryzen 9 9950X3D', 'Boxed', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000395' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000396' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000396' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00
FROM orders o WHERE o.order_number = 'ORD-00000396' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000397' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 2, 53990.00
FROM orders o WHERE o.order_number = 'ORD-00000397' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 11, 'AMD Ryzen 7 9800X3D', 'Boxed', 32995.00, 1, 32995.00
FROM orders o WHERE o.order_number = 'ORD-00000397' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000397' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000398' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000398' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000398' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 35, 'AMD Radeon RX 7700 XT', 'Triple-Fan', 28195.00, 1, 28195.00
FROM orders o WHERE o.order_number = 'ORD-00000398' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00
FROM orders o WHERE o.order_number = 'ORD-00000399' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000399' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000399' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000400' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000401' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000401' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000401' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 2, 30990.00
FROM orders o WHERE o.order_number = 'ORD-00000401' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000402' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000403' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00
FROM orders o WHERE o.order_number = 'ORD-00000403' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 16, 'AMD Ryzen 9 7950X3D', 'OEM (Tray)', 41795.00, 1, 41795.00
FROM orders o WHERE o.order_number = 'ORD-00000403' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000403' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000404' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000404' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 1, 17495.00
FROM orders o WHERE o.order_number = 'ORD-00000404' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 2, 33990.00
FROM orders o WHERE o.order_number = 'ORD-00000404' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 1, 36795.00
FROM orders o WHERE o.order_number = 'ORD-00000405' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000405' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 13, 'AMD Ryzen 9 7900X3D', 'Boxed', 37995.00, 2, 75990.00
FROM orders o WHERE o.order_number = 'ORD-00000405' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000405' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000406' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000406' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000407' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000407' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000407' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000408' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 1, 47195.00
FROM orders o WHERE o.order_number = 'ORD-00000409' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000410' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 43, 'AMD Radeon RX 7900 XTX', 'Dual-Fan', 50495.00, 2, 100990.00
FROM orders o WHERE o.order_number = 'ORD-00000411' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 2, 38990.00
FROM orders o WHERE o.order_number = 'ORD-00000412' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000412' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000412' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000412' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 1, 27995.00
FROM orders o WHERE o.order_number = 'ORD-00000413' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00
FROM orders o WHERE o.order_number = 'ORD-00000414' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000414' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 2, 74990.00
FROM orders o WHERE o.order_number = 'ORD-00000414' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000414' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 2, 36390.00
FROM orders o WHERE o.order_number = 'ORD-00000415' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000415' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 2, 48390.00
FROM orders o WHERE o.order_number = 'ORD-00000416' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 32, 'AMD Radeon RX 7600', 'Triple-Fan', 15495.00, 1, 15495.00
FROM orders o WHERE o.order_number = 'ORD-00000416' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000416' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00
FROM orders o WHERE o.order_number = 'ORD-00000417' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000417' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000417' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000418' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000418' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 1, 18295.00
FROM orders o WHERE o.order_number = 'ORD-00000419' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 31, 'AMD Radeon RX 7600', 'Dual-Fan', 14995.00, 2, 29990.00
FROM orders o WHERE o.order_number = 'ORD-00000419' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 3, 'AMD Ryzen 7 7800X3D', 'Boxed', 27995.00, 2, 55990.00
FROM orders o WHERE o.order_number = 'ORD-00000420' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000420' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 41, 'AMD Radeon RX 7900 GRE', 'Triple-Fan', 38195.00, 1, 38195.00
FROM orders o WHERE o.order_number = 'ORD-00000420' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 1, 15295.00
FROM orders o WHERE o.order_number = 'ORD-00000421' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 2, 32990.00
FROM orders o WHERE o.order_number = 'ORD-00000421' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 2, 53590.00
FROM orders o WHERE o.order_number = 'ORD-00000421' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 1, 48795.00
FROM orders o WHERE o.order_number = 'ORD-00000421' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000422' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000422' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000423' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000424' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 6, 'AMD Ryzen 5 7600X', 'OEM (Tray)', 15295.00, 2, 30590.00
FROM orders o WHERE o.order_number = 'ORD-00000425' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 48, 'AMD Radeon RX 9070 XT', 'Reference', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000426' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 20, 'AMD Ryzen 9 9950X', 'OEM (Tray)', 44795.00, 2, 89590.00
FROM orders o WHERE o.order_number = 'ORD-00000427' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 2, 91990.00
FROM orders o WHERE o.order_number = 'ORD-00000427' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 1, 19695.00
FROM orders o WHERE o.order_number = 'ORD-00000427' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 1, 33495.00
FROM orders o WHERE o.order_number = 'ORD-00000427' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000428' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 2, 37990.00
FROM orders o WHERE o.order_number = 'ORD-00000428' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 2, 82390.00
FROM orders o WHERE o.order_number = 'ORD-00000428' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 1, 36995.00
FROM orders o WHERE o.order_number = 'ORD-00000428' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 47, 'AMD Radeon RX 9070', 'Triple-Fan', 41195.00, 1, 41195.00
FROM orders o WHERE o.order_number = 'ORD-00000429' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000429' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 36, 'AMD Radeon RX 7800 XT', 'Reference', 32995.00, 2, 65990.00
FROM orders o WHERE o.order_number = 'ORD-00000429' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000430' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 46, 'AMD Radeon RX 9070', 'Dual-Fan', 40495.00, 2, 80990.00
FROM orders o WHERE o.order_number = 'ORD-00000430' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 37, 'AMD Radeon RX 7800 XT', 'Dual-Fan', 33495.00, 2, 66990.00
FROM orders o WHERE o.order_number = 'ORD-00000430' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000430' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 23, 'AMD Radeon RX 6600 XT', 'Triple-Fan', 18195.00, 1, 18195.00
FROM orders o WHERE o.order_number = 'ORD-00000431' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00
FROM orders o WHERE o.order_number = 'ORD-00000431' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 28, 'AMD Radeon RX 6700 XT', 'Dual-Fan', 23495.00, 1, 23495.00
FROM orders o WHERE o.order_number = 'ORD-00000432' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 4, 'AMD Ryzen 7 7800X3D', 'OEM (Tray)', 26795.00, 1, 26795.00
FROM orders o WHERE o.order_number = 'ORD-00000433' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 25, 'AMD Radeon RX 6650 XT', 'Dual-Fan', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000433' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 19, 'AMD Ryzen 9 9950X', 'Boxed', 45995.00, 1, 45995.00
FROM orders o WHERE o.order_number = 'ORD-00000433' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000433' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 2, 85990.00
FROM orders o WHERE o.order_number = 'ORD-00000434' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 24, 'AMD Radeon RX 6650 XT', 'Reference', 18495.00, 2, 36990.00
FROM orders o WHERE o.order_number = 'ORD-00000435' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 5, 'AMD Ryzen 5 7600X', 'Boxed with Cooler', 16495.00, 1, 16495.00
FROM orders o WHERE o.order_number = 'ORD-00000436' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000436' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000437' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 27, 'AMD Radeon RX 6700 XT', 'Reference', 22995.00, 2, 45990.00
FROM orders o WHERE o.order_number = 'ORD-00000437' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 2, 27590.00
FROM orders o WHERE o.order_number = 'ORD-00000438' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 12, 'AMD Ryzen 7 9800X3D', 'OEM (Tray)', 31795.00, 2, 63590.00
FROM orders o WHERE o.order_number = 'ORD-00000439' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 38, 'AMD Radeon RX 7800 XT', 'Triple-Fan', 34195.00, 2, 68390.00
FROM orders o WHERE o.order_number = 'ORD-00000439' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000439' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000440' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 26, 'AMD Radeon RX 6650 XT', 'Triple-Fan', 19695.00, 2, 39390.00
FROM orders o WHERE o.order_number = 'ORD-00000440' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 50, 'AMD Radeon RX 9070 XT', 'Triple-Fan', 47195.00, 2, 94390.00
FROM orders o WHERE o.order_number = 'ORD-00000441' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 39, 'AMD Radeon RX 7900 GRE', 'Reference', 36995.00, 2, 73990.00
FROM orders o WHERE o.order_number = 'ORD-00000441' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000441' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 8, 'AMD Ryzen 5 9600X', 'OEM (Tray)', 17795.00, 1, 17795.00
FROM orders o WHERE o.order_number = 'ORD-00000441' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 18, 'AMD Ryzen 9 9950X3D', 'OEM (Tray)', 48795.00, 2, 97590.00
FROM orders o WHERE o.order_number = 'ORD-00000442' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000442' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 33, 'AMD Radeon RX 7700 XT', 'Reference', 26995.00, 1, 26995.00
FROM orders o WHERE o.order_number = 'ORD-00000442' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 44, 'AMD Radeon RX 7900 XTX', 'Triple-Fan', 51195.00, 1, 51195.00
FROM orders o WHERE o.order_number = 'ORD-00000442' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 49, 'AMD Radeon RX 9070 XT', 'Dual-Fan', 46495.00, 1, 46495.00
FROM orders o WHERE o.order_number = 'ORD-00000443' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 10, 'AMD Ryzen 7 7700', 'OEM (Tray)', 18295.00, 2, 36590.00
FROM orders o WHERE o.order_number = 'ORD-00000443' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 15, 'AMD Ryzen 9 7950X3D', 'Boxed', 42995.00, 1, 42995.00
FROM orders o WHERE o.order_number = 'ORD-00000444' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 1, 49995.00
FROM orders o WHERE o.order_number = 'ORD-00000444' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 1, 'AMD Ryzen 5 7600', 'Boxed with Cooler', 14995.00, 1, 14995.00
FROM orders o WHERE o.order_number = 'ORD-00000445' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 7, 'AMD Ryzen 5 9600X', 'Boxed with Cooler', 18995.00, 1, 18995.00
FROM orders o WHERE o.order_number = 'ORD-00000446' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 30, 'AMD Radeon RX 7600', 'Reference', 14495.00, 2, 28990.00
FROM orders o WHERE o.order_number = 'ORD-00000446' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 22, 'AMD Radeon RX 6600 XT', 'Dual-Fan', 17495.00, 2, 34990.00
FROM orders o WHERE o.order_number = 'ORD-00000447' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 42, 'AMD Radeon RX 7900 XTX', 'Reference', 49995.00, 2, 99990.00
FROM orders o WHERE o.order_number = 'ORD-00000447' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 2, 'AMD Ryzen 5 7600', 'OEM (Tray)', 13795.00, 1, 13795.00
FROM orders o WHERE o.order_number = 'ORD-00000447' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 40, 'AMD Radeon RX 7900 GRE', 'Dual-Fan', 37495.00, 1, 37495.00
FROM orders o WHERE o.order_number = 'ORD-00000448' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 9, 'AMD Ryzen 7 7700', 'Boxed with Cooler', 19495.00, 1, 19495.00
FROM orders o WHERE o.order_number = 'ORD-00000448' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 14, 'AMD Ryzen 9 7900X3D', 'OEM (Tray)', 36795.00, 2, 73590.00
FROM orders o WHERE o.order_number = 'ORD-00000449' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 21, 'AMD Radeon RX 6600 XT', 'Reference', 16995.00, 1, 16995.00
FROM orders o WHERE o.order_number = 'ORD-00000450' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 29, 'AMD Radeon RX 6700 XT', 'Triple-Fan', 24195.00, 1, 24195.00
FROM orders o WHERE o.order_number = 'ORD-00000450' LIMIT 1;
INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, 45, 'AMD Radeon RX 9070', 'Reference', 39995.00, 2, 79990.00
FROM orders o WHERE o.order_number = 'ORD-00000450' LIMIT 1;

SET FOREIGN_KEY_CHECKS = 1;

-- =====================================================
-- COMPLETION MESSAGE
-- =====================================================

SELECT '450 orders with items added successfully!' as message,
       '300 orders from 2025 (completed/cancelled)' as note_2025,
       '150 orders from 2026 (processing/shipped/completed)' as note_2026,
       'Sales dashboard now has data to display' as status;
