x = [47, 146, 246, 345, 443];
y = [438, 411, 356, 273, 161];
X = x * 1/3000
Y = 438/48 - (0.75/48) * y

XY = X .* Y
function y = sqr(x), y = x * x; endfunction;
X2 = arrayfun(@sqr, X)
X2Y = X2 .* Y
function y = cube(x), y = sqr(x) * x; endfunction;
X3 = arrayfun(@cube, X)
function y = fourth(x), y = sqr(x) * sqr(x); endfunction;
X4 = arrayfun(@fourth, X)

A=[mean(X4), mean(X3), mean(X2);
   mean(X3), mean(X2), mean(X);
   mean(X2), mean(X), 1]
v=[mean(X2Y);
   mean(XY);
   mean(Y)]
w = A \ v
