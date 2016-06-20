set hive.cli.print.header=true;
SELECT measure_id as id, measure_name as procedure, count(score) as N, avg(score) as Average, stddev_pop(score) as sigma FROM Tbl_procedures GROUP BY measure_id, measure_name ORDER BY sigma desc LIMIT 10;
