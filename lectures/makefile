
# TODO: keep track of local directory
# FIXME: don't create files on error

TEMPLATE := /home/tom/Talks/template.odp
ODP := odpdown
BIB := /home/tom/Papers/all.bib
CSL := /home/tom/Projects/website/site/csl/inline.csl

TEMPFILE := /tmp/ref_convert

%.odp: %.md $(TEMPLATE)
	pandoc --filter pandoc-citeproc --no-highlight -s $< --bibliography $(BIB) -t markdown-citations-fenced_code_attributes --csl $(CSL) | \
	  sed -e 's#()#(https://placedog.net/500)#g' > $(TEMPFILE)
	$(ODP) --break-master=section --content-master=content $(TEMPFILE) $(TEMPLATE) $@ 

%.pdf: %.odp
	soffice --headless --convert-to pdf:impress_pdf_Export $<


