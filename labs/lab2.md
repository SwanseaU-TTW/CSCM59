
# Task 2

From the previous lab we made a users table so people could log in but there
was no way of tracking their social network. Let's do that now!

Create a table to link users with each other. We're going to assume that social
links are mutual, i.e. if A is linked to B then B is linked to A. We also want
to store the date the link was created. In summary, create a table called
**Links** with columns: **link_id**, **link_a**, **link_b**, **creation_date**.
No columns should be null. The primary key is **link_id**. You will also need
to add foreign key constraints for **link_a** and **link_b**. 

Now populate the `Links` table with at least 10 different links.

## Task

*Due 05/11/2019*

Show your tutor:

* how the table is constructed by typing `describe Links;` 
* the contents of your table by `select * from Links;`  
* show all social links where at least one of them is a pet. *HINT*: you will
  need to join the `Users` table twice

**[5 marks]**

