## Data ingestion with Olist using Meltano

Create a Meltano project: olist-ingestion

```bash
meltano init olist-ingestion
cd olist-ingestion
```
Add an extractor to ingest the Olist csv files::

```bash
meltano add tap-csv
```
Configure the tap to read the Olist dataset from a local directory.
Create a `meltano.yml` file. Refer to the meltano.yml file in the repository for the complete configuration.

Add a loader to load the data into BigQuery:

```bash
meltano add target-bigquery
```
Configure the target-bigquery with the appropriate credentials and settings to connect to your BigQuery project. You can do this interactively using the command:
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

## Run csv files into BigQuery
Run the data pipeline to ingest the Olist dataset into BigQuery:
```bash
meltano run tap-csv target-bigquery
```


# Issues encountered and solutions:
1. **Issue**: The tap-csv was not able to read the csv files due to file paths as it was very long and had spaces in it.
   **Solution**: I moved the dataset to a directory, data, in the root of the meltano project and updated the file paths in the meltano.yml file accordingly.
2. **Issue**: There is a failure in ingestion 'product_category_name_translation.csv' due to the presence of special characters (Portuguese characters) in the file.
   **Solution**: Since this file is not critical for the analysis, I decided to exclude it from the ingestion process by removing it from the file paths in the meltano.yml configuration.