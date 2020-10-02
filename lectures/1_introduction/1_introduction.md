---
title: Introduction
date: 2 Oct, 2020
author: Thomas Torsney-Weir
modcode: CSCM59
modname: Relational and Object-Oriented Database Systems
theme: ttw
slideNumber: true
---

## What do we want to do with data?

::::::::: {.columns}
::: {.column}

* Add files
* Remove files
* Add data
* Retrieve data
* Alter data
* Remove data

:::
::: {.column}
![<https://blog.revolutionanalytics.com/2017/12/sex-marriage-survey.html?utm_source=rss&utm_medium=Sendible&utm_campaign=RSS>](images/excel_bad.png)
:::
:::::::::

## Database system

::::::::: {.columns}
::: {.column width="70%"}


* **What is it?**
    * A computerised record-keeping system. 
    * Consists of the data, hardware, software (DBMS), and users.
    * Centralizes source of data in an organization
* **Concepts**
    * Databases are integrated, and shared (usually). 
    * Store persistent data = entities + relationships.
    * Transactions.
    * Data independence.
    * Each row is a true proposition from which other true propositions may be inferred.

:::
::: {.column width="30%"}
![[Brazil (1985)](https://en.wikipedia.org/wiki/Brazil_(1985_film))](images/brazil.jpeg)
:::
:::::::::

## Database advantages

::::::::: {.columns}
::: {.column}

* Data is shared
* Redundancy reduced
* Avoid inconsistency (sort of)
* Supports transitions
* Maintains integrity
* Enforce security
* Enforce standards

:::
::: {.column}
![](images/db_usage.svg)
:::
:::::::::

##

![<https://www.slideshare.net/chauhantushar/introduction-to-mysql>](images/mysql_overview.png){height=780px}

## Integrated

Integrated
  : A collection of separate files with redundancy removed (as far as possible)

![<http://phdcomics.com/comics.php?f=1323>](images/phd052810s.gif)


## Shared

Shared
  : The ability to share the same data resource with multiple applications or users

* Several different users, each with different requirements and interests.
* Each user sharing the database sees a subset of the data.
* Each user has a different view of the database.
* Sometimes, different users view different data simultaneously (concurrency).

## Software

![3 tier architecture](images/software_diagram.svg){height=600px}

## Software

::::::::: {.columns}

::: {.column width=60%}
![DB architecture](images/db_internals.svg)
:::

::: {.column width=40%}

Data manipulation language
  : (DML) Language used for retrieving and changing data

Data definition language
  : (DDL) Language used for defining the data schema

SQL can do both of these

:::

:::::::::

## Users

* **Application programmers**
    - Write software front-ends to the database

* **Users**
    - Directly write queries to the database
    - Run reporting engines

* **DBA**
    - responsible for administering the database according to instructions given by the Data Administrator (DA).

## Entity relationship diagram

![Boxes are relations, diamonds are relationships](images/er_diagram.svg){height=600px}

::: notes

* Relationship is a part of the data!!!!!
* Not all relationships binary.

### Example

A.Smith supplies monkey wrenches to Manhattan project

B. Smith supplies monkey wrenches.

C. Monkey wrenches are used in the Manhattan project.

D. The Manhattan project is supplied by Smith.

$B + C + D \nRightarrow A$

:::

## Database models

* **Relational**
* Inverted list
* Hierarchic
* Network
* **Object**
* **Document-oriented**

## Summary

* Databases are everywhere
* Databases are integrated and shared in an organization
* ER diagrams are how we can conceptually talk about data
* Not just relational databases

