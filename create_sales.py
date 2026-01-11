import random
import subprocess
from datetime import datetime, timedelta

# Sample user data extracted from users_insert.sql
users = [
    ('antonio.gonzalez1@mypc.com', 'Antonio', 'Gonzalez'),
    ('ana.sollus2@mypc.com', 'Ana', 'Sollus'),
    ('miguel.sollner3@mypc.com', 'Miguel', 'Sollner'),
    ('estanislao.voitlexner4@mypc.com', 'Estanislao', 'Voitlexner'),
    ('araceli.miranda5@mypc.com', 'Araceli', 'Miranda'),
    ('ana.soliz6@mypc.com', 'Ana', 'Soliz'),
    ('rosa.solntseff7@mypc.com', 'Rosa', 'Solntseff'),
    ('margarita.soto9@mypc.com', 'Margarita', 'Soto'),
    ('rosalinda.campanilla10@mypc.com', 'Rosalinda', 'Campanilla'),
    ('gregorio.reyes11@mypc.com', 'Gregorio', 'Reyes'),
]

# Product variant data (from mypc_complete.sql + inserts.sql) - (variant_id, title, price, product_name)
# CORRECT MAPPING:
# mypc_complete.sql: Product 1 variants 1-2, Product 2 variants 3-4 (Total: 4 variants)
# inserts.sql: CPUs variants 5-20, GPUs variants 21-50 (Total: 46 variants)
# GRAND TOTAL: 50 variants across all products
products = [
    # Variants 1-4: Sample CPUs from mypc_complete.sql (Products 1-2)
    (1, 'Boxed with Cooler', 14995.00, 'AMD Ryzen 5 7600'),
    (2, 'OEM (Tray)', 13795.00, 'AMD Ryzen 5 7600'),
    (3, 'Boxed', 27995.00, 'AMD Ryzen 7 7800X3D'),
    (4, 'OEM (Tray)', 26795.00, 'AMD Ryzen 7 7800X3D'),
    # Variants 5-20: CPUs from inserts.sql (Products 3-10, 8 products × 2 variants = 16 variants)
    (5, 'Boxed with Cooler', 16495.00, 'AMD Ryzen 5 7600X'),
    (6, 'OEM (Tray)', 15295.00, 'AMD Ryzen 5 7600X'),
    (7, 'Boxed with Cooler', 18995.00, 'AMD Ryzen 5 9600X'),
    (8, 'OEM (Tray)', 17795.00, 'AMD Ryzen 5 9600X'),
    (9, 'Boxed with Cooler', 19495.00, 'AMD Ryzen 7 7700'),
    (10, 'OEM (Tray)', 18295.00, 'AMD Ryzen 7 7700'),
    (11, 'Boxed', 32995.00, 'AMD Ryzen 7 9800X3D'),
    (12, 'OEM (Tray)', 31795.00, 'AMD Ryzen 7 9800X3D'),
    (13, 'Boxed', 37995.00, 'AMD Ryzen 9 7900X3D'),
    (14, 'OEM (Tray)', 36795.00, 'AMD Ryzen 9 7900X3D'),
    (15, 'Boxed', 42995.00, 'AMD Ryzen 9 7950X3D'),
    (16, 'OEM (Tray)', 41795.00, 'AMD Ryzen 9 7950X3D'),
    (17, 'Boxed', 49995.00, 'AMD Ryzen 9 9950X3D'),
    (18, 'OEM (Tray)', 48795.00, 'AMD Ryzen 9 9950X3D'),
    (19, 'Boxed', 45995.00, 'AMD Ryzen 9 9950X'),
    (20, 'OEM (Tray)', 44795.00, 'AMD Ryzen 9 9950X'),
    # Variants 21-50: GPUs from inserts.sql (Products 11-20, 10 products × 3 variants = 30 variants)
    (21, 'Reference', 16995.00, 'AMD Radeon RX 6600 XT'),
    (22, 'Dual-Fan', 17495.00, 'AMD Radeon RX 6600 XT'),
    (23, 'Triple-Fan', 18195.00, 'AMD Radeon RX 6600 XT'),
    (24, 'Reference', 18495.00, 'AMD Radeon RX 6650 XT'),
    (25, 'Dual-Fan', 18995.00, 'AMD Radeon RX 6650 XT'),
    (26, 'Triple-Fan', 19695.00, 'AMD Radeon RX 6650 XT'),
    (27, 'Reference', 22995.00, 'AMD Radeon RX 6700 XT'),
    (28, 'Dual-Fan', 23495.00, 'AMD Radeon RX 6700 XT'),
    (29, 'Triple-Fan', 24195.00, 'AMD Radeon RX 6700 XT'),
    (30, 'Reference', 14495.00, 'AMD Radeon RX 7600'),
    (31, 'Dual-Fan', 14995.00, 'AMD Radeon RX 7600'),
    (32, 'Triple-Fan', 15495.00, 'AMD Radeon RX 7600'),
    (33, 'Reference', 26995.00, 'AMD Radeon RX 7700 XT'),
    (34, 'Dual-Fan', 27495.00, 'AMD Radeon RX 7700 XT'),
    (35, 'Triple-Fan', 28195.00, 'AMD Radeon RX 7700 XT'),
    (36, 'Reference', 32995.00, 'AMD Radeon RX 7800 XT'),
    (37, 'Dual-Fan', 33495.00, 'AMD Radeon RX 7800 XT'),
    (38, 'Triple-Fan', 34195.00, 'AMD Radeon RX 7800 XT'),
    (39, 'Reference', 36995.00, 'AMD Radeon RX 7900 GRE'),
    (40, 'Dual-Fan', 37495.00, 'AMD Radeon RX 7900 GRE'),
    (41, 'Triple-Fan', 38195.00, 'AMD Radeon RX 7900 GRE'),
    (42, 'Reference', 49995.00, 'AMD Radeon RX 7900 XTX'),
    (43, 'Dual-Fan', 50495.00, 'AMD Radeon RX 7900 XTX'),
    (44, 'Triple-Fan', 51195.00, 'AMD Radeon RX 7900 XTX'),
    (45, 'Reference', 39995.00, 'AMD Radeon RX 9070'),
    (46, 'Dual-Fan', 40495.00, 'AMD Radeon RX 9070'),
    (47, 'Triple-Fan', 41195.00, 'AMD Radeon RX 9070'),
    (48, 'Reference', 45995.00, 'AMD Radeon RX 9070 XT'),
    (49, 'Dual-Fan', 46495.00, 'AMD Radeon RX 9070 XT'),
    (50, 'Triple-Fan', 47195.00, 'AMD Radeon RX 9070 XT'),
]

# Address templates for Filipino locations
addresses = [
    "123 Rizal Street, Makati City, Metro Manila, 1200",
    "456 Bonifacio Avenue, Quezon City, Metro Manila, 1100",
    "789 Mabini Street, Manila, Metro Manila, 1000",
    "321 Del Pilar Street, Pasig City, Metro Manila, 1600",
    "654 Aguinaldo Highway, Cavite City, Cavite, 4100",
    "987 MacArthur Highway, Angeles City, Pampanga, 2009",
    "147 Osmeña Boulevard, Cebu City, Cebu, 6000",
    "258 Araneta Avenue, Davao City, Davao del Sur, 8000",
    "369 Session Road, Baguio City, Benguet, 2600",
    "741 Burgos Street, Iloilo City, Iloilo, 5000",
]

phone_numbers = [
    '+63 917 123 4567',
    '+63 918 234 5678',
    '+63 919 345 6789',
    '+63 920 456 7890',
    '+63 921 567 8901',
    '+63 922 678 9012',
    '+63 923 789 0123',
    '+63 924 890 1234',
    '+63 925 901 2345',
    '+63 926 012 3456',
]

def generate_order_number(index):
    """Generate order number in format ORD-00000001"""
    return f"ORD-{index:08d}"

def random_date_in_range(start_date, end_date):
    """Generate random datetime between start and end dates"""
    time_between = end_date - start_date
    random_days = random.randint(0, time_between.days)
    random_hours = random.randint(0, 23)
    random_minutes = random.randint(0, 59)
    return start_date + timedelta(days=random_days, hours=random_hours, minutes=random_minutes)

def generate_orders():
    """Generate realistic order data"""
    orders = []
    order_items_list = []
    order_id = 1
    
    # 2025 orders (Jan 1 - Dec 31, 2025)
    # Generate 300 orders for 2025
    start_2025 = datetime(2025, 1, 1)
    end_2025 = datetime(2025, 12, 31, 23, 59, 59)
    
    print("Generating 2025 orders (completed/cancelled)...")
    for i in range(300):
        user = random.choice(users)
        order_date = random_date_in_range(start_2025, end_2025)
        
        # 2025: 85% completed, 15% cancelled
        status = 'completed' if random.random() < 0.85 else 'cancelled'
        
        # Random 1-4 items per order
        num_items = random.randint(1, 4)
        selected_products = random.sample(products, num_items)
        
        subtotal = 0
        order_items = []
        
        for product in selected_products:
            variant_id, variant_title, price, product_name = product
            quantity = random.randint(1, 2)
            line_total = price * quantity
            subtotal += line_total
            
            order_items.append({
                'order_id': order_id,
                'variant_id': variant_id,
                'product_name': product_name,
                'variant_title': variant_title,
                'unit_price': price,
                'quantity': quantity,
                'line_total': line_total
            })
        
        shipping = 150.00 if subtotal < 5000 else 0.00
        tax = subtotal * 0.12
        total = subtotal + shipping + tax
        
        orders.append({
            'id': order_id,
            'order_number': generate_order_number(order_id),
            'user_email': user[0],
            'customer_name': f"{user[1]} {user[2]}",
            'customer_email': user[0],
            'customer_phone': random.choice(phone_numbers),
            'shipping_address': random.choice(addresses),
            'status': status,
            'subtotal': subtotal,
            'shipping': shipping,
            'tax': tax,
            'total': total,
            'placed_at': order_date.strftime('%Y-%m-%d %H:%M:%S'),
            'updated_at': order_date.strftime('%Y-%m-%d %H:%M:%S')
        })
        
        order_items_list.extend(order_items)
        order_id += 1
        
        if (i + 1) % 50 == 0:
            print(f"  Generated {i + 1} orders for 2025...")
    
    # 2026 orders (Jan 1 - current date)
    # Generate 150 orders for 2026
    start_2026 = datetime(2026, 1, 1)
    end_2026 = datetime.now()
    
    print("Generating 2026 orders (processing/shipped/completed)...")
    statuses_2026 = ['processing', 'shipped', 'completed', 'completed', 'completed']  # More completed
    
    for i in range(150):
        user = random.choice(users)
        order_date = random_date_in_range(start_2026, end_2026)
        
        # 2026: mix of processing, shipped, completed
        status = random.choice(statuses_2026)
        
        # Random 1-4 items per order
        num_items = random.randint(1, 4)
        selected_products = random.sample(products, num_items)
        
        subtotal = 0
        order_items = []
        
        for product in selected_products:
            variant_id, variant_title, price, product_name = product
            quantity = random.randint(1, 2)
            line_total = price * quantity
            subtotal += line_total
            
            order_items.append({
                'order_id': order_id,
                'variant_id': variant_id,
                'product_name': product_name,
                'variant_title': variant_title,
                'unit_price': price,
                'quantity': quantity,
                'line_total': line_total
            })
        
        shipping = 150.00 if subtotal < 5000 else 0.00
        tax = subtotal * 0.12
        total = subtotal + shipping + tax
        
        orders.append({
            'id': order_id,
            'order_number': generate_order_number(order_id),
            'user_email': user[0],
            'customer_name': f"{user[1]} {user[2]}",
            'customer_email': user[0],
            'customer_phone': random.choice(phone_numbers),
            'shipping_address': random.choice(addresses),
            'status': status,
            'subtotal': subtotal,
            'shipping': shipping,
            'tax': tax,
            'total': total,
            'placed_at': order_date.strftime('%Y-%m-%d %H:%M:%S'),
            'updated_at': order_date.strftime('%Y-%m-%d %H:%M:%S')
        })
        
        order_items_list.extend(order_items)
        order_id += 1
        
        if (i + 1) % 50 == 0:
            print(f"  Generated {i + 1} orders for 2026...")
    
    return orders, order_items_list

def generate_sql():
    """Generate SQL file"""
    orders, order_items = generate_orders()
    
    with open('db/sales_insert.sql', 'w', encoding='utf-8') as f:
        f.write("-- =====================================================\n")
        f.write("-- MyPC Database - Sales Data (Orders & Order Items)\n")
        f.write("-- =====================================================\n")
        f.write(f"-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write("-- Contains 450 orders (300 from 2025, 150 from 2026)\n")
        f.write("-- Run this after mypc_complete.sql and users_insert.sql\n")
        f.write("-- =====================================================\n\n")
        f.write("USE mypc_db;\n\n")
        f.write("SET FOREIGN_KEY_CHECKS = 0;\n\n")
        
        # First pass: Create a temp table mapping order_numbers to IDs
        f.write("-- =====================================================\n")
        f.write("-- INSERT ORDERS\n")
        f.write("-- =====================================================\n\n")
        
        for order in orders:
            sql = f"""INSERT INTO `orders` (`order_number`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `placed_at`, `updated_at`) 
SELECT '{order['order_number']}', u.id, '{order['status']}', {order['subtotal']:.2f}, {order['shipping']:.2f}, {order['tax']:.2f}, {order['total']:.2f}, '{order['customer_name']}', '{order['customer_email']}', '{order['customer_phone']}', '{order['shipping_address']}', '{order['placed_at']}', '{order['updated_at']}'
FROM users u WHERE u.email = '{order['user_email']}' LIMIT 1;\n"""
            f.write(sql)
        
        # Order Items - use order_number to get correct order_id
        f.write("\n-- =====================================================\n")
        f.write("-- INSERT ORDER ITEMS (using order_number lookup)\n")
        f.write("-- =====================================================\n\n")
        
        # Create a mapping of order numbers to their sequence
        order_number_map = {}
        for idx, order in enumerate(orders):
            order_number_map[order['id']] = order['order_number']
        
        for item in order_items:
            order_number = order_number_map[item['order_id']]
            sql = f"""INSERT INTO `order_items` (`order_id`, `variant_id`, `product_name`, `variant_title`, `unit_price`, `quantity`, `line_total`)
SELECT o.id, {item['variant_id']}, '{item['product_name']}', '{item['variant_title']}', {item['unit_price']:.2f}, {item['quantity']}, {item['line_total']:.2f}
FROM orders o WHERE o.order_number = '{order_number}' LIMIT 1;\n"""
            f.write(sql)
        
        f.write("\nSET FOREIGN_KEY_CHECKS = 1;\n\n")
        f.write("-- =====================================================\n")
        f.write("-- COMPLETION MESSAGE\n")
        f.write("-- =====================================================\n\n")
        f.write("SELECT '450 orders with items added successfully!' as message,\n")
        f.write("       '300 orders from 2025 (completed/cancelled)' as note_2025,\n")
        f.write("       '150 orders from 2026 (processing/shipped/completed)' as note_2026,\n")
        f.write("       'Sales dashboard now has data to display' as status;\n")
    
    print(f"\n✓ SQL file created: db/sales_insert.sql")
    print(f"✓ Total orders: {len(orders)}")
    print(f"✓ Total order items: {len(order_items)}")
    print(f"✓ 2025 orders: 300 (85% completed, 15% cancelled)")
    print(f"✓ 2026 orders: 150 (mixed processing/shipped/completed)")

if __name__ == "__main__":
    generate_sql()
