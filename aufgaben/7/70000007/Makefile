#
# Makefile -- build and run simulation program
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	sim sim.c.expanded

sim:	sim.c
	gcc -std=c99 -g -Wall -O2 sim.c -o sim

test:	sim
	./sim

sim.c.expanded:	sim.c
	expand sim.c > sim.c.expanded
