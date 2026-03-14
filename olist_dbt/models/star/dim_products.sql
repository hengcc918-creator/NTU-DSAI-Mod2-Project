{{
	config(
		materialized='table'
	)
}}

with src_products as (
	select *
	from {{ source('olist_dataset', 'products_english') }}
)

select distinct
	cast(product_id as string) as product_id,
	coalesce(nullif(trim(cast(product_category_name_english as string)), ''), 'unkown') as product_category_name
from src_products
