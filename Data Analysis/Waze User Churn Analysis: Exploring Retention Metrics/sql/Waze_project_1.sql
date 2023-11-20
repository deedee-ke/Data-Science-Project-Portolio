SELECT ID, label, sessions, drives, total_sessions, n_days_after_onboarding, total_navigations_fav1, total_navigations_fav2, driven_km_drives, duration_minutes_drives, activity_days, driving_days, device
FROM waze_dataset
LIMIT 5;

ID|label   |sessions|drives|total_sessions|n_days_after_onboarding|total_navigations_fav1|total_navigations_fav2|driven_km_drives|duration_minutes_drives|activity_days|driving_days|device |
--+--------+--------+------+--------------+-----------------------+----------------------+----------------------+----------------+-----------------------+-------------+------------+-------+
 0|retained|     283|   226|   296.7482729|                   2276|                   208|                     0|     2628.845068|            1985.775061|           28|          19|Android|
 1|retained|     133|   107|   326.8965962|                   1225|                    19|                    64|     13715.92055|            3160.472914|           13|          11|iPhone |
 2|retained|     114|    95|   135.5229263|                   2651|                     0|                     0|     3059.148818|            1610.735904|           14|           8|Android|
 3|retained|      49|    40|   67.58922127|                     15|                   322|                     7|     913.5911231|            587.1965423|            7|           3|iPhone |
 4|retained|      84|    68|   168.2470201|                   1562|                   166|                     5|     3950.202008|            1219.555924|           27|          18|Android|

-- Exploring missing values
SELECT COUNT(*) missing_label_count
FROM waze_dataset
WHERE label = '';

missing_label_count|
-------------------+
                700|
                
--Summary Statistics
SELECT label,
	   COUNT(*) AS total_users, 
       ROUND(AVG(driven_km_drives), 2) AS avg_km_driven, 
       ROUND(AVG(drives), 2) AS avg_drives, 
       ROUND(AVG(driving_days), 2) AS avg_driving_days
FROM waze_dataset
GROUP BY label;
               
label   |total_users|avg_km_driven|avg_drives|avg_driving_days|
--------+-----------+-------------+----------+----------------+
        |        700|      3935.97|      67.8|           12.13|
churned |       2536|      4147.17|     72.73|            7.22|
retained|      11763|      4022.25|     66.08|           13.25|
      
-- Median kilometers per drive for churned and retained users
SELECT
  label,
  MEDIAN(driven_km_drives  / drives) AS median_km_per_drive
FROM waze_dataset 
GROUP BY label;

label   |median_km_per_drive|
--------+-------------------+
        |       71.648256075|
churned |  73.49180722941176|
retained|  74.05103747058824|

-- Median kilometers per driving day for churned and retained users
SELECT 
  label,
  MEDIAN(driven_km_drives / driving_days) AS median_km_per_driving_day
fROM waze_dataset 
GROUP BY label;
              
label   |median_km_per_driving_day|
--------+-------------------------+
        |       281.46438509999996|
churned |        523.0867493333334|
retained|       272.62854914999997|

-- Median drives per driving day for churned and retained users
SELECT 
  label,
  MEDIAN(drives / driving_days) AS median_drives_per_driving_day
fROM waze_dataset 
GROUP BY label;

label   |median_drives_per_driving_day|
--------+-----------------------------+
        |                            4|
churned |                            7|
retained|                            3|

-- Churn rates by device type
SELECT
    label,
    device,
    COUNT(*) AS count_per_label_device,
    ROUND(CAST(COUNT(*) AS FLOAT) / (
        SELECT COUNT(*) FROM waze_dataset  WHERE label = wd.label
    ), 2) AS ratio_per_label_device
FROM
    waze_dataset wd 
GROUP BY
    label, device;

label   |device |count_per_label_device|ratio_per_label_device|
--------+-------+----------------------+----------------------+
        |Android|                   253|                  0.36|
        |iPhone |                   447|                  0.64|
churned |Android|                   891|                  0.35|
churned |iPhone |                  1645|                  0.65|
retained|Android|                  4183|                  0.36|
retained|iPhone |                  7580|                  0.64|







