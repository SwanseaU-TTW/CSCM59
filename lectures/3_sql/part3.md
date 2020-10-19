---
title: SQL --- Part 3
date: 20 Oct, 2020
author: Thomas Torsney-Weir
modcode: CSCM59
modname: Relational and Object-Oriented Database Systems
theme: ttw
slideNumber: true
---

## Last time

::::::::: {.columns}
::: {.column}
* **Requesting data**
* Inserting data
* Deleting data
* Changing data
:::
::: {.column}
```sql
SELECT *
FROM Department d, Employee e
WHERE d.did=e.did
  and e.salary > 30000;
```
:::
:::::::::

## Last time

::::::::: {.columns}
::: {.column}
* Requesting data
* **Inserting data**
* Deleting data
* Changing data
:::
::: {.column}
```sql
INSERT INTO Employee 
  (eid, ename, did, salary) 
VALUES 
  ('e5', 'Mackenzie', 3, 25000);
```
:::
:::::::::

## Last time

::::::::: {.columns}
::: {.column}
* Requesting data
* Inserting data
* **Deleting data**
* Changing data
:::
::: {.column}
```sql
DELETE from Employee
WHERE salary < 20000;
```
:::
:::::::::

## Last time

::::::::: {.columns}
::: {.column}
* Requesting data
* Inserting data
* Deleting data
* **Changing data**
:::
::: {.column}
```sql
UPDATE Employee
SET salary = 31000
WHERE ename = 'finzi'; 
```
:::
:::::::::

## Today

SQL tricks :)

* Other joins 
* Aggregation
* Subqueries
* Insert tricks
* Update tricks
* Delete tricks

## Other joins

* **Inner**

    ```sql
    SELECT *
    FROM Department d
    JOIN Employee e
    ON d.did=e.did;
    ```

* **Left outer**
* **Right outer**
* **Full**

## Other joins

* **Inner**
* **Left outer**

    ```sql
    SELECT *
    FROM Department d
    LEFT JOIN Employee e
    ON d.did=e.did;
    ```

* **Right outer**

    ```sql
    SELECT *
    FROM Department d
    RIGHT JOIN Employee e
    ON d.did=e.did;
    ```

* **Full**

## Other joins

* **Inner**
* **Left outer**
* **Right outer**
* **Full**
    - combines left and right outer joins
    - not possible in MySQL

## Aggregation

Summarises a number of rows into one

* Count
* Sum
* Avg
* Min
* Max
* *Many* proprietary extensions

. . .

::::::::: {.columns}
::: {.column}
```sql
SELECT count(*)
FROM Department;
```
:::
::: {.column}
```sql
SELECT Sum(salary)
FROM Employee;
```
:::
::::::::: 

::: notes
Where reduces the rows before the aggregation!
:::

## Aggregation

`GROUP BY` aggregates sub-sections of tables individually

```sql
SELECT dname, SUM(salary)
FROM Department d, Employee e
WHERE d.did=e.did
GROUP BY dname;
```

## Filtering using aggregates

`HAVING` is like `WHERE` but only for aggregates

```sql
SELECT dname, SUM(salary)
FROM Department d, Employee e
WHERE d.did=e.did
GROUP BY dname
HAVING SUM(salary) > 20000;
```

## Subqueries

Use the results of one query as value in another

```sql
SELECT *
FROM Department
WHERE budget=(SELECT MAX(budget) FROM Department);
```

## Insert tricks

Works great for importing data

```sql
INSERT INTO Employee (ename, salary)
SELECT CONCAT(fname, ' ', lname), salary
FROM Interviewees
WHERE salary < 10000;
```

## Update tricks

Useful for refactoring

```sql
UPDATE Department
SET Budget=tmp.ttlsalary
FROM Department
INNER JOIN (SELECT e.did, sum(e.salary) as ttlsalary
            FROM Employee e
            GROUP BY e.did) tmp
WHERE tmp.did=Department.did
```

## Delete tricks

Subqueries to find which rows to delete

```sql
DELETE FROM Employee
WHERE did in (SELECT did 
              FROM Department 
              WHERE dname='Marketing');
```

## Why do these?

* Databases deal with massive amounts of data
* Single query can often run more efficiently than in multiple queries
    - especially with inserting/updating data
    - searching is likely faster with a database

## Summary

* Left joins and aggregates are used all the time
* Subqueries are useful with aggregates
* Running one query often faster than dealing with multiple queries

