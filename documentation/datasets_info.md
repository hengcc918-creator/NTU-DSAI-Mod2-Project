## olist_customers_dataset.csv
- customer_id: Unique identifier for each customer
- customer_unique_id: Unique identifier for each customer across all orders
- customer_zip_code_prefix: The first five digits of the customer's zip code
- customer_city: The city where the customer is located
- customer_state: The state where the customer is located
## olist_orders_dataset.csv
- order_id: Unique identifier for each order
- customer_id: Unique identifier for the customer who made the order
- order_status: The current status of the order (e.g., delivered, canceled, etc.)
- order_purchase_timestamp: The date and time when the order was placed
- order_approved_at: The date and time when the order was approved
- order_delivered_carrier_date: The date and time when the order was delivered to the carrier
- order_delivered_customer_date: The date and time when the order was delivered to the customer
- order_estimated_delivery_date: The estimated date and time for the order to be delivered
## olist_order_items_dataset.csv
- order_id: Unique identifier for each order
- order_item_id: Unique identifier for each item in the order
- product_id: Unique identifier for each product
- seller_id: Unique identifier for each seller
- shipping_limit_date: The date and time by which the item must be shipped
- price: The price of the item 
- freight_value: The cost of shipping the item
## olist_products_dataset.csv
- product_id: Unique identifier for each product
- product_category_name: The category to which the product belongs 
- product_name_length: The length of the product name
- product_description_length: The length of the product description
- product_photos_qty: The number of photos associated with the product
- product_weight_g: The weight of the product in grams
- product_length_cm: The length of the product in centimeters
- product_height_cm: The height of the product in centimeters
- product_width_cm: The width of the product in centimeters
## olist_sellers_dataset.csv
- seller_id: Unique identifier for each seller
- seller_zip_code_prefix: The first five digits of the seller's zip code
- seller_city: The city where the seller is located
- seller_state: The state where the seller is located
## product_category_name_translation.csv
- product_category_name: The original category name in Portuguese
- product_category_name_english: The translated category name in English
### olist_order_payments_dataset.csv
- order_id: Unique identifier for each order
- payment_sequential: The sequential number of the payment for the order
- payment_type: The type of payment used for the order (e.g., credit card, boleto, etc.)
- payment_installments: The number of installments for the payment
- payment_value: The total value of the payment
### olist_order_reviews_dataset.csv
- review_id: Unique identifier for each review
- order_id: Unique identifier for each order
- review_score: The score given by the customer for the order (1 to 5)
- review_comment_title: The title of the review comment
- review_comment_message: The message of the review comment
- review_creation_date: The date and time when the review was created
- review_answer_timestamp: The date and time when the review was answered by the seller
### olist_geolocation_dataset.csv - more than 1-million records
- geolocation_zip_code_prefix: The first five digits of the zip code
- geolocation_lat: The latitude of the location
- geolocation_lng: The longitude of the location
- geolocation_city: The city associated with the zip code
- geolocation_state: The state associated with the zip code