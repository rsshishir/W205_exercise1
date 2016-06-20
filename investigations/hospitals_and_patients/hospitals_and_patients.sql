set hive.cli.print.header=true;
SELECT p.hospital_id as ID, p.average as average,s.weighted_survey_score as survey_score from procedures_score p, Tbl_surveys s where s.hospital_id=p.hospital_id ORDER BY average DESC;

drop table proc_survey;
CREATE TABLE proc_survey as 
SELECT p.hospital_id as ID, p.average as average, cast(s.weighted_survey_score as float) as survey_score from procedures_score p, Tbl_surveys s where s.hospital_id=p.hospital_id;
Describe proc_survey;
select corr(average, survey_score) as corr_between_average_surveyscore from proc_survey;
