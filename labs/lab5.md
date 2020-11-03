---
title: Lab 5 - Constraints
author: CSCM59
date: Due 11 Nov, 2020
---

From the previous lab we made a users table so people could log in but there
was no way of tracking their social network. Let's do that now!

# Tasks

Each of the sections below contains a **Task** which you need to show to the
deomonstrator. Here is a summary:

1. Show the demonstrator `Links` table
2. The results of `describe Users` showing the user type constraint
3. The results of `describe Links` showing the link_a/link_b constraint

# Create a new table

Create a table to link users with each other. We're going to assume that social
links are mutual, i.e. if A is linked to B then B is linked to A. We also want
to store the date the link was created. In summary, create a table called
`Links` with columns: `link_id`, `link_a`, `link_b`, `creation_date`.
No columns should be null. The primary key is `link_id`. You will also need
to add foreign key constraints for `link_a` and `link_b`. 

Now populate the `Links` table with at least 10 different links.

**Task**: the contents of your table by `select * from Links;`  

# Update the database constraints

We want to implement a constraint: `ALTER TABLE Users ADD CONSTRAINT ...` to
limit the contents of the type field to one of three values: "pet", "admin",
"person". The relevant documentation is here:
<https://dev.mysql.com/doc/refman/8.0/en/create-table-check-constraints.html>.

*Note*: You may have implemented the type column as an integer with a foreign
key to a lookup table. If you did this that's ok. You don't need to change that
part of your database, just show the tutor that you did this and that will also
count for the first item.

**Task**: The results of `describe Users` showing the user type constraint

# Don't allow self-friending

Implement a constraint to eliminate self-references in the `Links` table.
This means that `link_a` and `link_b` must contain different usernames. Add a
constraint to the database to account for this.

**Task**: The results of `describe Links` showing the link_a/link_b constraint



