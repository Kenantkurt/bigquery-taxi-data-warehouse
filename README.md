# BigQuery Taxi Data Warehouse

Hands-on GCS and BigQuery project using NYC Yellow Taxi trip data from January to June 2024.

## Project Overview

In this project, I worked with NYC Yellow Taxi parquet files stored in Google Cloud Storage and queried them in BigQuery using different table strategies.

The goal was to understand:

- how external tables work in BigQuery
- the difference between external and regular tables
- how columnar storage affects bytes processed
- how partitioning and clustering improve query efficiency

## Tech Stack

- Google Cloud Storage (GCS)
- BigQuery
- SQL
- NYC Yellow Taxi Trip Records (January 2024 to June 2024)

## Dataset

Source data: NYC TLC Yellow Taxi Trip Records

Files used:
- yellow_tripdata_2024-01.parquet
- yellow_tripdata_2024-02.parquet
- yellow_tripdata_2024-03.parquet
- yellow_tripdata_2024-04.parquet
- yellow_tripdata_2024-05.parquet
- yellow_tripdata_2024-06.parquet

The parquet files were uploaded to a GCS bucket and queried from BigQuery.

## Project Steps

### 1. Created a GCS bucket
Used Google Cloud Storage to store the parquet source files.

### 2. Uploaded the parquet files
Uploaded the first 6 months of 2024 Yellow Taxi parquet files to the bucket.

### 3. Created an external table
Created an external BigQuery table pointing to the parquet files stored in GCS.

See: `sql/01_create_external_table.sql`

### 4. Created a regular table
Loaded the same data into a standard BigQuery table.

See: `sql/02_create_regular_table.sql`

### 5. Created a partitioned and clustered table
Created an optimized BigQuery table partitioned by `tpep_dropoff_datetime` and clustered by `VendorID`.

See: `sql/03_create_partitioned_clustered_table.sql`

### 6. Ran analysis queries
Used SQL queries to inspect row counts, distinct locations, bytes processed, and partitioning benefits.

See: `sql/04_analysis_queries.sql`

## Key Findings

- Total records in the January–June 2024 dataset: **20,332,093**
- Trips with `fare_amount = 0`: **8,333**
- `COUNT(DISTINCT PULocationID)` showed:
  - **0 MB** estimated bytes processed on the external table
  - **155.12 MB** estimated bytes processed on the regular table
- Selecting only `PULocationID` processed **155.12 MB**
- Selecting `PULocationID` and `DOLocationID` processed **310.24 MB**
- Filtering on a non-partitioned table processed **310.24 MB**
- The same filtered query on the partitioned table processed **26.84 MB**

## What I Learned

This project helped me practice the difference between storage and query layers in GCP.

Main takeaways:
- external tables let BigQuery query files directly from GCS
- regular tables store data inside BigQuery
- BigQuery is columnar, so scanning more columns increases bytes processed
- partitioning significantly reduces the amount of scanned data when queries filter by date
- clustering improves organization of data inside partitions

## Repository Structure

```text
sql/
├── 01_create_external_table.sql
├── 02_create_regular_table.sql
├── 03_create_partitioned_clustered_table.sql
└── 04_analysis_queries.sql
