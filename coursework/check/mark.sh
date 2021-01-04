
checkdir=$(dirname $0)

${checkdir}/runchecks.sh
${checkdir}/gen_schema.sh
  
# open pdfs
find . -name '*.pdf' -exec sh -c 'zathura {} &' \;
ristretto db_schema/diagrams/summary/relationships.real.large.png &
vim comments.txt *.log

