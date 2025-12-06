#
# Makefile -- build the KSdiagramm form
#
# (c) 2025 Prof Dr Andreas Müller 
#
all:	kspaper.pdf

ksdiagramm.pdf:	ksdiagramm.tex graph.tex
	pdflatex ksdiagramm.tex
kspaper.pdf:	kspaper.tex ksdiagramm.pdf
	pdflatex kspaper.tex
