---
title: Security
date: 20 Nov, 2020
author: Thomas Torsney-Weir
modcode: CSCM59
modname: Relational and Object-Oriented Database Systems
theme: ttw
slideNumber: true
---



## Introduction

Security is different to Integrity

* **Security** 
    - protecting data from unauthorised users
    - making sure people are allowed to do something
* **Integrity** 
    - protecting data from authorised users
    - making sure the thing someone is trying to do is correct

* **Constraints** are required
    - specified in some suitable language 
    - stored in the system
    - system must monitor operations to ensure constraints are enforced

## Outline

* Concepts
* Implementation 1: Discretionary control
* Implementation 2: Mandatory control

## Aspects of security

* **Legal, social and ethical**: is the user allowed access?
* **Physical controls**: Is the terminal locked?
* **Policy questions**: who decides who is allowed access?
* **Operational**: if passwords are used how is their integrity enforced?
* **Operating system support**: is main memory erased when no longer needed? What about the recovery log?
* **DBMS**: our main concern

## Legal, social, ethical

Is the user allowed access?

![<https://www.vice.com/en/article/bjp9zv/facebook-employees-look-at-user-data>](images/fb_problem.png){height="620px"}

## Physical controls

![<https://www.getsafeonline.org/news/council-fined-for-data-breach-after-laptops-stolen/>](images/laptops_stolen.png){height="620px"}

## Policy questions

Who decides who is allowed access?

![<https://www.swansea.ac.uk/business-and-industry/newsletter/privacy-policy/>](images/su_data_protection.png){height="620px"}

## Operational 

if passwords are used how is their integrity enforced?

![<https://xkcd.com/936/>](images/password_strength.png)

## OS support

![&nbsp;](images/intel1.png)

![<https://www.theregister.com/2018/01/02/intel_cpu_design_flaw/>](images/intel2.png)

## Database design

* 'Who can do what' is a policy decision
* DBMS only enforces policy decisions
* Security is another type of *constraint*
    * saved in catalog
    * specified with SQL

::: notes
* There must be a means of checking requests against constraints.
* The system must be able to recognise the source of a request. 
  (note: a single id may be given to several users)
:::

## Implementations

Discretionary control
: Each user is given rights over certain objects for certain operations

. . .

Mandatory control
: Each user and each object is given a level, and typically cannot access anything above that level
: **Not in MySQL**

## Discretionary control

* We need a language in which we can express constraints
* Easier to state what is allowed than what is forbidden

Example:
```
	GRANT	<priviledge list>
	ON    <relvar name>
	TO    <user id list>;
```

## Language

```sql
GRANT SELECT, DELETE
	ON  S
	TO  Jim, Fred, Mary;
```

**NOTE**: "all" can be used as a legal id

more: <https://dev.mysql.com/doc/refman/5.7/en/grant.html>

## Privileges

* SELECT
* INSERT
* DELETE
* UPDATE
* ALL

**NOTE**: Often queries will touch other unexpected other objects (e.g. views)

One can also grant privileges to create, drop, rename etc, etc. 

## Not authorized?

What happens when authority is not allowed for an enquiry?

* **Ideas**
    * Send error message. Careful not to be too explicit!
    * Lock terminal?
    * Terminate program?
    * Keep a log of all requests?...or maybe just refused requests?

## Implementations

Discretionary control **(Done!)**
: Each user is given rights over certain objects for certain operations

Mandatory control
: Each user and each object is given a level, and typically cannot access anything above that level
: **Not in MySQL**

## Mandatory control

* Each data object has a level
* Each user has a level

Then:

Simple security policy
: User x can retrieve object y only if level x >= level y

Star property
: User x can update object y only if x = y

## How it works

* Each tuple must have an extra attribute containing its level
* Anything written by user level $x$ has that value automatically

![&nbsp;](images/tbl_demo.svg)

## Example

* User U3 = level 3
* User U2 = level 2

```sql
SELECT * FROM mydata;
```

![&nbsp;](images/tbl_demo.svg)

. . .

* U3 sees four tuples
* U2 sees two tuples

## Implementation details

`S where city = "London"`

Becomes

`S where city  = "London" and level <= user level;`

Must be invisible to user

## Problems?

![&nbsp;](images/tbl_demo.svg)

* User U3 will be able to see four tuples
* Will be unaware that supplier S4 exists.

So following request seems reasonable:

```sql
Insert into S tuple	{`s#` = s4,
			Sname = Baker,
			Status = 25,
			City = Rome,
			};
```

## Problems?

This will need to become:

```sql
Insert into S tuple	{`s#` = s4,
			Sname = Baker,
			Status = 25,
			City = Rome,
			Level = 3
			};
```

* **Note**: implicitly the primary key now is a composite key of S# and level
* Different users with different levels see completely different views of data

## Summary

* Policy decisions are made outside the DBMS
* Job of DBMS is to enforce decisions
* Implementation 1: Discretionary control
* Implementation 2: Mandatory control


