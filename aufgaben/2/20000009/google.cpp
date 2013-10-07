/*
 * google.cpp -- Berechnung der Google-Matrix fuer ein kleines Modell-Internet
 * 
 * (c) 2007 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <iostream>
#include <unistd.h>

#define	N 4

class vector {
	double	v[N];
public:
	vector() {
		for (int i = 0; i < N; i++) v[i] = 0;
	}
	vector(const double& l) {
		for (int i = 0; i < N; i++) v[i] = l;
	}
	vector operator+(const vector& other) const {
		vector	result;
		for (int i = 0; i < N; i++) result.v[i] = v[i] + other.v[i];
		return result;
	}
	vector operator*(const double& l) const {
		vector	result;
		for (int i = 0; i < N; i++) result.v[i] = v[i] * l;
		return result;
	}
	vector&	operator=(const vector& other) {
		for (int i = 0; i < 4; i++) {
			v[i] = other.v[i];
		}
		return *this;
	}
	double	abs() {
		double	a = 0.;
		for (int i = 0; i < N; i++) a += fabs(v[i]);
		return a;
	}
	friend class matrix;
	friend std::ostream& operator<<(std::ostream&, const vector& v);
};
std::ostream&	operator<<(std::ostream& o, const vector& v) {
	for (int i = 0; i < N; i++) {
		o << "v[" << i << "] = " << v.v[i] << std::endl;
	}
	return o;
}

class matrix {
	double	m[N][N];
public:
	matrix() {
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				m[i][j] = 0;
			}
		}
	}
	matrix	operator+(const matrix& other) const {
		matrix	result;
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				result.m[i][j] = m[i][j] + other.m[i][j];
			}
		}
		return result;
	}
	matrix 	operator*(const double lambda) const {
		matrix	result;
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				result.m[i][j] = m[i][j] * lambda;
			}
		}
		return result;
	}
	vector	operator*(const vector& v) const {
		vector	result;
		for (int i = 0; i < N; i++) {
			result.v[i] = 0;
			for (int j = 0; j < N; j++) {
				result.v[i] += m[i][j] * v.v[j];
			}
		}
		return result;
	}
	friend class	matrixfactory;
	friend std::ostream& operator<<(std::ostream&, const matrix& m);
};
std::ostream&	operator<<(std::ostream& o, const matrix& m) {
	for (int i = 0; i < N; i++) {
		o << "[";
		for (int j = 0; j < N; j++) {
			o << m.m[i][j];
			if (j < N - 1) o << " ";
		}
		o << "]" << std::endl;
	}
	return o;
}

class matrixfactory {
public:
	matrix	getH() const {
		matrix	result;
		result.m[0][3] = 1;
		result.m[1][0] = 0.5;
		result.m[2][0] = 0.5;
		result.m[2][1] = 0.5;
		result.m[3][1] = 0.5;
		result.m[3][2] = 1;
		return result;
	}
	matrix	getA() const {
		matrix result;
		for (int i = 0; i < N; i++) {
			for (int j = 0; j < N; j++) {
				result.m[i][j] = 1;
			}
		}
		return result;
	}
};

void	test(const matrix& m, int n) {
	std::cout << "Google Matrix:" << std::endl;
	std::cout << m;
	vector	v(1);
	for (int i = 0; i < n; i++) {
		v = m * v;
		v = v * (1/v.abs());
	}
	std::cout << "Eigenvektor zum Eigenwert 1" << std::endl;
	std::cout << v;
}

int	main(int argc, char *argv[]) {
	int	n = 20;
	double	alpha = 0.1;
	int	c;
	matrixfactory	f;
	matrix	H = f.getH();
	matrix	A = f.getA();

	while (EOF != (c = getopt(argc, argv, "n:a:")))
		switch (c) {
		case 'a':	alpha = atof(optarg);
				break;
		case 'n':	n = atoi(optarg);
				break;

		}
	test(H, n);
	test((H * (1 - alpha)) + (A * (1./N) * alpha), n);
	exit(EXIT_SUCCESS);
}
