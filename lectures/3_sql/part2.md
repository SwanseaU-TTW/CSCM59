---
title: SQL --- Part 2
date: 16 Oct, 2020
author: Thomas Torsney-Weir
modcode: CSCM59
modname: Relational and Object-Oriented Database Systems
theme: ttw
slideNumber: true
---

## Data manipulation

* Requesting data *(last time)*
* Inserting data
* Deleting data
* Changing data


## Inserting data

```sql
INSERT INTO <table name> 
    (<column1>, <column2>, ..., <columnN>) 
  VALUES 
    (<value1>, <value2>, ..., <valueN>); 
```

## Inserting data

```sql
INSERT INTO Employee (eid, ename, did, salary) VALUES ('e5', 'Mackenzie', 3, 25000);
INSERT INTO Employee (eid, ename, did, salary) VALUES ('e6', 'Castillo', 3, 27000);
INSERT INTO Employee (eid, ename, did, salary) VALUES ('e7', 'Arroyo', 1, 45000);
INSERT INTO Employee (eid, ename, did, salary) VALUES ('e8', 'Hays', 2, 15000);
```

. . .

Only in MySQL!

```sql
INSERT INTO Employee (eid, ename, did, salary) 
VALUES ('e5', 'Mackenzie', 3, 25000),
       ('e6', 'Castillo', 3, 27000),
       ('e7', 'Arroyo', 1, 45000),
       ('e8', 'Hays', 2, 15000);
```

## Altering data

```sql
UPDATE <table name>
  set <column name1> = <value1>,
      <column name2> = <value2>
  where <condition>; 
```

Example

```sql
UPDATE Employee
SET salary = 31000
WHERE ename = 'finzi'; 
```

## Deleting data

```sql
DELETE FROM <table name>
WHERE <condition>; 
```

Example

```sql
DELETE from Employee
WHERE salary < 20000;
```

## Gotchas

* **Never do this!**

    ```sql
    DELETE FROM <table name>;
    ```

    This will delete all rows of the table in one shot

. . .

* **Rarely do this!**

    ```sql
    UPDATE <table name>
    SET salary = 3100;
    ```

    This will set the salary to 3100 for all rows

::: notes
using a select statement beforehand is a good idea to make 
sure the where clause is correct
:::

## Summary

* `INSERT`, `UPDATE`, and `DELETE` take care of the rest of the data manipulation
  aspect of the relational model
* Be very careful with the `WHERE` clause when changing data!

