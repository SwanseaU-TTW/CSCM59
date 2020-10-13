

LABS := lab1.pdf lab2.pdf

all: $(LABS)

.PHONY := all

%.pdf: %.md
	pandoc -t latex -o $@ $<


