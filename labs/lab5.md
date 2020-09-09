
# Task 5

So far we've worked on creating a database structure and putting data into it.
For this lab (and the next one) the idea is to get some practice altering the
structure of your database. When you alter the structure of a database it's
usually best to introduce new elements and not worry about de-normalizing your
database. Once that's running, then you can work on re-normalizing your
database.  The next 2 labs will follow this idea.  This lab will create all the
new structures in the database. The following lab will concentrate on removing
the old structure.

What we want to do is transition the `type` column of the `Users` table to use
a lookup table rather than a text column. For this lab you need to do the 
following:

1) Create a table called `UserType` The columns should be:
    * `type_id` which is an integer primary key
    * `type_description` which is a string field and must be unique (this is 
       important for lookup tables!)
2) Insert a row for each unique user type into the `UserType` table. The
   `type_description` should contain the type strings.
3) Create a new column called `type_id` in your `Users` table to hold a 
   foreign key link to the `type_id` of the `UserType` table. Have a look at
   the documentation for `ALTER TABLE`:
   <https://dev.mysql.com/doc/refman/8.0/en/alter-table.html>
4) Populate the `type_id` column of your `Users` table. For this, you will need
   to use the `UPDATE` statement:
   <https://dev.mysql.com/doc/refman/8.0/en/update.html>. You need to get
   the `type_id` from the `UserType` table based on the text field `type`.
   You can join the `Users` and `UserType` table together within the
   UPDATE statement like so (this is just a sketch of the update statement!)

   ```
   UPDATE Users
   JOIN UserType ut
   ON Users.type=ut.type_description
   SET ...
   WHERE ...
   ```

This sounds like a lot! But you have an extra week to complete all this.

## Task

*Due 03/12/2019*

Show your tutor:

* The structure of the `Users` table (`DESCRIBE Users`) showing the new column
  and foreign key constraint to the `UserType` table
* The structure of the `UserType` table (`DESCRIBE Users`)
* The contents of the `UserType` table. 
* The contents of your `Users` table showing the contents of the old `type` 
  column and the new `type_id` columns

**[5 marks]**

