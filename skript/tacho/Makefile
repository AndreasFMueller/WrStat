#
# Makefile -- Fallstudie Kalman-Filter
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	graph

curves.mp:	tacho.m
	octave tacho.m

graph_FILES = graph-1.pdf
graph:	$(graph_FILES)
$(graph_FILES):	curves.mp graph.mp
	TEX=latex mpost graph.mp
	for f in graph.[0-9]*; \
	do \
		mptopdf $${f}; \
	done
