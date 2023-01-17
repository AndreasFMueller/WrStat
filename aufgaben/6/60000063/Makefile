#
# Makefile -- build the computation programs
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
binom:	binom.c
	gcc `pkg-config --cflags mpfr` `pkg-config --cflags gmp` -o binom -Wall -O2 -g binom.c `pkg-config --libs mpfr` `pkg-config --libs gmp`
	./binom
	
small:	small.c
	gcc -o small -Wall -O2 -g small.c -lmpfr -lgmp
	./small

