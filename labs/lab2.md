---
title: Lab 2 - Basic selection
author: CSCM59
date: Due 21 Oct, 2020
---

In this lab you'll get some practice writing basic SQL statements. We won't
be doing anything too crazy yet. That's for next week's lab :)

For the time being, we'll be using a simple finance database for our queries.
You can access the backup file [here](???) to load into the database. It's also
listed under this file in the Modules section.

If you need more help with SQL, the 
[MySQL reference](https://dev.mysql.com/doc/refman/8.0/en/select.html) 
may be of use.

After loading in the file you will have a database called 'finance' which will
contain the following tables and columns:



# Tasks

Each of the sections below contains a **Task** which you need to show to the
deomonstrator. Here is a summary:

1. Show the demonstrator the prices of AAPL
2. Show the demonstrator the list of companies
3. Show the demonstrator the which stocks are in the portfolio

# Getting an overview

Before using a new database I try to run some queries to get a sense for what's
in the various tables. This gives me a lot of insight into what's in the
various tables. So run, for example,

```
SELECT *
FROM portfolio;
```

and have a look at the result. Do this for all the tables in the database.

# Looking at prices of a stock

Write a query to get the prices of AAPL. Your results must only contain the
date and price. 

**TASK**: show your demonstrator this query and the resulting table

# Finding specific companies

You want to find all companies in California grouped by what exchange they
are in.

*HINT*: Think about what you can add to a query to put similar rows together

**TASK**: show your demonstrator this query and the resulting table

# Getting the current portfolio

Write a query to return only the stock symbols and number of shares in the
current portfolio. The current portfolio is an item in the portfolio that has
not yet been sold.

*HINT*: you can use `IS NULL` and `IS NOT NULL` to filter missing values

**TASK**: show your demonstrator this query and the resulting table


