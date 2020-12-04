---
documentclass: extarticle
fontsize: 14pt
header-includes: \pagenumbering{gobble}
---

# Example database

The database has 6 relations. You may assume that the same column name in 2 
tables indicates a primary/foreign key pair:

* **Branch**(Bname, Bcity, assets)
* **Customer**(Cname, street, city)
* **Account**(Anumber, Bname, balance)
* **Loan**(Lnumber, Bname, amount)
* **Depositor**(Cname, Anumber)
* **Borrower**(Cname, Lnumber)

\newpage

# Relational algebra

The 5 operators are:

* Union
* Difference
* Cartesian Product (times, \*)
* Selection (where)
* Projection (\{\})

# Relational calculus

$\{t | P(t)\}$

* $t$ is the set of tuples
* $P(t)$ is a predicate function
* $t.A$ or $t[A]$ means attribute $A$ of tuple $t$
* $t \in r$ means tuple $t$ in relation $r$

## Useful first-order logic primitives

* $\forall$: forall. $\forall t \in r P(t)$ The condition must be true for all tuples.
* $\exists$: exists. $\exists t \in r P(t)$ There must be at least one tuple where the 
                     condition holds true.
* comparisons: $<$, $=$, $>$, $\leq$, $\geq$, $\neq$
* connectives: not ($\neg$), if ($\Rightarrow$), iff (if and only if, $\iff$), 
               and ($\land$), or ($\lor$)

\newpage

# Example query 1

Find the loan number for each loan of an amount greater than $1200$

## Relational algebra

\vspace{7cm}

## Relational calculus

\newpage

# Example query 2

Find the branch name, branch city, and loan amount for loans of more than $1200$

## Relational algebra

\vspace{7cm}

## Relational calculus

\newpage

# Example query 3

Find the name of all customers with a loan from the Swansea branch and the 
city in which they live.

## Relational algebra

\vspace{7cm}

## Relational calculus

