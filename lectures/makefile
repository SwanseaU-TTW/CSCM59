
PANOPTS := --mathjax --no-highlight -V center=false -V history=false -V revealjs-url=../reveal.js --template=template.html
PANFILTERS := --lua-filter=./revealjs-codeblock.lua
BIBOPTS := --bibliography refs.bib --filter pandoc-citeproc

all: 1_introduction/1_introduction.html \
	   2_relationalmodel/2_relationalmodel.html \
	   3_sql/part1.html 3_sql/part2.html 3_sql/part3.html \
		 4_design/principles.html 4_design/practical.html \
		 5_views/views.html \
		 6_integrity/integrity.html \
		 7_optimisation/optimisation.html \
		 8_recovery/recovery.html \
		 9_concurrency/concurrency.html \
		 10_security/security.html \
		 11_oodb/oodb.html \
		 12_orm/orm.html \
		 13_foundations/foundations.html \
		 14_data_mining/data_mining.html 

%.html: %.md template.html 
	pandoc -s -t revealjs $(PANOPTS) $(BIBOPTS) $(PANFILTERS) -o $@ $<

clean:
	rm -f 1_introduction/1_introduction.html \
	      2_relationalmodel/2_relationalmodel.html \
	      3_sql/part1.html 3_sql/part2.html 3_sql/part3.html \
		    4_design/principles.html 4_design/practical.html \
		    5_views/views.html \
		    6_integrity/integrity.html \
		    7_optimisation/optimisation.html \
		    8_recovery/recovery.html \
		    9_concurrency/concurrency.html \
		    10_security/security.html \
		    11_oodb/oodb.html \
		    12_orm/orm.html \
		    13_foundations/foundations.html \
		    14_data_mining/data_mining.html 

