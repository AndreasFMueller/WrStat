/*
 * bsim.c -- simulate bernoulli law of large numbers
 *
 * (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <math.h>

double	epsilon = 0.01;
int	n = 47000;
int	repeat = 10000;

int	meanoffcount = 0;
int	probabilityoffcount = 0;

void	simulate() {
	int	sum = 0;
	int	six = 0;
	int	i = 0;
	while (i < n) {
		int	w = 1 + random() % 6;
		sum += w;
		six += (w == 6) ? 1 : 0;
		i++;
	}
	if (fabs((sum / (double)n) - 3.5) > epsilon) {
		meanoffcount++;
	}
	if (fabs((six / (double)n) - 0.1666666666666666) > epsilon) {
		probabilityoffcount++;
	}
}

void	usage(char *progname) {
	printf("usage: %s [ -e epsilon ] [ -n n ] [ -r repeat ]\n", progname);
	printf("options:\n");
	printf("  -e epsilon       count number of simulations where the mean "
		"or the\n");
	printf("                   frequency differ by more than <epsilon> "
		"from the correct\n");
	printf("                   values\n");
	printf("  -n n             number of dice throws in one simulation\n");
	printf("  -r repeat        number of repetitions of the simulation\n");
	printf("  -h               display this help message and exit\n");
}

int	main(int argc, char *argv[]) {
	int	c;
	while (EOF != (c = getopt(argc, argv, "e:n:r:h")))
		switch (c) {
		case 'e':
			epsilon = atof(optarg);
			break;
		case 'n':
			n = atoi(optarg);
			break;
		case 'r':
			repeat = atoi(optarg);
			break;
		case 'h':
			usage(argv[0]);
			return EXIT_SUCCESS;
		}

	int	r = 0;
	while (r < repeat) {
		simulate();
		r++;
	}
	printf("P(M_%d - 3.5) > %f) = %f (%d/%d events)\n", n, epsilon,
		meanoffcount / (double)repeat,
		meanoffcount, repeat);
	printf("P(h_%d - 1/6) > %f) = %f (%d/%d events)\n", n, epsilon,
		probabilityoffcount / (double)repeat,
		probabilityoffcount, repeat);

	return EXIT_SUCCESS;
}
