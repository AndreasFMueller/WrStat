#
# Makefile -- build probability and statistics script
#
# (c) 2009 Prof Dr Andreas Mueller
# $Id$
#
all:	skript.pdf checklist.pdf

SOURCES = einleitung.tex wahrscheinlichkeit.tex laplace.tex	\
	erwartung.tex verteilung.tex stetige-verteilungen.tex	\
	diskrete-verteilungen.tex schaetzen.tex 		\
	testen.tex filter.tex generatoren.tex			\
	spamfilter.tex tabellen.tex 				\
	google.tex junkscience.tex 				\
	tabellen.tex skript.tex kombinatorik.tex

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

