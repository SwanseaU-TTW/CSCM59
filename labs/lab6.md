---
title: Lab 6 - Views
author: CSCM59
date: Due 18 Nov, 2020
---



# Tasks

Each of the sections below contains a **Task** which you need to show to the
deomonstrator. Here is a summary:

1. Show the the structure and contents of the `Pets` view
2. Show the structure and contents of the `Pet_Owners` view

# Create a view for pets

Create a view called `Pets` which will show the `username` and `email` for
all pets in the database.

**Task**: The results of `SHOW CREATE VIEW Pets;`

**Task**: The results of `SELECT * FROM Pets;`

# Creating views

Create a view called `Pet_Owners`, which will show the `username`, `email`, and
`type` of both the pet and the pet owner (there should be 6 columns). Similar
to last week a pet owner owner is a user (person or admin in the database) who
is linked to a pet.

**HINT 1**: You will need to join the `Users` table with the `Links` table
twice. Have a look at table aliases (n.b. be sure to read the section on table
aliases, not column aliases): http://www.mysqltutorial.org/mysql-alias/

**HINT 2**: When developing views, it can slow down development time to keep
dropping and recreating views while I figure out the proper query. I find it
easier to first figure out the proper select query. I only create the view
itself once I get the query part working.

**Optional**: You may think it's better to explicitly label the pet and owner
in the view. In other words, you would have columns in the `Pet_Owners` table
like `owner_username`, `pet_username`, etc. This is possible but you will need
to use the `UNION ALL` operator
(<https://dev.mysql.com/doc/refman/8.0/en/union.html>) and column aliases
(<http://www.mysqltutorial.org/mysql-alias/>).

**Task**: The results of `SHOW CREATE VIEW Pet_Owners;`

**Task**: The results of `SELECT * FROM Pet_Owners;`



