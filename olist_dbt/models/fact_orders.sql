{{
	config(
		materialized='table',
		alias='fact_order'
	)
}}

with src_orders as (
	select *
	from {{ source('olist_dataset', 'orders') }}
)

select
	cast(order_id as string) as order_id,
	cast(customer_id as string) as customer_id,
	cast(order_status as string) as order_status,
	cast(order_purchase_timestamp as timestamp) as order_purchase_timestamp
from src_orders
