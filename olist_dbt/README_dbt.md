# Data Transformation with dbt
## Setting up a dbt project with BigQuery  
1. Run `dbt init olist_dbt` to create a new dbt project.
    * Choose `bigquery` as the desired database to use
    * Choose `oauth` as the desired authentication method
    * Enter the GCP project ID when asked
    * Enter `olist_dbt` as the name of the dbt dataset
    * For threads and job_execution_timeout_seconds, use the default
    * For desired location, choose US.
2. Update the `dbt_project.yml` file to set the appropriate configurations for the project. Refer to the [dbt_project.yml](dbt_project.yml) file in the repository for the complete configuration.

### Setting up profiles.yml
Click on the `profiles.yml` located at home folder. Copy the profiles under `olist_dbt`.
Under `olist_dbt` folder, create a new file called `profiles.yml` and paste the profile information and save the `profiles.yml`.

Finally, run the command `dbt debug` to confirm the profiles are correctly configured.

## Creating dbt models
The business case is to analyze the sales performance of the e-commerce platform, identify trends, and provide insights for improving sales strategies to a mixed audience of business stakeholders and data analysts. Hence a **star schema was chosen for the data modeling to facilitate easy analysis and reporting**. The fact table will contain the measures related to orders, while the dimension tables will contain the attributes related to customers, products, and time.

1. Create a new model `fact_orders.sql` in the `models` directory with the following SQL code to create the fact_orders model. Refer to the [fact_orders.sql](models/fact_orders.sql) file in the repository for the complete SQL code.
2. Create star model for the dimension tables in the `models/star` directory. For example, create a `dim_customers.sql` file with the following SQL code to create the dim_customers model. Refer to the [dim_customers.sql](models/star/dim_customers.sql) file in the repository for the complete SQL code.
3. Create a `schema.yml` file in the `models` directory to define the tests and documentation for the fact_orders model. Refer to the [schema.yml](models/schema.yml) file in the repository for the complete configuration.
4. Create a `schema.yml` file in the `models/star` directory to define the tests and documentation for the dimension models. Refer to the [schema.yml](models/star/schema.yml) file in the repository for the complete configuration.

Each model is defined with appropriate tests to ensure data quality and integrity. The fact_orders model includes tests for not null and unique constraints on the order_id, while the dimension models include tests for not null constraints on their respective primary keys.

Each table was generated individually and then the dependencies were added to the `schema.yml` files to ensure the correct order of execution when running dbt.

The dbt models were then run using the following commands:
- dbt run --select `table_name` *replace 'table_name' with the actual name of the model to run*
- dbt test --select `table_name` *replace 'table_name' with the actual name of the model to test*

## Issues encountered and solutions:
1. **Issue**: There was an error in the schema.yml file due to identation issues.\
   **Solution**: I fixed the indentation issues in the schema.yml file to ensure it is properly formatted and can be parsed correctly by dbt.
2. **Issue**: There was an error in the SQL code for the fact_orders model due to incorrect casting of the order_purchase_timestamp field.\
   **Solution**: I corrected the SQL code to properly cast the order_purchase_timestamp field as a timestamp data type, which resolved the error and allowed the model to run successfully.
3. **Issue**: There was a null value in the product_category_name field in the dim_products model, which will cause issues with analysis.\
   **Solution**: I updated the SQL code for the dim_products model to use the COALESCE function to replace null values in the product_category_name field with 'unknown', which allowed for better handling of missing data in the analysis.