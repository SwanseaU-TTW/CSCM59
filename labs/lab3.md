---
title: Lab 3 - Advanced selection
author: CSCM59
date: Due 28 Oct, 2020
---

After last week's lab writing basic SQL statements, now it's time for some more
crazy SQL statements :) As a hint, the topics used in today's lab were
discussed in the lectures yesterday and last friday.

We'll be using the same simple finance database from last week for our queries.
You can access the backup file
[here](https://canvas.swansea.ac.uk/courses/15672/modules/items/860963) to load
into the database. It's also listed in week 2's lab in the Modules section.

If you need more help with SQL, the 
[MySQL reference](https://dev.mysql.com/doc/refman/8.0/en/select.html) 
may be of use.

# Tasks

Each of the sections below contains a **Task** which you need to show to the
deomonstrator. Here is a summary:

1. Which stock on which day had the highest price?
2. Which stocks have never been invested in?
3. What is the total amount paid for all the current portfolio stocks?

# Which stock on which day had the highest price?

Write a query to get the symbol, price date, and price of the stock in the
database with the highest price. *This must be a general query, not one specific
to the current data in the database*

**TASK**: show your demonstrator this query and the resulting table

# Which stocks have never been invested in?

Write a query to get the symbol, name, and sell date (if possible) of the
companies that were never purchased in the portfolio.

**TASK**: show your demonstrator this query and the resulting table

# What is the total amount paid for all the current portfolio stocks?

You have the current portfolio from last week. So now you need to figure out
how much money this current portfolio cost (a single number). That is the total
number of shares times the share price at the time of purchase. *The share
price must match up with the purchase date*

**TASK**: show your demonstrator this query and the resulting table


