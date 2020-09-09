---
title: CSCM59 Relational and Object-Oriented Databases Lab
...

The goal of this set of lab exercises is to get you up and running with some
basic SQL skills and database design.  Text in **Bold** and *ITALICS* should be
typed in exactly as written (except that SQL is not case sensitive).  Don't
forget the semi-colon to end each statement.  I will not be giving all
necessary code so you must be prepared to investigate much of it for yourself.
You will learn more this way.Try an online tutorial such as
<https://www.techonthenet.com/mysql/index.php>. Text preceded by “Task n” needs
to be checked by the tutor in order to gain credit.  Make sure your work is
checked off as you progress.  The lab classes are worth 10% of this module.

There is a SQL tutorial on blackboard at 
<https://bb.swan.ac.uk/bbcswebdav/pid-3498349-dt-content-rid-3682811_2/xid-3682811_2>.

Log into mysql:

1. Load the Sql command line app. Specialists Apps->College of Science->Computer Science->xampp 7
2. Start mysql by clicking the "start" button
3. Click the "shell" button to get to the command line
4. Connect to the mysql server: `mysql.exe -u root mysql`


# Saving/restoring your database

Right now mysql on the lab machines is configured to use the C drive to save
your database. This means that if you do your work on one lab machine, when you
come back and are at a different machine you won't have your database anymore.
Rather than restarting your work each week you can restore your database at
the beginning of the lab and save it at the end of the lab. **Even if you use
the same lab machine week to week, don't rely on the data being permanent on 
the C drive!** Other labs may erase the database or the machines may be 
upgraded during the semester. It's best to keep a backup of your work on your
personal drive

## Saving your database to your P drive

Your P drive is your own. I recommend saving all your coursework here since it
will sync across the lab machines on campus, wheee!

If you're still inside the mysql command line, quit out of it first: `exit;`
To save your database to your P drive (e.g. at the end of the lab session) 
run from the command line:
```
mysqldump -u root --databases SocialNetwork > P:\cscm59_db.sql
``` 
`P:\cscm59_db.sql` is the filename where you want your db to be saved. It will
save your database in a single file using sql commands to recreate the
structure and data. Using plain text to save your database is convenient. If
there are any errors when you restore your database you can manually edit the
file to address the errors. This file is also easy to version control.

## Restoring your database from your P drive

At the beginning of the lab session or if you make a mistake and want to go
back you can restore the database from your backup. 

1. First log into mysql: `mysql.exe -u root mysql`
2. Drop the old version of the database: `DROP DATABASE SocialNetwork;` The old
   version of the database will be deleted permanently. There's no going back
   now!
3. Tell mysql to read your backup file and execute the commands in there:
   `source P:\cscm59_db.sql`
4. Now use your library database again: `use SocialNetwork;`

# Due dates

The labs are due the next lab class after they are assigned. For example, if
the lab is introduced on 15 Oct then you will need to finish it by the 
following week. If there is no lab session one week, then you have extra 
time :)

