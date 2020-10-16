
PANOPTS := --no-highlight -V center=false -V history=false -V revealjs-url=../reveal.js --template=template.html
BIBOPTS := --bibliography refs.bib --filter pandoc-citeproc

all: 1_introduction/1_introduction.html \
	   2_relationalmodel/2_relationalmodel.html \
	   3_sql/part1.html 3_sql/part2.html

%.html: %.md template.html 
	pandoc -s -t revealjs $(PANOPTS) $(BIBOPTS) -o $@ $<

clean:
	rm -f 1_introduction/1_introduction.html
