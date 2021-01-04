#!/usr/bin/env bash

SQL="SELECT * FROM degree_qualification ORDER by student_id;"

VALFILE=$(mktemp -t value_XXX)
EXPFILE=$(mktemp -t expected_XXX)

# using the -e flag prints out a table with formatting chars
echo "${SQL}" | mysql -u root cscm59_check > ${VALFILE}
if [ $? -ne 0 ]; then
  #>&2 echo "missing degree_classification view"
  # let mysql figure out the error
  exit 2
fi
echo "${SQL}" | mysql -u root cscm59_csv> ${EXPFILE}

# ignore whitespace and capitalization
diff -i -b -y ${VALFILE} ${EXPFILE} 

if [ $? -ne 0 ]; then
  >&2 echo "degree qualification view incorrect"
  exit 1
fi

rm ${VALFILE}
rm ${EXPFILE}

