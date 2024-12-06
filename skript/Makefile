#
# Makefile -- build probability and statistics script
#
# (c) 2009 Prof Dr Andreas Mueller
# $Id$
#
all:	skript.pdf checklist.pdf

include 3-zufallsvariable/Makefile.include
include 6-schaetzen/Makefile.include
include 7-testen/Makefile.include

SOURCES =								\
	0-einleitung/einleitung.tex					\
	1-kombinatorik/kombinatorik.tex					\
	2-ereignisse/wahrscheinlichkeit.tex				\
	2-ereignisse/spamfilter.tex					\
	2-ereignisse/google.tex						\
	$(sources3)							\
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
	$(sources6)							\
	$(sources7)							\
	8-filter/filter.tex						\
	8-filter/zweiquellen.tex					\
	8-filter/einfuehrung.tex					\
	8-filter/problemstellung.tex					\
	8-filter/loesung.tex						\
	8-filter/positionsmessung.tex					\
	8-filter/hoehenmesser.tex					\
	a-datenblaetter/datenblaetter.tex				\
	a-datenblaetter/db-binomialverteilung.tex			\
	a-datenblaetter/db-exponentialverteilung.tex			\
	a-datenblaetter/db-gleichverteilung.tex				\
	a-datenblaetter/db-normalverteilung.tex				\
	a-datenblaetter/db-paretoverteilung.tex				\
	a-datenblaetter/db-poissonverteilung.tex			\
	b-tabellen/tabellen.tex						\
	b-tabellen/chi2.tex						\
	b-tabellen/ftable.tex						\
	b-tabellen/ks.tex						\
	b-tabellen/norm.tex						\
	b-tabellen/normquant.tex					\
	b-tabellen/t.tex						\
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

