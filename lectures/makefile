
PANOPTS := -V center=false -V history=false -V revealjs-url=../reveal.js --template=template.html
#BIBOPTS := --bibliography refs.bib --filter pandoc-citeproc

all: 1_introduction/1_introduction.html

%.html: %.md template.html 
	pandoc -s -t revealjs $(PANOPTS) $(BIBOPTS) -o $@ $<

clean:
	rm -f 1_introduction/1_introduction.html
