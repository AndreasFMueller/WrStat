/*
 * sim.c -- simple exponential distribution simulation 
 *
 * (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

double	X() {
	double	y = random() / (double)RAND_MAX;
	return -log(1 - y);
}

int	main(int argc, char *argv[]) {
	int	n = 1000;
	if (argc > 1) {
		n = atoi(argv[1]);
	}
	double	x = 0, x2 = 0;
	int	counter = 0;
	while (counter++ < n) {
		double	value = X();
		x += value;
		x2 += value * value;
	}
	double	e = x / n;
	printf("Erwartungswert: %f\n", e);
	printf("Varianz:        %f\n", x2 / n - e * e);
	return EXIT_SUCCESS;
}
