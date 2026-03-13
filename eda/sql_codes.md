## Converting `product_category_name` in `products` table to English

```sql
SELECT 
    p.* EXCEPT(product_category_name), 
-- Converting product_category_name to English
-- If there is a translation available in the product_category_name_translation table, use it; otherwise, keep the original category name
-- string_field_1 contains the English translation of the category name, while string_field_0 contains the original category name in Portuguese
    COALESCE(t.string_field_1, p.product_category_name) AS product_category_name_english
    FROM `dsai-488403.olist_dataset.products` AS p
LEFT JOIN 
    `dsai-488403.olist_dataset.product_category_name_translation` AS t
ON 
    p.product_category_name = t.string_field_0;
