#
# beispiel.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

mu1 = 3
sigma1 = 0.8
n = 10
mu2 = 3.7
sigma2 = 1.2
m = 10


do
	x1 = normrnd(mu1, sigma1, n, 1);
	x2 = normrnd(mu2, sigma2, n, 1);

	m1 = mean(x1)
	s1 = sqrt(var(x1))
	m2 = mean(x2)
	s2 = sqrt(var(x2))

	sp = sqrt(((n-1)*s1^2 + (m-1)*s2^2)/(m+n-2))

	k = m + n - 2
	t = (m1-m2) * sqrt(n*m*(n+m-2)/(n+m)) / sqrt((n-1)*s1^2 + (m-1)*s2^2)

	tkrit = 1.7341
	tkrittwosided = 2.1009

	s = sqrt(s1^2 + s2^2)/sqrt(10)
	nkrit = 1.96 * s

until ((abs(t) > tkrit) & (abs(t) < tkrittwosided) & (abs(t) > nkrit))
