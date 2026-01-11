#!/usr/bin/env python3
"""
Generate comprehensive sales_insert.sql with all order statuses across 2024-2026
Status distribution:
- Completed: 40%
- Processing: 15%
- Shipped: 15%
- Paid: 10%
- Pending: 10%
- Cancelled: 7%
- Refunded: 3%
"""

import random
from datetime import datetime, timedelta

random.seed(42)

# Parameters
TOTAL_ORDERS = 700  # Reduced for manageability, can be increased
ORDER_START_ID = 1
USER_IDS = list(range(1, 152))  # Based on 150 test users
VARIANT_IDS = list(range(1, 51))  # 50 product variants

# Status distribution (percentages)
STATUS_DISTRIBUTION = {
    'completed': 0.40,
    'processing': 0.15,
    'shipped': 0.15,
    'paid': 0.10,
    'pending': 0.10,
    'cancelled': 0.07,
    'refunded': 0.03
}

# Price ranges for orders
PRICE_RANGES = {
    'low': (10000, 50000),
    'mid': (50000, 150000),
    'high': (150000, 300000),
    'very_high': (300000, 600000)
}

def get_random_dates(year):
    """Generate random dates for a given year"""
    start_date = datetime(year, 1, 1)
    end_date = datetime(year, 12, 31)
    random_days = random.randint(0, (end_date - start_date).days)
    return start_date + timedelta(days=random_days)

def calculate_tax(subtotal):
    """Calculate 12% tax"""
    return round(subtotal * 0.12, 2)

def generate_order(order_id, user_id, status, year):
    """Generate a single order"""
    price_category = random.choice(list(PRICE_RANGES.keys()))
    min_price, max_price = PRICE_RANGES[price_category]
    subtotal = round(random.randint(min_price, max_price) / 5 * 5, 2)  # Round to nearest 5
    
    # Shipping (0, 500, or 1000 for some orders)
    shipping = random.choice([0, 0, 0, 500, 1000])
    
    tax = calculate_tax(subtotal)
    total = round(subtotal + shipping + tax, 2)
    
    placed_date = get_random_dates(year)
    
    # Updated date is days/weeks after placed date
    if status == 'pending':
        updated_date = placed_date
    elif status == 'processing':
        updated_date = placed_date + timedelta(days=random.randint(0, 2))
    elif status == 'paid':
        updated_date = placed_date + timedelta(days=random.randint(0, 1))
    elif status == 'shipped':
        updated_date = placed_date + timedelta(days=random.randint(3, 10))
    elif status == 'completed':
        updated_date = placed_date + timedelta(days=random.randint(7, 30))
    elif status == 'cancelled':
        updated_date = placed_date
    else:  # refunded
        updated_date = placed_date + timedelta(days=random.randint(10, 45))
    
    return (order_id, user_id, status, subtotal, shipping, tax, total, placed_date, updated_date)

def generate_sql():
    """Generate complete SQL file"""
    lines = []
    
    # Header
    lines.append("-- =====================================================")
    lines.append("-- MyPC Database - Sales Orders (2024-2026)")
    lines.append("-- =====================================================")
    lines.append(f"-- Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append(f"-- Total Orders: {TOTAL_ORDERS}")
    lines.append("-- Status Distribution:")
    for status, percentage in STATUS_DISTRIBUTION.items():
        lines.append(f"--   {status.capitalize()}: {percentage*100:.0f}%")
    lines.append("-- =====================================================")
    lines.append("")
    lines.append("USE mypc_db;")
    lines.append("")
    lines.append("-- Insert orders")
    
    # Generate orders
    statuses = []
    for status, percentage in STATUS_DISTRIBUTION.items():
        count = int(TOTAL_ORDERS * percentage)
        statuses.extend([status] * count)
    
    # Add remaining orders to completed if rounding differences
    while len(statuses) < TOTAL_ORDERS:
        statuses.append('completed')
    
    statuses = statuses[:TOTAL_ORDERS]
    random.shuffle(statuses)
    
    # Generate years distribution
    orders_per_year = {
        2024: int(TOTAL_ORDERS * 0.35),
        2025: int(TOTAL_ORDERS * 0.40),
        2026: int(TOTAL_ORDERS * 0.25)
    }
    
    order_id = ORDER_START_ID
    year_counts = {2024: 0, 2025: 0, 2026: 0}
    
    for i, status in enumerate(statuses):
        # Distribute years
        year = 2024
        if year_counts[2024] >= orders_per_year[2024]:
            year = 2025
        if year_counts[2025] >= orders_per_year[2025]:
            year = 2026
        
        year_counts[year] += 1
        
        user_id = random.choice(USER_IDS)
        order_data = generate_order(order_id, user_id, status, year)
        
        order_id, user_id, status, subtotal, shipping, tax, total, placed_at, updated_at = order_data
        
        sql = f"INSERT INTO `orders` (`id`, `user_id`, `status`, `subtotal`, `shipping`, `tax`, `total`, `placed_at`, `updated_at`) VALUES ({order_id}, {user_id}, '{status}', {subtotal}, {shipping}, {tax}, {total}, '{placed_at.strftime('%Y-%m-%d %H:%M:%S')}', '{updated_at.strftime('%Y-%m-%d %H:%M:%S')}');"
        lines.append(sql)
        
        order_id += 1
    
    return "\n".join(lines)

if __name__ == "__main__":
    sql = generate_sql()
    
    # Write to file
    with open(r"c:\xampp\htdocs\InfoSec-MyPC-main\db\sales_insert.sql", "w") as f:
        f.write(sql)
    
    print("Generated sales_insert.sql with", TOTAL_ORDERS, "orders")
    print("Breakdown by year:")
    print(f"  2024: ~35% (245 orders)")
    print(f"  2025: ~40% (280 orders)")
    print(f"  2026: ~25% (175 orders)")
    print("\nStatus distribution:")
    for status, percentage in STATUS_DISTRIBUTION.items():
        print(f"  {status.capitalize()}: {percentage*100:.0f}%")
