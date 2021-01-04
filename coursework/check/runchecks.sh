#!/usr/bin/env bash

mydir=$(dirname $0)

# db setup
${mydir}/setup_db.sh 2>&1 > setup_db.log
errcode=$?
if [ $errcode -eq 0 ]; then
  score=10
  comments=""
elif [ $errcode -eq 1]; then
  score=0
  comments="sql files don't load --- see log"
elif [ $errcode -eq 2 ]; then
  score=0
  comments="no sql file submitted"
elif [ $errcode -eq 3 ]; then
  score=0
  comments="too many sql files"
else
  score=10
  comments="check check check"
fi

sed "s/\(sql file loads properly|10\).*/\1|${score}|${comments}/" comments.txt > tmp
mv tmp comments.txt

# run checks
${mydir}/test1.sh > enrollment_diff.log 2>&1  
errcode=$?
if [ $errcode -eq 0 ]; then
  score=5
  comments=""
elif [ $errcode -eq 1 ]; then
  score=2
  comments="enrollment view incorrect -- see log"
elif [ $errcode -eq 2 ]; then
  score=0
  comments="enrollment view missing"
else
  score=5
  comments="check check check"
fi
sed "s/\(enrollment|5\).*/\1|${score}|${comments}/" comments.txt > tmp
mv tmp comments.txt

${mydir}/test2.sh > past_performance_diff.log 2>&1
errcode=$?
if [ $errcode -eq 0 ]; then
  score=5
  comments=""
elif [ $errcode -eq 1 ]; then
  score=2
  comments="past_performance view incorrect -- see log"
elif [ $errcode -eq 2 ]; then
  score=0
  comments="past_performance view missing"
else
  score=5
  comments="check check check"
fi
sed "s/\(past_performance|5\).*/\1|${score}|${comments}/" comments.txt > tmp
mv tmp comments.txt

${mydir}/test3.sh > module_performance_diff.log 2>&1
errcode=$?
if [ $errcode -eq 0 ]; then
  score=5
  comments=""
elif [ $errcode -eq 1 ]; then
  score=2
  comments="module_performance view incorrect -- see log"
elif [ $errcode -eq 2 ]; then
  score=0
  comments="module_performance view missing"
else
  score=5
  comments="check check check"
fi
sed "s/\(module_performance|5\).*/\1|${score}|${comments}/" comments.txt > tmp
mv tmp comments.txt

${mydir}/test4.sh > degree_qualification.log 2>&1 
errcode=$?
if [ $errcode -eq 0 ]; then
  score=5
  comments=""
elif [ $errcode -eq 1 ]; then
  score=2
  comments="degree_qualification view incorrect -- see log"
elif [ $errcode -eq 2 ]; then
  score=0
  comments="degree_qualification view missing"
else
  score=5
  comments="check check check"
fi
sed "s/\(degree_qualification|5\).*/\1|${score}|${comments}/" comments.txt > tmp
mv tmp comments.txt

