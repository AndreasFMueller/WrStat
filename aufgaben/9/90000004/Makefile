#
# Makefile -- run kalman filter and display graphs
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
graphs = velocities.pdf positions.pdf

all:	$(graphs) kalman.m.expand filtered.csv

positions.pdf:	positions.eps
	if [ 0 -ne `wc -c < positions.eps` ]; \
	then \
		epstopdf --outfile=positions.pdf positions.eps; \
	fi

velocities.pdf:	velocities.eps
	if [ 0 -ne `wc -c < velocities.eps` ]; \
	then \
		epstopdf --outfile=velocities.pdf velocities.eps; \
	fi

positions.eps velocities.eps filtered.csv:	kalman.m gps.csv
	if type octave > /dev/null 2> /dev/null; \
	then \
		octave < kalman.m; \
	else \
		touch positions.eps velocities.eps filtered.csv; \
	fi

kalman.m.expand:	kalman.m
	expand kalman.m > kalman.m.expand
