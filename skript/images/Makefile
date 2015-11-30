#
# Makefile zum kompilieren des Skripts zur Vorlesung Wahrscheinlichkeit und
# Statistik, gehalten im Wintersemester seit 2006
#
# (c) 2006, Prof. Dr. Andreas Mueller, HSR
# $Id: Makefile,v 1.2 2008/09/12 21:29:30 afm Exp $
#
all:	verteilungsfunktion abhaengigkeit algebra total erwartung ebola \
	zweiwuerfel regression exp norm gl power filter

verteilungsfunktion_FILES = verteilungsfunktion-1.pdf \
	verteilungsfunktion-2.pdf verteilungsfunktion-3.pdf \
	verteilungsfunktion-4.pdf verteilungsfunktion-5.pdf \
	verteilungsfunktion-6.pdf verteilungsfunktion-7.pdf
abhaengigkeit_FILES = abhaengigkeit-1.pdf abhaengigkeit-2.pdf \
	abhaengigkeit-3.pdf abhaengigkeit-4.pdf abhaengigkeit-5.pdf
algebra_FILES = algebra-1.pdf algebra-2.pdf
total_FILES = total-1.pdf
erwartung_FILES = erwartung-1.pdf erwartung-2.pdf erwartung-3.pdf \
	erwartung-4.pdf erwartung-5.pdf erwartung-6.pdf erwartung-7.pdf
ebola_FILES = ebola-1.pdf
zweiwuerfel_FILES = zweiwuerfel-1.pdf
regression_FILES = regression-1.pdf regression-2.pdf
norm_FILES = norm-1.pdf
exp_FILES = exp-1.pdf exp-2.pdf exp-3.pdf
power_FILES = power-1.pdf power-2.pdf power-3.pdf
gl_FILES = gl-1.pdf
filter_FILES = filter-1.pdf

verteilungsfunktion: $(verteilungsfunktion_FILES)
abhaengigkeit: $(abhaengigkeit_FILES)
algebra: $(algebra_FILES)
total: $(total_FILES)
erwartung: $(erwartung_FILES)
ebola: $(ebola_FILES)
zweiwuerfel: $(zweiwuerfel_FILES)
regression: $(regression_FILES)
norm: $(norm_FILES)
exp: $(exp_FILES)
power: $(power_FILES)
gl: $(gl_FILES)
filter: $(filter_FILES)

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

$(erwartung_FILES):	erwartung.mp
	TEX=latex mpost erwartung.mp
	for i in erwartung.[0-9]*; \
	do \
		mptopdf $${i}; \
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

$(exp_FILES):	exp.mp
	TEX=latex mpost exp.mp
	for i in exp.[0-9]*; \
	do \
		mptopdf $${i}; \
	done

$(norm_FILES):	norm.mp
	TEX=latex mpost norm.mp
	for i in norm.[0-9]*; \
	do \
		mptopdf $${i}; \
	done

$(regression_FILES):	regression.mp
	TEX=latex mpost regression.mp
	for i in regression.[0-9]*; \
	do \
		mptopdf $${i}; \
	done

$(power_FILES):	power.mp
	TEX=latex mpost power.mp
	for i in power.[0-9]*; \
	do \
		mptopdf $${i}; \
	done

$(gl_FILES):	gl.mp
	TEX=latex mpost gl.mp
	for i in gl.[0-9]*; \
	do \
		mptopdf $${i}; \
	done

$(filter_FILES):	filter.mp
	TEX=latex mpost filter.mp
	for i in filter.[0-9]*; \
	do \
		mptopdf $${i}; \
	done



