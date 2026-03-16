{{
	config(
		materialized='table'
	)
}}

with src_customers as (
	select *
	from {{ source('olist_dataset', 'customers') }}
)

select distinct
	cast(customer_id as string) as customer_id,
	cast(customer_unique_id as string) as customer_unique_id,
	cast(customer_zip_code_prefix as string) as customer_zipcode,
	cast(customer_city as string) as customer_city,
	cast(customer_state as string) as customer_state
from src_customers
