"""
Generate accurate sales data using real products from products_inserts.sql
Produces INSERT statements for orders and order_items tables
"""
import random
from datetime import datetime, timedelta

random.seed(42)

# Real product variants from products_inserts.sql with actual prices
# Format: (variant_id, product_id, variant_sku, title, price)
PRODUCT_VARIANTS = [
    # AMD CPUs (variants 1-20)
    (1, 1, 'CPU-AMD-R5-7600-BOX', 'AMD Ryzen 5 7600 Boxed', 14995.00),
    (2, 1, 'CPU-AMD-R5-7600-OEM', 'AMD Ryzen 5 7600 OEM', 13795.00),
    (3, 2, 'CPU-AMD-R5-7600X-BOX', 'AMD Ryzen 5 7600X Boxed', 16495.00),
    (4, 2, 'CPU-AMD-R5-7600X-OEM', 'AMD Ryzen 5 7600X OEM', 15295.00),
    (5, 3, 'CPU-AMD-R5-9600X-BOX', 'AMD Ryzen 5 9600X Boxed', 18995.00),
    (6, 3, 'CPU-AMD-R5-9600X-OEM', 'AMD Ryzen 5 9600X OEM', 17795.00),
    (7, 4, 'CPU-AMD-R7-7700-BOX', 'AMD Ryzen 7 7700 Boxed', 19495.00),
    (8, 4, 'CPU-AMD-R7-7700-OEM', 'AMD Ryzen 7 7700 OEM', 18295.00),
    (9, 5, 'CPU-AMD-R7-7800X3D-BOX', 'AMD Ryzen 7 7800X3D Boxed', 27995.00),
    (10, 5, 'CPU-AMD-R7-7800X3D-OEM', 'AMD Ryzen 7 7800X3D OEM', 26795.00),
    (11, 6, 'CPU-AMD-R7-9800X3D-BOX', 'AMD Ryzen 7 9800X3D Boxed', 32995.00),
    (12, 6, 'CPU-AMD-R7-9800X3D-OEM', 'AMD Ryzen 7 9800X3D OEM', 31795.00),
    (13, 7, 'CPU-AMD-R9-7900X3D-BOX', 'AMD Ryzen 9 7900X3D Boxed', 37995.00),
    (14, 7, 'CPU-AMD-R9-7900X3D-OEM', 'AMD Ryzen 9 7900X3D OEM', 36795.00),
    (15, 8, 'CPU-AMD-R9-7950X3D-BOX', 'AMD Ryzen 9 7950X3D Boxed', 42995.00),
    (16, 8, 'CPU-AMD-R9-7950X3D-OEM', 'AMD Ryzen 9 7950X3D OEM', 41795.00),
    (17, 9, 'CPU-AMD-R9-9950X3D-BOX', 'AMD Ryzen 9 9950X3D Boxed', 49995.00),
    (18, 9, 'CPU-AMD-R9-9950X3D-OEM', 'AMD Ryzen 9 9950X3D OEM', 48795.00),
    (19, 10, 'CPU-AMD-R9-9950X-BOX', 'AMD Ryzen 9 9950X Boxed', 45995.00),
    (20, 10, 'CPU-AMD-R9-9950X-OEM', 'AMD Ryzen 9 9950X OEM', 44795.00),
    
    # AMD GPUs (variants 21-50)
    (21, 11, 'GPU-RX-6600XT-REF', 'RX 6600 XT Reference', 16995.00),
    (22, 11, 'GPU-RX-6600XT-DUAL', 'RX 6600 XT Dual-Fan', 17495.00),
    (23, 11, 'GPU-RX-6600XT-TRIPLE', 'RX 6600 XT Triple-Fan', 18195.00),
    (24, 12, 'GPU-RX-6650XT-REF', 'RX 6650 XT Reference', 18495.00),
    (25, 12, 'GPU-RX-6650XT-DUAL', 'RX 6650 XT Dual-Fan', 18995.00),
    (26, 12, 'GPU-RX-6650XT-TRIPLE', 'RX 6650 XT Triple-Fan', 19695.00),
    (27, 13, 'GPU-RX-6700XT-REF', 'RX 6700 XT Reference', 22995.00),
    (28, 13, 'GPU-RX-6700XT-DUAL', 'RX 6700 XT Dual-Fan', 23495.00),
    (29, 13, 'GPU-RX-6700XT-TRIPLE', 'RX 6700 XT Triple-Fan', 24195.00),
    (30, 14, 'GPU-RX-7600-REF', 'RX 7600 Reference', 14495.00),
    (31, 14, 'GPU-RX-7600-DUAL', 'RX 7600 Dual-Fan', 14995.00),
    (32, 14, 'GPU-RX-7600-TRIPLE', 'RX 7600 Triple-Fan', 15695.00),
    (33, 15, 'GPU-RX-7700XT-REF', 'RX 7700 XT Reference', 26995.00),
    (34, 15, 'GPU-RX-7700XT-DUAL', 'RX 7700 XT Dual-Fan', 27495.00),
    (35, 15, 'GPU-RX-7700XT-TRIPLE', 'RX 7700 XT Triple-Fan', 28195.00),
    (36, 16, 'GPU-RX-7800XT-REF', 'RX 7800 XT Reference', 32995.00),
    (37, 16, 'GPU-RX-7800XT-DUAL', 'RX 7800 XT Dual-Fan', 33495.00),
    (38, 16, 'GPU-RX-7800XT-TRIPLE', 'RX 7800 XT Triple-Fan', 34195.00),
    (39, 17, 'GPU-RX-7900GRE-REF', 'RX 7900 GRE Reference', 36995.00),
    (40, 17, 'GPU-RX-7900GRE-DUAL', 'RX 7900 GRE Dual-Fan', 37495.00),
    (41, 17, 'GPU-RX-7900GRE-TRIPLE', 'RX 7900 GRE Triple-Fan', 38195.00),
    (42, 18, 'GPU-RX-7900XTX-REF', 'RX 7900 XTX Reference', 49995.00),
    (43, 18, 'GPU-RX-7900XTX-DUAL', 'RX 7900 XTX Dual-Fan', 50495.00),
    (44, 18, 'GPU-RX-7900XTX-TRIPLE', 'RX 7900 XTX Triple-Fan', 51195.00),
    (45, 19, 'GPU-RX-9070-REF', 'RX 9070 Reference', 39995.00),
    (46, 19, 'GPU-RX-9070-DUAL', 'RX 9070 Dual-Fan', 40495.00),
    (47, 19, 'GPU-RX-9070-TRIPLE', 'RX 9070 Triple-Fan', 41195.00),
    (48, 20, 'GPU-RX-9070XT-REF', 'RX 9070 XT Reference', 45995.00),
    (49, 20, 'GPU-RX-9070XT-DUAL', 'RX 9070 XT Dual-Fan', 46495.00),
    (50, 20, 'GPU-RX-9070XT-TRIPLE', 'RX 9070 XT Triple-Fan', 47195.00),
    
    # Motherboards (variants 51-60)
    (51, 21, 'MB-AORUS-X670-ELITE-AX-STD', 'AORUS X670 ELITE AX', 18995.00),
    (52, 22, 'MB-ASRock-B550-PHANTOM-4AC-STD', 'ASRock B550 Phantom Gaming', 7495.00),
    (53, 23, 'MB-ASRock-B650M-HDV-M2-STD', 'ASRock B650M HDV M.2', 8995.00),
    (54, 24, 'MB-ASRock-X870-STEEL-STD', 'ASRock X870 Steel Legend', 19995.00),
    (55, 25, 'MB-ASUS-ROG-STRIX-B550F-STD', 'ASUS ROG Strix B550-F', 11995.00),
    (56, 26, 'MB-ASUS-TUF-B650-PLUS-STD', 'ASUS TUF B650-PLUS', 13995.00),
    (57, 27, 'MB-GIGABYTE-B850M-GAMING-STD', 'Gigabyte B850M Gaming X', 9995.00),
    (58, 28, 'MB-MSI-MAG-B850-TOMAHAWK-STD', 'MSI MAG B850 Tomahawk', 15995.00),
    (59, 29, 'MB-MSI-MAG-X870E-TOMAHAWK-STD', 'MSI MAG X870E Tomahawk', 21995.00),
    (60, 30, 'MB-ROG-STRIX-X670E-GAMING-STD', 'ROG STRIX X670E Gaming', 27995.00),
    
    # Cases (variants 61-92)
    (61, 31, 'CASE-TT-TOWER-300-BLK', 'Thermaltake Tower 300 Black', 4995.00),
    (62, 31, 'CASE-TT-TOWER-300-SNW', 'Thermaltake Tower 300 Snow', 4995.00),
    (63, 31, 'CASE-TT-TOWER-300-TRQ', 'Thermaltake Tower 300 Turquoise', 4995.00),
    (64, 31, 'CASE-TT-TOWER-300-GRN', 'Thermaltake Tower 300 Matcha', 4995.00),
    (65, 32, 'CASE-PHANTEKS-G400A-BLK', 'Phanteks G400A Black', 3695.00),
    (66, 32, 'CASE-PHANTEKS-G400A-WHT', 'Phanteks G400A White', 3695.00),
    (67, 33, 'CASE-NZXT-H7-FLOW-BLK', 'NZXT H7 Flow Black', 5495.00),
    (68, 33, 'CASE-NZXT-H7-FLOW-WHT', 'NZXT H7 Flow White', 5495.00),
    (69, 34, 'CASE-NZXT-H6-FLOW-BLK', 'NZXT H6 Flow Black', 4795.00),
    (70, 34, 'CASE-NZXT-H6-FLOW-WHT', 'NZXT H6 Flow White', 4795.00),
    (71, 35, 'CASE-MONTECH-KING-95-BLK', 'Montech King 95 Black', 6995.00),
    (72, 35, 'CASE-MONTECH-KING-95-WHT', 'Montech King 95 White', 6995.00),
    (73, 36, 'CASE-LIAN-LI-O11-BLK', 'Lian Li O11 EVO Black', 8495.00),
    (74, 36, 'CASE-LIAN-LI-O11-WHT', 'Lian Li O11 EVO White', 8495.00),
    (75, 37, 'CASE-LIAN-LI-217-BLK', 'Lian Li Lancool 217 Black', 5995.00),
    (76, 37, 'CASE-LIAN-LI-217-WHT', 'Lian Li Lancool 217 White', 5995.00),
    (77, 38, 'CASE-HYTE-Y70-BLK', 'HYTE Y70 Touch Black', 11995.00),
    (78, 38, 'CASE-HYTE-Y70-WHT', 'HYTE Y70 Touch White', 11995.00),
    (79, 39, 'CASE-HYTE-Y40-BLK', 'HYTE Y40 Black', 6495.00),
    (80, 39, 'CASE-HYTE-Y40-WHT', 'HYTE Y40 White', 6495.00),
    (81, 40, 'CASE-FRACTAL-NORTH-WHT', 'Fractal North Snow White', 6995.00),
    (82, 41, 'CASE-FRACTAL-MESH-BLK', 'Fractal Meshify 2 Black', 7995.00),
    (83, 41, 'CASE-FRACTAL-MESH-WHT', 'Fractal Meshify 2 White', 7995.00),
    (84, 41, 'CASE-FRACTAL-MESH-WLN', 'Fractal Meshify 2 Walnut', 7995.00),
    (85, 42, 'CASE-CORSAIR-4000D-BLK', 'Corsair 4000D Black', 4495.00),
    (86, 42, 'CASE-CORSAIR-4000D-WHT', 'Corsair 4000D White', 4495.00),
    (87, 43, 'CASE-CM-NR200P-BLK', 'CM NR200P V3 Black', 4295.00),
    (88, 43, 'CASE-CM-NR200P-WHT', 'CM NR200P V3 White', 4295.00),
    (89, 44, 'CASE-CM-MB600-BLK', 'CM MasterBox 600 Black', 3995.00),
    (90, 44, 'CASE-CM-MB600-WHT', 'CM MasterBox 600 White', 3995.00),
    (91, 45, 'CASE-ANTEC-C5-BLK', 'Antec C5 ARGB Black', 2995.00),
    (92, 45, 'CASE-ANTEC-C5-WHT', 'Antec C5 ARGB White', 2995.00),
    
    # CPU Coolers (variants 93-111)
    (93, 46, 'COOL-PA120-SE-BLK', 'Thermalright PA120 SE Black', 2195.00),
    (94, 46, 'COOL-PA120-SE-WHT', 'Thermalright PA120 SE White', 2195.00),
    (95, 47, 'COOL-NHD15-G2-BLK', 'Noctua NH-D15 G2 Black', 6995.00),
    (96, 47, 'COOL-NHD15-G2-CHRX', 'Noctua NH-D15 G2 Chromax', 6995.00),
    (97, 47, 'COOL-NHD15-G2-BGE', 'Noctua NH-D15 G2 Beige', 6995.00),
    (98, 48, 'COOL-NHD15-BGE', 'Noctua NH-D15 Brown', 5495.00),
    (99, 48, 'COOL-NHD15-CHRX', 'Noctua NH-D15 Chromax', 5495.00),
    (100, 49, 'COOL-MSI-FROZR-BLK', 'MSI Core Frozr L', 2995.00),
    (101, 50, 'COOL-LIAN-LI-240', 'Galahad II 240mm', 5795.00),
    (102, 50, 'COOL-LIAN-LI-360', 'Galahad II 360mm', 6595.00),
    (103, 51, 'COOL-ID-214XT-BLK', 'ID-COOLING SE-214XT Black', 1495.00),
    (104, 51, 'COOL-ID-214XT-WHT', 'ID-COOLING SE-214XT White', 1495.00),
    (105, 52, 'COOL-AK620-DIG-BLK', 'DeepCool AK620 Digital Black', 3495.00),
    (106, 52, 'COOL-AK620-DIG-WHT', 'DeepCool AK620 Digital White', 3495.00),
    (107, 53, 'COOL-MF140-1PK', 'MasterFan MF140 Single', 1795.00),
    (108, 53, 'COOL-MF140-2PK', 'MasterFan MF140 Twin Pack', 3095.00),
    (109, 54, 'COOL-DRP4-BLK', 'Dark Rock Pro 4', 5495.00),
    (110, 55, 'COOL-ARCTIC-240', 'Arctic Liquid Freezer 240mm', 5495.00),
    (111, 55, 'COOL-ARCTIC-360', 'Arctic Liquid Freezer 360mm', 6295.00),
    
    # DDR4 RAM (variants 112-145)
    (112, 56, 'RAM-SAM-DDR4-8G', 'Samsung DDR4 8GB', 1795.00),
    (113, 56, 'RAM-SAM-DDR4-16G', 'Samsung DDR4 16GB', 2595.00),
    (114, 57, 'RAM-MUSHKIN-16K', 'Mushkin Redline 16GB Kit', 1895.00),
    (115, 57, 'RAM-MUSHKIN-32K', 'Mushkin Redline 32GB Kit', 3495.00),
    (116, 58, 'RAM-LEXAR-8G', 'Lexar Thor DDR4 8GB', 1495.00),
    (117, 58, 'RAM-LEXAR-16G', 'Lexar Thor DDR4 16GB', 2295.00),
    (118, 58, 'RAM-LEXAR-32G', 'Lexar Thor DDR4 32GB', 3095.00),
    (119, 59, 'RAM-KINGSTON-8G', 'Kingston Fury Beast 8GB', 1595.00),
    (120, 59, 'RAM-KINGSTON-16G', 'Kingston Fury Beast 16GB', 2295.00),
    (121, 59, 'RAM-KINGSTON-32G', 'Kingston Fury Beast 32GB', 2995.00),
    (122, 60, 'RAM-GSKILL-4G', 'G.Skill Ripjaws V 4GB', 1095.00),
    (123, 60, 'RAM-GSKILL-8G', 'G.Skill Ripjaws V 8GB', 1695.00),
    (124, 60, 'RAM-GSKILL-16G', 'G.Skill Ripjaws V 16GB', 2295.00),
    (125, 60, 'RAM-GSKILL-32G', 'G.Skill Ripjaws V 32GB', 2895.00),
    (126, 61, 'RAM-CRUCIAL-8E', 'Crucial Ballistix 8GB Elite', 1795.00),
    (127, 61, 'RAM-CRUCIAL-16E', 'Crucial Ballistix 16GB Elite', 2495.00),
    (128, 61, 'RAM-CRUCIAL-32E', 'Crucial Ballistix 32GB Elite', 3195.00),
    (129, 61, 'RAM-CRUCIAL-8M', 'Crucial Ballistix 8GB MAX', 1995.00),
    (130, 61, 'RAM-CRUCIAL-16M', 'Crucial Ballistix 16GB MAX', 2695.00),
    (131, 62, 'RAM-VIPER-8G', 'Viper Steel 8GB', 1649.00),
    (132, 62, 'RAM-VIPER-16G', 'Viper Steel 16GB', 2249.00),
    (133, 62, 'RAM-VIPER-32G', 'Viper Steel 32GB', 2849.00),
    (134, 63, 'RAM-TEAM-8G', 'Team Dark Z 8GB', 1549.00),
    (135, 63, 'RAM-TEAM-16G', 'Team Dark Z 16GB', 2149.00),
    (136, 63, 'RAM-TEAM-32G', 'Team Dark Z 32GB', 2749.00),
    (137, 64, 'RAM-SPECTRIX-8G', 'Spectrix D41 8GB', 1749.00),
    (138, 64, 'RAM-SPECTRIX-16G', 'Spectrix D41 16GB', 2449.00),
    (139, 64, 'RAM-SPECTRIX-32G', 'Spectrix D41 32GB', 3149.00),
    (140, 65, 'RAM-CORSAIR-4G', 'Corsair Vengeance 4GB', 649.00),
    (141, 65, 'RAM-CORSAIR-8G', 'Corsair Vengeance 8GB', 1649.00),
    (142, 65, 'RAM-CORSAIR-16G', 'Corsair Vengeance 16GB', 2449.00),
    (143, 65, 'RAM-CORSAIR-32G', 'Corsair Vengeance 32GB', 3249.00),
    (144, 65, 'RAM-CORSAIR-64G', 'Corsair Vengeance 64GB', 4849.00),
    (145, 65, 'RAM-CORSAIR-128K', 'Corsair Vengeance 128GB Kit', 8049.00),
    
    # DDR5 RAM (variants 146-178)
    (146, 66, 'RAM-TEAM-16K', 'Team Delta RGB DDR5 16GB', 3995.00),
    (147, 66, 'RAM-TEAM-32K', 'Team Delta RGB DDR5 32GB', 5595.00),
    (148, 66, 'RAM-TEAM-64K', 'Team Delta RGB DDR5 64GB', 7195.00),
    (149, 67, 'RAM-PATRIOT-16K', 'Patriot Viper Venom 16GB', 4195.00),
    (150, 67, 'RAM-PATRIOT-32K', 'Patriot Viper Venom 32GB', 5895.00),
    (151, 67, 'RAM-PATRIOT-64K', 'Patriot Viper Venom 64GB', 7595.00),
    (152, 68, 'RAM-LEXAR-16K', 'Lexar Ares RGB DDR5 16GB', 3795.00),
    (153, 68, 'RAM-LEXAR-32K', 'Lexar Ares RGB DDR5 32GB', 5295.00),
    (154, 69, 'RAM-KINGSTON-8G', 'Kingston Fury Beast DDR5 8GB', 3495.00),
    (155, 69, 'RAM-KINGSTON-16K', 'Kingston Fury Beast DDR5 16GB', 3895.00),
    (156, 69, 'RAM-KINGSTON-32K', 'Kingston Fury Beast DDR5 32GB', 5395.00),
    (157, 69, 'RAM-KINGSTON-64K', 'Kingston Fury Beast DDR5 64GB', 6895.00),
    (158, 70, 'RAM-GSKILL-16K', 'G.Skill Trident Z5 DDR5 16GB', 4495.00),
    (159, 70, 'RAM-GSKILL-32K', 'G.Skill Trident Z5 DDR5 32GB', 6095.00),
    (160, 70, 'RAM-GSKILL-64K', 'G.Skill Trident Z5 DDR5 64GB', 7695.00),
    (161, 70, 'RAM-GSKILL-96K', 'G.Skill Trident Z5 DDR5 96GB', 9295.00),
    (162, 71, 'RAM-CRUCIAL-8G', 'Crucial DDR5 Pro 8GB', 3095.00),
    (163, 71, 'RAM-CRUCIAL-16K', 'Crucial DDR5 Pro 16GB', 3495.00),
    (164, 71, 'RAM-CRUCIAL-32K', 'Crucial DDR5 Pro 32GB', 4695.00),
    (165, 71, 'RAM-CRUCIAL-64K', 'Crucial DDR5 Pro 64GB', 5895.00),
    (166, 72, 'RAM-CORSAIR-16K', 'Corsair Vengeance DDR5 16GB', 3695.00),
    (167, 72, 'RAM-CORSAIR-32K', 'Corsair Vengeance DDR5 32GB', 4995.00),
    (168, 72, 'RAM-CORSAIR-64K', 'Corsair Vengeance DDR5 64GB', 6295.00),
    (169, 72, 'RAM-CORSAIR-96K', 'Corsair Vengeance DDR5 96GB', 7595.00),
    (170, 73, 'RAM-CORSAIR-DOM-16K', 'Corsair Dominator DDR5 16GB', 5995.00),
    (171, 73, 'RAM-CORSAIR-DOM-32K', 'Corsair Dominator DDR5 32GB', 8295.00),
    (172, 73, 'RAM-CORSAIR-DOM-64K', 'Corsair Dominator DDR5 64GB', 10595.00),
    (173, 73, 'RAM-CORSAIR-DOM-128K', 'Corsair Dominator DDR5 128GB', 15195.00),
    (174, 74, 'RAM-XPG-16K', 'XPG Lancer Blade DDR5 16GB', 3995.00),
    (175, 74, 'RAM-XPG-32K', 'XPG Lancer Blade DDR5 32GB', 5595.00),
    (176, 75, 'RAM-ADATA-16K', 'ADATA XPG Lancer DDR5 16GB', 3849.00),
    (177, 75, 'RAM-ADATA-32K', 'ADATA XPG Lancer DDR5 32GB', 5399.00),
    (178, 75, 'RAM-ADATA-64K', 'ADATA XPG Lancer DDR5 64GB', 6949.00),
    
    # HDDs (variants 179-188)
    (179, 76, 'HDD-WD-RED-STD', 'WD Red Pro 20TB', 29995.00),
    (180, 77, 'HDD-WD-GOLD-STD', 'WD Gold 22TB', 34995.00),
    (181, 78, 'HDD-WD-BLUE-STD', 'WD Blue 8TB', 9995.00),
    (182, 79, 'HDD-TOSHIBA-X300-STD', 'Toshiba X300 Pro 22TB', 32995.00),
    (183, 80, 'HDD-TOSHIBA-MG-STD', 'Toshiba MG 10TB', 14995.00),
    (184, 81, 'HDD-SEAGATE-IRON-STD', 'Seagate IronWolf Pro 20TB', 31995.00),
    (185, 82, 'HDD-SEAGATE-FIRE-STD', 'Seagate FireCuda 8TB', 12995.00),
    (186, 83, 'HDD-SEAGATE-EXOS-STD', 'Seagate Exos X16 16TB', 27995.00),
    (187, 84, 'HDD-SEAGATE-BARRA-STD', 'Seagate BarraCuda Pro 12TB', 19995.00),
    (188, 85, 'HDD-WD-BLACK-STD', 'WD Black 8TB', 15995.00),
    
    # PSUs (variants 189-198)
    (189, 86, 'PSU-CORSAIR-RM850X-BLK', 'Corsair RM850x', 7995.00),
    (190, 87, 'PSU-EVGA-SN1000-P5', 'EVGA SuperNOVA 1000 P5', 9995.00),
    (191, 88, 'PSU-TT-GF3-750', 'Thermaltake Toughpower GF3 750W', 6495.00),
    (192, 89, 'PSU-CM-MWE-750', 'CM MWE Gold V3 750W', 5995.00),
    (193, 90, 'PSU-GB-UD750', 'Gigabyte UD750GM', 5495.00),
    (194, 91, 'PSU-MSI-A850G', 'MSI MPG A850G', 8495.00),
    (195, 92, 'PSU-NZXT-C1000', 'NZXT C1000', 9495.00),
    (196, 93, 'PSU-CORSAIR-SF750', 'Corsair SF750', 8995.00),
    (197, 94, 'PSU-SF-LEADEX-850', 'Super Flower Leadex III 850W', 7495.00),
    (198, 95, 'PSU-ASUS-ROG-1000', 'ASUS ROG THOR 1000W', 12995.00),
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
    return start + timedelta(days=random_days)

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
        
        # Each order has 1-4 items
        num_items = random.choices([1, 2, 3, 4], weights=[40, 35, 20, 5])[0]
        order_total = 0
        
        # Select random products for this order
        selected_variants = random.sample(PRODUCT_VARIANTS, min(num_items, len(PRODUCT_VARIANTS)))
        
        for variant in selected_variants:
            variant_id, product_id, sku, title, price = variant
            quantity = random.choices([1, 2, 3], weights=[70, 25, 5])[0]
            line_total = price * quantity
            order_total += line_total
            
            order_items.append({
                'id': order_item_id,
                'order_id': order_id,
                'product_id': product_id,
                'variant_id': variant_id,
                'quantity': quantity,
                'price': price
            })
            order_item_id += 1
        
        orders.append({
            'id': order_id,
            'user_id': user_id,
            'status': status,
            'total': order_total,
            'created_at': order_date.strftime('%Y-%m-%d %H:%M:%S'),
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
            f"INSERT INTO orders (id, user_id, status, total, created_at, updated_at) VALUES "
            f"({order['id']}, {order['user_id']}, '{order['status']}', {order['total']:.2f}, "
            f"'{order['created_at']}', '{order['updated_at']}');"
        )
    
    lines.append("")
    lines.append("-- =====================================================")
    lines.append("-- ORDER_ITEMS TABLE")
    lines.append("-- =====================================================")
    lines.append("")
    
    # Generate order_items INSERT
    for item in order_items:
        lines.append(
            f"INSERT INTO order_items (id, order_id, product_id, variant_id, quantity, price) VALUES "
            f"({item['id']}, {item['order_id']}, {item['product_id']}, {item['variant_id']}, "
            f"{item['quantity']}, {item['price']:.2f});"
        )
    
    lines.append("")
    lines.append("-- =====================================================")
    lines.append("-- SUMMARY")
    lines.append("-- =====================================================")
    
    # Calculate stats
    status_counts = {}
    year_counts = {}
    for order in orders:
        status_counts[order['status']] = status_counts.get(order['status'], 0) + 1
        year = order['created_at'][:4]
        year_counts[year] = year_counts.get(year, 0) + 1
    
    lines.append(f"-- Total Orders: {len(orders)}")
    lines.append(f"-- Total Order Items: {len(order_items)}")
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
