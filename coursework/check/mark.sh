
checkdir=$(dirname $0)

${checkdir}/runchecks.sh
if [ $? -ne 0 ]; then
  exit 1
fi
${checkdir}/gen_schema.sh
  
# open pdfs
find . -name '*.pdf' -exec sh -c 'zathura {} &' \;
ristretto db_schema/diagrams/summary/relationships.real.large.png &
vim comments.txt *.log

