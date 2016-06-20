DROP TABLE procedures_score;
CREATE TABLE procedures_score AS 
SELECT hospital_id, count(score) as N, avg(score) as Average, stddev_pop(score) as Sigma, (avg(score)-stddev_pop(score)) as Lower_quality_score from Tbl_procedures GROUP BY hospital_id ORDER BY Lower_quality_score desc LIMIT 10;

set hive.cli.print.header=true;
SELECT h.hospital_id as ID, h.hospital_name as Name, p.N as N, p.Average as Average, p.Sigma as Sigma, p.Lower_quality_score as min_quality_score  from procedures_score p, Tbl_hospitals h where h.hospital_id=p.hospital_id ORDER BY min_quality_score DESC;
