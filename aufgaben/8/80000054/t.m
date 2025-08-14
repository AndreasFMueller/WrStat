%
% t.m
%
% (c) 2023 Prof Dr Andreas Müller
%
s = 4711;
rand("seed", s);
randn("seed", s);

mx = 6.5;
my = 6.7;

nx = 16;
ny = 12;
f = sqrt(nx * ny * (nx + ny - 2) / (nx + ny))

t = 0
while (abs(t) < 2.0555) || (abs(t) > 2.2)
	x = mx + randn(1,nx);
	y = my + randn(1,ny);
	sx = var(x)
	sy = var(y)
	delta = mean(x) - mean(y);
	delta
	t = f * delta / sqrt((nx-1)*sx^2+(ny-1)*sy^2);
	t
end
t

fn = fopen("t.tex", "w");
fprintf(fn, "\\def\\nx{%d}%%\n", nx);
fprintf(fn, "\\def\\ny{%d}%%\n", ny);
fprintf(fn, "\\def\\mx{%.2f}%%\n", mean(x));
fprintf(fn, "\\def\\my{%.2f}%%\n", mean(y));
fprintf(fn, "\\def\\sx{%.3f}%%\n", sqrt(sx));
fprintf(fn, "\\def\\sy{%.3f}%%\n", sqrt(sy));
fprintf(fn, "\\def\\freiheitsgrade{%d}%%\n", nx + ny - 2);
fprintf(fn, "\\def\\T{%.4f}%%\n", t);
fclose(fn);
