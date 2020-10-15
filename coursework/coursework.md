---
title: CSCM59, Coursework 2020 -- 2021 
subtitle: Deadline 11:00 a.m. on Wednesday 16/12/2020
author: Dr. T. Torsney-Weir
date: 15 September, 2020
numbersections: true
...


By submitting this coursework, electronically and/or hardcopy, you state that
you fully understand and are complying with the university's policy on
Academic Integrity and Academic Misconduct. The policy can be found at
<https://myuni.swansea.ac.uk/academic-life/academic-misconduct/>.

# Overview

The purpose of this coursework is to give you experience in designing,
implementing and querying a simple database. To achieve a good mark you will
need to demonstrate that you understand the principles of the Relational Model
and can implement it in a sensible, practical way. This coursework is worth 20%
of the module.

# Description of Task

Student progress through a curriculum

With the University's switch over from Blackboard to Canvas, let's try 
implementing our own. Maybe we can make it better :) One thing our system will
focus on, though is analytics rather than being a fancy content management
system.

# Entities

You'll need to support the following entities:

* To make things a bit easier (and for legal reasons) every university will
  have a completely separate database.
* The database needs to track students who log into the system. Each user will
  have a user name, first name, last name, student number,
  password, email, last login date and time, creation date and time, and 
  phone number (for resets!)
* Students have a student number and preferred name. 
* We only need to support 3 year bachelor programs (no masters, not part 
  time, etc). This is to simplify the amount of data you need to enter.
* The student number is and always will be unique and is assigned by an 
  administrator in the university.
* There are a number of modules offered by the university. Each module has a 
  name, academic year (i.e. 1st year, masters, etc), and code
* There are 2 semesters per year
* Each student is assigned to one course. To keep things simple, students
  cannot change courses. A course is a set of modules. To reduce the number of
  modules, assume a course only offers 2 modules per lecture. 
* For each semester, for each module, we need to store a lecturer name
* We need to store marks! Marks are integers between 0 and 100. Each student, 
  for each module, for each semester, will receive a mark at the end. If the
  student doesn't complete the module by the end of the semester then they'll
  get a 0. 
* During the semester no grades are entered

# Instructions

Design, build and populate a database in at least 3NF.  In general, tables
should not allow null values, and you should use the fewest tables possible.
Then interrogate your database to ascertain the answers to the following
questions:

1. Show the name and number of columns for all your tables.
2. Show the attribute names and types for all your your tables, 
   and the primary and foreign keys.
3. What integrity constraints are there for each of your tables?
4. What students are enrolled in my lecures? Create a view called `enrollment`
   with columns `lecturer`, `module_code`, `student_id`, and `student_name`.
   `student_name` is a combination of the first and last name. This should
   only contain lectures that are in progress.
5. For each student in the module, it would be good to get some statistics
   on past student performance. Create a view called `past_performance` with
   columns `module_code`, `past_module_code`, `mark_average`, `mark_variance`,
   `mark_high`, `mark_low`, `num_students`
6. For a single module in a semester, show the average, variance, and number 
   of students. Create a view called `module_performance` with columns
   `module_code`, `module_name`, `mark_average`, `mark_variance`, `mark_high`, 
   `mark_low`, `num_students`. 
7. We need a query for the final degree qualification. So, for each student 
   who's completed 3 years of study, show the average grade from all modules
   over the last 2 years. Create a view called `degree_qualification` which 
   only contains students who completed 3 years of study. It needs columns
   `student_id`, `student_name`, and `final_mark` which is the above mentioned
   average.

Do not spend hours putting large amounts of data into your database. 
Satisfy your self with sufficient data to interrogate sensibly.

Where these questions ask you to create a view. Please be precise! Do not change
the table or column names and make sure you have only those columns.

# Submission

When you have finished interrogating your database put the results into a
3 files: 

* The sql code to create and populate the database as a single text file.
* Put the session (i.e. the executed SQL statements and the results
  obtained) into a text sql file. For questions 4--7 you can likely just select
  from the view you created.
* Draw a Functional Dependency diagram for each table. This can be drawn 
  freehand if you wish but you must then scan it into a pdf file before 
  submitting. I will not accept hardcopies. Consider using a free drawing 
  package for Windows here: <http://dia-installer.de/>. 

Zip all files into a single zipped folder and submit that to Canvas in the
usual way.  Late submission will be awarded 0%, in line with University
guidelines.

# Marking

Marks will be awarded according to the marking rubric on Canvas. Under
normal circumstances all course works will be marked by 3rd January, 2021. 
Course works are usually marked more quickly than this.

# Feedback

All individual feedback will be contained in the marking rubric notes. 

# Unfair Practice 

This is an individual assignment. You are allowed to discuss
the work with your colleagues, but the work you submit must be your own. Any
evidence of collusion, plagiarism, or any other form of Unfair Practice will be
investigated and, if found proven, penalised according to University Guidelines.
If you are in any doubt about any aspect of the work, or the meaning of Unfair
Practice as defined by Swansea University, you should seek
advice before submitting your work. This coursework must be submitted
electronically, as described in section 3 above, but by submitting it to
Blackboard you are agreeing to the statement made on the standard
College of Science Coursework Submission Form.

