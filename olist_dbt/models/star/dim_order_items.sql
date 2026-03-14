{{
	config(
		materialized='table',
		alias='dim_order_item'
	)
}}

with src_order_items as (
	select *
	from {{ source('olist_dataset', 'order_items') }}
)

select
	cast(order_id as string) as order_id,
	cast(order_item_id as int64) as order_line_id,
	cast(product_id as string) as product_id,
	cast(seller_id as string) as seller_id,
	cast(price as numeric) as price,
	cast(freight_value as numeric) as freight_value,
	cast(price as numeric) + cast(freight_value as numeric) as total_value
from src_order_items
