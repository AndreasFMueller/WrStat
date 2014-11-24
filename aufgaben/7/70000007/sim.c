/*
 * sim.c -- Simulation zur Schaetzung des Intervallendes
 *
 * (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#define _BSD_SOURCE	1
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <getopt.h>

double	estimate(int n) {
	double	result = 0;
	while (n-- > 0) {
		double x = random() / (double)RAND_MAX;
		if (x > result) {
			result = x;
		}
	}
	return result;
}

int	main(int argc, char *argv[]) {
	int	n = 3;
	int	N = 10000;
	int	c;
	while (EOF != (c = getopt(argc, argv, "n:N:")))
		switch (c) {
		case 'n':
			n = atoi(optarg);
			break;
		case 'N':
			N = atoi(optarg);
			break;
		}

	double	s = 0;
	for (int i = 0; i < N; i++) {
		s += estimate(n);
	}
	printf("estimate: %f\n", s / N);
}
