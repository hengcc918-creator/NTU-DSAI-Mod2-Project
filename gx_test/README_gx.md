# Data Quality Check and Testing with Great Expectations
In this section, we will implement data quality checks using Great Expectations to ensure the integrity and reliability of our data. 

I will create a Great Expectations project in the `gx_test/` directory and use Jupyter notebooks to define and run data quality checks on the following tables:
- `fact_orders`
- `dim_customers`
- `dim_products`
- `dim_sellers`
- `dim_order_items`

## Data Quality Checks
### fact_orders
1. Check for duplicate `order_id`.
2. Ensure that `order_purchase_timestamp` should be a valid timestamp.
3. Check for null values in `order_id`, `customer_id`, and `order_status`.

### dim_customers
1. Check for null values in `customer_id` and `customer_unique_id`.
2. Check for duplicate `customer_id`.

### dim_products
1. Check for null values in `product_id` and `product_category_name`.
2. Check for duplicate `product_id`.

### dim_sellers
1. Check for null values in `seller_id` and `seller_city` and `seller_state`.
2. Check for duplicate `seller_id`.

### dim_order_items
1. Check for null values in `order_id`, `product_id`, and `seller_id`.
2. Check for price and total_value to be non-negative or zero.
3. Check for freight_value to be non-negative.
4. Check for duplicate `order_id`.

## Summary of Data Quality Checks
- For `fact_orders`, we will focus on ensuring the uniqueness of `order_id`, the validity of timestamps, and the presence of critical identifiers.
- For `dim_customers`, we will ensure that there are no missing critical identifiers and that there are no duplicate customer records.
- For `dim_products`, we will ensure that there are no missing critical identifiers and that there are no duplicate product records.
- For `dim_sellers`, we will ensure that there are no missing critical identifiers and that there are no duplicate seller records.
- For `dim_order_items`, we will ensure that there are no missing critical identifiers, that price and total_value are non-negative, and that freight_value is non-negative. However, I found that there are quite a lot of duplicated `order_id` in `dim_order_items`. After investigating the data, I realized that this is expected as one order can have multiple items as stated in `order_line_id` columns. Hence this quality check is not applicable for `dim_order_items`.
