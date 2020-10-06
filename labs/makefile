

HEADER := intro.md

lab1.pdf: lab1.md
	pandoc -t latex -o $@ $<

%.pdf: %.md $(HEADER)
	cat $(HEADER) $< | pandoc -t latex -o $@


