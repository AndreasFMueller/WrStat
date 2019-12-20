#
# Makefile -- build probability and statistics script
#
# (c) 2009 Prof Dr Andreas Mueller
# $Id$
#
all:	skript.pdf checklist.pdf

SOURCES =								\
	0-einleitung/einleitung.tex					\
	1-kombinatorik/kombinatorik.tex					\
	2-ereignisse/wahrscheinlichkeit.tex				\
	2-ereignisse/spamfilter.tex					\
	2-ereignisse/google.tex						\
	3-zufallsvariable/erwartung.tex					\
	3-zufallsvariable/learning.tex					\
	4-verteilung/verteilung.tex					\
	5-katalog/binomialverteilung.tex				\
	5-katalog/chi2verteilung.tex					\
	5-katalog/dgleichverteilung.tex					\
	5-katalog/diskrete-verteilungen.tex				\
	5-katalog/exponentialverteilung.tex				\
	5-katalog/gleichverteilung.tex					\
	5-katalog/hypergeometrisch.tex					\
	5-katalog/normalverteilung.tex					\
	5-katalog/poissonverteilung.tex					\
	5-katalog/potenzverteilung.tex					\
	5-katalog/stetige-verteilungen.tex				\
	6-schaetzen/schaetzen.tex					\
	7-testen/testen.tex						\
	8-filter/filter.tex						\
	a-datenblaetter/datenblaetter.tex				\
	a-datenblaetter/db-binomialverteilung.tex			\
	a-datenblaetter/db-exponentialverteilung.tex			\
	a-datenblaetter/db-gleichverteilung.tex				\
	a-datenblaetter/db-normalverteilung.tex				\
	a-datenblaetter/db-paretoverteilung.tex				\
	a-datenblaetter/db-poissonverteilung.tex			\
	b-tabellen/tabellen.tex						\
	generatoren.tex			\
	junkscience.tex 				\
	skript.tex 

skript.pdf:	$(SOURCES) skript.ind
	pdflatex skript.tex

skript.ind:	images skript.tex $(SOURCES) images-subdir tacho-subdir
	touch skript.ind
	pdflatex skript.tex
	makeindex skript.idx

images-subdir:	
	cd images; make

tacho-subdir:
	cd tacho; make

checklist.pdf:	checklist.tex
	pdflatex checklist.tex

skriptparts:	skript.pdf
	cd parts; make

