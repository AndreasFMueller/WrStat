#
# Makefile -- build probability and statistics script
#
# (c) 2009 Prof Dr Andreas Mueller
# $Id$
#
all:	skript.pdf checklist.pdf

include 0-einleitung/Makefile.include
include 1-kombinatorik/Makefile.include
include 2-ereignisse/Makefile.include
include 3-zufallsvariable/Makefile.include
include 4-verteilung/Makefile.include
include 5-katalog/Makefile.include
include 6-schaetzen/Makefile.include
include 7-testen/Makefile.include
include 8-filter/Makefile.include
include a-datenblaetter/Makefile.include
include b-tabellen/Makefile.include

SOURCES =								\
	$(sources0)							\
	$(sources1)							\
	$(sources2)							\
	$(sources3)							\
	$(sources4)							\
	$(sources5)							\
	$(sources6)							\
	$(sources7)							\
	$(sources8)							\
	$(sourcesa)							\
	$(sourcesb)							\
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

