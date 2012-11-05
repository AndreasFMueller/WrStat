#
# Makefile zum kompilieren des Skripts zur Vorlesung Wahrscheinlichkeit und
# Statistik, gehalten im Wintersemester seit 2006
#
# (c) 2006, Prof. Dr. Andreas Mueller, HSR
# $Id: Makefile,v 1.2 2008/09/12 21:29:30 afm Exp $
#
default:	algebra verteilungsfunktion abhaengigkeit total erwartung \
	power.eps 

verteilungsfunktion:	verteilungsfunktion.mp
	TEX=latex mpost verteilungsfunktion.mp
	for i in 1 2 3 4 5 6 7; \
	do \
		mptopdf verteilungsfunktion.$${i}; \
		pdf2ps verteilungsfunktion-$${i}.pdf; \
		ps2eps -f verteilungsfunktion-$${i}.ps; \
	done

abhaengigkeit:	abhaengigkeit.mp
	TEX=latex mpost abhaengigkeit.mp
	for i in 1 2 3 4 5; \
	do \
		mptopdf abhaengigkeit.$${i}; \
		pdf2ps abhaengigkeit-$${i}.pdf; \
		ps2eps -f abhaengigkeit-$${i}.ps; \
	done

algebra:	algebra.mp
	TEX=latex mpost algebra.mp
	for i in 1 2; \
	do \
		mptopdf algebra.$${i}; \
		pdf2ps algebra-$${i}.pdf; \
		ps2eps -f algebra-$${i}.ps; \
	done

total:	total.mp
	TEX=latex mpost total.mp
	mptopdf total.1
	pdf2ps total-1.pdf
	ps2eps -f total-1.ps

erwartung:	erwartung.mp
	TEX=latex mpost erwartung.mp
	for i in 1 2 3 4; \
	do \
		mptopdf erwartung.$${i}; \
		pdf2ps erwartung-$${i}.pdf; \
		ps2eps -f erwartung-$${i}.ps; \
	done

power.eps:	power.asy
	LANG=C asy power.asy

ohm.eps:	ohm.pdf
	pdf2ps ohm.pdf
	ps2eps -f ohm.ps

verzoegerungszeit.eps:	verzoegerungszeit.pdf
	pdf2ps verzoegerungszeit.pdf
	ps2eps -f verzoegerungszeit.ps
