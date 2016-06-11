#!/bin/bash
tail -n +2 Hospital_General_Information.csv > hospitals.csv
tail -n +2 Timely_and_Effective_Care_Hospital.csv > effective_care.csv
tail -n +2 Readmissions_and_Deaths_Hospital.csv > readmissions.csv
tail -n +2 Measure_Dates.csv > Measures.csv
tail -n +2 hvbp_hcahps_02_18_2016.csv > surveys_responses.csv
hdfs dfs -put hospitals.csv /user/w205/hospital_compare
hdfs dfs -put effective_care.csv /user/w205/hospital_compare
hdfs dfs -put readmissions.csv /user/w205/hospital_compare
hdfs dfs -put Measures.csv /user/w205/hospital_compare
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare
