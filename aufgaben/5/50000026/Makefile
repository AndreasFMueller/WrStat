#
# Makefile -- build simulation program
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rappeswil
#
all:	sim sim.expanded.c

sim:	sim.c
	gcc -g -O2 -Wall -o sim sim.c -lm

sim.expanded.c:	sim.c
	expand sim.c > sim.expanded.c
