%
% d.m
%
% (c) 2023 Prof Dr Andreas Müller
%

n = 4;
x = [    5;   13;   50;   72 ];
y = [ 0.03; 0.05; 0.16; 0.25 ];

d = zeros(4,5);
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
for i = (1:4)
	fprintf(fn, " %d & %.0f & %.2f & %.0f & %.4f & %.2f \\\\\n",
		i, d(i,1), d(i,2), d(i,3), d(i,4), d(i,5));
end
fprintf(fn, "}\n");

fprintf(fn, "\\def\\summen{\n");
	fprintf(fn, " \\Sigma & %.0f & %.2f & %.0f & %.4f & %.2f \\\\\n",
		s(1), s(2), s(3), s(4), s(5));
fprintf(fn, "}\n");

fprintf(fn, "\\def\\mittelwerte{\n");
	fprintf(fn, " E & %.0f & %.2f & %.0f & %.4f & %.2f \\\\\n",
		e(1), e(2), e(3), e(4), e(5));
fprintf(fn, "}\n");

fprintf(fn, "\\def\\steigung{%.4f}\n", a);
fprintf(fn, "\\def\\achsabschnitt{%.4f}\n", b);
fprintf(fn, "\\def\\r{%.4f}\n", r);
fprintf(fn, "\\def\\rr{%.4f}\n", r^2);
fprintf(fn, "\\def\\punkte{\n");
for i = (1:4)
	fprintf(fn, "\\punkt{%.4f}{%.4f}\n", x(i), y(i));
end
fprintf(fn, "}\n");
fprintf(fn, "\\def\\gerade#1{\n");
fprintf(fn, "\\draw[color=#1,line width=1.2pt] \\p{%.4f}{%.4f}", 0, b);
fprintf(fn, " -- \\p{%.4f}{%.4f};\n", 125, 125 * a + b);
fprintf(fn, "}\n");

ux = 35;
uy = a * ux + b

fprintf(fn, "\\def\\uy{%.2f}\n", uy);

h = (0.4 - b) / a;
fprintf(fn, "\\def\\h{%.2f}\n", h);

fclose(fn);
