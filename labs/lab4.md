
# Task 4

So far we've been loosy goosey with 2 parts of our database. The `types` 
column of the `Users` table and the `link_a`/`link_b` columns of the `Links`
table. 

We want to implement a constraint: `ALTER TABLE Users ADD CONSTRAINT ...` to
limit the contents of the type field to one of three values: "pet", "admin",
"person". The relevant documentation is here:
<https://dev.mysql.com/doc/refman/8.0/en/create-table-check-constraints.html>.

Also implement a constraint to eliminate self-references in the `Links` table.
This means that `link_a` and `link_b` must contain different usernames. Add a
constraint to the database to account for this.

**Note**: You may have implemented the type column as an integer with a foreign
key to a lookup table. If you did this that's ok. You don't need to change that
part of your database, just show the tutor that you did this and that will also
count for the first item.


## Task

*Due 19/11/2019*

Show your tutor:

* The results of `describe Users` showing the user type constraint
* The results of `describe Links` showing the link_a/link_b constraint

**[5 marks]**

