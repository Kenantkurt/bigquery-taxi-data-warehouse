-- Total record count
SELECT COUNT(*) AS total_records
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata`;

-- Distinct PULocationID on external table
SELECT COUNT(DISTINCT PULocationID) AS distinct_pu_locations
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata_external`;

-- Distinct PULocationID on regular table
SELECT COUNT(DISTINCT PULocationID) AS distinct_pu_locations
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata`;

-- Columnar storage check: single column
SELECT PULocationID
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata`;

-- Columnar storage check: two columns
SELECT PULocationID, DOLocationID
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata`;

-- Zero fare trips
SELECT COUNT(*) AS zero_fare_trips
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata`
WHERE fare_amount = 0;

-- Partition benefit: non-partitioned table
SELECT DISTINCT VendorID
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata`
WHERE tpep_dropoff_datetime >= '2024-03-01'
  AND tpep_dropoff_datetime < '2024-03-16';

-- Partition benefit: partitioned table
SELECT DISTINCT VendorID
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata_partitioned_clustered`
WHERE tpep_dropoff_datetime >= '2024-03-01'
  AND tpep_dropoff_datetime < '2024-03-16';

-- COUNT(*) metadata/statistics behavior
SELECT COUNT(*)
FROM `white-set-490418-r8.trips_data_all.yellow_tripdata`;
