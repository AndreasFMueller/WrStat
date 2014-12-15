#
# Makefile -- run kalman filter and display graphs
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
graphs = velocities.pdf positions.pdf

all:	$(graphs) kalman.m.expand filtered.csv

positions.pdf:	positions.eps
	epstopdf --outfile=positions.pdf positions.eps

velocities.pdf:	velocities.eps
	epstopdf --outfile=velocities.pdf velocities.eps 

positions.eps velocities.eps filtered.csv:	kalman.m gps.csv
	octave < kalman.m

kalman.m.expand:	kalman.m
	expand kalman.m > kalman.m.expand
