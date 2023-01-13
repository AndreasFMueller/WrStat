#
# sim.m
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
a0 = 0.08;
b0 = 2;
n = 5;
r = 0;

do
	X = [ 15, 20, 30, 50, 75 ];
	Y = round(a0 * X + b0 + randn(1,5));

	t = X';
	t(:,2) = Y';

	t(:,3:4) = t(:,1:2).^2;
	t(:,5) = t(:,1) .* t(:,2);

	t;

	s = sum(t);
	e = s / n;

	covXY = e(5) - e(1) * e(2);
	varX = e(3) - e(1)^2;
	varY = e(4) - e(2)^2;

	a = covXY / varX;
	b = e(2) - a * e(1);
	r = covXY / sqrt(varX * varY);
until (r > 0.99)

t
s
e
a
b
r

bezos = 311e3
jeff = a*bezos + b
