DROP TABLE Tbl_surveys;
CREATE TABLE Tbl_surveys AS SELECT hospital_id, weighted_survey_score FROM surveys; 
Describe Tbl_surveys;
