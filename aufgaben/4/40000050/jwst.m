#
# jwst.m
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
n = 5;
t = [
    2002, 2010;
    2006, 2014;
    2010, 2016;
    2014, 2019;
    2018, 2020
]

#t = t - ones(n, 2) * 2000;

t(:,3:4) = t.^2;
t(:,5) = t(:,1) .* t(:,2);

format long

t

s = sum(t)
e = s/n

covXY = e(5) - e(1) * e(2)
varX = e(3) - e(1)^2
varY = e(4) - e(2)^2

a = covXY/varX
b = e(2) - a * e(1)
r = covXY / sqrt(varX*varY)

JWST = b / (1-a)
