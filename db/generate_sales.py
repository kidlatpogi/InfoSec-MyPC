"""
Generate accurate sales data using real products from products_inserts.sql
Produces INSERT statements for orders and order_items tables
Matches the actual database schema from mypc_complete.sql
"""
import random
from datetime import datetime, timedelta

random.seed(42)

# Real product variants from products_inserts.sql with actual prices
# Format: (variant_id, product_id, variant_sku, title, price, product_name)
PRODUCT_VARIANTS = [
    # AMD CPUs (variants 1-20)
    (1, 1, 'CPU-AMD-R5-7600-BOX', 'Boxed with Cooler', 14995.00, 'AMD Ryzen 5 7600'),
    (2, 1, 'CPU-AMD-R5-7600-OEM', 'OEM (Tray)', 13795.00, 'AMD Ryzen 5 7600'),
    (3, 2, 'CPU-AMD-R5-7600X-BOX', 'Boxed with Cooler', 16495.00, 'AMD Ryzen 5 7600X'),
    (4, 2, 'CPU-AMD-R5-7600X-OEM', 'OEM (Tray)', 15295.00, 'AMD Ryzen 5 7600X'),
    (5, 3, 'CPU-AMD-R5-9600X-BOX', 'Boxed with Cooler', 18995.00, 'AMD Ryzen 5 9600X'),
    (6, 3, 'CPU-AMD-R5-9600X-OEM', 'OEM (Tray)', 17795.00, 'AMD Ryzen 5 9600X'),
    (7, 4, 'CPU-AMD-R7-7700-BOX', 'Boxed with Cooler', 19495.00, 'AMD Ryzen 7 7700'),
    (8, 4, 'CPU-AMD-R7-7700-OEM', 'OEM (Tray)', 18295.00, 'AMD Ryzen 7 7700'),
    (9, 5, 'CPU-AMD-R7-7800X3D-BOX', 'Boxed', 27995.00, 'AMD Ryzen 7 7800X3D'),
    (10, 5, 'CPU-AMD-R7-7800X3D-OEM', 'OEM (Tray)', 26795.00, 'AMD Ryzen 7 7800X3D'),
    (11, 6, 'CPU-AMD-R7-9800X3D-BOX', 'Boxed', 32995.00, 'AMD Ryzen 7 9800X3D'),
    (12, 6, 'CPU-AMD-R7-9800X3D-OEM', 'OEM (Tray)', 31795.00, 'AMD Ryzen 7 9800X3D'),
    (13, 7, 'CPU-AMD-R9-7900X3D-BOX', 'Boxed', 37995.00, 'AMD Ryzen 9 7900X3D'),
    (14, 7, 'CPU-AMD-R9-7900X3D-OEM', 'OEM (Tray)', 36795.00, 'AMD Ryzen 9 7900X3D'),
    (15, 8, 'CPU-AMD-R9-7950X3D-BOX', 'Boxed', 42995.00, 'AMD Ryzen 9 7950X3D'),
    (16, 8, 'CPU-AMD-R9-7950X3D-OEM', 'OEM (Tray)', 41795.00, 'AMD Ryzen 9 7950X3D'),
    (17, 9, 'CPU-AMD-R9-9950X3D-BOX', 'Boxed', 49995.00, 'AMD Ryzen 9 9950X3D'),
    (18, 9, 'CPU-AMD-R9-9950X3D-OEM', 'OEM (Tray)', 48795.00, 'AMD Ryzen 9 9950X3D'),
    (19, 10, 'CPU-AMD-R9-9950X-BOX', 'Boxed', 45995.00, 'AMD Ryzen 9 9950X'),
    (20, 10, 'CPU-AMD-R9-9950X-OEM', 'OEM (Tray)', 44795.00, 'AMD Ryzen 9 9950X'),
    
    # AMD GPUs (variants 21-50)
    (21, 11, 'GPU-RX-6600XT-REF', 'Reference', 16995.00, 'AMD Radeon RX 6600 XT'),
    (22, 11, 'GPU-RX-6600XT-DUAL', 'Dual-Fan', 17495.00, 'AMD Radeon RX 6600 XT'),
    (23, 11, 'GPU-RX-6600XT-TRIPLE', 'Triple-Fan', 18195.00, 'AMD Radeon RX 6600 XT'),
    (24, 12, 'GPU-RX-6650XT-REF', 'Reference', 18495.00, 'AMD Radeon RX 6650 XT'),
    (25, 12, 'GPU-RX-6650XT-DUAL', 'Dual-Fan', 18995.00, 'AMD Radeon RX 6650 XT'),
    (26, 12, 'GPU-RX-6650XT-TRIPLE', 'Triple-Fan', 19695.00, 'AMD Radeon RX 6650 XT'),
    (27, 13, 'GPU-RX-6700XT-REF', 'Reference', 22995.00, 'AMD Radeon RX 6700 XT'),
    (28, 13, 'GPU-RX-6700XT-DUAL', 'Dual-Fan', 23495.00, 'AMD Radeon RX 6700 XT'),
    (29, 13, 'GPU-RX-6700XT-TRIPLE', 'Triple-Fan', 24195.00, 'AMD Radeon RX 6700 XT'),
    (30, 14, 'GPU-RX-7600-REF', 'Reference', 14495.00, 'AMD Radeon RX 7600'),
    (31, 14, 'GPU-RX-7600-DUAL', 'Dual-Fan', 14995.00, 'AMD Radeon RX 7600'),
    (32, 14, 'GPU-RX-7600-TRIPLE', 'Triple-Fan', 15695.00, 'AMD Radeon RX 7600'),
    (33, 15, 'GPU-RX-7700XT-REF', 'Reference', 26995.00, 'AMD Radeon RX 7700 XT'),
    (34, 15, 'GPU-RX-7700XT-DUAL', 'Dual-Fan', 27495.00, 'AMD Radeon RX 7700 XT'),
    (35, 15, 'GPU-RX-7700XT-TRIPLE', 'Triple-Fan', 28195.00, 'AMD Radeon RX 7700 XT'),
    (36, 16, 'GPU-RX-7800XT-REF', 'Reference', 32995.00, 'AMD Radeon RX 7800 XT'),
    (37, 16, 'GPU-RX-7800XT-DUAL', 'Dual-Fan', 33495.00, 'AMD Radeon RX 7800 XT'),
    (38, 16, 'GPU-RX-7800XT-TRIPLE', 'Triple-Fan', 34195.00, 'AMD Radeon RX 7800 XT'),
    (39, 17, 'GPU-RX-7900GRE-REF', 'Reference', 36995.00, 'AMD Radeon RX 7900 GRE'),
    (40, 17, 'GPU-RX-7900GRE-DUAL', 'Dual-Fan', 37495.00, 'AMD Radeon RX 7900 GRE'),
    (41, 17, 'GPU-RX-7900GRE-TRIPLE', 'Triple-Fan', 38195.00, 'AMD Radeon RX 7900 GRE'),
    (42, 18, 'GPU-RX-7900XTX-REF', 'Reference', 49995.00, 'AMD Radeon RX 7900 XTX'),
    (43, 18, 'GPU-RX-7900XTX-DUAL', 'Dual-Fan', 50495.00, 'AMD Radeon RX 7900 XTX'),
    (44, 18, 'GPU-RX-7900XTX-TRIPLE', 'Triple-Fan', 51195.00, 'AMD Radeon RX 7900 XTX'),
    (45, 19, 'GPU-RX-9070-REF', 'Reference', 39995.00, 'AMD Radeon RX 9070'),
    (46, 19, 'GPU-RX-9070-DUAL', 'Dual-Fan', 40495.00, 'AMD Radeon RX 9070'),
    (47, 19, 'GPU-RX-9070-TRIPLE', 'Triple-Fan', 41195.00, 'AMD Radeon RX 9070'),
    (48, 20, 'GPU-RX-9070XT-REF', 'Reference', 45995.00, 'AMD Radeon RX 9070 XT'),
    (49, 20, 'GPU-RX-9070XT-DUAL', 'Dual-Fan', 46495.00, 'AMD Radeon RX 9070 XT'),
    (50, 20, 'GPU-RX-9070XT-TRIPLE', 'Triple-Fan', 47195.00, 'AMD Radeon RX 9070 XT'),
    
    # Motherboards (variants 51-60)
    (51, 21, 'MB-AORUS-X670-ELITE-AX-STD', 'Standard', 18995.00, 'AORUS X670 ELITE AX'),
    (52, 22, 'MB-ASRock-B550-PHANTOM-4AC-STD', 'Standard', 7495.00, 'ASRock B550 Phantom Gaming 4 AC'),
    (53, 23, 'MB-ASRock-B650M-HDV-M2-STD', 'Standard', 8995.00, 'ASRock B650M HDV M.2'),
    (54, 24, 'MB-ASRock-X870-STEEL-STD', 'Standard', 19995.00, 'ASRock X870 Steel Legend WiFi'),
    (55, 25, 'MB-ASUS-ROG-STRIX-B550F-STD', 'Standard', 11995.00, 'ASUS ROG Strix B550-F Gaming'),
    (56, 26, 'MB-ASUS-TUF-B650-PLUS-STD', 'Standard', 13995.00, 'ASUS TUF GAMING B650-PLUS'),
    (57, 27, 'MB-GIGABYTE-B850M-GAMING-STD', 'Standard', 9995.00, 'GIGABYTE B850M GAMING X WiFi 6E'),
    (58, 28, 'MB-MSI-MAG-B850-TOMAHAWK-STD', 'Standard', 15995.00, 'MSI MAG B850 Tomahawk MAX WIFI'),
    (59, 29, 'MB-MSI-MAG-X870E-TOMAHAWK-STD', 'Standard', 21995.00, 'MSI MAG X870E Tomahawk WIFI'),
    (60, 30, 'MB-ROG-STRIX-X670E-GAMING-STD', 'Standard', 27995.00, 'ROG STRIX X670E GAMING WIFI'),
    
    # Cases (variants 61-92)
    (61, 31, 'CASE-TT-TOWER-300-BLK', 'Black', 4995.00, 'Thermaltake Tower 300'),
    (62, 31, 'CASE-TT-TOWER-300-SNW', 'Snow', 4995.00, 'Thermaltake Tower 300'),
    (63, 31, 'CASE-TT-TOWER-300-TRQ', 'Turquoise', 4995.00, 'Thermaltake Tower 300'),
    (64, 31, 'CASE-TT-TOWER-300-GRN', 'Matcha Green', 4995.00, 'Thermaltake Tower 300'),
    (65, 32, 'CASE-PHANTEKS-G400A-BLK', 'Black', 3695.00, 'Phanteks Eclipse G400A'),
    (66, 32, 'CASE-PHANTEKS-G400A-WHT', 'White', 3695.00, 'Phanteks Eclipse G400A'),
    (67, 33, 'CASE-NZXT-H7-FLOW-BLK', 'Matte Black', 5495.00, 'NZXT H7 Flow'),
    (68, 33, 'CASE-NZXT-H7-FLOW-WHT', 'White', 5495.00, 'NZXT H7 Flow'),
    (69, 34, 'CASE-NZXT-H6-FLOW-BLK', 'Black', 4795.00, 'NZXT H6 Flow RGB'),
    (70, 34, 'CASE-NZXT-H6-FLOW-WHT', 'White', 4795.00, 'NZXT H6 Flow RGB'),
    (71, 35, 'CASE-MONTECH-KING-95-BLK', 'Black', 6995.00, 'Montech King 95 Pro'),
    (72, 35, 'CASE-MONTECH-KING-95-WHT', 'White', 6995.00, 'Montech King 95 Pro'),
    (73, 36, 'CASE-LIAN-LI-O11-BLK', 'Black', 8495.00, 'Lian Li O11 Dynamic EVO RGB'),
    (74, 36, 'CASE-LIAN-LI-O11-WHT', 'White', 8495.00, 'Lian Li O11 Dynamic EVO RGB'),
    (75, 37, 'CASE-LIAN-LI-217-BLK', 'Black', 5995.00, 'Lian Li Lancool 217'),
    (76, 37, 'CASE-LIAN-LI-217-WHT', 'White', 5995.00, 'Lian Li Lancool 217'),
    (77, 38, 'CASE-HYTE-Y70-BLK', 'Black', 11995.00, 'HYTE Y70 Touch Infinite'),
    (78, 38, 'CASE-HYTE-Y70-WHT', 'White', 11995.00, 'HYTE Y70 Touch Infinite'),
    (79, 39, 'CASE-HYTE-Y40-BLK', 'Black', 6495.00, 'HYTE Y40 Snow White'),
    (80, 39, 'CASE-HYTE-Y40-WHT', 'White', 6495.00, 'HYTE Y40 Snow White'),
    (81, 40, 'CASE-FRACTAL-NORTH-WHT', 'Snow White', 6995.00, 'Fractal Design North'),
    (82, 41, 'CASE-FRACTAL-MESH-BLK', 'Black', 7995.00, 'Fractal Design Meshify 2'),
    (83, 41, 'CASE-FRACTAL-MESH-WHT', 'White', 7995.00, 'Fractal Design Meshify 2'),
    (84, 41, 'CASE-FRACTAL-MESH-WLN', 'Walnut front', 7995.00, 'Fractal Design Meshify 2'),
    (85, 42, 'CASE-CORSAIR-4000D-BLK', 'Black', 4495.00, 'Corsair 4000D Airflow TG'),
    (86, 42, 'CASE-CORSAIR-4000D-WHT', 'White', 4495.00, 'Corsair 4000D Airflow TG'),
    (87, 43, 'CASE-CM-NR200P-BLK', 'Black', 4295.00, 'Cooler Master NR200P V3'),
    (88, 43, 'CASE-CM-NR200P-WHT', 'White', 4295.00, 'Cooler Master NR200P V3'),
    (89, 44, 'CASE-CM-MB600-BLK', 'Black', 3995.00, 'Cooler Master MasterBox 600'),
    (90, 44, 'CASE-CM-MB600-WHT', 'White', 3995.00, 'Cooler Master MasterBox 600'),
    (91, 45, 'CASE-ANTEC-C5-BLK', 'Black', 2995.00, 'Antec C5 ARGB'),
    (92, 45, 'CASE-ANTEC-C5-WHT', 'White', 2995.00, 'Antec C5 ARGB'),
    
    # CPU Coolers (variants 93-111)
    (93, 46, 'COOL-PA120-SE-BLK', 'Black', 2195.00, 'Thermalright Peerless Assassin 120 SE'),
    (94, 46, 'COOL-PA120-SE-WHT', 'White', 2195.00, 'Thermalright Peerless Assassin 120 SE'),
    (95, 47, 'COOL-NHD15-G2-BLK', 'Black', 6995.00, 'Noctua NH-D15 G2'),
    (96, 47, 'COOL-NHD15-G2-CHRX', 'Chromax.black', 6995.00, 'Noctua NH-D15 G2'),
    (97, 47, 'COOL-NHD15-G2-BGE', 'Classic beige', 6995.00, 'Noctua NH-D15 G2'),
    (98, 48, 'COOL-NHD15-BGE', 'Brown/beige', 5495.00, 'Noctua NH-D15'),
    (99, 48, 'COOL-NHD15-CHRX', 'Chromax.black', 5495.00, 'Noctua NH-D15'),
    (100, 49, 'COOL-MSI-FROZR-BLK', 'Black top cover only', 2995.00, 'MSI MAG Core Frozr L ARGB'),
    (101, 50, 'COOL-LIAN-LI-240', '240 mm', 5795.00, 'Lian Li Galahad II Trinity Performance'),
    (102, 50, 'COOL-LIAN-LI-360', '360 mm', 6595.00, 'Lian Li Galahad II Trinity Performance'),
    (103, 51, 'COOL-ID-214XT-BLK', 'Black', 1495.00, 'ID-COOLING SE-214XT ARGB'),
    (104, 51, 'COOL-ID-214XT-WHT', 'White', 1495.00, 'ID-COOLING SE-214XT ARGB'),
    (105, 52, 'COOL-AK620-DIG-BLK', 'Black', 3495.00, 'DeepCool AK620 Digital'),
    (106, 52, 'COOL-AK620-DIG-WHT', 'White', 3495.00, 'DeepCool AK620 Digital'),
    (107, 53, 'COOL-MF140-1PK', 'Single pack', 1795.00, 'Cooler Master MasterFan MF140 Halo'),
    (108, 53, 'COOL-MF140-2PK', 'Twin pack', 3095.00, 'Cooler Master MasterFan MF140 Halo'),
    (109, 54, 'COOL-DRP4-BLK', 'Black only', 5495.00, 'be quiet! Dark Rock Pro 4'),
    (110, 55, 'COOL-ARCTIC-240', '240 mm', 5495.00, 'Arctic Liquid Freezer III'),
    (111, 55, 'COOL-ARCTIC-360', '360 mm', 6295.00, 'Arctic Liquid Freezer III'),
    
    # DDR4 RAM (variants 112-145)
    (112, 56, 'RAM-SAM-DDR4-8G', '8 GB', 1795.00, 'Samsung SODIMM DDR4'),
    (113, 56, 'RAM-SAM-DDR4-16G', '16 GB', 2595.00, 'Samsung SODIMM DDR4'),
    (114, 57, 'RAM-MUSHKIN-16K', '16 GB kit (2x8)', 1895.00, 'Mushkin Redline SODIMM DDR4'),
    (115, 57, 'RAM-MUSHKIN-32K', '32 GB kit (2x16)', 3495.00, 'Mushkin Redline SODIMM DDR4'),
    (116, 58, 'RAM-LEXAR-8G', '8 GB', 1495.00, 'Lexar Thor DDR4 UDIMM'),
    (117, 58, 'RAM-LEXAR-16G', '16 GB', 2295.00, 'Lexar Thor DDR4 UDIMM'),
    (118, 58, 'RAM-LEXAR-32G', '32 GB', 3095.00, 'Lexar Thor DDR4 UDIMM'),
    (119, 59, 'RAM-KINGSTON-8G', '8 GB', 1595.00, 'Kingston FURY Beast DDR4'),
    (120, 59, 'RAM-KINGSTON-16G', '16 GB', 2295.00, 'Kingston FURY Beast DDR4'),
    (121, 59, 'RAM-KINGSTON-32G', '32 GB', 2995.00, 'Kingston FURY Beast DDR4'),
    (122, 60, 'RAM-GSKILL-4G', '4 GB', 1095.00, 'G.SKILL Ripjaws V DDR4'),
    (123, 60, 'RAM-GSKILL-8G', '8 GB', 1695.00, 'G.SKILL Ripjaws V DDR4'),
    (124, 60, 'RAM-GSKILL-16G', '16 GB', 2295.00, 'G.SKILL Ripjaws V DDR4'),
    (125, 60, 'RAM-GSKILL-32G', '32 GB', 2895.00, 'G.SKILL Ripjaws V DDR4'),
    (126, 61, 'RAM-CRUCIAL-8E', '8 GB Elite', 1795.00, 'Crucial Ballistix DDR4'),
    (127, 61, 'RAM-CRUCIAL-16E', '16 GB Elite', 2495.00, 'Crucial Ballistix DDR4'),
    (128, 61, 'RAM-CRUCIAL-32E', '32 GB Elite', 3195.00, 'Crucial Ballistix DDR4'),
    (129, 61, 'RAM-CRUCIAL-8M', '8 GB MAX', 1995.00, 'Crucial Ballistix DDR4'),
    (130, 61, 'RAM-CRUCIAL-16M', '16 GB MAX', 2695.00, 'Crucial Ballistix DDR4'),
    (131, 62, 'RAM-VIPER-8G', '8 GB', 1649.00, 'Viper Steel DDR4'),
    (132, 62, 'RAM-VIPER-16G', '16 GB', 2249.00, 'Viper Steel DDR4'),
    (133, 62, 'RAM-VIPER-32G', '32 GB', 2849.00, 'Viper Steel DDR4'),
    (134, 63, 'RAM-TEAM-8G', '8 GB', 1549.00, 'Team T-Force Dark Z DDR4'),
    (135, 63, 'RAM-TEAM-16G', '16 GB', 2149.00, 'Team T-Force Dark Z DDR4'),
    (136, 63, 'RAM-TEAM-32G', '32 GB', 2749.00, 'Team T-Force Dark Z DDR4'),
    (137, 64, 'RAM-SPECTRIX-8G', '8 GB', 1749.00, 'Spectrix D41 RGB DDR4'),
    (138, 64, 'RAM-SPECTRIX-16G', '16 GB', 2449.00, 'Spectrix D41 RGB DDR4'),
    (139, 64, 'RAM-SPECTRIX-32G', '32 GB', 3149.00, 'Spectrix D41 RGB DDR4'),
    (140, 65, 'RAM-CORSAIR-4G', '4 GB', 649.00, 'Corsair Vengeance LPX DDR4'),
    (141, 65, 'RAM-CORSAIR-8G', '8 GB', 1649.00, 'Corsair Vengeance LPX DDR4'),
    (142, 65, 'RAM-CORSAIR-16G', '16 GB', 2449.00, 'Corsair Vengeance LPX DDR4'),
    (143, 65, 'RAM-CORSAIR-32G', '32 GB', 3249.00, 'Corsair Vengeance LPX DDR4'),
    (144, 65, 'RAM-CORSAIR-64G', '64 GB', 4849.00, 'Corsair Vengeance LPX DDR4'),
    (145, 65, 'RAM-CORSAIR-128K', '128 GB kit', 8049.00, 'Corsair Vengeance LPX DDR4'),
    
    # DDR5 RAM (variants 146-178)
    (146, 66, 'RAM-TEAM-16K', '16 GB kit', 3995.00, 'Team T-Force Delta RGB DDR5'),
    (147, 66, 'RAM-TEAM-32K', '32 GB kit', 5595.00, 'Team T-Force Delta RGB DDR5'),
    (148, 66, 'RAM-TEAM-64K', '64 GB kit', 7195.00, 'Team T-Force Delta RGB DDR5'),
    (149, 67, 'RAM-PATRIOT-16K', '16 GB kit', 4195.00, 'Patriot Viper Venom DDR5'),
    (150, 67, 'RAM-PATRIOT-32K', '32 GB kit', 5895.00, 'Patriot Viper Venom DDR5'),
    (151, 67, 'RAM-PATRIOT-64K', '64 GB kit', 7595.00, 'Patriot Viper Venom DDR5'),
    (152, 68, 'RAM-LEXAR-16K', '16 GB kit', 3795.00, 'Lexar Ares RGB DDR5'),
    (153, 68, 'RAM-LEXAR-32K', '32 GB kit', 5295.00, 'Lexar Ares RGB DDR5'),
    (154, 69, 'RAM-KINGSTON-8G', '8 GB', 3495.00, 'Kingston FURY Beast DDR5 RGB'),
    (155, 69, 'RAM-KINGSTON-16K', '16 GB kit', 3895.00, 'Kingston FURY Beast DDR5 RGB'),
    (156, 69, 'RAM-KINGSTON-32K', '32 GB kit', 5395.00, 'Kingston FURY Beast DDR5 RGB'),
    (157, 69, 'RAM-KINGSTON-64K', '64 GB kit', 6895.00, 'Kingston FURY Beast DDR5 RGB'),
    (158, 70, 'RAM-GSKILL-16K', '16 GB kit', 4495.00, 'G.Skill Trident Z5 RGB DDR5'),
    (159, 70, 'RAM-GSKILL-32K', '32 GB kit', 6095.00, 'G.Skill Trident Z5 RGB DDR5'),
    (160, 70, 'RAM-GSKILL-64K', '64 GB kit', 7695.00, 'G.Skill Trident Z5 RGB DDR5'),
    (161, 70, 'RAM-GSKILL-96K', '96 GB kit', 9295.00, 'G.Skill Trident Z5 RGB DDR5'),
    (162, 71, 'RAM-CRUCIAL-8G', '8 GB', 3095.00, 'Crucial DDR5 Pro UDIMM'),
    (163, 71, 'RAM-CRUCIAL-16K', '16 GB kit', 3495.00, 'Crucial DDR5 Pro UDIMM'),
    (164, 71, 'RAM-CRUCIAL-32K', '32 GB kit', 4695.00, 'Crucial DDR5 Pro UDIMM'),
    (165, 71, 'RAM-CRUCIAL-64K', '64 GB kit', 5895.00, 'Crucial DDR5 Pro UDIMM'),
    (166, 72, 'RAM-CORSAIR-16K', '16 GB kit', 3695.00, 'Corsair Vengeance DDR5'),
    (167, 72, 'RAM-CORSAIR-32K', '32 GB kit', 4995.00, 'Corsair Vengeance DDR5'),
    (168, 72, 'RAM-CORSAIR-64K', '64 GB kit', 6295.00, 'Corsair Vengeance DDR5'),
    (169, 72, 'RAM-CORSAIR-96K', '96 GB kit', 7595.00, 'Corsair Vengeance DDR5'),
    (170, 73, 'RAM-CORSAIR-DOM-16K', '16 GB kit', 5995.00, 'Corsair Dominator Platinum RGB DDR5'),
    (171, 73, 'RAM-CORSAIR-DOM-32K', '32 GB kit', 8295.00, 'Corsair Dominator Platinum RGB DDR5'),
    (172, 73, 'RAM-CORSAIR-DOM-64K', '64 GB kit', 10595.00, 'Corsair Dominator Platinum RGB DDR5'),
    (173, 73, 'RAM-CORSAIR-DOM-128K', '128 GB kit', 15195.00, 'Corsair Dominator Platinum RGB DDR5'),
    (174, 74, 'RAM-XPG-16K', '16 GB kit', 3995.00, 'XPG Lancer Blade RGB DDR5'),
    (175, 74, 'RAM-XPG-32K', '32 GB kit', 5595.00, 'XPG Lancer Blade RGB DDR5'),
    (176, 75, 'RAM-ADATA-16K', '16 GB kit', 3849.00, 'ADATA XPG Lancer RGB DDR5'),
    (177, 75, 'RAM-ADATA-32K', '32 GB kit', 5399.00, 'ADATA XPG Lancer RGB DDR5'),
    (178, 75, 'RAM-ADATA-64K', '64 GB kit', 6949.00, 'ADATA XPG Lancer RGB DDR5'),
    
    # HDDs (variants 179-188)
    (179, 76, 'HDD-WD-RED-STD', 'Standard', 29995.00, 'WD Red Pro 20TB'),
    (180, 77, 'HDD-WD-GOLD-STD', 'Standard', 34995.00, 'WD Gold 22TB'),
    (181, 78, 'HDD-WD-BLUE-STD', 'Standard', 9995.00, 'WD Blue 8TB'),
    (182, 79, 'HDD-TOSHIBA-X300-STD', 'Standard', 32995.00, 'Toshiba X300 Pro 22TB'),
    (183, 80, 'HDD-TOSHIBA-MG-STD', 'Standard', 14995.00, 'Toshiba MG 10TB'),
    (184, 81, 'HDD-SEAGATE-IRON-STD', 'Standard', 31995.00, 'Seagate IronWolf Pro 20TB'),
    (185, 82, 'HDD-SEAGATE-FIRE-STD', 'Standard', 12995.00, 'Seagate FireCuda 8TB'),
    (186, 83, 'HDD-SEAGATE-EXOS-STD', 'Standard', 27995.00, 'Seagate Exos X16 16TB'),
    (187, 84, 'HDD-SEAGATE-BARRA-STD', 'Standard', 19995.00, 'Seagate BarraCuda Pro 12TB'),
    (188, 85, 'HDD-WD-BLACK-STD', 'Standard', 15995.00, 'WD Black 8TB'),
    
    # PSUs (variants 189-198)
    (189, 86, 'PSU-CORSAIR-RM850X-BLK', 'Standard', 7995.00, 'Corsair RM850x'),
    (190, 87, 'PSU-EVGA-SN1000-P5', 'Standard', 9995.00, 'EVGA SuperNOVA 1000 P5'),
    (191, 88, 'PSU-TT-GF3-750', 'Standard', 6495.00, 'Thermaltake Toughpower GF3 750W'),
    (192, 89, 'PSU-CM-MWE-750', 'Standard', 5995.00, 'Cooler Master MWE Gold V3 750W'),
    (193, 90, 'PSU-GB-UD750', 'Standard', 5495.00, 'Gigabyte UD750GM'),
    (194, 91, 'PSU-MSI-A850G', 'Standard', 8495.00, 'MSI MPG A850G'),
    (195, 92, 'PSU-NZXT-C1000', 'Standard', 9495.00, 'NZXT C1000'),
    (196, 93, 'PSU-CORSAIR-SF750', 'Standard', 8995.00, 'Corsair SF750'),
    (197, 94, 'PSU-SF-LEADEX-850', 'Standard', 7495.00, 'Super Flower Leadex III Gold'),
    (198, 95, 'PSU-ASUS-ROG-1000', 'Standard', 12995.00, 'ASUS ROG THOR 1000W'),
]

# 7 Order statuses with realistic distribution
STATUSES = [
    ('pending', 10),      # 10% - new orders
    ('processing', 12),   # 12% - being packed
    ('paid', 10),         # 10% - payment received
    ('shipped', 15),      # 15% - in transit
    ('completed', 35),    # 35% - delivered (majority)
    ('cancelled', 10),    # 10% - customer cancelled
    ('refunded', 8),      # 8% - returned/refunded
]

# Year distribution
YEARS = [
    (2024, 35),  # 35% of orders
    (2025, 40),  # 40% of orders
    (2026, 25),  # 25% of orders
]

def random_date(year):
    """Generate random date within a year"""
    if year == 2026:
        # Current year - only up to January 11
        start = datetime(2026, 1, 1)
        end = datetime(2026, 1, 11)
    else:
        start = datetime(year, 1, 1)
        end = datetime(year, 12, 31)
    
    delta = end - start
    random_days = random.randint(0, delta.days)
    random_hours = random.randint(8, 22)  # Business hours
    random_minutes = random.randint(0, 59)
    random_seconds = random.randint(0, 59)
    return start + timedelta(days=random_days, hours=random_hours, minutes=random_minutes, seconds=random_seconds)

def weighted_choice(choices):
    """Pick from weighted choices"""
    total = sum(weight for _, weight in choices)
    r = random.uniform(0, total)
    cumulative = 0
    for choice, weight in choices:
        cumulative += weight
        if r <= cumulative:
            return choice
    return choices[-1][0]

def generate_order_number(order_id, date):
    """Generate unique order number like ORD-2024-000001"""
    return f"ORD-{date.year}-{order_id:06d}"

def escape_sql(s):
    """Escape single quotes in SQL strings"""
    return s.replace("'", "''")

def generate_orders(num_orders=500):
    """Generate realistic orders and order items"""
    orders = []
    order_items = []
    order_item_id = 1
    
    # User IDs 1-4 are admin accounts, start from 5 for customers
    customer_ids = list(range(5, 25))  # 20 customer IDs
    
    for order_id in range(1, num_orders + 1):
        year = weighted_choice(YEARS)
        order_date = random_date(year)
        status = weighted_choice(STATUSES)
        user_id = random.choice(customer_ids)
        order_number = generate_order_number(order_id, order_date)
        
        # Each order has 1-4 items
        num_items = random.choices([1, 2, 3, 4], weights=[40, 35, 20, 5])[0]
        subtotal = 0
        
        # Select random products for this order
        selected_variants = random.sample(PRODUCT_VARIANTS, min(num_items, len(PRODUCT_VARIANTS)))
        
        for variant in selected_variants:
            variant_id, product_id, sku, variant_title, price, product_name = variant
            quantity = random.choices([1, 2, 3], weights=[70, 25, 5])[0]
            line_total = price * quantity
            subtotal += line_total
            
            order_items.append({
                'id': order_item_id,
                'order_id': order_id,
                'variant_id': variant_id,
                'product_name': product_name,
                'variant_title': variant_title,
                'unit_price': price,
                'quantity': quantity,
                'line_total': line_total
            })
            order_item_id += 1
        
        # Calculate shipping and tax
        shipping = 150.00 if subtotal < 5000 else 0.00  # Free shipping over 5000
        tax = round(subtotal * 0.12, 2)  # 12% VAT
        total = subtotal + shipping + tax
        
        orders.append({
            'id': order_id,
            'order_number': order_number,
            'user_id': user_id,
            'status': status,
            'subtotal': subtotal,
            'shipping': shipping,
            'tax': tax,
            'total': total,
            'placed_at': order_date.strftime('%Y-%m-%d %H:%M:%S'),
            'updated_at': order_date.strftime('%Y-%m-%d %H:%M:%S')
        })
    
    return orders, order_items

def generate_sql():
    """Generate SQL INSERT statements"""
    orders, order_items = generate_orders(500)
    
    lines = []
    lines.append("-- =====================================================")
    lines.append("-- MyPC Database - Sales Test Data")
    lines.append("-- =====================================================")
    lines.append("-- Generated from actual products in products_inserts.sql")
    lines.append("-- Contains 500 orders with all 7 statuses across 2024-2026")
    lines.append("-- Matches mypc_complete.sql schema (placed_at, order_number, etc.)")
    lines.append("-- =====================================================")
    lines.append("")
    lines.append("USE mypc_db;")
    lines.append("")
    lines.append("-- Clear existing order data")
    lines.append("SET FOREIGN_KEY_CHECKS = 0;")
    lines.append("TRUNCATE TABLE order_items;")
    lines.append("TRUNCATE TABLE orders;")
    lines.append("SET FOREIGN_KEY_CHECKS = 1;")
    lines.append("")
    lines.append("-- =====================================================")
    lines.append("-- ORDERS TABLE")
    lines.append("-- =====================================================")
    lines.append("")
    
    # Generate orders INSERT
    for order in orders:
        lines.append(
            f"INSERT INTO orders (id, order_number, user_id, status, subtotal, shipping, tax, total, placed_at, updated_at) VALUES "
            f"({order['id']}, '{order['order_number']}', {order['user_id']}, '{order['status']}', "
            f"{order['subtotal']:.2f}, {order['shipping']:.2f}, {order['tax']:.2f}, {order['total']:.2f}, "
            f"'{order['placed_at']}', '{order['updated_at']}');"
        )
    
    lines.append("")
    lines.append("-- =====================================================")
    lines.append("-- ORDER_ITEMS TABLE")
    lines.append("-- =====================================================")
    lines.append("")
    
    # Generate order_items INSERT
    for item in order_items:
        product_name = escape_sql(item['product_name'])
        variant_title = escape_sql(item['variant_title'])
        lines.append(
            f"INSERT INTO order_items (id, order_id, variant_id, product_name, variant_title, unit_price, quantity, line_total) VALUES "
            f"({item['id']}, {item['order_id']}, {item['variant_id']}, '{product_name}', '{variant_title}', "
            f"{item['unit_price']:.2f}, {item['quantity']}, {item['line_total']:.2f});"
        )
    
    lines.append("")
    lines.append("-- =====================================================")
    lines.append("-- SUMMARY")
    lines.append("-- =====================================================")
    
    # Calculate stats
    status_counts = {}
    year_counts = {}
    total_revenue = 0
    for order in orders:
        status_counts[order['status']] = status_counts.get(order['status'], 0) + 1
        year = order['placed_at'][:4]
        year_counts[year] = year_counts.get(year, 0) + 1
        if order['status'] in ['completed', 'shipped', 'paid']:
            total_revenue += order['total']
    
    lines.append(f"-- Total Orders: {len(orders)}")
    lines.append(f"-- Total Order Items: {len(order_items)}")
    lines.append(f"-- Total Revenue (completed/shipped/paid): PHP {total_revenue:,.2f}")
    lines.append("-- ")
    lines.append("-- Status Distribution:")
    for status, count in sorted(status_counts.items()):
        pct = (count / len(orders)) * 100
        lines.append(f"--   {status}: {count} ({pct:.1f}%)")
    lines.append("-- ")
    lines.append("-- Year Distribution:")
    for year, count in sorted(year_counts.items()):
        pct = (count / len(orders)) * 100
        lines.append(f"--   {year}: {count} ({pct:.1f}%)")
    lines.append("")
    lines.append("SELECT 'Sales data loaded successfully!' as message;")
    
    return '\n'.join(lines)

if __name__ == '__main__':
    sql = generate_sql()
    with open('sales_insert.sql', 'w', encoding='utf-8') as f:
        f.write(sql)
    print("Generated sales_insert.sql successfully!")
    print(f"File size: {len(sql) / 1024:.1f} KB")
