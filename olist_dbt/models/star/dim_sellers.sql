{{
	config(
		materialized='table'
	)
}}

with src_sellers as (
	select *
	from {{ source('olist_dataset', 'sellers') }}
)

select distinct
	cast(seller_id as string) as seller_id,
	cast(seller_zip_code_prefix as string) as seller_zipcode,
	cast(seller_city as string) as seller_city,
	cast(seller_state as string) as seller_state
from src_sellers
