DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals (hospital_id string, hospital_name string, hospital_address string, hospital_city string, hospital_state string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE procedures;
CREATE EXTERNAL TABLE procedures (hospital_id string, hospital_name string, hospital_address string, hospital_city string, hospital_state string, zip string, county string, phone string,condition string, measure_id string, measure_name string, score float)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/procedures';

DROP TABLE surveys;
CREATE EXTERNAL TABLE surveys (hospital_id string, hospital_name string, hospital_address string, hospital_city string, hospital_state string, zip string, county string, unweighted_survey_score string, weighted_survey_score float)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys';