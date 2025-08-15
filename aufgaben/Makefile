#
# Makefile to build the problem collection
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
all:
	@echo choose test, sammlung or 'woche(0[1-9]|1[0-4])'

test:	test.pdf

sammlung:	aufgabensammlung.pdf

topdir := ${PWD}
workdir := work

makeindex = makeindex
pdflatex = pdflatex --output-directory=$(workdir)
bibtex = bibtex
touch = touch

TEXFILES = aufgabensammlung.tex						\
	macros/uebungen.tex						\
	macros/packages.tex						\
	macros/front.tex						\
	macros/content.tex						\
	$(workdir)/1.tex						\
	$(workdir)/2.tex						\
	$(workdir)/4.tex						\
	$(workdir)/5.tex						\
	$(workdir)/6.tex						\
	$(workdir)/7.tex						\
	$(workdir)/8.tex						\
	$(workdir)/9.tex						\
	$(workdir)/r.tex

aufgabensammlung.pdf:	$(workdir)/aufgabensammlung.pdf
	cp $(workdir)/aufgabensammlung.pdf .

$(workdir)/aufgabensammlung.pdf:	$(TEXFILES) \
	$(workdir)/aufgabensammlung.ind $(workdir)/thema.tex
	$(pdflatex) aufgabensammlung.tex

$(workdir)/aufgabensammlung.ind:	$(TEXFILES) \
	$(workdir)/aufgabensammlung.idx
	cd $(workdir) ; $(makeindex) aufgabensammlung.idx

$(workdir)/aufgabensammlung.idx:	$(TEXFILES) \
	aufgabensammlung.tex
	$(touch) $(workdir)/aufgabensammlung.ind
	$(pdflatex) aufgabensammlung.tex

$(workdir)/thema.tex:      $(workdir)/thema.tix bin/mkthemaidx
	cd $(workdir); ../bin/mkthemaidx thema.tix thema.tex

bin/mkthemaidx:     bin/mkthemaidx.cpp
	cd bin; make

$(workdir)/thema.tix:      $(TEXFILES) 
	cd $(workdir); $(pdflatex) aufgabensammlung.tex

$(workdir)/1.tex:	bin/buildchapter.sh 1/*.tex
	bin/buildchapter.sh 1 > $(workdir)/1.tex

$(workdir)/2.tex:	bin/buildchapter.sh 2/*.tex
	bin/buildchapter.sh 2 > $(workdir)/2.tex

$(workdir)/3.tex:	bin/buildchapter.sh 3/*.tex
	bin/buildchapter.sh 3 > $(workdir)/3.tex

$(workdir)/4.tex:	bin/buildchapter.sh 4/*.tex
	bin/buildchapter.sh 4 > $(workdir)/4.tex

$(workdir)/5.tex:	bin/buildchapter.sh 5/*.tex
	bin/buildchapter.sh 5 > $(workdir)/5.tex

$(workdir)/6.tex:	bin/buildchapter.sh 6/*.tex
	bin/buildchapter.sh 6 > $(workdir)/6.tex

$(workdir)/7.tex:	bin/buildchapter.sh 7/*.tex
	bin/buildchapter.sh 7 > $(workdir)/7.tex

$(workdir)/8.tex:	bin/buildchapter.sh 8/*.tex
	bin/buildchapter.sh 8 > $(workdir)/8.tex

$(workdir)/9.tex:	bin/buildchapter.sh 9/*.tex
	bin/buildchapter.sh 9 > $(workdir)/9.tex

$(workdir)/r.tex:	bin/buildchapter.sh r/*.tex
	bin/buildchapter.sh r > $(workdir)/r.tex

wochen:	woche01 woche02 woche03 woche04 woche05 woche06 woche07 woche08 \
	woche09 woche10 woche11 woche12 woche13

woche01:	woche01.pdf
woche01.pdf:	woche01.tex $(TEXFILES)
	$(pdflatex) woche01.tex
	cp $(workdir)/woche01.pdf .

woche02:	woche02.pdf
woche02.pdf:	woche02.tex $(TEXFILES)
	$(pdflatex) woche02.tex
	cp $(workdir)/woche02.pdf .

woche03:	woche03.pdf
woche03.pdf:	woche03.tex $(TEXFILES)
	$(pdflatex) woche03.tex
	cp $(workdir)/woche03.pdf .

images:
	for d in ?/*; \
	do \
		if [ -d $${d} -a -r $${d}/Makefile ]; \
		then \
			echo $${d}; \
			cd $${d}; \
			make || exit 1; \
			cd ../..; \
		fi; \
	done

$(workdir)/test.pdf:	test.tex testaufgabe.tex $(TEXFILES)
	$(pdflatex) test.tex

test.pdf:	$(workdir)/test.pdf
	cp $(workdir)/test.pdf .
