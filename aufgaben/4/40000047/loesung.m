#
# loesung.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
n = 9; Y = 1600;
n = 4; Y = 1300;

XY = [
	23,  651
	26,  762
	30,  856
	34, 1063
	43, 1190
	48, 1298
	52, 1421
	57, 1440
	58, 1518
];

tabelle = zeros(n,5);
tabelle(:,1:2) = XY(1:n,1:2);
tabelle(:,3) = tabelle(:,1) .* tabelle(:,1);
tabelle(:,4) = tabelle(:,2) .* tabelle(:,2);
tabelle(:,5) = tabelle(:,1) .* tabelle(:,2)

s = sum(tabelle) / n
EX = s(1) 
EY = s(2)
EX2 = s(3)
EY2 = s(4)
EXY = s(5)

covXY = EXY - EX*EY
varX = EX2 - EX^2
varY = EY2 - EY^2

a = covXY / varX
b = EY - a * EX

X = (Y - b) / a

r = covXY / sqrt(varX * varY)


