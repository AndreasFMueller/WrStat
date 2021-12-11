#
# chi.m -- chi2-Test für Unfallstatistik
#
# Konstruktion eines Datensatzes, der für alpha = 0.05 signifikant
# ist, aber für alpha = 0.01 nicht.
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

D05 = 11.070
D01 = 15.086

D = 0
a = 10

n0 = [ 40, 35, 30, 30, 30, 30 ];

while ((D < D05) || (D > D01))
	ni = n0 + round(a * (rand(1,6) - 0.5));
	n = sum(ni);
	pi = ones(1,6) / 6;
	npi = n * pi;
	d = ni - npi;
	d
	d .* d
	D = sum((d .* d) ./ npi,2)
end

ni
