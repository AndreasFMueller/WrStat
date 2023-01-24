/*
 * small.c
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mpfr.h>

int	main(int argc, char *argv[]) {
	mpfr_set_default_prec(100);
	mpfr_t	x;
	mpfr_t	e;
	mpfr_inits(x, e, NULL);
	mpfr_set_flt(x, 235.7/sqrt(2), MPFR_RNDN);
	mpfr_erfc(e, x, MPFR_RNDN);
	mpfr_div_ui(e, e, 2, MPFR_RNDN);
	mpfr_out_str(stdout, 10, 60, e, MPFR_RNDN);
	printf("\n");
	mpfr_clear(x);
	mpfr_clear(e);
	return EXIT_SUCCESS;
}

