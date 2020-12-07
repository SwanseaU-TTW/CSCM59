---
title: Data mining
date: 08 Dec, 2020
author: Thomas Torsney-Weir
modcode: CSCM59
modname: Relational and Object-Oriented Database Systems
theme: ttw
slideNumber: true
---

## Decision support

Decision support systems help in the analysis of business information.

Their aim is to help management spot trends, pinpoint problems and make intelligent decisions

These days – analytics engines

## General aspects

* Primarily read-only: Updating usually limited to periodic refresh and load.
* Deletes and inserts are rare.
* Updates almost never.
* Columns tend to be used in combination.
* Integrity generally not a concern (assumed to be correct when loaded).
* Keys often include a temporal component.
* Databases tend to be large, especially when data accumulated over time.
* The database tends to be heavily indexed.
* Often involves various kinds of (controlled) redundancy.

## Example

```sql
select p.display_name as loan_officer, o.display_name as branch, 
       d.month_name, sum(disbursal_count) as disbursals,
       sum(disbursal_amount) as disbursal_amount
from fact_loan_disbursals disb
join dim_date d on d.date_key = disb.disbursal_date_key
join dim_office o on o.office_key = disb.branch_key
join dim_personnel p on p.personnel_key = disb.loan_officer_key
where d.year4 = 2009
  and p.is_loan_officer is true
group by p.display_name, o.display_name, d.month_number
order by p.display_name, o.display_name, d.month_number
```

## Boolean expression complexity

* Complicated expressions in where clause.
* Hard to write.
* Hard to understand.

## Boolean expression complexity

``` {.sql data-line-numbers="|8-9"}
select p.display_name as loan_officer, o.display_name as branch, 
       d.month_name, sum(disbursal_count) as disbursals,
       sum(disbursal_amount) as disbursal_amount
from fact_loan_disbursals disb
join dim_date d on d.date_key = disb.disbursal_date_key
join dim_office o on o.office_key = disb.branch_key
join dim_personnel p on p.personnel_key = disb.loan_officer_key
where d.year4 = 2009
  and p.is_loan_officer is true
group by p.display_name, o.display_name, d.month_number
order by p.display_name, o.display_name, d.month_number
```

## Join complexity

* In a fully normalised database queries can involve joins over several tables.
* Designers often tend to "denormalise" tables.

## Join complexity

``` {.sql data-line-numbers="|4-7"}
select p.display_name as loan_officer, o.display_name as branch, 
       d.month_name, sum(disbursal_count) as disbursals,
       sum(disbursal_amount) as disbursal_amount
from fact_loan_disbursals disb
join dim_date d on d.date_key = disb.disbursal_date_key
join dim_office o on o.office_key = disb.branch_key
join dim_personnel p on p.personnel_key = disb.loan_officer_key
where d.year4 = 2009
  and p.is_loan_officer is true
group by p.display_name, o.display_name, d.month_number
order by p.display_name, o.display_name, d.month_number
```

## Functional complexity

* Queries involve statistics.
* Traditional SQL implementations slow to provide support, therefore queries often broken down into several queries and statistical analysis carried out separately.

## Functional complexity

``` {.sql data-line-numbers="|2-3,10"}
select p.display_name as loan_officer, o.display_name as branch, 
       d.month_name, sum(disbursal_count) as disbursals,
       sum(disbursal_amount) as disbursal_amount
from fact_loan_disbursals disb
join dim_date d on d.date_key = disb.disbursal_date_key
join dim_office o on o.office_key = disb.branch_key
join dim_personnel p on p.personnel_key = disb.loan_officer_key
where d.year4 = 2009
  and p.is_loan_officer is true
group by p.display_name, o.display_name, d.month_number
order by p.display_name, o.display_name, d.month_number
```

## Analytical complexity

* Again, queries involve several "sub-queries", can be prevented by SQL implementations

## Physical and Logical design

If a specific type of query (e.g. if a join over table X and table Y is the
dominant type then it makes sense to "pre-join" those tables at the physical
level).

This should not be reflected at the logical level! (though the optimiser must
be aware of the existence of the pre-joined table.)

## Data warehouses

Decision  support systems  are usually (very) large special databases,
collected by querying several separate databases and stored in a separate
location.

This allows the periodic intensive querying to take place without impacting on
the normal workplace databases.

## Large databases

* Can be several terabytes in size.
* Performance tuning can be hard (growing by up to 50% per year)
* **Scalability a problem**
    * Database design ("unnormalised")
    * Inefficient use of relational operations
    * Weaknesses in DBMS implementations
    * Lack of scalability in DBMSs
    * Architectural design errors

## Business queries

* What if...?

If a customer buys soap, will he also buy toothpaste?

...within x days...

## Dimensional schemas

* **Two types of table**
    * Fact table
    * Dimensional tables

Often called **star schemas** because of the ER diagram

## Example

::::::::: {.columns}
::: {.column}
### SP
![SP table](images/sp_tbl.svg)
:::
::: {.column}
### TI
![TI table](images/ti_tbl.svg)
:::
::::::::: 

## Star Schema

![star schema](images/star_schema.svg)

## Multi-Dimensional schemas

All data so far has been seen as 2-dimensional.e.g:
![&nbsp;](images/2d_tbls.svg)

## Multi-Dimensional schemas

Data in warehouses can more easily be viewed as a cube (or hypercube)

Each cell of the hypercube contains summary stats for that set of criteria

![olap cube](images/olap_cube.svg)



## Pivoting

By "pivoting" a (hyper)cube around an axis we get a different interpretation

![olap cube](images/olap_cube.svg)

## Summary


