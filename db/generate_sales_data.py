import random
from datetime import datetime, timedelta

# Configuration
TOTAL_ORDERS = 700

# Ensure MINIMUM representation of each status, then distribute remaining by percentages
STATUS_DISTRIBUTION = {
    'completed': 0.40,
    'processing': 0.15,
    'shipped': 0.15,
    'paid': 0.10,
    'pending': 0.10,
    'cancelled': 0.07,
    'refunded': 0.03
}

YEAR_DISTRIBUTION = {
    2024: 0.35,
    2025: 0.40,
    2026: 0.25
}

# Sample products with variant IDs
PRODUCT_VARIANTS = [
    {'id': 1, 'name': 'Intel Core i7-13700K', 'price': 429.99},
    {'id': 2, 'name': 'Intel Core i5-13600K', 'price': 319.99},
    {'id': 3, 'name': 'AMD Ryzen 9 7950X', 'price': 699.99},
    {'id': 4, 'name': 'AMD Ryzen 7 7700X', 'price': 429.99},
    {'id': 5, 'name': 'NVIDIA RTX 4090', 'price': 1999.99},
    {'id': 6, 'name': 'NVIDIA RTX 4080', 'price': 1199.99},
    {'id': 7, 'name': 'AMD Radeon RX 7900 XTX', 'price': 899.99},
    {'id': 8, 'name': 'Corsair Vengeance DDR5 32GB', 'price': 149.99},
    {'id': 9, 'name': 'Kingston Fury Beast DDR5 32GB', 'price': 129.99},
    {'id': 10, 'name': 'Samsung 990 Pro NVMe 2TB', 'price': 199.99},
    {'id': 11, 'name': 'WD Black SN850X NVMe 2TB', 'price': 189.99},
    {'id': 12, 'name': 'Seagate Barracuda HDD 4TB', 'price': 79.99},
    {'id': 13, 'name': 'ASUS ROG STRIX Z790-E', 'price': 329.99},
    {'id': 14, 'name': 'MSI MPG B850E EDGE WIFI', 'price': 289.99},
    {'id': 15, 'name': 'Corsair RM1000e PSU 1000W', 'price': 199.99},
    {'id': 16, 'name': 'Noctua NH-D15 CPU Cooler', 'price': 109.99},
    {'id': 17, 'name': 'Lian Li Lancool 216 Case', 'price': 89.99},
]

# Set seed for reproducibility
random.seed(42)

# Generate status list with MINIMUM baseline to ensure all statuses present
MIN_PER_STATUS = 50  # Minimum 50 of each status
BASE_ORDERS = len(STATUS_DISTRIBUTION) * MIN_PER_STATUS  # 350 orders
REMAINING_ORDERS = TOTAL_ORDERS - BASE_ORDERS  # 1050 orders to distribute

statuses = []

# Add baseline for each status
for status in STATUS_DISTRIBUTION.keys():
    statuses.extend([status] * MIN_PER_STATUS)

# Distribute remaining orders by percentages
for status, percentage in STATUS_DISTRIBUTION.items():
    additional = int(REMAINING_ORDERS * percentage)
    statuses.extend([status] * additional)

# Fill any remaining spots (due to rounding) with completed
remaining = TOTAL_ORDERS - len(statuses)
if remaining > 0:
    statuses.extend(['completed'] * remaining)

# Trim if we exceeded
statuses = statuses[:TOTAL_ORDERS]

# Shuffle to randomize
random.shuffle(statuses)

# Generate data
orders = []
order_items = []
order_item_id = 1
user_ids = list(range(2, 12))  # Users 2-11 (user 1 is admin)

# Calculate how many orders per year
year_2024_count = int(TOTAL_ORDERS * YEAR_DISTRIBUTION[2024])
year_2025_count = int(TOTAL_ORDERS * YEAR_DISTRIBUTION[2025])
year_2026_count = TOTAL_ORDERS - year_2024_count - year_2025_count

# Create date ranges
date_ranges = []
# 2024: full year
for i in range(year_2024_count):
    day_of_year = random.randint(1, 365)
    date_ranges.append((2024, day_of_year))

# 2025: full year
for i in range(year_2025_count):
    day_of_year = random.randint(1, 365)
    date_ranges.append((2025, day_of_year))

# 2026: Jan-11 (11 days into the year)
for i in range(year_2026_count):
    day_of_year = random.randint(1, 11)
    date_ranges.append((2026, day_of_year))

random.shuffle(date_ranges)

# Generate orders with items
for i in range(TOTAL_ORDERS):
    order_id = i + 1
    user_id = random.choice(user_ids)
    status = statuses[i]
    
    # Generate 1-3 line items per order
    num_items = random.randint(1, 3)
    order_subtotal = 0.0
    
    for j in range(num_items):
        variant = random.choice(PRODUCT_VARIANTS)
        quantity = random.randint(1, 3)
        line_total = quantity * variant['price']
        order_subtotal += line_total
        
        item_sql = f"INSERT INTO `order_items` (`id`, `order_id`, `product_name`, `quantity`, `variant_id`, `line_total`) VALUES ({order_item_id}, {order_id}, '{variant['name']}', {quantity}, {variant['id']}, {line_total});"
        order_items.append(item_sql)
        order_item_id += 1
    
    shipping = round(random.choice([0, 500, 1000, 1500]), 2)
    tax = round(order_subtotal * 0.12, 2)
    total = round(order_subtotal + shipping + tax, 2)
    
    # Generate date from date_ranges
    year, day_of_year = date_ranges[i]
    base_date = datetime(year, 1, 1)
    date = base_date + timedelta(days=day_of_year - 1)
    date_str = date.strftime('%Y-%m-%d %H:%M:%S')
    
    sql = f"INSERT INTO `orders` (`id`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `placed_at`, `updated_at`) VALUES ({order_id}, {user_id}, '{status}', {order_subtotal}, {shipping}, {tax}, {total}, '{date_str}', '{date_str}');"
    orders.append(sql)

# Write to file
output_file = r'c:\xampp\htdocs\InfoSec-MyPC-main\db\sales_insert.sql'

with open(output_file, 'w') as f:
    f.write("-- =====================================================\n")
    f.write("-- MyPC Database - Sales Orders (2024-2026)\n")
    f.write("-- =====================================================\n")
    f.write(f"-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
    f.write(f"-- Contains {TOTAL_ORDERS} realistic orders from users in users_insert.sql\n")
    f.write(f"-- All 7 statuses included: Pending, Processing, Paid, Shipped, Completed, Cancelled, Refunded\n")
    f.write(f"-- Total order items: {order_item_id - 1}\n")
    f.write(f"-- 2024: ~{year_2024_count} orders\n")
    f.write(f"-- 2025: ~{year_2025_count} orders\n")
    f.write(f"-- 2026: ~{year_2026_count} orders\n")
    f.write("-- =====================================================\n\n")
    f.write("USE mypc_db;\n\n")
    f.write("-- Insert orders\n")
    
    for order_sql in orders:
        f.write(order_sql + '\n')
    
    f.write("\n-- Insert order items\n")
    for item_sql in order_items:
        f.write(item_sql + '\n')

# Count actual statuses in final list
status_counts = {}
for status in statuses:
    status_counts[status] = status_counts.get(status, 0) + 1

# Print summary
print(f"Generated sales_insert.sql with {TOTAL_ORDERS} orders and {order_item_id - 1} order items\n")
print("Breakdown by year:")
print(f"  2024: ~{year_2024_count} orders")
print(f"  2025: ~{year_2025_count} orders")
print(f"  2026: ~{year_2026_count} orders")
print(f"\nActual Status distribution in generated file:")
for status in sorted(STATUS_DISTRIBUTION.keys()):
    count = status_counts.get(status, 0)
    percentage = (count / TOTAL_ORDERS) * 100
    print(f"  {status}: {count} orders ({percentage:.1f}%)")
print(f"\nTotal: {sum(status_counts.values())} orders")
print(f"Total order items: {order_item_id - 1}")
