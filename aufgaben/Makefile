#
# Makefile to build the problem collection
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
all:	aufgabensammlung.pdf

TEXFILES = aufgabensammlung.tex uebungen.tex \
	1.tex 2.tex 4.tex 5.tex 6.tex 7.tex 8.tex 9.tex r.tex

aufgabensammlung.pdf:	$(TEXFILES) aufgabensammlung.ind thema.tex
	pdflatex aufgabensammlung.tex uebungen.tex

thema.tex:      thema.tix mkthemaidx
	./mkthemaidx thema.tix thema.tex

thema.tix:      $(TEXFILES)
	pdflatex aufgabensammlung.tex

aufgabensammlung.ind:	$(TEXFILES) images
	touch aufgabensammlung.ind
	pdflatex aufgabensammlung.tex
	makeindex aufgabensammlung.idx

mkthemaidx:     mkthemaidx.cpp
	g++ -Wall -g -O -o mkthemaidx mkthemaidx.cpp

clean:
	rm -f *.dvi *.log ?.tex aufgabensammlung.pdf

1.tex:	buildchapter.sh 1/*.tex
	./buildchapter.sh 1 > 1.tex

2.tex:	buildchapter.sh 2/*.tex
	./buildchapter.sh 2 > 2.tex

3.tex:	buildchapter.sh 3/*.tex
	./buildchapter.sh 3 > 3.tex

4.tex:	buildchapter.sh 4/*.tex
	./buildchapter.sh 4 > 4.tex

5.tex:	buildchapter.sh 5/*.tex
	./buildchapter.sh 5 > 5.tex

6.tex:	buildchapter.sh 6/*.tex
	./buildchapter.sh 6 > 6.tex

7.tex:	buildchapter.sh 7/*.tex
	./buildchapter.sh 7 > 7.tex

8.tex:	buildchapter.sh 8/*.tex
	./buildchapter.sh 8 > 8.tex

9.tex:	buildchapter.sh 9/*.tex
	./buildchapter.sh 9 > 9.tex

r.tex:	buildchapter.sh r/*.tex
	./buildchapter.sh r > r.tex

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
