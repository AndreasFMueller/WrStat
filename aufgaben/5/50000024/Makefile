#
# Makefile -- build graphs for problem 50000024
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	graph

graph_FILES = graph-1.pdf
graph:	$(graph_FILES)
$(graph_FILES):	graph.mp
	TEX=latex mpost graph.mp
	for f in graph.[0-9]*; \
	do \
		mptopdf $${f}; \
	done
