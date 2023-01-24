table = zeros(7, 5);
X = [ 15; 20; 30; 50; 75 ];
sum(X)
Y = [  3;  4;  5;  7;  9 ];
sum(Y)
X2 = X .* X
sum(X2)
Y2 = Y .* Y
sum(Y2)
XY = X .* Y

table(1:5,1) = X;   table(6,1) = sum(X);
table(1:5,2) = Y;   table(6,2) = sum(Y);
table(1:5,3) = X2;  table(6,3) = sum(X2);
table(1:5,4) = Y2;  table(6,4) = sum(Y2);
table(1:5,5) = XY;  table(6,5) = sum(XY);
table(7,:) = table(6,:) / 5;

EX = table(7,1);
EY = table(7,2);
EX2 = table(7,3);
EY2 = table(7,4);
EXY = table(7,5);

covXY = EXY - EX * EY
varX = EX2 - EX^2
varY = EY2 - EY^2

a = covXY / varX
b = EY - a * EX
r2 = covXY / sqrt(varX*varY)
r = sqrt(r2)

x = 311e3
g = a*x+b

format bank

table


