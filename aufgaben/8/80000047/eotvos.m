%
% eotvos.m
%
% (c) 2023 Prof Dr Andreas Müller
%
m1 = 499.62; s1 = 1.38; n1 = 83;
m2 = 495.23; s2 = 1.06; n2 = 82;

a = sqrt(n1*n2*(n1+n2-2)/(n1+n2));

T = (m1-m2) * a / sqrt((n1-1) * s1^2 + (n2-1) * s2^2)

f = n1 + n2 - 2


