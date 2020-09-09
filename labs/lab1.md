
# Task 1

For the lab we're going to go about implementing a database to hold a social
network. Yes, Facebook does this but some healthy competition never hurt 
anyone. Just ask Myspace or Google Plus :) But we'll try to come up with 
something unique: a site for both pets and owners!

First let's create the initial structure to hold data:

1.  Create a database: `create database SocialNetwork;`
2.  You must enter the new database to be able to use it: `use SocialNetwork;`

Using the code from the SQL tutorial create a table called **Users** with the
columns: **username**, **password**, **email**, **type**, **login_date**. The
**type** can be one of several types: admin, person, pet. Choose suitable
datatypes.  There are many different types in SQL and you should familiarise
yourself with lots of them. Keep a web browser handy bookmarked to a site such
as <https://www.techonthenet.com/mysql/datatypes.php> 

Now make the **username** attribute the primary key for this new 
table: `ALTER TABLE Users ADD PRIMARY KEY (username);`

Now add a record into the table: 
`INSERT INTO Users(username, password, email, type) VALUES ('hadley', 'poodlessmell', 'hadley@awesomedog.com', 'pet');

Note the use of single quotes to enclose text.  This is compulsory for text but
shouldn't be used for other attribute types. Look up how to add several records
at once. Now add about ten records to your table.

## Task

*Due 29/10/2019*

Show your tutor:

* how the table is constructed by typing `describe Users;` 
* the contents of your table by `select * from Users;`  
* Now show all records with a given user type such as person.  You will need to
  use where in your select statement. 
* Now show how you can order your results by username. You will need to use the
  `ORDER BY` clause

**[5 marks]**

