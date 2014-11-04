#paper: *.tex *.bib
#	latex paper && bibtex paper  && latex paper && latex paper && dvipdf paper

GRAPHICS = $(patsubst %.eps,%.pdf,$(wildcard *.eps))

all:	paper

%.pdf:	%.eps
	epstopdf $^

paper: *.tex *.bib $(GRAPHICS)
	pdflatex paper && bibtex paper  && pdflatex paper && pdflatex paper

clean:
	rm -f *.aux *.log *.dvi *.pdf *.blg *.bbl

