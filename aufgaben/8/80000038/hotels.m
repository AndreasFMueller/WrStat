#
# hotels.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
A = [
     5,     5,  1205,0.1869,        769;
     4,    16,  1747,0.2710,       1189;
     3,    32,  1865,0.2893,        945;
     2,    10,   303,0.0470,        123;
     1,    41,  1327,0.2058,        418;
]
nzimmer = sum(A(:,3))
p = A(:,3) / nzimmer
A(:,4) = p;
n = sum(A(:,5))

A(:,6) = n*p
A(:,7) = (A(:,5) - A(:,6)).^2 ./ A(:,6)
D = sum(A(:,7))
