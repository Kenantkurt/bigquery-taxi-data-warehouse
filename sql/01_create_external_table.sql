CREATE OR REPLACE EXTERNAL TABLE `white-set-490418-r8.trips_data_all.yellow_tripdata_external`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://white-set-490418-r8-taxi-bucket/yellow_taxi_2024/*.parquet']
);
