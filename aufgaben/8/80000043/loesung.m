#
# loesung.m --
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
# 
ni = [ 45, 39, 25, 29, 26, 25 ];
n = sum(ni)
pi = ones(1,6) / 6;

d = ni - n * pi
Dzeile = (d .* d) ./ (n * pi);
Dzeile'

D = sum(Dzeile)

tabelle = zeros(6,4);
tabelle(:,1) = ni';
tabelle(:,2) = pi';
tabelle(:,3) = n * pi';
tabelle(:,4) = Dzeile'
