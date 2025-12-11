USE mypc_db;

-- =====================================================
-- NVME SSD PRODUCTS (10 items, IDs 96-105)
-- =====================================================

INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
(4, 'SSD-SAMSUNG-990-PRO', 'Samsung 990 PRO NVMe', 'samsung-990-pro-nvme', 'PCIe 4.0 flagship NVMe SSD', 'PCIe 4.0 x4 flagship NVMe SSD, up to 7450 MB/s read, 6900 MB/s write, V-NAND 3-bit MLC, 5-year warranty, excellent for gaming and content creation.', 1),
(4, 'SSD-SAMSUNG-9100-PRO', 'Samsung 9100 PRO NVMe', 'samsung-9100-pro-nvme', 'Next-gen PCIe 5.0 NVMe SSD', 'Next-gen PCIe 5.0 x4 NVMe SSD with blazing speeds up to 10,000 MB/s read, ideal for professional workloads and future-proof builds, 5-year warranty.', 1),
(4, 'SSD-WD-SN850X', 'Western Digital SN850X NVMe', 'wd-sn850x-nvme', 'WD Black Gaming NVMe SSD', 'WD Black Gaming NVMe SSD, PCIe 4.0 x4, up to 7300 MB/s, Game Mode 2.0, RGB heatsink available, 5-year warranty, perfect for PS5 and PC gaming.', 1),
(4, 'SSD-CRUCIAL-P510', 'Crucial P510 NVMe', 'crucial-p510-nvme', 'Micron-powered PCIe 4.0 NVMe', 'Micron-powered PCIe 4.0 NVMe, up to 7000 MB/s read, DirectStorage ready, excellent endurance, 5-year warranty, great value performance SSD.', 1),
(4, 'SSD-KINGSTON-KC3000', 'Kingston KC3000 NVMe', 'kingston-kc3000-nvme', 'High-performance PCIe 4.0 NVMe', 'Kingston Fury Renegade series, PCIe 4.0 x4, up to 7000 MB/s read, built-in heatsink, 5-year warranty with free tech support, great for gaming.', 1),
(4, 'SSD-KINGSTON-NV3', 'Kingston NV3 NVMe', 'kingston-nv3-nvme', 'Budget-friendly PCIe 4.0 NVMe', 'Budget-friendly PCIe 4.0 NVMe, up to 6000 MB/s, great upgrade over SATA SSDs, 3-year warranty, ideal for mainstream builds and laptops.', 1),
(4, 'SSD-LEXAR-NM790', 'Lexar NM790 NVMe', 'lexar-nm790-nvme', 'Value PCIe 4.0 NVMe SSD', 'Value PCIe 4.0 x4 NVMe SSD, up to 7400 MB/s, HMB 3.0 tech, 5-year warranty, excellent price-to-performance ratio for daily tasks.', 1),
(4, 'SSD-NEXTORAGE-NQ780', 'Nextorage NQ780 NVMe', 'nextorage-nq780-nvme', 'Professional PCIe 4.0 NVMe', 'Professional-grade PCIe 4.0 NVMe, up to 7300 MB/s, designed for creators and gamers, 5-year warranty, robust endurance rating.', 1),
(4, 'SSD-TEAMGROUP-MP33-PRO', 'TeamGroup MP33 PRO NVMe', 'teamgroup-mp33-pro-nvme', 'Budget PCIe 3.0 NVMe SSD', 'Budget PCIe 3.0 x4 NVMe, up to 2100 MB/s, great for everyday computing and entry-level gaming, 5-year warranty, best bang for buck.', 1),
(4, 'SSD-SEAGATE-FIRECUDA-530', 'Seagate FireCuda 530 NVMe', 'seagate-firecuda-530-nvme', 'Gaming PCIe 4.0 NVMe SSD', 'Gaming-focused PCIe 4.0 x4 NVMe, up to 7300 MB/s, includes heatsink, PS5 compatible, 5-year warranty, excellent for high-performance rigs.', 1);

-- NVMe Variants
INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
(96, 'SSD-SAMSUNG-990-512G', '512 GB', 5495.00, 15),
(96, 'SSD-SAMSUNG-990-1TB', '1 TB', 8995.00, 20),
(96, 'SSD-SAMSUNG-990-2TB', '2 TB', 14995.00, 12),
(97, 'SSD-SAMSUNG-9100-1TB', '1 TB', 12995.00, 10),
(97, 'SSD-SAMSUNG-9100-2TB', '2 TB', 19995.00, 8),
(98, 'SSD-WD-SN850X-1TB', '1 TB', 9495.00, 18),
(98, 'SSD-WD-SN850X-2TB', '2 TB', 15495.00, 10),
(99, 'SSD-CRUCIAL-P510-1TB', '1 TB', 7995.00, 20),
(99, 'SSD-CRUCIAL-P510-2TB', '2 TB', 12995.00, 12),
(100, 'SSD-KINGSTON-KC3000-512G', '512 GB', 5995.00, 15),
(100, 'SSD-KINGSTON-KC3000-1TB', '1 TB', 9495.00, 18),
(100, 'SSD-KINGSTON-KC3000-2TB', '2 TB', 15995.00, 10),
(101, 'SSD-KINGSTON-NV3-512G', '512 GB', 3495.00, 25),
(101, 'SSD-KINGSTON-NV3-1TB', '1 TB', 5495.00, 30),
(101, 'SSD-KINGSTON-NV3-2TB', '2 TB', 8995.00, 15),
(102, 'SSD-LEXAR-NM790-512G', '512 GB', 3995.00, 20),
(102, 'SSD-LEXAR-NM790-1TB', '1 TB', 6495.00, 25),
(102, 'SSD-LEXAR-NM790-2TB', '2 TB', 9995.00, 15),
(103, 'SSD-NEXTORAGE-NQ780-1TB', '1 TB', 8995.00, 12),
(103, 'SSD-NEXTORAGE-NQ780-2TB', '2 TB', 14995.00, 8),
(104, 'SSD-TEAMGROUP-MP33-512G', '512 GB', 2995.00, 25),
(104, 'SSD-TEAMGROUP-MP33-1TB', '1 TB', 4495.00, 30),
(104, 'SSD-TEAMGROUP-MP33-2TB', '2 TB', 6995.00, 20),
(105, 'SSD-SEAGATE-530-1TB', '1 TB', 9995.00, 15),
(105, 'SSD-SEAGATE-530-2TB', '2 TB', 16995.00, 10);

-- NVMe Images
INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
(96, '/assets/NVME/SAMSUNG 990 PRO NVME 2TB.webp', 'Samsung 990 PRO NVMe', 0),
(97, '/assets/NVME/SAMSUNG 9100 PRO NVME 2TB.jpg', 'Samsung 9100 PRO NVMe', 0),
(98, '/assets/NVME/WESTERN DIGITAL SN850X NVME.webp', 'Western Digital SN850X NVMe', 0),
(99, '/assets/NVME/CRUCIAL P510 NVME_.webp', 'Crucial P510 NVMe', 0),
(100, '/assets/NVME/KINGSTON KC3000 NVME.jpg', 'Kingston KC3000 NVMe', 0),
(101, '/assets/NVME/KINGSTON NV3 NVME 1TB.png', 'Kingston NV3 NVMe', 0),
(102, '/assets/NVME/LEXAR NM790 NVME_.webp', 'Lexar NM790 NVMe', 0),
(103, '/assets/NVME/NEXAR NQ780 NVME.png', 'Nextorage NQ780 NVMe', 0),
(104, '/assets/NVME/TEAMGROUP MP33 PRO NVME 2TB.jpg', 'TeamGroup MP33 PRO NVMe', 0),
(105, '/assets/NVME/Seagate FireCuda 530 M.2 NVMe_.jpg', 'Seagate FireCuda 530 NVMe', 0);

-- =====================================================
-- SATA SSD PRODUCTS (10 items, IDs 106-115)
-- =====================================================

INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
(4, 'SSD-SAMSUNG-870-EVO', 'Samsung 870 EVO SATA', 'samsung-870-evo-sata', 'Premium 2.5" SATA SSD', 'Premium 2.5" SATA III SSD, up to 560 MB/s read, 530 MB/s write, V-NAND 3-bit MLC, 5-year warranty, best-in-class reliability and performance.', 1),
(4, 'SSD-CRUCIAL-MX500', 'Crucial MX500 SATA', 'crucial-mx500-sata', 'Mainstream 2.5" SATA SSD', 'Micron 3D NAND 2.5" SATA SSD, up to 560 MB/s read, 510 MB/s write, power-loss immunity, 5-year warranty, excellent value for upgrading old systems.', 1),
(4, 'SSD-WD-BLUE', 'Western Digital Blue SATA', 'wd-blue-sata', 'Budget-friendly SATA SSD', 'WD Blue 2.5" SATA III SSD, up to 560 MB/s, perfect boot drive upgrade from HDD, 5-year warranty, great for everyday computing.', 1),
(4, 'SSD-KINGSTON-A400', 'Kingston A400 SATA', 'kingston-a400-sata', 'Entry-level SATA SSD', 'Budget 2.5" SATA III SSD, up to 500 MB/s, great for breathinglife into old PCs, 3-year warranty, best bang-for-buck upgrade.', 1),
(4, 'SSD-SANDISK-ULTRA-3D', 'SanDisk Ultra 3D SATA', 'sandisk-ultra-3d-sata', '3D NAND SATA SSD', '3D NAND 2.5" SATA SSD, up to 560 MB/s read, 530 MB/s write, nCache 2.0 tech, 5-year warranty, reliable performance for all-day computing.', 1),
(4, 'SSD-LEXAR-NS100', 'Lexar NS100 SATA', 'lexar-ns100-sata', 'Value SATA SSD', 'Value 2.5" SATA III SSD, up to 550 MB/s, SLC caching for burst speed, 3-year warranty, affordable upgrade for laptops and desktops.', 1),
(4, 'SSD-ADATA-SU800', 'ADATA SU800 SATA', 'adata-su800-sata', '3D NAND SATA SSD', '3D NAND 2.5" SATA SSD, up to 560 MB/s, intelligent SLC caching, LDPC error correction, 5-year warranty, great for mainstream users.', 1),
(4, 'SSD-PATRIOT-BURST', 'Patriot Burst SATA', 'patriot-burst-sata', 'Budget SATA SSD', 'Budget 2.5" SATA SSD, up to 560 MB/s, Burst technology for fast boot, 3-year warranty, simple and affordable PC refresh.', 1),
(4, 'SSD-TOSHIBA-TR200', 'Toshiba TR200 SATA', 'toshiba-tr200-sata', 'Reliable SATA SSD', 'BiCS FLASH 3D NAND 2.5" SATA SSD, up to 555 MB/s, SLC write caching, 3-year warranty, trusted Toshiba quality for everyday tasks.', 1),
(4, 'SSD-SEAGATE-BARRACUDA-120', 'Seagate BarraCuda 120 SATA', 'seagate-barracuda-120-sata', 'Performance SATA SSD', 'BarraCuda 120 2.5" SATA SSD, up to 560 MB/s, 3D TLC NAND, 5-year warranty, fast and reliable for gaming and productivity.', 1);

-- SATA SSD Variants
INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
(106, 'SSD-SAMSUNG-870-250G', '250 GB', 2995.00, 20),
(106, 'SSD-SAMSUNG-870-500G', '500 GB', 4495.00, 25),
(106, 'SSD-SAMSUNG-870-1TB', '1 TB', 6995.00, 20),
(106, 'SSD-SAMSUNG-870-2TB', '2 TB', 11995.00, 12),
(107, 'SSD-CRUCIAL-MX500-250G', '250 GB', 2495.00, 20),
(107, 'SSD-CRUCIAL-MX500-500G', '500 GB', 3995.00, 25),
(107, 'SSD-CRUCIAL-MX500-1TB', '1 TB', 5995.00, 22),
(107, 'SSD-CRUCIAL-MX500-2TB', '2 TB', 9995.00, 15),
(108, 'SSD-WD-BLUE-250G', '250 GB', 2295.00, 25),
(108, 'SSD-WD-BLUE-500G', '500 GB', 3795.00, 30),
(108, 'SSD-WD-BLUE-1TB', '1 TB', 5795.00, 25),
(109, 'SSD-KINGSTON-A400-240G', '240 GB', 1995.00, 30),
(109, 'SSD-KINGSTON-A400-480G', '480 GB', 3295.00, 30),
(109, 'SSD-KINGSTON-A400-960G', '960 GB', 4995.00, 20),
(110, 'SSD-SANDISK-ULTRA-250G', '250 GB', 2695.00, 20),
(110, 'SSD-SANDISK-ULTRA-500G', '500 GB', 4195.00, 25),
(110, 'SSD-SANDISK-ULTRA-1TB', '1 TB', 6495.00, 20),
(111, 'SSD-LEXAR-NS100-256G', '256 GB', 1995.00, 25),
(111, 'SSD-LEXAR-NS100-512G', '512 GB', 3295.00, 20),
(111, 'SSD-LEXAR-NS100-1TB', '1 TB', 4995.00, 15),
(112, 'SSD-ADATA-SU800-256G', '256 GB', 2295.00, 20),
(112, 'SSD-ADATA-SU800-512G', '512 GB', 3795.00, 25),
(112, 'SSD-ADATA-SU800-1TB', '1 TB', 5795.00, 18),
(113, 'SSD-PATRIOT-BURST-240G', '240 GB', 1895.00, 25),
(113, 'SSD-PATRIOT-BURST-480G', '480 GB', 2995.00, 20),
(113, 'SSD-PATRIOT-BURST-960G', '960 GB', 4695.00, 15),
(114, 'SSD-TOSHIBA-TR200-240G', '240 GB', 2095.00, 20),
(114, 'SSD-TOSHIBA-TR200-480G', '480 GB', 3395.00, 20),
(114, 'SSD-TOSHIBA-TR200-960G', '960 GB', 5295.00, 12),
(115, 'SSD-SEAGATE-120-250G', '250 GB', 2495.00, 18),
(115, 'SSD-SEAGATE-120-500G', '500 GB', 3995.00, 22),
(115, 'SSD-SEAGATE-120-1TB', '1 TB', 6295.00, 15);

-- SATA SSD Images
INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
(106, '/assets/SATA SSD/SAMSUNG 870 EVO 1TB.jpg', 'Samsung 870 EVO SATA', 0),
(107, '/assets/SATA SSD/Crucial MX500.jpg', 'Crucial MX500 SATA', 0),
(108, '/assets/SATA SSD/WESTERN DIGITAL BLUE 1TB SATA SSD.webp', 'Western Digital Blue SATA', 0),
(109, '/assets/SATA SSD/KINGSTON A400 240GB SATA_.webp', 'Kingston A400 SATA', 0),
(110, '/assets/SATA SSD/SANDISK ULTRA 3D SATA SSD.webp', 'SanDisk Ultra 3D SATA', 0),
(111, '/assets/SATA SSD/LEXAR NS100 SATA SSD.webp', 'Lexar NS100 SATA', 0),
(112, '/assets/SATA SSD/ADATA SU800 SATA SSD.webp', 'ADATA SU800 SATA', 0),
(113, '/assets/SATA SSD/PATRIOT BURST 960GB.jpg', 'Patriot Burst SATA', 0),
(114, '/assets/SATA SSD/TOSHIBA TR200 SATA SSD.jpg', 'Toshiba TR200 SATA', 0),
(115, '/assets/SATA SSD/SEAGATE BARRACUDA 120 SATA SSD.jpg', 'Seagate BarraCuda 120 SATA', 0);
