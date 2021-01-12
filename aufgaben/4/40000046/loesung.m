#
# loesung.m -- Lösung der Aufgabe 40000046
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
n = 8;
S = zeros(n,2);
S(:,1) = 20 * (0:7)';
S(:,2) = [ 2.49, 2.23, 1.99, 1.72, 1.48, 1.21, 0.96, 0.70 ]';
S(:,3) = S(:,1).^2;
S(:,4) = S(:,2).^2;
S(:,5) = S(:,1).*S(:,2);
S

s = sum(S)
E = s/n

a = (E(5) - E(1)*E(2)) / (E(3) - E(1)^2)
b = E(2) - a * E(1)

t = (3-b)/a

r = (E(5) - E(1)*E(2)) / (sqrt(E(3)-E(1)^2) * sqrt(E(4)-E(2)^2))
