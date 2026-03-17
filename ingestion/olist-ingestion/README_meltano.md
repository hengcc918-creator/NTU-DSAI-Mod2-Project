# Data ingestion with Meltano

Create a Meltano project: olist-ingestion

```bash
meltano init olist-ingestion
```
This will create a new directory called `olist-ingestion` with the necessary files and folders for a Meltano project.
```bash
cd olist-ingestion
```

## Add an extractor to ingest the Olist csv files:

As an extractor for Kaggle datasets is not available, I have downloaded the dataset into a local directory first, and will use the tap-csv to read the csv files from that local directory.

Configure the tap to read the Olist dataset from a local directory.
```bash
meltano add tap-csv
```

Add a loader to load the data into BigQuery:

```bash
meltano add target-bigquery
```
Configure the target-bigquery with the appropriate credentials and settings to connect to the BigQuery project. It was done interactively using the command:
```bash
meltano config set target-bigquery --interactive
```

Set the following options:

- `credentials_path`: _full path to the service account key file_
- `dataset`: `olist_dataset`
- `denormalized`: `true`
- `flattening_enabled`: `true`
- `flattening_max_depth`: `1`
- `method`: `batch_job`
- `project`: *your_gcp_project_id*

Refer to the [meltano.yml](meltano.yml) file in the repository for the complete configuration.

## Run csv files into BigQuery
Run the data pipeline to ingest the Olist dataset into BigQuery:
```bash
meltano run tap-csv target-bigquery
```

## Issues encountered and solutions:
1. **Issue**: The tap-csv was not able to read the csv files due to file paths as it was very long and had spaces in it.\
   **Solution**: I moved the dataset to a directory, data, in the root of the meltano project and updated the file paths in the [meltano.yml](meltano.yml) file accordingly.
2. **Issue**: There is a failure in ingestion 'product_category_name_translation.csv' due to the presence of special characters (Portuguese characters) in the file.\
   **Solution**: I have manually uploaded this file to BigQuery and excluded it from the ingestion process by removing it from the file paths in the [meltano.yml](meltano.yml) configuration. This allowed the rest of the files to be ingested successfully while still ensuring that the data from 'product_category_name_translation.csv' is available in BigQuery for analysis.