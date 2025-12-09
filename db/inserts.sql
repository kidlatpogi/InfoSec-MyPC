    USE mypc_db;

    -- =====================================================
    -- CATEGORIES INSERT
    -- =====================================================

    INSERT IGNORE INTO `categories` (`name`, `slug`, `description`) VALUES
    ('Processors', 'processors', 'CPUs and processors for desktop computers'),
    ('Graphics Cards', 'graphics-cards', 'GPUs and graphics cards'),
    ('Memory', 'memory', 'RAM and memory modules'),
    ('Storage', 'storage', 'SSDs, HDDs, and storage devices'),
    ('Motherboards', 'motherboards', 'Computer motherboards'),
    ('Power Supplies', 'power-supplies', 'PSUs and power supplies'),
    ('Cases', 'cases', 'Computer cases and chassis'),
    ('Cooling', 'cooling', 'CPU coolers and case fans');

    -- =====================================================
    -- AMD CPU PRODUCTS (10 items, IDs 1-10)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (1, 'CPU-AMD-R5-7600', 'AMD Ryzen 5 7600', 'amd-ryzen-5-7600', '6-core / 12-thread Zen 4 desktop processor', '6-core / 12-thread Zen 4 desktop processor, 3.8 GHz base, 5.1 GHz boost, 6 MB L2 + 32 MB L3, 65 W TDP, AM5 socket. Native DDR5-5200 support and integrated Radeon Graphics deliver smooth 1080p gaming and snappy everyday performance without a discrete card. Ships as boxed (with Wraith Stealth cooler) or OEM/tray.', 1),
    (1, 'CPU-AMD-R5-7600X', 'AMD Ryzen 5 7600X', 'amd-ryzen-5-7600x', 'Unlocked 6C/12T Zen 4 flagship', 'Unlocked 6C/12T Zen 4 flagship, 4.7 GHz base, 5.3 GHz boost, 6 MB L2 + 32 MB L3, 105 W. Higher power headroom pushes frame rates further for competitive gaming and brisk content creation. AM5 platform, DDR5-5200, PCIe 5.0 ready; cooler not included.', 1),
    (1, 'CPU-AMD-R5-9600X', 'AMD Ryzen 5 9600X', 'amd-ryzen-5-9600x', 'Next-gen 6C/12T Zen 5 chip', 'Next-gen 6C/12T Zen 5 chip built on 4 nm, 3.9 GHz base, up to 5.4 GHz boost, 6 MB L2 + 32 MB L3, 65 W. Faster IPC plus DDR5-5600 and RDNA 2-based graphics give creators and gamers a future-proof AM5 upgrade path.', 1),
    (1, 'CPU-AMD-R7-7700', 'AMD Ryzen 7 7700', 'amd-ryzen-7-7700', '8-core / 16-thread Zen 4 workhorse', '8-core / 16-thread Zen 4 workhorse, 3.8 GHz base, 5.3 GHz boost, 8 MB L2 + 32 MB L3, 65 W. Extra cores slice through streaming and multitasking while onboard Radeon Graphics keep budgets lean; full AM5 feature set included.', 1),
    (1, 'CPU-AMD-R7-7800X3D', 'AMD Ryzen 7 7800X3D', 'amd-ryzen-7-7800x3d', 'World\'s first 8C/16T gaming CPU with 3D V-Cache', 'World\'s first 8C/16T gaming CPU with 3D V-Cache: 96 MB L3 stacked on top of 8 MB L2, 4.2 GHz base, 5.0 GHz boost, 120 W. Massive cache lifts average gaming FPS 10-30 % versus non-3D siblings; AM5, DDR5-5200, PCIe 5.0.', 1),
    (1, 'CPU-AMD-R7-9800X3D', 'AMD Ryzen 7 9800X3D', 'amd-ryzen-7-9800x3d', '2nd-gen 8C/16T Zen 5 with 3D V-Cache', '2nd-gen 8C/16T Zen 5 with refined 3D V-Cache, 4.7 GHz base, 5.2 GHz boost, 96 MB L3, 120 W. Higher clocks plus lower cache latency crown it the new gaming king while still crushing creator workloads on AM5 platform.', 1),
    (1, 'CPU-AMD-R9-7900X3D', 'AMD Ryzen 9 7900X3D', 'amd-ryzen-9-7900x3d', '12C/24T Zen 4 powerhouse with 3D V-Cache', '12C/24T Zen 4 powerhouse fused with 128 MB 3D V-Cache, 4.4 GHz base, 5.6 GHz boost, 120 W. Ideal for high-refresh gaming and heavy production pipelines; 12 MB L2, DDR5-5200, PCIe 5.0 lanes for GPUs and NVMe SSDs.', 1),
    (1, 'CPU-AMD-R9-7950X3D', 'AMD Ryzen 9 7950X3D', 'amd-ryzen-9-7950x3d', 'Flagship 16C/32T Zen 4 CPU', 'Flagship 16C/32T Zen 4 CPU, 4.2 GHz base, 5.7 GHz boost, 16 MB L2 + 128 MB 3D V-Cache, 120 W. Top-tier gaming frame rates meet professional render, compile, and encode speed on the AM5 ecosystem.', 1),
    (1, 'CPU-AMD-R9-9950X3D', 'AMD Ryzen 9 9950X3D', 'amd-ryzen-9-9950x3d', 'Next-gen 16C/32T Zen 5 beast with 3D V-Cache', 'Next-gen 16C/32T Zen 5 beast with 128 MB 3D V-Cache, 4.2 GHz base, 5.7 GHz boost, 170 W. Industry-leading cache, IPC uplift, and DDR5-5600 support deliver unmatched gaming lows and creator throughput for premium AM5 builds.', 1),
    (1, 'CPU-AMD-R9-9950X', 'AMD Ryzen 9 9950X', 'amd-ryzen-9-9950x', 'Pure-speed 16C/32T Zen 5 flagship', 'Pure-speed 16C/32T Zen 5 flagship minus vertical cache, 4.3 GHz base, 5.7 GHz boost, 16 MB L2 + 64 MB L3, 170 W. Higher sustained clocks excel in heavily threaded tasks like rendering and compilation; cooler sold separately.', 1);

    -- AMD CPU Variants (Boxed with cooler vs OEM tray)
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (1, 'CPU-AMD-R5-7600-BOX', 'Boxed with Cooler', 14995.00, 15),
    (1, 'CPU-AMD-R5-7600-OEM', 'OEM (Tray)', 13795.00, 10),
    (2, 'CPU-AMD-R5-7600X-BOX', 'Boxed with Cooler', 16495.00, 15),
    (2, 'CPU-AMD-R5-7600X-OEM', 'OEM (Tray)', 15295.00, 10),
    (3, 'CPU-AMD-R5-9600X-BOX', 'Boxed with Cooler', 18995.00, 12),
    (3, 'CPU-AMD-R5-9600X-OEM', 'OEM (Tray)', 17795.00, 8),
    (4, 'CPU-AMD-R7-7700-BOX', 'Boxed with Cooler', 19495.00, 12),
    (4, 'CPU-AMD-R7-7700-OEM', 'OEM (Tray)', 18295.00, 8),
    (5, 'CPU-AMD-R7-7800X3D-BOX', 'Boxed', 27995.00, 10),
    (5, 'CPU-AMD-R7-7800X3D-OEM', 'OEM (Tray)', 26795.00, 5),
    (6, 'CPU-AMD-R7-9800X3D-BOX', 'Boxed', 32995.00, 10),
    (6, 'CPU-AMD-R7-9800X3D-OEM', 'OEM (Tray)', 31795.00, 5),
    (7, 'CPU-AMD-R9-7900X3D-BOX', 'Boxed', 37995.00, 6),
    (7, 'CPU-AMD-R9-7900X3D-OEM', 'OEM (Tray)', 36795.00, 4),
    (8, 'CPU-AMD-R9-7950X3D-BOX', 'Boxed', 42995.00, 6),
    (8, 'CPU-AMD-R9-7950X3D-OEM', 'OEM (Tray)', 41795.00, 4),
    (9, 'CPU-AMD-R9-9950X3D-BOX', 'Boxed', 49995.00, 5),
    (9, 'CPU-AMD-R9-9950X3D-OEM', 'OEM (Tray)', 48795.00, 3),
    (10, 'CPU-AMD-R9-9950X-BOX', 'Boxed', 45995.00, 5),
    (10, 'CPU-AMD-R9-9950X-OEM', 'OEM (Tray)', 44795.00, 3);

-- Product Images for AMD CPUs
INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
(1, '/assets/AMD CPU/AMD RYZEN 5 7600.webp', 'AMD Ryzen 5 7600', 0),
(2, '/assets/AMD CPU/AMD RYZEN 5 7600X.jpg', 'AMD Ryzen 5 7600X', 0),
(3, '/assets/AMD CPU/AMD RYZEN 5 9600 X.jpg', 'AMD Ryzen 5 9600X', 0),
(4, '/assets/AMD CPU/AMD RYZEN 7 7700.jpg', 'AMD Ryzen 7 7700', 0),
(5, '/assets/AMD CPU/AMD RYZEN 7 7800 X3D.webp', 'AMD Ryzen 7 7800X3D', 0),
(6, '/assets/AMD CPU/AMD RYZEN 7 9800 X3D.jpg', 'AMD Ryzen 7 9800X3D', 0),
(7, '/assets/AMD CPU/AMD RYZEN 9 7900 X3D.jpg', 'AMD Ryzen 9 7900X3D', 0),
(8, '/assets/AMD CPU/AMD RYZEN 9 7950 X3D.jpg', 'AMD Ryzen 9 7950X3D', 0),
(9, '/assets/AMD CPU/AMD RYZEN 9 9950 X3D.jpg', 'AMD Ryzen 9 9950X3D', 0),
(10, '/assets/AMD CPU/AMD RYZEN 9 9950X.jpg', 'AMD Ryzen 9 9950X', 0);    -- =====================================================
    -- AMD GPU PRODUCTS (10 items, IDs 11-20)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (2, 'GPU-RX-6600XT', 'AMD Radeon RX 6600 XT', 'amd-radeon-rx-6600xt', 'RDNA 2 2048-SP card with 8GB GDDR6', 'RDNA 2 2048-SP card, 1968 MHz game / 2589 MHz boost, 8 GB GDDR6 on 128-bit bus, 160 W TDP, PCIe 4.0. 1080p ultra gaming with Smart Access Memory, AV1 decode, HDMI 2.1 & DP 1.4a outputs. Fits most ITX builds.', 1),
    (2, 'GPU-RX-6650XT', 'AMD Radeon RX 6650 XT', 'amd-radeon-rx-6650xt', 'Factory-binned RDNA 2 refresh', 'Factory-binned RDNA 2 2048-SP refresh, 2055 MHz game / 2635 MHz boost, 8 GB GDDR6 at 17.5 Gbps, 180 W. Faster memory + clocks give 5-10 % lift versus RX 6600 XT while staying on 128-bit bus; ideal for high-refresh 1080p.', 1),
    (2, 'GPU-RX-6700XT', 'AMD Radeon RX 6700 XT', 'amd-radeon-rx-6700xt', 'RDNA 2 2560-SP 1440p card', 'RDNA 2 2560-SP 1440p card, 2321 MHz game / 2581 MHz boost, 12 GB GDDR6 on 192-bit + 96 MB Infinity Cache, 230 W. Handles maxed 1440p or entry 4K; supports ray tracing, FSR, and USB-C output on premium boards.', 1),
    (2, 'GPU-RX-7600', 'AMD Radeon RX 7600', 'amd-radeon-rx-7600', 'Cutting-down-to-size RDNA 3 GPU', 'Cutting-down-to-size RDNA 3 2048-SP GPU, 2250 MHz game / 2655 MHz boost, 8 GB GDDR6 on 128-bit, 165 W. New encode block adds AV1 hardware; sips power yet punches above RX 6600 XT levels at 1080p.', 1),
    (2, 'GPU-RX-7700XT', 'AMD Radeon RX 7700 XT', 'amd-radeon-rx-7700xt', 'RDNA 3 3456-SP 1440p champ', 'RDNA 3 3456-SP 1440p champ, 2276 MHz game / 2544 MHz boost, 12 GB GDDR6 on 192-bit, 245 W. Dual media engines, AI accelerators, DisplayPort 2.1 ready; 20 % faster than RX 6700 XT while drawing less board power.', 1),
    (2, 'GPU-RX-7800XT', 'AMD Radeon RX 7800 XT', 'amd-radeon-rx-7800xt', 'RDNA 3 3840-SP sweet-spot 4K card', 'RDNA 3 3840-SP sweet-spot 4K card, 2430 MHz game / 2430 MHz boost, 16 GB GDDR6 on 256-bit, 263 W. 64 MB Infinity Cache, AV1 encode/decode, HDMI 2.1a; trades blows with RX 6900 XT at lower wattage and price.', 1),
    (2, 'GPU-RX-7900GRE', 'AMD Radeon RX 7900 GRE', 'amd-radeon-rx-7900gre', 'Golden Rabbit RDNA 3 5120-SP variant', '"Golden Rabbit" RDNA 3 5120-SP variant, 1880 MHz game / 2245 MHz boost, 16 GB GDDR6 on 256-bit, 260 W. China-origin SKU now global; 4K60 ultra with ray tracing, 20 GB/s effective cache bandwidth.', 1),
    (2, 'GPU-RX-7900XTX', 'AMD Radeon RX 7900 XTX', 'amd-radeon-rx-7900xtx', 'Top-tier RDNA 3 flagship', 'Top-tier RDNA 3 6144-SP flagship, 2269 MHz game / 2500 MHz boost, 24 GB GDDR6 on 384-bit, 355 W. 96 MB Infinity Cache, DisplayPort 2.1 54 Gbps, dual 8-pin; rivals RTX 4080 at 4K and excels at creator workloads.', 1),
    (2, 'GPU-RX-9070', 'AMD Radeon RX 9070', 'amd-radeon-rx-9070', 'Early RDNA 4 4096-SP card', 'Early RDNA 4 4096-SP card, 2400 MHz game / 2700 MHz boost, 16 GB GDDR7 on 256-bit, 220 W. Second-gen RT + AI cores push 4K high settings; new media engine offers 8K 60 Hz encode, DP 2.1 UHBR 20.', 1),
    (2, 'GPU-RX-9070XT', 'AMD Radeon RX 9070 XT', 'amd-radeon-rx-9070xt', 'Factory-overclocked RDNA 4 flagship', 'Factory-overclocked RDNA 4 4608-SP flagship, 2500 MHz game / 2850 MHz boost, 16 GB GDDR7 at 24 Gbps, 250 W. 15 % faster than RX 7900 XTX while drawing ~100 W less; HDMI 2.2 ready, USB-C 4K144 output.', 1);

    -- AMD GPU Variants (Reference, Dual-Fan, Triple-Fan)
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (11, 'GPU-RX-6600XT-REF', 'Reference', 16995.00, 10),
    (11, 'GPU-RX-6600XT-DUAL', 'Dual-Fan', 17495.00, 8),
    (11, 'GPU-RX-6600XT-TRIPLE', 'Triple-Fan', 18195.00, 4),
    (12, 'GPU-RX-6650XT-REF', 'Reference', 18495.00, 10),
    (12, 'GPU-RX-6650XT-DUAL', 'Dual-Fan', 18995.00, 8),
    (12, 'GPU-RX-6650XT-TRIPLE', 'Triple-Fan', 19695.00, 4),
    (13, 'GPU-RX-6700XT-REF', 'Reference', 22995.00, 8),
    (13, 'GPU-RX-6700XT-DUAL', 'Dual-Fan', 23495.00, 6),
    (13, 'GPU-RX-6700XT-TRIPLE', 'Triple-Fan', 24195.00, 3),
    (14, 'GPU-RX-7600-REF', 'Reference', 14495.00, 12),
    (14, 'GPU-RX-7600-DUAL', 'Dual-Fan', 14995.00, 10),
    (14, 'GPU-RX-7600-TRIPLE', 'Triple-Fan', 15695.00, 5),
    (15, 'GPU-RX-7700XT-REF', 'Reference', 26995.00, 8),
    (15, 'GPU-RX-7700XT-DUAL', 'Dual-Fan', 27495.00, 6),
    (15, 'GPU-RX-7700XT-TRIPLE', 'Triple-Fan', 28195.00, 3),
    (16, 'GPU-RX-7800XT-REF', 'Reference', 32995.00, 6),
    (16, 'GPU-RX-7800XT-DUAL', 'Dual-Fan', 33495.00, 5),
    (16, 'GPU-RX-7800XT-TRIPLE', 'Triple-Fan', 34195.00, 3),
    (17, 'GPU-RX-7900GRE-REF', 'Reference', 36995.00, 5),
    (17, 'GPU-RX-7900GRE-DUAL', 'Dual-Fan', 37495.00, 4),
    (17, 'GPU-RX-7900GRE-TRIPLE', 'Triple-Fan', 38195.00, 2),
    (18, 'GPU-RX-7900XTX-REF', 'Reference', 49995.00, 4),
    (18, 'GPU-RX-7900XTX-DUAL', 'Dual-Fan', 50495.00, 3),
    (18, 'GPU-RX-7900XTX-TRIPLE', 'Triple-Fan', 51195.00, 2),
    (19, 'GPU-RX-9070-REF', 'Reference', 39995.00, 5),
    (19, 'GPU-RX-9070-DUAL', 'Dual-Fan', 40495.00, 4),
    (19, 'GPU-RX-9070-TRIPLE', 'Triple-Fan', 41195.00, 2),
    (20, 'GPU-RX-9070XT-REF', 'Reference', 45995.00, 4),
    (20, 'GPU-RX-9070XT-DUAL', 'Dual-Fan', 46495.00, 3),
    (20, 'GPU-RX-9070XT-TRIPLE', 'Triple-Fan', 47195.00, 2);

-- Product Images for AMD GPUs
INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
(11, '/assets/AMD GPU/AMD RADEON RX 6600 XT.webp', 'AMD Radeon RX 6600 XT', 0),
(12, '/assets/AMD GPU/AMD RADEON RX 6650 XT.webp', 'AMD Radeon RX 6650 XT', 0),
(13, '/assets/AMD GPU/AMD RADEON RX 6700 XT.webp', 'AMD Radeon RX 6700 XT', 0),
(14, '/assets/AMD GPU/AMD RADEON RX 7600.webp', 'AMD Radeon RX 7600', 0),
(15, '/assets/AMD GPU/AMD RADEON RX 7700 XT.jpg', 'AMD Radeon RX 7700 XT', 0),
(16, '/assets/AMD GPU/AMD RADEON RX 7800 XT.webp', 'AMD Radeon RX 7800 XT', 0),
(17, '/assets/AMD GPU/AMD RADEON RX 7900 GRE.jpg', 'AMD Radeon RX 7900 GRE', 0),
(18, '/assets/AMD GPU/AMD RADEON RX 7900 XTX.webp', 'AMD Radeon RX 7900 XTX', 0),
(19, '/assets/AMD GPU/AMD RADEON RX 9070.webp', 'AMD Radeon RX 9070', 0),
(20, '/assets/AMD GPU/AMD RADEON RX 9070 XT.png', 'AMD Radeon RX 9070 XT', 0);    -- =====================================================
    -- MOTHERBOARD PRODUCTS (10 items, IDs 21-30)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (5, 'MB-AORUS-X670-ELITE-AX', 'AORUS X670 ELITE AX', 'aorus-x670-elite-ax', 'AM5 ATX board for Ryzen 7000/8000 CPUs', 'AM5 ATX board for Ryzen 7000/8000 CPUs, 16+2+2 70 A VRM, DDR5-6600+ (4 slots, 128 GB), PCIe 5.0 x16 & x4, 4×M.2 (1 PCIe 5), 2.5 GbE + Wi-Fi 6E + BT 5.3, USB-C 20 Gbps, Q-Flash Plus. Solid mid-range foundation with RGB Fusion 2.0.', 1),
    (5, 'MB-ASRock-B550-PHANTOM-GAMING-4-AC', 'ASRock B550 Phantom Gaming 4 AC', 'asrock-b550-phantom-gaming-4-ac', 'AM4 ATX, 8-phase VRM', 'AM4 ATX, 8-phase VRM, PCIe 4.0 x16, DDR4-4733+ (4×32 GB), 2×M.2 (1 PCIe 4), 2.5 GbE + 802.11ac + BT 4.2, USB-C 10 Gbps. Entry-level gaming board with Polychrome SYNC and M.2 heatsink.', 1),
    (5, 'MB-ASRock-B650M-HDV-M2', 'ASRock B650M HDV M.2', 'asrock-b650m-hdv-m2', 'AM5 micro-ATX, 8-layer PCB', 'AM5 micro-ATX, 8-layer PCB, 8-phase 50 A VRM, DDR5-6400 (2 slots, 96 GB), PCIe 4.0 x16, 2×M.2 (PCIe 5 & 4), 2.5 GbE, Wi-Fi 6E optional via M.2 Key-E. Budget builder friendly with EZ M.2 latch.', 1),
    (5, 'MB-ASRock-X870-STEEL-LEGEND-WIFI', 'ASRock X870 Steel Legend WiFi', 'asrock-x870-steel-legend-wifi', 'Next-gen AM5 ATX', 'Next-gen AM5 ATX, 14+2+1 90 A VRM, DDR5-8000+ (4 slots), PCIe 5.0 x16 & x4, 4×M.2 (2 PCIe 5), 5 GbE + Wi-Fi 7 + BT 5.4, USB4 40 Gbps front-C. White camo aesthetic, Polychrome RGB, graphics-card holder included.', 1),
    (5, 'MB-ASUS-ROG-STRIX-B550-F-GAMING', 'ASUS ROG Strix B550-F Gaming', 'asus-rog-strix-b550-f-gaming', 'AM4 ROG ATX', 'AM4 ROG ATX, 12+2 50 A VRM, DDR4-5100 (128 GB), PCIe 4.0 x16 & x4, 2×M.2 with heatsinks, 2.5 GbE, SupremeFX S1220A audio, Aura Sync. Premium gaming features minus the premium chipset price.', 1),
    (5, 'MB-ASUS-TUF-GAMING-B650-PLUS', 'ASUS TUF GAMING B650-PLUS', 'asus-tuf-gaming-b650-plus', 'AM5 TUF ATX', 'AM5 TUF ATX, 12+2 DrMOS 60 A, DDR5-6400 (128 GB), PCIe 5.0 x16, 3×M.2 (1 PCIe 5), 2.5 GbE + Wi-Fi 6, USB-C 20 Gbps. Military-grade components, Realtek 7.1 audio, and two-way AI noise cancel.', 1),
    (5, 'MB-GIGABYTE-B850M-GAMING-X-WIFI6E', 'GIGABYTE B850M GAMING X WiFi 6E', 'gigabyte-b850m-gaming-x-wifi6e', 'AM5 micro-ATX', 'AM5 micro-ATX, 10+2+1 55 A VRM, DDR5-7600 (2 slots, 96 GB), PCIe 4.0 x16, 2×M.2 (PCIe 5 & 4), 2.5 GbE + Wi-Fi 6E + BT 5.3, Q-Flash Plus. Black & grey heatsinks with RGB Fusion accents for compact gaming rigs.', 1),
    (5, 'MB-MSI-MAG-B850-TOMAHAWK-MAX-WIFI', 'MSI MAG B850 Tomahawk MAX WIFI', 'msi-mag-b850-tomahawk-max-wifi', 'AM5 ATX', 'AM5 ATX, 14+2+1 80 A VRM, DDR5-7600 (128 GB), PCIe 5.0 x16 & x4, 4×M.2 (1 PCIe 5), 2.5 GbE + Wi-Fi 6E + BT 5.3, USB-C 20 Gbps. Extended heatsink, M.2 Shield Frozr, and BIOS Flashback for bullet-proof reliability.', 1),
    (5, 'MB-MSI-MAG-X870E-TOMAHAWK-WIFI', 'MSI MAG X870E Tomahawk WIFI', 'msi-mag-x870e-tomahawk-wifi', 'AM5 high-end ATX', 'AM5 high-end ATX, 16+2+1 90 A VRM, DDR5-8200+ (128 GB), PCIe 5.0 x16 & x8, 4×M.2 (2 PCIe 5), 5 GbE + Wi-Fi 7 + BT 5.4, USB4 40 Gbps rear-C. Navy-grey Tomahawk armor, fully shielded PCB for enthusiast overclocking.', 1),
    (5, 'MB-ROG-STRIX-X670E-GAMING-WIFI', 'ROG STRIX X670E GAMING WIFI', 'rog-strix-x670e-gaming-wifi', 'Flagship AM5 ROG ATX', 'Flagship AM5 ROG ATX, 18+2 110 A VRM, DDR5-8000+ (128 GB), PCIe 5.0 x16 & x4, 4×M.2 (2 PCIe 5 with heatsinks), 10 GbE + Wi-Fi 6E, USB4 40 Gbps front & rear. Polymo lighting, ROG Gen-Z.2 card, AI Overclocking, and SupremeFX ALC4082 audio.', 1);

    -- Motherboard Variants (None needed for first variant)
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (21, 'MB-AORUS-X670-ELITE-AX-STD', 'Standard', 18995.00, 12),
    (22, 'MB-ASRock-B550-PHANTOM-4AC-STD', 'Standard', 7495.00, 18),
    (23, 'MB-ASRock-B650M-HDV-M2-STD', 'Standard', 8995.00, 15),
    (24, 'MB-ASRock-X870-STEEL-STD', 'Standard', 19995.00, 10),
    (25, 'MB-ASUS-ROG-STRIX-B550F-STD', 'Standard', 11995.00, 14),
    (26, 'MB-ASUS-TUF-B650-PLUS-STD', 'Standard', 13995.00, 12),
    (27, 'MB-GIGABYTE-B850M-GAMING-STD', 'Standard', 9995.00, 15),
    (28, 'MB-MSI-MAG-B850-TOMAHAWK-STD', 'Standard', 15995.00, 10),
    (29, 'MB-MSI-MAG-X870E-TOMAHAWK-STD', 'Standard', 21995.00, 8),
    (30, 'MB-ROG-STRIX-X670E-GAMING-STD', 'Standard', 27995.00, 6);

    -- Product Images for Motherboards
    INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
    (21, '/assets/AMD Motherboard/AORUS X670 ELITE AX.png', 'AORUS X670 ELITE AX', 0),
    (22, '/assets/AMD Motherboard/ASROCK B550 PHANTOM GAMING 4_AC.webp', 'ASRock B550 Phantom Gaming 4 AC', 0),
    (23, '/assets/AMD Motherboard/ASROCK B650M HDV_M2.jpg', 'ASRock B650M HDV M.2', 0),
    (24, '/assets/AMD Motherboard/ASROCK X870 STEEL LEGEND WIFI.webp', 'ASRock X870 Steel Legend WiFi', 0),
    (25, '/assets/AMD Motherboard/ASUS ROG Strix B550-F Gaming_.webp', 'ASUS ROG Strix B550-F Gaming', 0),
    (26, '/assets/AMD Motherboard/ASUS TUF GAMING B650-PLUS.png', 'ASUS TUF Gaming B650-Plus', 0),
    (27, '/assets/AMD Motherboard/GIGABYTE B850M GAMING X WIFI6E.png', 'Gigabyte B850M Gaming X WiFi6E', 0),
    (28, '/assets/AMD Motherboard/MSI MAG B850 Tomahawk MAX WIFI_.webp', 'MSI MAG B850 Tomahawk Max WiFi', 0),
    (29, '/assets/AMD Motherboard/MSI MAG X870E TOMAHAWK WIFI.webp', 'MSI MAG X870E Tomahawk WiFi', 0),
    (30, '/assets/AMD Motherboard/ROG STRIX X670E-GAMING WIFI.png', 'ROG STRIX X670E Gaming WiFi', 0);

    -- =====================================================
    -- CASE PRODUCTS (15 items, IDs 31-45)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (7, 'CASE-TT-TOWER-300', 'Thermaltake Tower 300', 'tt-tower-300', 'Mini-ITX / micro-ATX vertical “chimney” tower', 'Mini-ITX / micro-ATX vertical “chimney” tower, 3× 120 mm ARGB fans pre-installed, 280 mm rad top, 365 mm GPU clearance, hot-swap 3.5” sled, tempered-glass front & side. Rotatable motherboard tray shows off GPU or CPU side at will.', 1),
    (7, 'CASE-PHANTEKS-ECLIPSE-G400A', 'Phanteks Eclipse G400A', 'phanteks-eclipse-g400a', 'Mid-tower ATX airflow specialist', 'Mid-tower ATX airflow specialist, mesh front, 2× 140 mm Skiron fans included, supports 360 mm front / 280 mm top radiators, 390 mm GPUs, built-in PWM fan hub. Tool-less tempered-glass side, PSU shroud, 34 mm cable space.', 1),
    (7, 'CASE-NZXT-H7-FLOW', 'NZXT H7 Flow', 'nzxt-h7-flow', 'Clean ATX airflow chassis', 'Clean ATX airflow chassis, perforated top & front, 2× 120 mm fans, fits 360 mm side / 360 mm top AIO, 381 mm GPU, 165 mm CPU cooler. Removable radiator bracket, pre-installed vertical GPU kit, USB-C 3.2 Gen 2 front.', 1),
    (7, 'CASE-NZXT-H6-FLOW-RGB', 'NZXT H6 Flow RGB', 'nzxt-h6-flow-rgb', 'Compact dual-chamber ATX', 'Compact dual-chamber ATX, 2× 140 mm RGB intake + 1× 120 mm exhaust pre-installed, 280 mm GPU basement, 360 mm top rad, 165 mm tower clearance. Swing-open glass side, cable-concealing rear chamber, USB-C front.', 1),
    (7, 'CASE-MONTECH-KING-95-PRO', 'Montech King 95 Pro', 'montech-king-95-pro', 'Premium aluminum ATX', 'Premium aluminum ATX, 4 mm tempered glass, dual 200 mm ARGB front, 1× 120 mm rear, 420 mm rad support, 3-way GPU mount (horizontal, vertical, reverse). Tool-less panels, PWM/ARGB hub, USB-C 3.2 Gen 2×2.', 1),
    (7, 'CASE-LIAN-LI-O11-DYNAMIC-EVO-RGB', 'Lian Li O11 Dynamic EVO RGB', 'lian-li-o11-dynamic-evo-rgb', 'Dual-chamber ATX icon', 'Dual-chamber ATX icon, 3× 120 mm UniFan SL-EVO ARGB pre-mounted, 420 mm side / 360 mm top radiator, 455 mm GPU, reversible motherboard tray. Modular rails, tempered-glass front & side, USB-C 3.2 Gen 2×2.', 1),
    (7, 'CASE-LIAN-LI-LANCOOL-217', 'Lian Li Lancool 217', 'lian-li-lancool-217', 'Mid-range ATX airflow', 'Mid-range ATX airflow, mesh front, 2× 140 mm PWM fans, 360 mm top / 280 mm front rad, 392 mm GPU, 170 mm air cooler. Hinged tempered-glass side, PSU basement with removable drive cage, USB-C front.', 1),
    (7, 'CASE-HYTE-Y70-TOUCH-INFINITE', 'HYTE Y70 Touch Infinite', 'hyte-y70-touch-infinite', 'Dual-chamber ATX showcase with touch screen', 'Dual-chamber ATX showcase, built-in 5” 1080p touch screen on front, 3× 140 mm Infinity ARGB fans, 420 mm side rad, 422 mm GPU vertical-ready. Rotatable motherboard tray, 3× USB-C front (1 3.2 Gen 2×2).', 1),
    (7, 'CASE-HYTE-Y40-SNOW-WHITE', 'HYTE Y40 Snow White', 'hyte-y40-snow-white', 'Compact dual-chamber ATX in snowy finish', 'Compact dual-chamber ATX in snowy finish, 2× 120 mm RGB fans, 360 mm top rad, 375 mm GPU, 165 mm tower. Panoramic 3 mm glass corner, PSU & cable basement, USB-C 3.2 Gen 2 front, vertical GPU bracket included.', 1),
    (7, 'CASE-FRACTAL-DESIGN-NORTH', 'Fractal Design North', 'fractal-design-north', 'Scandi-inspired ATX mid-tower', 'Scandi-inspired ATX mid-tower, real wood or vented metal front, 2× 140 mm Aspect PWM fans, 360 mm top / 280 mm front rad, 355 mm GPU. Open interior, hinged glass side, Nexus 7 fan hub pre-wired.', 1),
    (7, 'CASE-FRACTAL-DESIGN-MESHIFY-2', 'Fractal Design Meshify 2', 'fractal-design-meshify-2', 'High-airflow ATX icon', 'High-airflow ATX icon, angular mesh front, 3× 140 mm Dynamic X2 GP-14 fans, 420 mm top / 360 mm front rad, 360 mm GPU with HDD cage. Modular top, reversible front door, USB-C 3.2 Gen 2, sound-damped panels.', 1),
    (7, 'CASE-CORSAIR-4000D-AIRFLOW-TG', 'Corsair 4000D Airflow TG', 'corsair-4000d-airflow-tg', 'Mid-tower ATX airflow champion', 'Mid-tower ATX airflow champion, mesh front panel, 2× 120 mm AirGuide fans, 360 mm front / 280 mm top rad, 360 mm GPU, 170 mm tower. RapidRoute cable management, tempered-glass side, USB-C 3.2 Gen 2 ready.', 1),
    (7, 'CASE-CM-NR200P-V3', 'Cooler Master NR200P V3', 'cm-nr200p-v3', 'Updated mini-ITX SFF', 'Updated mini-ITX SFF, 3 mm tempered-glass or vented steel side options, 3× 120 mm SickleFlow fans, 280 mm rad top, 3-slot 330 mm GPU vertical mount. Tool-less steel chassis, PCIe 4.0 riser included, USB-C 3.2 Gen 2.', 1),
    (7, 'CASE-CM-MASTERBOX-600', 'Cooler Master MasterBox 600', 'cm-masterbox-600', 'Value ATX mid-tower', 'Value ATX mid-tower, fine-mesh front, 2× 120 mm ARGB fans, 360 mm front / 280 mm top rad, 400 mm GPU, 165 mm cooler. ARGB controller built-in, tempered-glass side, PSU shroud with HDD sled, USB-C front.', 1),
    (7, 'CASE-ANTEC-C5-ARGB', 'Antec C5 ARGB', 'antec-c5-argb', 'Budget ATX airflow', 'Budget ATX airflow, mesh front, 3× 120 mm ARGB fans pre-installed, 280 mm front / 240 mm top rad, 350 mm GPU, 160 mm tower. Full-length PSU shroud, magnetic tempered-glass side, ARGB sync button front I/O.', 1);

    -- Case Variants
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (31, 'CASE-TT-TOWER-300-BLK', 'Black', 4995.00, 8),
    (31, 'CASE-TT-TOWER-300-SNW', 'Snow', 4995.00, 6),
    (31, 'CASE-TT-TOWER-300-TRQ', 'Turquoise', 4995.00, 4),
    (31, 'CASE-TT-TOWER-300-GRN', 'Matcha Green', 4995.00, 2),
    (32, 'CASE-PHANTEKS-G400A-BLK', 'Black', 3695.00, 15),
    (32, 'CASE-PHANTEKS-G400A-WHT', 'White', 3695.00, 10),
    (33, 'CASE-NZXT-H7-FLOW-BLK', 'Matte Black', 5495.00, 10),
    (33, 'CASE-NZXT-H7-FLOW-WHT', 'White', 5495.00, 8),
    (34, 'CASE-NZXT-H6-FLOW-BLK', 'Black', 4795.00, 12),
    (34, 'CASE-NZXT-H6-FLOW-WHT', 'White', 4795.00, 8),
    (35, 'CASE-MONTECH-KING-95-BLK', 'Black', 6995.00, 7),
    (35, 'CASE-MONTECH-KING-95-WHT', 'White', 6995.00, 5),
    (36, 'CASE-LIAN-LI-O11-BLK', 'Black', 8495.00, 6),
    (36, 'CASE-LIAN-LI-O11-WHT', 'White', 8495.00, 4),
    (37, 'CASE-LIAN-LI-217-BLK', 'Black', 5995.00, 8),
    (37, 'CASE-LIAN-LI-217-WHT', 'White', 5995.00, 7),
    (38, 'CASE-HYTE-Y70-BLK', 'Black', 11995.00, 10),
    (38, 'CASE-HYTE-Y70-WHT', 'White', 11995.00, 5),
    (39, 'CASE-HYTE-Y40-BLK', 'Black', 6495.00, 5),
    (39, 'CASE-HYTE-Y40-WHT', 'White', 6495.00, 3),
    (40, 'CASE-FRACTAL-NORTH-WHT', 'Snow White', 6995.00, 10),
    (41, 'CASE-FRACTAL-MESH-BLK', 'Black', 7995.00, 6),
    (41, 'CASE-FRACTAL-MESH-WHT', 'White', 7995.00, 4),
    (41, 'CASE-FRACTAL-MESH-WLN', 'Walnut front', 7995.00, 2),
    (42, 'CASE-CORSAIR-4000D-BLK', 'Black', 4495.00, 6),
    (42, 'CASE-CORSAIR-4000D-WHT', 'White', 4495.00, 4),
    (43, 'CASE-CM-NR200P-BLK', 'Black', 4295.00, 12),
    (43, 'CASE-CM-NR200P-WHT', 'White', 4295.00, 8),
    (44, 'CASE-CM-MB600-BLK', 'Black', 3995.00, 10),
    (44, 'CASE-CM-MB600-WHT', 'White', 3995.00, 6),
    (45, 'CASE-ANTEC-C5-BLK', 'Black', 2995.00, 15),
    (45, 'CASE-ANTEC-C5-WHT', 'White', 2995.00, 10);

    -- Case Images
    INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
    (31, '/assets/CASE/Thermaltake The Tower 300 Micro Tower Chassis.jpg', 'Thermaltake Tower 300', 0),
    (32, '/assets/CASE/Phanteks Eclipse G400A ATX_.webp', 'Phanteks Eclipse G400A', 0),
    (33, '/assets/CASE/NZXT H7 Flow.webp', 'NZXT H7 Flow', 0),
    (34, '/assets/CASE/NZXT H6 Flow RGB Compact Dual-Chamber ATX_.jpg', 'NZXT H6 Flow RGB', 0),
    (35, '/assets/CASE/Montech KING 95 PRO ATX.webp', 'Montech King 95 Pro', 0),
    (36, '/assets/CASE/Lian-Li-O11-Dynamic-EVO-RGB-001.jpg', 'Lian Li O11 Dynamic EVO RGB', 0),
    (37, '/assets/CASE/Lian Li Lancool 217.webp', 'Lian Li Lancool 217', 0),
    (38, '/assets/CASE/HYTE Y70 Touch Infinite.jpg', 'HYTE Y70 Touch Infinite', 0),
    (39, '/assets/CASE/HYTE Y40 Snow White ATX.jpg', 'HYTE Y40 Snow White', 0),
    (40, '/assets/CASE/Fractal Design North PC.webp', 'Fractal Design North', 0),
    (41, '/assets/CASE/Fractal Design Meshify 2.jpg', 'Fractal Design Meshify 2', 0),
    (42, '/assets/CASE/Corsair 4000D Airflow Tempered Glass_.webp', 'Corsair 4000D Airflow TG', 0),
    (43, '/assets/CASE/CoolerMaster MasterBox NR200P V3.webp', 'Cooler Master NR200P V3', 0),
    (44, '/assets/CASE/Cooler Master MasterBox 600 PC.jpg', 'Cooler Master MasterBox 600', 0),
    (45, '/assets/CASE/Antec C5 ARGB_.jpg', 'Antec C5 ARGB', 0);

    -- =====================================================
    -- CPU COOLER PRODUCTS (10 items, IDs 46-55)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (8, 'COOL-THERMALRIGHT-PA120-SE', 'Thermalright Peerless Assassin 120 SE', 'thermalright-pa120-se', 'Dual-tower 120 mm SE edition', 'Dual-tower 120 mm SE edition, 6 heat-pipes, 2× TL-C12C PWM fans (1550 rpm, 25 dB), 165 mm height, 245 W TDP rating. Easy clip mounting for Intel 1700/AMD AM5; top-tier value for Ryzen 7 & i7 builds.', 1),
    (8, 'COOL-NOCTUA-NH-D15-G2', 'Noctua NH-D15 G2', 'noctua-nh-d15-g2', '2nd-gen flagship dual-tower', '2nd-gen flagship dual-tower, 8 heat-pipes, offset asymmetry for 100 % PCIe clearance, 2× NF-A14x25 G2 140 mm fans, 159 mm height, 280 W TDP. SecuFirm2+ for AM5/LGA1700, NT-H2 paste, 6-year warranty.', 1),
    (8, 'COOL-NOCTUA-NH-D15', 'Noctua NH-D15', 'noctua-nh-d15', 'Legendary dual-tower classic', 'Legendary dual-tower classic, 6 heat-pipes, 2× NF-A15 140 mm PWM fans, 165 mm height, 250 W TDP. Whisper-quiet 24.6 dB(A), broad socket support (Intel 1700/AMD AM5), premium build and 6-year warranty.', 1),
    (8, 'COOL-MSI-MAG-CORE-FROZR-L-ARGB', 'MSI MAG Core Frozr L ARGB', 'msi-mag-core-frozr-l-argb', 'Single-tower 120 mm ARGB', 'Single-tower 120 mm ARGB, 4 direct-touch heat-pipes, Core-Architecture fan 500-2000 rpm, 180 W TDP, 154 mm height. Mystic Light sync via 3-pin ARGB, universal Intel/AMD brackets, pre-applied thermal paste.', 1),
    (8, 'COOL-LIAN-LI-GALAHAD-II-TRINITY-PERF', 'Lian Li Galahad II Trinity Performance', 'lian-li-galahad-ii-trinity-perf', 'AIO Trinity pump with infinity-mirror cap', 'AIO Trinity pump with infinity-mirror cap, 3× 120 mm high-static RGB fans (69 CFM, 2.7 mmH₂O), 400 mm sleeved tubes, 300 W TDP. Removable aluminum pump shroud, Lian-Li UNI FAN compatible, 5-year leak warranty.', 1),
    (8, 'COOL-ID-COOLING-SE-214XT-ARGB', 'ID-COOLING SE-214XT ARGB', 'id-cooling-se-214xt-argb', 'Budget single-tower 120 mm', 'Budget single-tower 120 mm, 4 heat-pipes, 150 W TDP, 154 mm height. Included ARGB PWM fan 600-1800 rpm, 24 dB; supports Intel LGA1700 & AMD AM5; tool-free top-mount bracket, pre-applied paste.', 1),
    (8, 'COOL-DEEPCOOL-AK620-DIGITAL', 'DeepCool AK620 Digital', 'deepcool-ak620-digital', 'Dual-tower 120 mm with status LCD', 'Dual-tower 120 mm with status LCD on top cover, 6 nickel-plated heat-pipes, 2× FK120 PWM fans (1850 rpm, 28 dB), 260 W TDP, 160 mm height. Matrix LED shows temp/logo, wide AM5/LGA1700 coverage.', 1),
    (8, 'COOL-CM-MASTERFAN-MF140-HALO', 'Cooler Master MasterFan MF140 Halo', 'cm-masterfan-mf140-halo', '140 mm hybrid-frame RGB fan', '140 mm hybrid-frame RGB fan (air-flow & static-pressure), 2000 rpm, 53 CFM, 2.1 mmH₂O, 30 dB. Dual-ring ARGB, MFDB bearing, daisy-chainable; ideal case or radiator upgrade, includes anti-vibration pads.', 1),
    (8, 'COOL-BE-QUIET-DARK-ROCK-PRO-4', 'be quiet! Dark Rock Pro 4', 'be-quiet-dark-rock-pro-4', 'Flagship dual-tower silence', 'Flagship dual-tower silence, 7 copper heat-pipes, 2× Silent Wings 135 mm & 120 mm PWM fans, 250 W TDP, 163 mm height. Ceramic-black coating, brushed-aluminum top cover, inaudible 24 dB under load.', 1),
    (8, 'COOL-ARCTIC-LIQUID-FREEZER-III', 'Arctic Liquid Freezer III', 'arctic-liquid-freezer-iii', 'Rev. 3 AIO with thicker 38 mm radiator', 'Rev. 3 AIO with thicker 38 mm radiator, VRM fan on pump block, 2×/3× P14 PWM PST A-RGB, 300 W TDP. Sleeved tubing, integrated cable management, compatible with Intel 1700/AMD AM5, 6-year warranty.', 1);

    -- Cooler Variants
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (46, 'COOL-PA120-SE-BLK', 'Black', 2195.00, 20),
    (46, 'COOL-PA120-SE-WHT', 'White', 2195.00, 10),
    (47, 'COOL-NHD15-G2-BLK', 'Black', 6995.00, 5),
    (47, 'COOL-NHD15-G2-CHRX', 'Chromax.black', 6995.00, 4),
    (47, 'COOL-NHD15-G2-BGE', 'Classic beige', 6995.00, 3),
    (48, 'COOL-NHD15-BGE', 'Brown/beige', 5495.00, 9),
    (48, 'COOL-NHD15-CHRX', 'Chromax.black', 5495.00, 6),
    (49, 'COOL-MSI-FROZR-BLK', 'Black top cover only', 2995.00, 20),
    (50, 'COOL-LIAN-LI-240', '240 mm', 5795.00, 6),
    (50, 'COOL-LIAN-LI-360', '360 mm', 6595.00, 4),
    (51, 'COOL-ID-214XT-BLK', 'Black', 1495.00, 20),
    (51, 'COOL-ID-214XT-WHT', 'White', 1495.00, 15),
    (52, 'COOL-AK620-DIG-BLK', 'Black', 3495.00, 10),
    (52, 'COOL-AK620-DIG-WHT', 'White', 3495.00, 5),
    (53, 'COOL-MF140-1PK', 'Single pack', 1795.00, 25),
    (53, 'COOL-MF140-2PK', 'Twin pack', 3095.00, 15),
    (54, 'COOL-DRP4-BLK', 'Black only', 5495.00, 10),
    (55, 'COOL-ARCTIC-240', '240 mm', 5495.00, 6),
    (55, 'COOL-ARCTIC-360', '360 mm', 6295.00, 4);

    -- Cooler Images
    INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
    (46, '/assets/CPU Coolers/Thermalright Peerless Assassin 120 SE CPU Air Cooler.webp', 'Thermalright Peerless Assassin 120 SE', 0),
    (47, '/assets/CPU Coolers/Noctua NH-D15 G2 CPU air cooler.webp', 'Noctua NH-D15 G2', 0),
    (48, '/assets/CPU Coolers/Noctua NH-D15 CPU cooler.jpg', 'Noctua NH-D15', 0),
    (49, '/assets/CPU Coolers/MSI MAG COREFROZR AA13 ARGB CPU.jpg', 'MSI MAG Core Frozr L ARGB', 0),
    (50, '/assets/CPU Coolers/Li Galahad II Trinity Performance.jpg', 'Lian Li Galahad II Trinity Performance', 0),
    (51, '/assets/CPU Coolers/ID-COOLING SE-214-XT ARGB CPU Cooler.jpg', 'ID-COOLING SE-214XT ARGB', 0),
    (52, '/assets/CPU Coolers/DeepCool AK620 Digital CPU Cooler.webp', 'DeepCool AK620 Digital', 0),
    (53, '/assets/CPU Coolers/Cooler Master MasterFan MF140 Halo.png', 'Cooler Master MasterFan MF140 Halo', 0),
    (54, '/assets/CPU Coolers/be quiet! Dark Rock Pro 4 CPU cooler.jpg', 'be quiet! Dark Rock Pro 4', 0),
    (55, '/assets/CPU Coolers/ARCTIC Liquid Freezer III.jpg', 'Arctic Liquid Freezer III', 0);

    -- =====================================================
    -- DDR4 MEMORY PRODUCTS (10 items, IDs 56-65)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (3, 'RAM-SAMSUNG-SODIMM-DDR4', 'Samsung SODIMM DDR4', 'samsung-sodimm-ddr4', 'JEDEC-standard 1.2 V DDR4-3200 CL22 SODIMM', 'JEDEC-standard 1.2 V DDR4-3200 CL22 SODIMM for laptops & mini-PCs; strict binning gives rock-solid stability and low power draw.', 1),
    (3, 'RAM-MUSHKIN-REDLINE-SODIMM-DDR4', 'Mushkin Redline SODIMM DDR4', 'mushkin-redline-sodimm-ddr4', 'Performance DDR4-3200 CL16 SODIMM', 'Performance DDR4-3200 CL16 SODIMM with red aluminium spreader; hand-tested chips deliver plug-and-play speed boost for gaming notebooks.', 1),
    (3, 'RAM-LEXAR-THOR-DDR4-UDIMM', 'Lexar Thor DDR4 UDIMM', 'lexar-thor-ddr4-udimm', 'Desktop DDR4-3600 CL18', 'Desktop DDR4-3600 CL18, wing-bolt heat-spreader, low-profile 34 mm height; XMP 2.0 one-click OC, compatible with Ryzen & Intel DDR4 boards.', 1),
    (3, 'RAM-KINGSTON-FURY-BEAST-DDR4', 'Kingston FURY Beast DDR4', 'kingston-fury-beast-ddr4', 'Iconic DDR4-3200–3733 CL15-19', 'Iconic DDR4-3200–3733 CL15-19, black or RGB heat-spreader, XMP ready; auto-overclock to highest JEDEC profile, backed by lifetime warranty.', 1),
    (3, 'RAM-GSKILL-RIPJAWS-V-DDR4', 'G.SKILL Ripjaws V DDR4', 'gskill-ripjaws-v-ddr4', 'Classic dual-channel DDR4-2133–4400', 'Classic dual-channel DDR4-2133–4400, 42 mm height, quad-channel validated; rippled red or black aluminium heatsink, lifetime warranty.', 1),
    (3, 'RAM-CRUCIAL-BALLISTIX-DDR4', 'Crucial Ballistix DDR4', 'crucial-ballistix-ddr4', 'Micron-E die DDR4-3200–4000', 'Micron-E die DDR4-3200–4000, low-profile 39 mm or RGB models, XMP 2.0; hand-tuned timings give best-in-class latency for Ryzen 5000.', 1),
    (3, 'RAM-VIPER-STEEL-DDR4', 'Viper Steel DDR4', 'viper-steel-ddr4', 'Military-grade DDR4-3000–4400', 'Military-grade DDR4-3000–4400, gun-metal 45 mm heat-spreader, solid aluminium shield; lifetime protection, XMP 2.0 profiles.', 1),
    (3, 'RAM-TEAM-DARK-Z-DDR4', 'Team T-Force Dark Z DDR4', 'team-dark-z-ddr4', 'AMD-themed black & red DDR4-3200 CL16', 'AMD-themed black & red DDR4-3200 CL16, 43 mm height, armour-style heatsink; validated for Ryzen 3000/5000, lifetime service.', 1),
    (3, 'RAM-SPECTRIX-D41-RGB-DDR4', 'Spectrix D41 RGB DDR4', 'spectrix-d41-rgb-ddr4', 'XPG DDR4-3200–4133 with diffused RGB bar', 'XPG DDR4-3200–4133 with diffused RGB bar, XMP 2.0; ASRock Polychrome, MSI Mystic Light sync, 46 mm height, lifetime warranty.', 1),
    (3, 'RAM-CORSAIR-VENGEANCE-LPX-DDR4', 'Corsair Vengeance LPX DDR4', 'corsair-vengeance-lpx-ddr4', 'Low-profile 34 mm DDR4-2133–5000', 'Low-profile 34 mm DDR4-2133–5000, pure aluminium spreader, XMP 2.0; hand-sorted ICs, wide compatibility, lifetime Corsair support.', 1);

    -- DDR4 Variants
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (56, 'RAM-SAM-DDR4-8G', '8 GB', 1795.00, 20),
    (56, 'RAM-SAM-DDR4-16G', '16 GB', 2595.00, 20),
    (57, 'RAM-MUSHKIN-16K', '16 GB kit (2×8)', 1895.00, 15),
    (57, 'RAM-MUSHKIN-32K', '32 GB kit (2×16)', 3495.00, 10),
    (58, 'RAM-LEXAR-8G', '8 GB', 1495.00, 15),
    (58, 'RAM-LEXAR-16G', '16 GB', 2295.00, 10),
    (58, 'RAM-LEXAR-32G', '32 GB', 3095.00, 5),
    (59, 'RAM-KINGSTON-8G', '8 GB', 1595.00, 20),
    (59, 'RAM-KINGSTON-16G', '16 GB', 2295.00, 20),
    (59, 'RAM-KINGSTON-32G', '32 GB', 2995.00, 10),
    (60, 'RAM-GSKILL-4G', '4 GB', 1095.00, 5),
    (60, 'RAM-GSKILL-8G', '8 GB', 1695.00, 15),
    (60, 'RAM-GSKILL-16G', '16 GB', 2295.00, 15),
    (60, 'RAM-GSKILL-32G', '32 GB', 2895.00, 10),
    (61, 'RAM-CRUCIAL-8E', '8 GB Elite', 1795.00, 10),
    (61, 'RAM-CRUCIAL-16E', '16 GB Elite', 2495.00, 10),
    (61, 'RAM-CRUCIAL-32E', '32 GB Elite', 3195.00, 8),
    (61, 'RAM-CRUCIAL-8M', '8 GB MAX', 1995.00, 5),
    (61, 'RAM-CRUCIAL-16M', '16 GB MAX', 2695.00, 5),
    (62, 'RAM-VIPER-8G', '8 GB', 1649.00, 10),
    (62, 'RAM-VIPER-16G', '16 GB', 2249.00, 10),
    (62, 'RAM-VIPER-32G', '32 GB', 2849.00, 5),
    (63, 'RAM-TEAM-8G', '8 GB', 1549.00, 10),
    (63, 'RAM-TEAM-16G', '16 GB', 2149.00, 10),
    (63, 'RAM-TEAM-32G', '32 GB', 2749.00, 5),
    (64, 'RAM-SPECTRIX-8G', '8 GB', 1749.00, 10),
    (64, 'RAM-SPECTRIX-16G', '16 GB', 2449.00, 10),
    (64, 'RAM-SPECTRIX-32G', '32 GB', 3149.00, 5),
    (65, 'RAM-CORSAIR-4G', '4 GB', 649.00, 5),
    (65, 'RAM-CORSAIR-8G', '8 GB', 1649.00, 20),
    (65, 'RAM-CORSAIR-16G', '16 GB', 2449.00, 20),
    (65, 'RAM-CORSAIR-32G', '32 GB', 3249.00, 10),
    (65, 'RAM-CORSAIR-64G', '64 GB', 4849.00, 5),
    (65, 'RAM-CORSAIR-128K', '128 GB kit', 8049.00, 2);

    -- DDR4 Images
    INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
    (56, '/assets/DDR4/SAMSUNG SODIMM DDR4_.webp', 'Samsung SODIMM DDR4', 0),
    (57, '/assets/DDR4/MUSHKIN ENHANCED REDLINE SODIMM DDR4.jpg', 'Mushkin Redline SODIMM DDR4', 0),
    (58, '/assets/DDR4/Lexar THOR DDR4 UDIMM_.webp', 'Lexar Thor DDR4 UDIMM', 0),
    (59, '/assets/DDR4/KINGSTON FURY BEAST DDR4_.jpg', 'Kingston FURY Beast DDR4', 0),
    (60, '/assets/DDR4/G.SKILL Ripjaws V DDR4 RAM.webp', 'G.SKILL Ripjaws V DDR4', 0),
    (61, '/assets/DDR4/Crucial Ballistix DDR4.jpg', 'Crucial Ballistix DDR4', 0),
    (62, '/assets/DDR4/Viper Steel Series DDR4 RAM.jpg', 'Viper Steel DDR4', 0),
    (63, '/assets/DDR4/TeamGroup T-Force Dark Z DDR4.jpg', 'Team T-Force Dark Z DDR4', 0),
    (64, '/assets/DDR4/SPECTRIX D41 DDR4 RGB.jpg', 'Spectrix D41 RGB DDR4', 0),
    (65, '/assets/DDR4/Corsair Vengeance LPX DDR4_.webp', 'Corsair Vengeance LPX DDR4', 0);

    -- =====================================================
    -- DDR5 MEMORY PRODUCTS (10 items, IDs 66-75)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (3, 'RAM-TEAM-DELTA-RGB-DDR5', 'Team T-Force Delta RGB DDR5', 'team-delta-rgb-ddr5', '120° ARGB light-bar DDR5-5600–7200', '120° ARGB light-bar DDR5-5600–7200, on-die ECC, PMIC power, XMP 3.0; aluminium heat-sink, lifetime warranty, motherboard sync ready.', 1),
    (3, 'RAM-PATRIOT-VIPER-VENOM-DDR5', 'Patriot Viper Venom DDR5', 'patriot-viper-venom-ddr5', 'Viper DDR5-5200–7400 CL30-36', 'Viper DDR5-5200–7400 CL30-36, forged heat-spreader, RGB top strip; on-die ECC, XMP 3.0, lifetime coverage, Intel & AMD certified.', 1),
    (3, 'RAM-LEXAR-ARES-RGB-DDR5', 'Lexar Ares RGB DDR5', 'lexar-ares-rgb-ddr5', 'DDR5-5600–6400 with mirrored RGB bar', 'DDR5-5600–6400 with mirrored RGB bar, aluminium heat-sink, PMIC & ECC inside; XMP 3.0 one-click, lifetime service, 1.25 V–1.35 V.', 1),
    (3, 'RAM-KINGSTON-FURY-BEAST-DDR5-RGB', 'Kingston FURY Beast DDR5 RGB', 'kingston-fury-beast-ddr5-rgb', 'Fury DDR5-4800–7200 CL36-40', 'Fury DDR5-4800–7200 CL36-40, infrared-sync RGB, XMP 3.0 & AMD EXPO profiles; plug-and-play overclock, lifetime warranty.', 1),
    (3, 'RAM-GSKILL-TRIDENT-Z5-RGB-DDR5', 'G.Skill Trident Z5 RGB DDR5', 'gskill-trident-z5-rgb-ddr5', 'Flagship DDR5-5600–8400', 'Flagship DDR5-5600–8400, matte-black or silver body with RGB light-bar, XMP 3.0, hand-binned Hynix ICs, lifetime G.Skill warranty.', 1),
    (3, 'RAM-CRUCIAL-DDR5-PRO-UDIMM', 'Crucial DDR5 Pro UDIMM', 'crucial-ddr5-pro-udimm', 'Micron DDR5-4800–5600', 'Micron DDR5-4800–5600, CL40-36, on-die ECC & PMIC, JEDEC profile plus XMP 3.0; low-profile 34 mm, lifetime coverage.', 1),
    (3, 'RAM-CORSAIR-VENGEANCE-DDR5', 'Corsair Vengeance DDR5', 'corsair-vengeance-ddr5', 'Vengeance DDR5-4800–7000', 'Vengeance DDR5-4800–7000, custom PCB, XMP 3.0, PMIC for clean power; black or white spreader, lifetime Corsair support.', 1),
    (3, 'RAM-CORSAIR-DOMINATOR-PLATINUM-RGB-DDR5', 'Corsair Dominator Platinum RGB DDR5', 'corsair-dominator-platinum-rgb-ddr5', 'Premium DDR5-5200–8000', 'Premium DDR5-5200–8000, 12-CAP LED capellix RGB, die-cast heat-spreaders, XMP 3.0, hand-screened ICs, lifetime warranty, DHX cooling.', 1),
    (3, 'RAM-XPG-LANCER-BLADE-RGB-DDR5', 'XPG Lancer Blade RGB DDR5', 'xpg-lancer-blade-rgb-ddr5', 'Low-profile 33 mm DDR5-5200–7200', 'Low-profile 33 mm DDR5-5200–7200, RGB light-strip, on-die ECC, PMIC, XMP 3.0 & AMD EXPO; compatible with big air coolers, lifetime service.', 1),
    (3, 'RAM-ADATA-XPG-LANCER-RGB-DDR5', 'ADATA XPG Lancer RGB DDR5', 'adata-xpg-lancer-rgb-ddr5', 'XPG DDR5-5200–7200 CL36-40', 'XPG DDR5-5200–7200 CL36-40, sleek geometric RGB diffuser, PMIC & ECC, XMP 3.0 ready; aluminium heat-sink, lifetime ADATA warranty.', 1);

    -- DDR5 Variants
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (66, 'RAM-TEAM-16K', '16 GB kit', 3995.00, 15),
    (66, 'RAM-TEAM-32K', '32 GB kit', 5595.00, 8),
    (66, 'RAM-TEAM-64K', '64 GB kit', 7195.00, 3),
    (67, 'RAM-PATRIOT-16K', '16 GB kit', 4195.00, 10),
    (67, 'RAM-PATRIOT-32K', '32 GB kit', 5895.00, 6),
    (67, 'RAM-PATRIOT-64K', '64 GB kit', 7595.00, 3),
    (68, 'RAM-LEXAR-16K', '16 GB kit', 3795.00, 12),
    (68, 'RAM-LEXAR-32K', '32 GB kit', 5295.00, 8),
    (69, 'RAM-KINGSTON-8G', '8 GB', 3495.00, 10),
    (69, 'RAM-KINGSTON-16K', '16 GB kit', 3895.00, 15),
    (69, 'RAM-KINGSTON-32K', '32 GB kit', 5395.00, 10),
    (69, 'RAM-KINGSTON-64K', '64 GB kit', 6895.00, 5),
    (70, 'RAM-GSKILL-16K', '16 GB kit', 4495.00, 8),
    (70, 'RAM-GSKILL-32K', '32 GB kit', 6095.00, 6),
    (70, 'RAM-GSKILL-64K', '64 GB kit', 7695.00, 3),
    (70, 'RAM-GSKILL-96K', '96 GB kit', 9295.00, 2),
    (71, 'RAM-CRUCIAL-8G', '8 GB', 3095.00, 15),
    (71, 'RAM-CRUCIAL-16K', '16 GB kit', 3495.00, 20),
    (71, 'RAM-CRUCIAL-32K', '32 GB kit', 4695.00, 15),
    (71, 'RAM-CRUCIAL-64K', '64 GB kit', 5895.00, 8),
    (72, 'RAM-CORSAIR-16K', '16 GB kit', 3695.00, 20),
    (72, 'RAM-CORSAIR-32K', '32 GB kit', 4995.00, 15),
    (72, 'RAM-CORSAIR-64K', '64 GB kit', 6295.00, 10),
    (72, 'RAM-CORSAIR-96K', '96 GB kit', 7595.00, 5),
    (73, 'RAM-CORSAIR-DOM-16K', '16 GB kit', 5995.00, 8),
    (73, 'RAM-CORSAIR-DOM-32K', '32 GB kit', 8295.00, 5),
    (73, 'RAM-CORSAIR-DOM-64K', '64 GB kit', 10595.00, 3),
    (73, 'RAM-CORSAIR-DOM-128K', '128 GB kit', 15195.00, 1),
    (74, 'RAM-XPG-16K', '16 GB kit', 3995.00, 10),
    (74, 'RAM-XPG-32K', '32 GB kit', 5595.00, 8),
    (75, 'RAM-ADATA-16K', '16 GB kit', 3849.00, 12),
    (75, 'RAM-ADATA-32K', '32 GB kit', 5399.00, 8),
    (75, 'RAM-ADATA-64K', '64 GB kit', 6949.00, 4);

    -- DDR5 Images
    INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
    (66, '/assets/DDR5/TeamGroup T-Force Delta RGB DDR5.webp', 'Team T-Force Delta RGB DDR5', 0),
    (67, '/assets/DDR5/Patriot Viper Venom DDR5.jpg', 'Patriot Viper Venom DDR5', 0),
    (68, '/assets/DDR5/LEXAR ARES RGB DDR5.webp', 'Lexar Ares RGB DDR5', 0),
    (69, '/assets/DDR5/Kingston FURY Beast DDR5 RGB.jpg', 'Kingston FURY Beast DDR5 RGB', 0),
    (70, '/assets/DDR5/G.Skill Trident Z5 RGB Series DDR5.webp', 'G.Skill Trident Z5 RGB DDR5', 0),
    (71, '/assets/DDR5/CRUCIAL DDR5 PRO UDIMM.png', 'Crucial DDR5 Pro UDIMM', 0),
    (72, '/assets/DDR5/Corsair Vengeance DDR5_.webp', 'Corsair Vengeance DDR5', 0),
    (73, '/assets/DDR5/CORSAIR  Dominator Platinum RGB_.webp', 'Corsair Dominator Platinum RGB DDR5', 0),
    (74, '/assets/DDR5/XPG Lancer Blade RGB DDR5_.jpg', 'XPG Lancer Blade RGB DDR5', 0),
    (75, '/assets/DDR5/ADATA XPG Lancer RGB DDR5.jpg', 'ADATA XPG Lancer RGB DDR5', 0);

    -- =====================================================
    -- HDD PRODUCTS (10 items, IDs 76-85)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (4, 'HDD-WD-RED-PRO-20TB', 'WD Red Pro 20TB', 'wd-red-pro-20tb', 'NAS-optimized 7200 rpm CMR drive', 'NAS-optimized 7200 rpm CMR drive, 512 MB cache, 300 TB/year workload, 1 M-hr MTBF, 5-year warranty; NASware 3.0, 3.5-inch SATA 6 Gb/s.', 1),
    (4, 'HDD-WD-GOLD-22TB', 'WD Gold 22TB', 'wd-gold-22tb', 'Enterprise-class 7200 rpm', 'Enterprise-class 7200 rpm, 512 MB cache, 550 TB/year workload, 2.5 M-hr MTBF, 5-year warranty; vibration protection, 24×7 duty, SATA 6 Gb/s.', 1),
    (4, 'HDD-WD-BLUE-8TB', 'WD Blue 8TB', 'wd-blue-8tb', 'Mainstream 5400 rpm CMR drive', 'Mainstream 5400 rpm CMR drive, 256 MB cache, 180 TB/year rating, 2-year warranty; everyday storage, SATA 6 Gb/s, 3.5-inch form factor.', 1),
    (4, 'HDD-TOSHIBA-X300-PRO-22TB', 'Toshiba X300 Pro 22TB', 'toshiba-x300-pro-22tb', 'Performance 7200 rpm', 'Performance 7200 rpm, 512 MB cache, 300 TB/year workload, 1 M-hr MTBF, 5-year warranty; cache technology, 3.5-inch SATA 6 Gb/s.', 1),
    (4, 'HDD-TOSHIBA-MG-10TB', 'Toshiba MG 10TB', 'toshiba-mg-10tb', 'Enterprise 7200 rpm', 'Enterprise 7200 rpm, 256 MB cache, 550 TB/year workload, 2 M-hr MTBF, 5-year warranty; persistent write cache, SATA 6 Gb/s, 512e sector.', 1),
    (4, 'HDD-SEAGATE-IRONWOLF-PRO-20TB', 'Seagate IronWolf Pro 20TB', 'seagate-ironwolf-pro-20tb', 'NAS 7200 rpm CMR', 'NAS 7200 rpm CMR, 256 MB cache, 300 TB/year, 1.2 M-hr MTBF, 5-year warranty + 3-year Rescue; AgileArray, RV sensors, SATA 6 Gb/s.', 1),
    (4, 'HDD-SEAGATE-FIRECUDA-8TB', 'Seagate FireCuda 8TB', 'seagate-firecuda-8tb', 'Gaming 7200 rpm', 'Gaming 7200 rpm, 256 MB cache, CMR, 5-year warranty; flashes frequently-used data to onboard NAND for near-SSD feel, SATA 6 Gb/s.', 1),
    (4, 'HDD-SEAGATE-EXOS-X16-16TB', 'Seagate Exos X16 16TB', 'seagate-exos-x16-16tb', 'Data-center 7200 rpm', 'Data-center 7200 rpm, 256 MB cache, 550 TB/year, 2.5 M-hr MTBF, 5-year warranty; helium sealed, PowerBalance, SATA 6 Gb/s, 512e/4Kn.', 1),
    (4, 'HDD-SEAGATE-BARRACUDA-PRO-12TB', 'Seagate BarraCuda Pro 12TB', 'seagate-barracuda-pro-12tb', 'Prosumer 7200 rpm', 'Prosumer 7200 rpm, 256 MB cache, 300 TB/year, 5-year warranty; fastest Barracuda series, SATA 6 Gb/s, 3.5-inch, 512e sector.', 1),
    (4, 'HDD-WD-BLACK-8TB', 'WD Black 8TB', 'wd-black-8tb', 'Performance 7200 rpm', 'Performance 7200 rpm, 256 MB cache, 180 TB/year, 5-year warranty; dual-core processor, dual-stage actuator, SATA 6 Gb/s, 3.5-inch.', 1);

    -- HDD Variants
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (76, 'HDD-WD-RED-STD', 'Standard', 29995.00, 12),
    (77, 'HDD-WD-GOLD-STD', 'Standard', 34995.00, 8),
    (78, 'HDD-WD-BLUE-STD', 'Standard', 9995.00, 25),
    (79, 'HDD-TOSHIBA-X300-STD', 'Standard', 32995.00, 10),
    (80, 'HDD-TOSHIBA-MG-STD', 'Standard', 14995.00, 15),
    (81, 'HDD-SEAGATE-IRON-STD', 'Standard', 31995.00, 10),
    (82, 'HDD-SEAGATE-FIRE-STD', 'Standard', 12995.00, 18),
    (83, 'HDD-SEAGATE-EXOS-STD', 'Standard', 27995.00, 12),
    (84, 'HDD-SEAGATE-BARRA-STD', 'Standard', 19995.00, 15),
    (85, 'HDD-WD-BLACK-STD', 'Standard', 15995.00, 20);

    -- HDD Images
    INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
    (76, '/assets/HDD/Western Digital (WD) Red Pro 20TB NAS_.webp', 'WD Red Pro 20TB', 0),
    (77, '/assets/HDD/Western Digital (WD) Gold 22TB.webp', 'WD Gold 22TB', 0),
    (78, '/assets/HDD/Western Digital (WD) Blue 8TB.webp', 'WD Blue 8TB', 0),
    (79, '/assets/HDD/Toshiba X300 Pro 22 TB Performance_.webp', 'Toshiba X300 Pro 22TB', 0),
    (80, '/assets/HDD/Toshiba MG Series 10TB Enterprise Capacity.jpg', 'Toshiba MG 10TB', 0),
    (81, '/assets/HDD/SEAGATE IRONWOLF PRO 20TB.jpg', 'Seagate IronWolf Pro 20TB', 0),
    (82, '/assets/HDD/Seagate FireCuda 8TB.jpg', 'Seagate FireCuda 8TB', 0),
    (83, '/assets/HDD/Seagate Exos X16 enterprise_.jpg', 'Seagate Exos X16 16TB', 0),
    (84, '/assets/HDD/Seagate BarraCuda Pro 12TB_.webp', 'Seagate BarraCuda Pro 12TB', 0),
    (85, '/assets/HDD/Western Digital (WD) Black 8TB.webp', 'WD Black 8TB', 0);

    -- =====================================================
    -- PSU PRODUCTS (10 items, IDs 86-95)
    -- =====================================================

    INSERT IGNORE INTO `products` (`category_id`, `sku`, `name`, `slug`, `short_description`, `long_description`, `active`) VALUES
    (6, 'PSU-CORSAIR-RM850X', 'Corsair RM850x', 'corsair-rm850x', '850W 80+ Gold Modular', '850W 80+ Gold certified fully modular power supply, 12-year warranty, 105 °C capacitor, flat cables, quiet 135 mm fan, ideal for high-end gaming and workstation builds.', 1),
    (6, 'PSU-EVGA-SUPERNOVA-1000', 'EVGA SuperNOVA 1000 P5', 'evga-supernova-1000-p5', '1000W 80+ Platinum Semi-Modular', '1000W 80+ Platinum semi-modular PSU, 10-year warranty, 130mm fan, ECO mode, excellent 12-year lifespan for enthusiast overclocking and server workloads.', 1),
    (6, 'PSU-THERMALTAKE-TOUGHPOWER-750', 'Thermaltake Toughpower GF3 750W', 'thermaltake-toughpower-gf3-750w', '750W 80+ Gold Full Modular', '750W 80+ Gold fully modular, 140mm fan, 135°C capacitors, modular cables for clean builds, 12-year warranty, perfect for mid-range gaming systems.', 1),
    (6, 'PSU-COOLERMASTER-MWE-GOLD-750', 'Cooler Master MWE Gold V3 750W', 'cm-mwe-gold-v3-750w', '750W 80+ Gold Fully Modular', '750W 80+ Gold certified with full modularity, quiet 120mm fan, compact size, 10-year warranty, great for balanced gaming builds.', 1),
    (6, 'PSU-GIGABYTE-UD750GM', 'Gigabyte UD750GM', 'gigabyte-ud750gm', '750W 80+ Gold Semi-Modular', '750W 80+ Gold semi-modular PSU, 105°C Japanese capacitors, 3-year warranty, efficient and reliable power for mainstream systems.', 1),
    (6, 'PSU-MSI-MPG-A850G', 'MSI MPG A850G', 'msi-mpg-a850g', '850W 80+ Gold Modular', '850W 80+ Gold fully modular, 12-year warranty, 135mm fan, excellent stability for high-performance gaming rigs and streaming setups.', 1),
    (6, 'PSU-NZXT-C1000', 'NZXT C1000', 'nzxt-c1000', '1000W 80+ Gold Fully Modular', '1000W 80+ Gold with modular cables, 10-year warranty, designed for enthusiast builds, extreme silence with semi-passive operation.', 1),
    (6, 'PSU-CORSAIR-SF750', 'Corsair SF750', 'corsair-sf750', '750W 80+ Platinum SFX Full Modular', '750W 80+ Platinum SFX form factor, compact for ITX builds, 12-year warranty, quiet performance in space-constrained builds.', 1),
    (6, 'PSU-SUPER-FLOWER-LEADEX-III', 'Super Flower Leadex III Gold', 'super-flower-leadex-iii-gold', '850W 80+ Gold Semi-Modular', '850W 80+ Gold semi-modular, Japanese quality capacitors, excellent efficiency, great for high-end builds with reliable power delivery.', 1),
    (6, 'PSU-ASUS-ROG-THOR-1000', 'ASUS ROG THOR 1000W', 'asus-rog-thor-1000w', '1000W 80+ Platinum Premium Modular', '1000W 80+ Platinum fully modular with OLED display, premium build quality, 12-year warranty, overkill power for extreme enthusiast systems.', 1);

    -- PSU Variants
    INSERT IGNORE INTO `product_variants` (`product_id`, `variant_sku`, `title`, `price`, `stock`) VALUES
    (86, 'PSU-CORSAIR-RM850X-BLK', 'Standard', 7995.00, 8),
    (87, 'PSU-EVGA-SN1000-P5', 'Standard', 9995.00, 5),
    (88, 'PSU-TT-GF3-750', 'Standard', 6495.00, 10),
    (89, 'PSU-CM-MWE-750', 'Standard', 5995.00, 12),
    (90, 'PSU-GB-UD750', 'Standard', 5495.00, 8),
    (91, 'PSU-MSI-A850G', 'Standard', 8495.00, 6),
    (92, 'PSU-NZXT-C1000', 'Standard', 9495.00, 4),
    (93, 'PSU-CORSAIR-SF750', 'Standard', 8995.00, 5),
    (94, 'PSU-SF-LEADEX-850', 'Standard', 7495.00, 7),
    (95, 'PSU-ASUS-ROG-1000', 'Standard', 12995.00, 3);

    -- PSU Images
    INSERT IGNORE INTO `product_images` (`product_id`, `url`, `alt_text`, `order`) VALUES
    (86, '/assets/PSU/Corsair RM850x.jpg', 'Corsair RM850x', 0),
    (87, '/assets/PSU/EVGA SuperNOVA 1000 P5.png', 'EVGA SuperNOVA 1000 P5', 0),
    (88, '/assets/PSU/Thermaltake-Toughpower-GF3-750W-850W-1000W-1200W-80Plus-Gold-Power-Supply-btz-ph-1.webp', 'Thermaltake Toughpower GF3 750W', 0),
    (89, '/assets/PSU/COOLERMASTER MWE GOLD V3 750W.png', 'Cooler Master MWE Gold V3 750W', 0),
    (90, '/assets/PSU/Gigabyte UD750GM.jpg', 'Gigabyte UD750GM', 0),
    (91, '/assets/PSU/MSI MPG A850G.jpg', 'MSI MPG A850G', 0),
    (92, '/assets/PSU/NZXT C1000.jpg', 'NZXT C1000', 0),
    (93, '/assets/PSU/CORSAIR SF750.webp', 'Corsair SF750', 0),
    (94, '/assets/PSU/Super Flower Leadex III Gold.jpg', 'Super Flower Leadex III Gold', 0),
    (95, '/assets/PSU/ROG THOR 1000W.webp', 'ASUS ROG THOR 1000W', 0);

    -- =====================================================
    -- USERS TABLE - Add Superadmin Account
    -- =====================================================

    INSERT IGNORE INTO `users` (`email`, `password_hash`, `first_name`, `last_name`, `role`, `is_admin`) VALUES
    ('superadmin@mypc.com', '$2y$10$tFnX.sMLCSnfYNeNyX0rseDx3MGiZPHOp1zxltMFsGnny/RvL5lVS', 'Super', 'Administrator', 'superadmin', 1);