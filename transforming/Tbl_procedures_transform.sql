DROP TABLE procedures_rev;
CREATE TABLE procedures_rev AS SELECT hospital_id, measure_id, measure_name, score FROM procedures WHERE score <> 'Not Available'; 

DROP TABLE hospital_id_count;
CREATE TABLE hospital_id_count AS SELECT hospital_id,COUNT(hospital_id) as idcount FROM procedures_rev GROUP BY hospital_id;
describe hospital_id_count;
select count(*) from hospital_id_count;

DROP TABLE hospital_id_rev;
CREATE TABLE hospital_id_rev AS SELECT hospital_id FROM hospital_id_count where idcount>30;
describe hospital_id_rev;
select count(*) from hospital_id_rev;

DROP TABLE measure_id_count;
CREATE TABLE measure_id_count AS SELECT measure_id, measure_name, COUNT(measure_id) as idcount FROM procedures_rev GROUP BY measure_id,measure_name;
describe measure_id_count;
select count(*) from measure_id_count;

DROP TABLE measure_id_rev;
CREATE TABLE measure_id_rev AS SELECT measure_id, measure_name FROM measure_id_count where idcount>1000 and measure_id not in ('EDV', 'ED_1b', 'ED_2b', 'OP_18b', 'OP_20', 'OP_21', 'OP_22', 'PC_01', 'VTE_6');
describe measure_id_rev;
select count(*) from measure_id_rev;

DROP TABLE Tbl_procedures;
CREATE TABLE Tbl_procedures AS
SELECT p.hospital_id, p.measure_id, p.measure_name, p.score FROM procedures_rev p, hospital_id_rev h1, measure_id_rev m WHERE p.measure_id=m.measure_id AND p.hospital_id=h1.hospital_id;
describe Tbl_procedures;
