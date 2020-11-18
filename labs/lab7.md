---
title: Lab 7 - Refactoring, Part I
author: CSCM59
date: Due 2 Dec, 2020
---

So far we've worked on creating a database structure and putting data into it.
For this lab (and the next one) the idea is to get some practice altering the
structure of your database. When you alter the structure of a database it's
usually best to introduce new elements and not worry about de-normalizing your
database. Once that's running, then you can work on re-normalizing your
database. The next 2 labs will follow this idea. This lab will create all the
new structures in the database. The following lab will concentrate on removing
the old structure.

Note that you'll have 2 weeks each for these last 2 labs but start early!

# Tasks

Each of the sections below contains a **Task** which you need to show to the
demonstrator. Here is a summary:

1. Show the demonstrator the results of `SHOW CREATE TABLE Person;`
2. Show the demonstrator the results of `SELECT * FROM Person;`
3. Show the demonstrator the results of `SHOW CREATE TABLE Pet;`
4. Show the demonstrator the results of `SELECT * FROM Pet;`
5. Show the demonstrator the results of `SHOW CREATE TABLE Links`
6. Show the demonstrator the results of `SELECT * FROM Links`

# Introduction

Until now, we've been storing pets and people in the users table. But they 
really have different qualities: pets have a species and humans have a 
nationality, for example. While we're at it, we'll update the links table to
only link pets to people. That means all that headache from the Pet_Owners
view will be solved!

I know this seems like alot! First of all, you have an extra week to complete
this lab. You can do the whole thing in 6 carefully crafted SQL statements.

# Create person table

Create a table called `Person` with the following columns: `person_id`, `username`,
and `nationality`. `username` should be the same as your primary key column
in your users table. Make sure to create a foreign key constraint for this 
column. Now populate this table with all non-pet (person and admin) users. Be
sure to give them a nationality.

*Note*: It will be easiest if you use a `SERIAL` type column for `person_id`

**Task**: Show the demonstrator the results of `SHOW CREATE TABLE Person;`

**Task**: Show the demonstrator the results of `SELECT * FROM Person;`

# Create pet table

Create a table called `Pet` with the following columns: `pet_id`, `username`,
and `species`. `username` should be the same as your primary key column
in your users table. Make sure to create a foreign key constraint for this 
column. Now populate this table with all pets (n.b. you have a view for this).
Be sure to note their species.

*Note*: It will be easiest if you use a `SERIAL` type column for `pet_id`

**Task**: Show the demonstrator the results of `SHOW CREATE TABLE Pet;`

**Task**: Show the demonstrator the results of `SELECT * FROM Pet;`

# Change links table

Now you want to add 2 columns to the Links table: `pet_id` and `person_id`.
These should be foreign keys to their respective tables: Pet and Person.  Now
you need to populate these two new columns with the `pet_id` from Pet and
`person_id` from Person tables. For this you will need an `UPDATE` statement.

**Task**: Show the demonstrator the results of `SHOW CREATE TABLE Links`
**Task**: Show the demonstrator the results of `SELECT * FROM Links`

