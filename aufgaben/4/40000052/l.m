
X = (8:12)'
Y = [ 288.09;282.94;225.09;182.92;109.10 ]
T = zeros(5,5);
T(:,1) = X;
T(:,2) = X .* X;
T(:,3) = Y;
T(:,4) = Y .* Y;
T(:,5) = X .* Y;
T

EX = sum(T(:,1)) / 5
varX = sum(T(:,2))/5 - EX^2
EY = sum(T(:,3)) / 5
varY = sum(T(:,4))/5 - EY^2
covXY = sum(T(:,5))/5 - EX*EY

a = covXY / varX
b = EY - a * EX

x = -b / a

r2 = covXY^2 / (varX * varY)
r = covXY / sqrt(varX * varY)

fn = fopen("tesla.tex", "w");
fprintf(fn, "\\def\\teslaEX{%.0f}\n", EX);
fprintf(fn, "\\def\\teslavarX{%.0f}\n", varX);
fprintf(fn, "\\def\\teslaEY{%.3f}\n", EY);
fprintf(fn, "\\def\\teslavarY{%.4f}\n", varY);
fprintf(fn, "\\def\\teslacovXY{%.2f}\n", covXY);
fprintf(fn, "\\def\\teslaa{%.1f}\n", a);
fprintf(fn, "\\def\\teslab{%.3f}\n", b);
fprintf(fn, "\\def\\teslax{%.4f}\n", x);
fprintf(fn, "\\def\\teslar{%.4f}\n", r);
fprintf(fn, "\\def\\teslarr{%.4f}\n", r2);
fprintf(fn, "\\def\\tesladata{\n");
for i = (1:5)
	fprintf(fn, "%2d & %2.0f & %3.0f & %.2f\\phantom{0} & %.4f & %.2f \\\\\n", i,
		T(i,1), T(i,2), T(i,3), T(i,4), T(i,5));
end
fprintf(fn, "}\n");
fprintf(fn, "\\def\\teslakurs{ ({%d*\\dx+\\ox},{%.2f*\\dy})", X(1), Y(1));
for i = (2:5)
	fprintf(fn, "\n\t-- ({%d*\\dx+\ox},{%.2f*\\dy})", X(i), Y(i));
end
fprintf(fn, "\n}\n");
fprintf(fn, "\\def\\teslapunkte{\n");
for i = (1:5)
	fprintf(fn, "\\fill[color=red] ({%.0f*\\dx+\\ox},{%.4f*\\dy}) circle[radius=0.08];\n", T(i,1), T(i,3));
end
fprintf(fn, "}\n");
fclose(fn);
