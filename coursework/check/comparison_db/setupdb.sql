
--DROP DATABASE if exists cscm59_csv;
--CREATE DATABASE cscm59_csv;

USE cscm59_csv;

-- CREATE TABLE people (
  -- firstname VARCHAR(255),
  -- lastname VARCHAR(255),
  -- email VARCHAR(255),
  -- username VARCHAR(255),
  -- phonenumber VARCHAR(255),
  -- studentnumber INTEGER,
  -- course VARCHAR(255)
-- );

-- LOAD DATA LOCAL INFILE 'people_tbl.csv'
-- INTO TABLE people
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- CREATE TABLE curriculum (
  -- code VARCHAR(255),
  -- name VARCHAR(255),
  -- academicyear INTEGER,
  -- course VARCHAR(255),
  -- semester VARCHAR(255),
  -- sem_start date,
  -- sem_end date,
  -- lecturer_fname VARCHAR(255),
  -- lecturer_lname VARCHAR(255),
  -- lecturer_username VARCHAR(255),
  -- lecturer_email VARCHAR(255)
-- );

-- LOAD DATA INFILE 'curriculum_tbl.csv'
-- INTO TABLE curriculum
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- CREATE TABLE marks (
  -- code VARCHAR(255),
  -- studentnumber INTEGER,
  -- name VARCHAR(255),
  -- mark INTEGER
-- );

-- LOAD DATA INFILE 'marks_tbl.csv'
-- INTO TABLE marks
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- views students needed to create

CREATE VIEW enrollment AS
SELECT c.lecturer_username as lecturer, c.code as module_code, 
       p.studentnumber as student_id, 
       concat(p.firstname, ' ', p.lastname) as student_name
FROM marks m
JOIN people p
on p.studentnumber=m.studentnumber
JOIN curriculum c
ON c.code=m.code
and c.semester=m.name
WHERE m.mark is null
ORDER BY c.code, p.studentnumber;

CREATE VIEW past_performance AS
SELECT m.code as module_code, past.code as past_module_code,
       AVG(past.mark) as mark_average, VARIANCE(past.mark) as mark_variance,
       MAX(past.mark) as mark_high, MIN(past.mark) as mark_low,
       COUNT(past.mark) as num_students
FROM marks m
JOIN marks past
ON m.studentnumber=past.studentnumber
and m.name>past.name
GROUP BY m.code, past.code;

CREATE VIEW module_performance AS
SELECT m.code as module_code, c.name,
       AVG(m.mark) as mark_average, VARIANCE(m.mark) as mark_variance,
       MAX(m.mark) as mark_high, MIN(m.mark) as mark_low,
       COUNT(m.mark) as num_students
FROM marks m
JOIN curriculum c
ON c.code=m.code
GROUP BY m.code, c.name;

CREATE VIEW degree_qualification AS
SELECT done.studentnumber as student_id, 
       CONCAT(p.firstname, ' ', p.lastname) as student_name, 
       AVG(m.mark) as final_mark
FROM marks m
JOIN (SELECT studentnumber
      FROM marks
      WHERE mark is not null
      group by studentnumber
      having count(DISTINCT name)=6) done
ON m.studentnumber=done.studentnumber
JOIN curriculum c 
ON c.code=m.code
and c.semester=m.name
JOIN people p
ON p.studentnumber=done.studentnumber
WHERE c.academicyear <> 1 -- last 2 years
GROUP BY student_id, student_name;
