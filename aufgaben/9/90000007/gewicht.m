#
# gewicht.m -- erzeuge Simulationsdaten und führe den Kalman-Filter aus
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#
w = 15;
m = 70 * ones(300,1);
m(101:200,1) = m(101:200,1) + (5 * (1:100) / 100)';
m(201:300,1) = m(201:300,1) + 5;

x = m + 0.6 * (rand(300,1) - 0.5);
z = x + normrnd(0, 0.1, 300, 1);

fid = fopen("gewicht.csv", "w")
for i = (1:300)
	fprintf(fid, "%.5f\n", z(i,1));
end
fclose(fid);

mhat = x(1,1);
p2 = 0;
sigma2 = 0.03;
rho2 = 0.01;
offset = zeros(300,1);
total = sqrt(var(m - z))

fid = fopen("gewicht.tex", "w");

fprintf(fid, "\\draw[color=red,line width=1pt] (0,%3f)", z(1,1)-70);
for i = 2:300
	fprintf(fid, "--(%.3f,%3f)\n", w * (i - 1) / 299, z(i,1)-70);
end
fprintf(fid, ";\n");

fprintf(fid, "\\draw[color=green,line width=1pt] (0,%3f)", m(1,1)-70);
for i = 2:300
	fprintf(fid, "--(%.3f,%3f)\n", w * (i - 1) / 299, m(i,1)-70);
end
fprintf(fid, ";\n");

fprintf(fid, "\\draw[color=blue,line width=1pt] (0,%.3f)\n", mhat - 70);
for i = 1:300
	K = (p2 + sigma2)/(p2 + sigma2 + rho2);
	mhat = mhat + K * (z(i,1) - mhat);
	fprintf(fid, "--(%.3f,%3f)\n", w * (i - 1) / 299, mhat-70);
	p2 = (1 - K)*(p2 + rho2);
	offset(i,1) = mhat - m(i,1);
	printf("%03d %6.2f %7.3f %7.3f %7.3f %7.3f\n", i, m(i,1), mhat, z(i,1), sqrt(p2), K);
end
fprintf(fid, ";\n")
fprintf(fid, "\\node at (12,2.5) {$p = %.3f$};\n", sqrt(p2));
fprintf(fid, "\\node at (12,1.5) {$K = %.3f$};\n", K);
fprintf(fid, "\\node at (12,0.5) {$\\Delta m= %.3f$};\n", sqrt(var(offset)));

fclose(fid);

mhat = x(1,1);
p2 = 0;
sigma2 = 0.001;
rho2 = 0.04;

fid = fopen("gewicht2.tex", "w");

fprintf(fid, "\\draw[color=red,line width=1pt] (0,%3f)", z(1,1)-70);
for i = 2:300
	fprintf(fid, "--(%.3f,%3f)\n", w * (i - 1) / 299, z(i,1)-70);
end
fprintf(fid, ";\n");

fprintf(fid, "\\draw[color=green,line width=1pt] (0,%3f)", m(1,1)-70);
for i = 2:300
	fprintf(fid, "--(%.3f,%3f)\n", w * (i - 1) / 299, m(i,1)-70);
end
fprintf(fid, ";\n");

fprintf(fid, "\\draw[color=blue,line width=1pt] (0,%.3f)\n", mhat - 70);
for i = 1:300
	K = (p2 + sigma2)/(p2 + sigma2 + rho2);
	mhat = mhat + K * (z(i,1) - mhat);
	fprintf(fid, "--(%.3f,%3f)\n", w * (i - 1) / 299, mhat-70);
	p2 = (1 - K)*(p2 + rho2);
	offset(i,1) = mhat - m(i,1);
	printf("%03d %6.2f %7.3f %7.3f %7.3f %7.3f\n", i, m(i,1), mhat, z(i,1), sqrt(p2), K);
end
fprintf(fid, ";\n")
fprintf(fid, "\\node at (12,2.5) {$p = %.3f$};\n", sqrt(p2));
fprintf(fid, "\\node at (12,1.5) {$K = %.3f$};\n", K);
fprintf(fid, "\\node at (12,0.5) {$\\Delta m= %.3f$};\n", sqrt(var(offset)));

fclose(fid);
