
# Task 3

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

## Task

*Due 12/11/2019*

Show your tutor:

* The contents of the Users table
* The contents of the Links table
* The results of `select * from Pet_Owners`

**[5 marks]**

