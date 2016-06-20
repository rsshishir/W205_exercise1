#!/bin/bash
tail -n +2 Hospital_General_Information.csv > hospitals.csv
tail -n +2 Timely_and_effective_care.csv > procedures.csv
tail -n +2 hvbp_tps_02_18_2016.csv > surveys.csv
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/procedures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put procedures.csv /user/w205/hospital_compare/procedures
hdfs dfs -put surveys.csv /user/w205/hospital_compare/surveys
