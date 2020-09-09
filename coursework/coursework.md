---
title: CSCM59, Coursework 2019 - 2020 
subtitle: Deadline 11:00 a.m. on Friday 13/12/2019
author: Dr. T. Torsney-Weir
date: 30 September, 2019
numbersections: true
...


By submitting this coursework, electronically and/or hardcopy, you state that
you fully understand and are complying with the university's policy on
Academic Integrity and Academic Misconduct. The policy can be found at
<https://myuni.swansea.ac.uk/academic-life/academic-misconduct/>.

# Overview

The purpose of this coursework is to give you experience in designing,
implementing and querying a simple database. To achieve a good mark you will
need to demonstrate that you understand the principles of the Relational Model
and can implement it in a sensible, practical way. This coursework is worth 20%
of the module.

# Description of Task

You're working for a startup in one of the hottest new areas: social network
and open banking-based budgeting apps (ooo, ahh). You're responsible for
designing the database to manage all user data. After asking around and reading
documentation you have the following entities:

* The database needs to track users who log into the system. Each user will
  have a user name, preferred name, password, email, last login date and time,
  creation date and time, birthday (for presents!), and phone number (for
  resets!)
* Each transaction has an associated bank account, merchant, category,
  description, transaction date, clearing date, and amount
* Each user can define their own set of categories for the transactions, but
  new users have 4 by default: pets, kids, bills, and food
* A bank account has an associated bank branch, nickname (user-defined), and
  account number. You should also track when the last time the account was
  updated.
* Bank accounts can be one of several types: current, savings, loan
* Several users can be linked to a single bank account (e.g. joint accounts)
* A bank branch belongs to a particular bank. Each branch has its own sort code
  and address (street, city, postal code).
* A bank has a name and headquarters address (street, city, postal code)
* One of the branches is called the *central branch*. Each bank has exactly 1
  but otherwise this is just like a regular branch.
* The ops team would like you to record any errors when updating an account
  with the message, account, and date/time of error
* Transaction amounts may either be debits or credits: debits are transactions
  where money leaves the account (e.g. grocery bill) and credits are where
  money comes in (e.g. salary).
* The clearing date must be later or on the day of the transaction date
* An account can only belong to one user unless it's a joint account in which
  case it can belong to two users

Design, build and populate a database in at least 3NF. 
No tables should allow null values, and you should use the fewest tables 
possible. Then interrogate your database to ascertain the answers to the 
following questions:

1. Show the name and number of columns for all your tables.
2. Show the attribute names and types for all your your tables, 
   and the primary and foreign keys.
3. What integrity constraints are there for any one of your tables?
4. What is the current balance for each account in the database
5. How many branches do each of the banks have in the database?
6. How many accounts do each of the banks have in the database?
7. Which user has the highest net worth? Net worth is your total assets
   (current and savings) minus total liabilities (loans).
8. What is the discrepancy in net worth between joint account holders?
9. For each user, what category has the highest spending?

Do not spend hours putting large amounts of data into your database. 
Satisfy your self with sufficient data to interrogate sensibly.

# Submission

When you have finished interrogating your database put the results into a
file. Put the session (i.e. the executed SQL statements and the results
obtained) into a text file. Draw a Functional Dependency diagram for each
table. This can be drawn freehand if you wish but you must then scan
it into a pdf file before submitting. I will not accept hardcopies.
Consider using a free drawing package for Windows here:
<http://dia-installer.de/>. Zip both files into a single zipped folder and
submit that to Blackboard in the usual way. Please note I do not want the SQL
code for creating and populating the database, just for the interrogation. Late
submission will be awarded 0%, in line with University guidelines.

# Marking

Marks will be awarded according to the marking rubric on Blackboard. Under
normal circumstances all course works will be marked by 3rd January, 2020. 
Course works are usually marked more quickly than this.

# Feedback

All individual feedback will be contained in the marking rubric notes. In
addition I will place a generic feedback file on Blackboard.

# Unfair Practice 

This is an individual assignment. You are allowed to discuss
the work with your colleagues, but the work you submit must be your own. Any
evidence of collusion, plagiarism, or any other form of Unfair Practice will be
investigated and, if found proven, penalised according to University Guidelines.
If you are in any doubt about any aspect of the work, or the meaning of Unfair
Practice as defined by Swansea University, you should seek
advice before submitting your work. This coursework must be submitted
electronically, as described in section 3 above, but by submitting it to
Blackboard you are agreeing to the statement made on the standard
College of Science Coursework Submission Form.

