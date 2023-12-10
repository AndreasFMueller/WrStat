d = zeros(4,5);
d(:,1:3) = [
	1,  0.188,   9;
	2,  0.216,   7;
	3,  0.317,   6;
	4,  0.000,  18
];
d(4,2) = 1 - sum(d(1:3,2));
n = sum(d(:,3))
d(:,4) = n * d(:,2);
d(:,5) = (d(:,3) - d(:,4));
d(:,5) = d(:,5) .* d(:,5);
d(:,5) = d(:,5) ./ d(:,4);

d

D = sum(d(:,5))

fn = fopen("data.tex", "w");
fprintf(fn, "%% generate by h.m\n");
fprintf(fn, "\\def\\pone{%.1f}%%\n", 100*d(1,2));
fprintf(fn, "\\def\\ptwo{%.1f}%%\n", 100*d(2,2));
fprintf(fn, "\\def\\pthree{%.1f}%%\n", 100*d(3,2));
fprintf(fn, "\\def\\pfour{%.1f}%%\n", 100*d(4,2));
fprintf(fn, "\\def\\tabledata{\n");
for i = (1:4)
fprintf(fn, "%d& %8.3f& %3.0f& %8.3f&  %10.3f\\\\\n",
	i, d(i,2), d(i,3), d(i,4), d(i,5));
end
fprintf(fn, "}%%\n");
fprintf(fn, "\\def\\D{%.3f}%%\n", D);
fclose(fn);
