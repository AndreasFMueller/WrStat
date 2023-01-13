/*
 * binom.c
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mpfr.h>

int	main(int argc, char *argv[]) {
	// compute the parameters for the binomial distribution
	int	n = 268204;
	double	p0 = 0.5109;
	double	trump = 0.284;
	int	maxk = trump * n;
	printf("binomial distribution: k_max = %d\n", maxk);

	// set default precision and initialize summation variable
	mpfr_set_default_prec(200);

	// initialize the basic variables
	mpfr_t	P, P0, P1;
	mpfr_t	binom;
	mpfr_inits(P, P0, P1, binom, NULL);
	mpfr_set_ui(P, 0, MPFR_RNDN);
	mpfr_set_ui(binom, 1, MPFR_RNDN);
	
	for (int k = 0; k <= maxk; k++) {
		// compute binomial cofficient
		if (k > 0) {
			mpfr_mul_ui(binom, binom, n-k+1, MPFR_RNDN);
			mpfr_div_ui(binom, binom, k, MPFR_RNDN);
		}

		// compute binomial probabilities
		mpfr_set_flt(P0, p0, MPFR_RNDN);
		mpfr_pow_ui(P0, P0, k, MPFR_RNDN);

		mpfr_set_flt(P1, 1-p0, MPFR_RNDN);
		mpfr_pow_ui(P1, P1, n-k, MPFR_RNDN);

		mpfr_mul(P0, P0, P1, MPFR_RNDN);

		mpfr_mul(P0, P0, binom, MPFR_RNDN);

		mpfr_add(P, P, P0, MPFR_RNDN);

		if (0 == (k+1) % 1000) {
			printf(".");
			fflush(stdout);
		}
	}
	printf("\n");

	printf("P      = ");
	mpfr_out_str(stdout, 10, 6, P, MPFR_RNDN);
	printf("\n");

	mpfr_t	l;
	mpfr_init(l);
	mpfr_log10(l, P, MPFR_RNDN);
	printf("log(P) = %.6f\n", mpfr_get_d(l, MPFR_RNDN));

	return EXIT_SUCCESS;
}

