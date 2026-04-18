CREATE OR REPLACE TABLE `white-set-490418-r8.trips_data_all.yellow_tripdata_partitioned_clustered`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT *
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata`;
