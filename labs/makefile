

HEADER := intro.md

%.pdf: %.md $(HEADER)
	cat $(HEADER) $< | pandoc -t latex -o $@


