#!/usr/bin/env bash

TMPDIR=$(mktemp -d)
TESTFILE=${TMPDIR}/cscm59.sql

# find the sql file
IFS=$'\n'
sqlfile=$(grep -r -i -l '^CREATE TABLE' *)

# make sure we have exactly 1 sql file
let numfiles=0
for f in ${sqlfile}; do
  let numfiles++
done
if [ $numfiles -eq 0 ]; then
  >&2 echo "no sql files found" 
  exit 2
elif [ $numfiles -gt 1 ]; then
  >&2 echo "too many sql files found" 
  exit 3
fi

# see if the views are in another file
IFS=$'\n'
viewfile=$(grep -r -i -l '^CREATE .*VIEW' *)
let numviewfiles=0
for f in ${sqlfile}; do
  let numviewfiles++
done
if [ $numviewfiles -gt 1 ]; then
  >&2 echo "too many view/answer files"
  exit 4
fi

# create a sql file to setup the db
echo 'DROP DATABASE if exists cscm59_check;' > ${TESTFILE}
echo 'CREATE DATABASE cscm59_check;' >> ${TESTFILE}
echo 'USE cscm59_check;' >> ${TESTFILE}
cat "${sqlfile}" | grep -i -v '^create database' | grep -i -v '^use ' >> ${TESTFILE}
if [ $numviewfiles -eq 1 ]; then
  sed -e '/CREATE .*VIEW/I,/;/!d' "${viewfile}" >> ${TESTFILE}
fi

# load the database
mysql -u root < ${TESTFILE} 2>&1 # let mysql print errors

# check that creation worked
if [ $? -ne 0 ]; then
  exit 1
fi


