CREATE DATABASE bond_trader;

CREATE TABLE staging_tbl (
  company TEXT,
  `interest rate` DOUBLE,
  `purchase date` DATE,
  `sell date` DATE,
  amount DECIMAL(10,2)
);

INSERT INTO staging_tbl (company, `interest rate`, `purchase date`, `sell date`, amount)
VALUES ('Apple', 0.05, '2020-10-01',null,1000),
       ('IBM', 0.04, '1990-09-25', '1998-10-17', 10000),
       ('Ford', 0.02, '2003-03-15', '2007-04-10', 50000),
       ('Disney', 0.03, '2015-06-03', null, 23000);