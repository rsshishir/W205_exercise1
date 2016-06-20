DROP TABLE state_procedures;
CREATE TABLE state_procedures AS select h.hospital_state, p.score from hospitals h, Tbl_procedures p where h.hospital_id=p.hospital_id;

set hive.cli.print.header=true;
SELECT hospital_state as State, count(score) as N, avg(score) as Average, stddev_pop(score) as Sigma, (avg(score)-stddev_pop(score)) as min_quality_score from state_procedures GROUP BY hospital_state ORDER BY min_quality_score desc LIMIT 10;
