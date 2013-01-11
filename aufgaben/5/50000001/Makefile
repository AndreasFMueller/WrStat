#
# Makefile to build the graphs
#
GRAPHFILES = graph-1.pdf graph-2.pdf
graph:  $(GRAPHFILES)
$(GRAPHFILES):  graph.mp Makefile
	TEX=latex mpost graph.mp
	mptopdf graph.1
	mptopdf graph.2
