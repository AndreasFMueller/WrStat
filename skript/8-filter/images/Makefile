#
# Makefile -- bilder für Kapitel 9
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
images:	faltung.pdf filterung.pdf

faltung.pdf:	faltung.tex
	pdflatex faltung.tex

filterung.pdf:	filterung.tex wienerpaths.tex
	pdflatex filterung.tex

wienerpaths.tex:	wiener1.m	
	octave < wiener1.m
