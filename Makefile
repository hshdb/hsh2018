PANDOC=~/.pandoc/bin/pandoc-2.1.3
OPTIONS=--from=markdown+smart --slide-level=2 -H header-include.tex -V theme:metropolis

.SUFFIXES: .md .pdf

default: slides.pdf

.md.pdf:
	${PANDOC} ${OPTIONS} -F multifilter -t beamer $< -o $@

notes.odt: slides.md
	${PANDOC} --from=markdown+smart -F notes.pl $< -o $@
