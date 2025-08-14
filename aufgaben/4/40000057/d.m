%
% d.m
%
% (c) 2023 Prof Dr Andreas Müller
%

n = 5;
x = [ 230.1,  44.5,  17.2, 151.5, 180.8 ];
y = [  22.1,  10.4,  12.0,  16.5,  17.9 ];

d = zeros(n,5);
d(:,1) = x;
d(:,2) = y;
d(:,3) = x .* x;
d(:,4) = y .* y;
d(:,5) = x .* y;

s = sum(d);
e = s / n;

c = e(5) - e(1)*e(2);
v(1) = e(3) - e(1)^2;
v(2) = e(4) - e(2)^2;

a = c / v(1)
b = e(2) - e(1) * a

r = a * sqrt(v(1)/v(2))

fn = fopen("daten.tex", "w");

fprintf(fn, "\\def\\tabelle{\n");
for i = (1:n)
	fprintf(fn, " %d & %.1f & %.1f & %.2f & %.2f & %.2f \\\\\n",
		i, d(i,1), d(i,2), d(i,3), d(i,4), d(i,5));
end
fprintf(fn, "}\n");

fprintf(fn, "\\def\\summen{\n");
	fprintf(fn, " \\Sigma & %.1f & %.1f & %.2f & %.2f & %.2f \\\\\n",
		s(1), s(2), s(3), s(4), s(5));
fprintf(fn, "}\n");

fprintf(fn, "\\def\\mittelwerte{\n");
	fprintf(fn, " E & %.1f & %.1f & %.2f & %.2f & %.2f \\\\\n",
		e(1), e(2), e(3), e(4), e(5));
fprintf(fn, "}\n");

fprintf(fn, "\\def\\steigung{%.4f}\n", a);
fprintf(fn, "\\def\\achsabschnitt{%.4f}\n", b);
fprintf(fn, "\\def\\r{%.4f}\n", r);
fprintf(fn, "\\def\\rr{%.4f}\n", r^2);
fprintf(fn, "\\def\\punkte{\n");
for i = (1:n)
	fprintf(fn, "\\punkt{%.4f}{%.4f}\n", x(i), y(i));
end
fprintf(fn, "}\n");
fprintf(fn, "\\def\\gerade#1{\n");
fprintf(fn, "\\draw[color=#1,line width=1.2pt] \\p{%.4f}{%.4f}", 0, b);
fprintf(fn, " -- \\p{%.4f}{%.4f};\n", 250, 250 * a + b);
fprintf(fn, "}\n");

ux = 100;
uy = a * ux + b

fprintf(fn, "\\def\\ux{%.2f}\n", ux);
fprintf(fn, "\\def\\uy{%.2f}\n", uy);

hy = 20;
hx = (hy - b) / a
fprintf(fn, "\\def\\hx{%.2f}\n", hx);
fprintf(fn, "\\def\\hy{%.2f}\n", hy); 

fclose(fn);
