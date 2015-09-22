#
# Makefile zum kompilieren des Skripts zur Vorlesung Wahrscheinlichkeit und
# Statistik, gehalten im Wintersemester seit 2006
#
# (c) 2006, Prof. Dr. Andreas Mueller, HSR
# $Id: Makefile,v 1.2 2008/09/12 21:29:30 afm Exp $
#
all:	verteilungsfunktion abhaengigkeit algebra total erwartung ebola \
	zweiwuerfel power.eps 

verteilungsfunktion_FILES = verteilungsfunktion-1.pdf \
	verteilungsfunktion-2.pdf verteilungsfunktion-3.pdf \
	verteilungsfunktion-4.pdf verteilungsfunktion-5.pdf \
	verteilungsfunktion-6.pdf verteilungsfunktion-7.pdf
abhaengigkeit_FILES = abhaengigkeit-1.pdf abhaengigkeit-2.pdf \
	abhaengigkeit-3.pdf abhaengigkeit-4.pdf abhaengigkeit-5.pdf
algebra_FILES = algebra-1.pdf algebra-2.pdf
total_FILES = total-1.pdf
erwartung_FILES = erwartung-1.pdf erwartung-2.pdf erwartung-3.pdf \
	erwartung-4.pdf
ebola_FILES = ebola-1.pdf
zweiwuerfel_FILES = zweiwuerfel-1.pdf

verteilungsfunktion: $(verteilungsfunktion_FILES)
abhaengigkeit: $(abhaengigkeit_FILES)
algebra: $(algebra_FILES)
total: $(total_FILES)
erwartung: $(erwartung_FILES)
ebola: $(ebola_FILES)
zweiwuerfel: $(zweiwuerfel_FILES)

$(verteilungsfunktion_FILES):	verteilungsfunktion.mp
	TEX=latex mpost verteilungsfunktion.mp
	for i in 1 2 3 4 5 6 7 8 9 10; \
	do \
		mptopdf verteilungsfunktion.$${i}; \
	done

$(abhaengigkeit_FILES):	abhaengigkeit.mp
	TEX=latex mpost abhaengigkeit.mp
	for i in 1 2 3 4 5; \
	do \
		mptopdf abhaengigkeit.$${i}; \
	done

$(algebra_FILES):	algebra.mp
	TEX=latex mpost algebra.mp
	for i in 1 2; \
	do \
		mptopdf algebra.$${i}; \
	done

$(total_FILES):	total.mp
	TEX=latex mpost total.mp
	mptopdf total.1
	pdf2ps total-1.pdf
	ps2eps -f total-1.ps

$(erwartung_FILES):	erwartung.mp
	TEX=latex mpost erwartung.mp
	for i in 1 2 3 4; \
	do \
		mptopdf erwartung.$${i}; \
	done

$(ebola_FILES):	ebola.mp
	TEX=latex mpost ebola.mp
	for i in ebola.[0-9]*; \
	do \
		mptopdf $${i}; \
	done

$(zweiwuerfel_FILES):	zweiwuerfel.mp
	TEX=latex mpost zweiwuerfel.mp
	for i in zweiwuerfel.[0-9]*; \
	do \
		mptopdf $${i}; \
	done

power.eps:	power.asy
	LANG=C asy power.asy

