
# Task 6

This lab is the follow-up to task 5 where we're altering the structure of the
databse. This week, we'll re-normalize our database from the work we did last
week. Remember that last lab, we introduced the `UserType` table and
incorporated it into the database structure. This created two locations in the
database with the same information: the user type. Now we need to remove the
old copy of the data.

1) Seems easy enough: Try and drop the column `type` from the `Users` table. 
   Have a look at the documentation for `ALTER TABLE`:
   <https://dev.mysql.com/doc/refman/8.0/en/alter-table.html>
2) Now try to check the `Pet_Owners` view (`SELECT * FROM Pet_Owners`).
   Do you get an error? Why do you think this occurred?
   If not, then something went wrong with Lab 3. Make sure you've completed 
   this lab :) Some database software (e.g. PostgreSQL) will have given you an
   error in step 1 rather than forcing you to double check your database.
3) Update the view to use the `UserType` table. 
    a. You can get the SQL for your view back by querying the *information 
       schema*. This has many fun tables containing statistics on all tables 
       in the database. `SELECT * FROM information_schema.views where table_name='Pet_Owners'`
    b. Now recreate the `Pet_Owners` view. Keep in mind that you'll need to
       join both the `Users` table and the `UserType` table twice now.
4) Double check your new view works properly: Run `SELECT * FROM Pet_Owners`.
   It should give you the same result before you deleted your `type` column

## Task

*Due 10/12/2019*

Show your tutor:

* Describe in your own words, the reason for the error in step 2
* Show the updated `Pet_Owners` view: `SELECT * FROM Pet_Owners`
* Show the updated `Users` table: `DESCRIBE Users`

**[5 marks]**

