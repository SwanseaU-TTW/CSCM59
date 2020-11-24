---
title: Lab 8 - Refactoring, Part II
author: CSCM59
date: Due 9 Dec, 2020
---

The last lab of the semester!

# Introduction

This lab is the follow-up to lab 7 where we were altering the structure of the
databse. This week, we'll re-normalize our database from the work we did last
week. 

Remember that last lab, we started refactoring the database. This created two
locations in the database with the same information: the user type. Having two
locations for data is better than no locations but worse than one. So, now we
need to remove the old copy of the data.

# Tasks

The sections below contain a **Task** which you need to show to the
demonstrator. Here is a summary:

1. Show the demonstrator the results of `SHOW CREATE VIEW Pet_Owners`
2. Show the demonstrator the results of `SELECT * FROM Pet_Owners`
3. Show the demonstrator the results of `SELECT * FROM Links`
4. Show the demonstrator the results of `SHOW CREATE TABLE Links`

# Update links table

*Note 1*: Doing the below will destructively modify your database! You may want
to go all of the below using a transaction. Just be careful as any errors will
cause a rollback and exit the transaction. You will need to `BEGIN TRANSACTION`
again.

*Note 2*: Double check that you've completed the previous lab correctly. Check
that for all pet to person/admin links you have an entry for both pet_id and 
person_id. If not, fix your database first!

The main problem now is that both link_a/link_b and pet_id/owner_id contain 
similar information: the link between pet an owner. Remove the old link_a and
link_b columns. Have a look at the `ALTER TABLE` documentation:
<https://dev.mysql.com/doc/refman/8.0/en/alter-table.html>.

# Update Pet_Owners view

Now try to check the `Pet_Owners` view (`SELECT * FROM Pet_Owners`).
Do you get an error? Why do you think this occurred?
If not, then something went wrong with previous labs. Make sure you've 
completed everything :)
Some database software (e.g. PostgreSQL) will have given you an
error in the previous step rather than forcing you to double check all views
in your database.

Now update your `Pet_Owners` view to use the new pet_id and owner_id columns
rather than link_a and link_b. You can get the SQL for your view back by
querying the *information schema*. This has many fun tables containing
statistics on all tables in the database. To get the view run 
`SELECT * FROM information_schema.views where table_name='Pet_Owners'` or 
`SHOW CREATE VIEW Pet_Owners`. 

**Task**: Show the demonstrator the results of `SHOW CREATE VIEW Pet_Owners`

**Task**: Show the demonstrator the results of `SELECT * FROM Pet_Owners`

# Remove now invalid data

The links table now can contain entries with no links. For example, a pet/pet
link will have a pet_id but no person_id. Now delete all rows in `Links` where
pet_id is null or person_id is null. *BE VERY CAREFUL!* The wrong query can
delete all table content. I like to replace `DELETE` with `SELECT *` first to
get an idea of which rows will be deleted.

**Task**: Show the demonstrator the results of `SELECT * FROM Links`

# Put constraints on your `Links` table

Now that pet_id and person_id no longer have null entries, put **not null**
constraints on these columns.

**Task**: Show the demonstrator the results of `SHOW CREATE TABLE Links`

