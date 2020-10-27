CREATE TABLE supplier (
  sid INTEGER AUTO_INCREMENT,
  sname VARCHAR(255) NOT NULL,
  status INTEGER NOT NULL,
  city VARCHAR(255) NOT NULL,
  PRIMARY KEY(sid)
);

INSERT INTO supplier (sname, status, city)
VALUES ('Smith', 20, 'London'),
       ('Jones', 10, 'Paris'),
       ('Johnson', 18, 'Cardiff'),
       ('Clark', 20, 'London'),
       ('Ayhan', 40, 'Brighton'),
       ('Robinson', 12, 'Manchester'),
       ('Lee', 14, 'Glasgow');

       DROP VIEW good_Supplier;
CREATE VIEW good_Supplier as SELECT s.sid, s.status, st.city FROM supplier s, supplier_status st WHERE st.status=s.status AND s.status > 15;

SELECT * FROM supplier;
SELECT * FROM good_Supplier;

INSERT into supplier (sname, status, city) VALUES ('sdffjhsdf', 18, 'Cardiff');

INSERT INTO good_Supplier (status, city) Values (21, 'Swansea/Manilla');

ALTER TABLE supplier ALTER COLUMN sname SET DEFAULT '##RENAME##';

SELECT * from good_Supplier gs, supplier s WHERE gs.city <> 'London' AND gs.sid=s.sid;

SELECT distinct status, city from supplier

CREATE TABLE supplier_status (
  status INTEGER NOT NULL,
  city varchar(255) NOT NULL,
  primary key (status)
);

INSERT INTO supplier_status (status, city) VALUES (20, 'LONDON'), (10, 'Paris');

ALTER TABLE supplier ADD FOREIGN KEY (status) REFERENCES supplier_status (status);
ALTER TABLE supplier DROP COLUMN city;
