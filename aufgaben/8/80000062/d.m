%
% d.m
%
% (c) 2025 Prof Dr Andreas Müller
%

s = 4710;
abstand = 0;
while (abstand < 0.04)
	s = s + 1;
	rand("seed", s);
	wunsorted = round(100 * rand(1,10))/100;
	w = sort(wunsorted);
	abstand = w(1);
	for i = (1:9)
		a = w(i+1) - w(i);
		if (a < abstand)
			abstand = a;
		end
	end
	a = 1 - w(10);
	if (a < abstand)
		abstand = a;
	end
end

%
% compute the normally distributed random numbers
%
function retval = Phiinverse(y)
	y = 2 * y - 1;
	xnew = 0;
	delta = 1;
	while (delta > 1e-12)
		x = xnew;
		xnew = x - (erf(x) - y) / (2 * exp(-x^2) / sqrt(pi));
		delta = abs(xnew - x);
	end
	retval = sqrt(2) * x;
end

p = zeros(1,10);
for i = (1:10)
	p(i) = Phiinverse(wunsorted(i));
end
p

function wertetabelle(fn, p, wunsorted)
	fprintf(fn, "\\def\\wertetabelle{\n");
	fprintf(fn, "\\begin{tabular}{|>{$}c<{$}|>{$}r<{$}|>{$}r<{$}||>{$}c<{$}|>{$}r<{$}|>{$}r<{$}|}\n");
	fprintf(fn, "\\hline\n");
	fprintf(fn, " i & x & \\Phi(x) & i & x & \\Phi(x) \\\\\n");
	fprintf(fn, "\\hline\n");
	for i = (1:5)
		fprintf(fn, " %d & %8.4f", i-1, p(i));
		fprintf(fn, "& \\ifthenelse{\\boolean{loesungen}}{%7.2f}{} &", wunsorted(i));
		fprintf(fn, " %d & %8.4f", i+4, p(i+5));
		fprintf(fn, "& \\ifthenelse{\\boolean{loesungen}}{%7.2f}{} \\\\\n", wunsorted(i+5));
	end
	fprintf(fn, "\\hline");
	fprintf(fn, "\\end{tabular}\n");
	fprintf(fn, "}\n");
end

function werte(fn, wunsorted)
	fprintf(fn, "\\def\\werte{\n\t%.2f", wunsorted(1));
	for i = (2:10)
		fprintf(fn, ", %.2f", wunsorted(i));
	end
	fprintf(fn, "\n}\n");
end

function normal(fn, p)
	fprintf(fn, "\\def\\normal{\n\t%.4f", p(1));
	for i = (2:10)
		fprintf(fn, ", %.4f", p(i));
	end
	fprintf(fn, "\n}\n");
end

function vertikal(fn, w)
	fprintf(fn, "\\def\\vertikal{\n");
	for i = (1:10)
		fprintf(fn, "\t\\draw[color=darkred,line width=0.3pt]");
		fprintf(fn, " ({%.2f*\\h},0) -- ++(0,{%d*\\s-0.05});\n", w(i), i-1);

		fprintf(fn, "\t\\draw[color=darkred,line width=0.3pt]");
		fprintf(fn, " ({%.2f*\\h},{%d*\\s+0.05}) -- ++(0,{\\s-0.05});\n",
			w(i), i-1);

		fprintf(fn, "\t\\draw[color=darkred]");
		fprintf(fn, " ({%.2f*\\h},-0.05) -- ++(0,0.1);\n", w(i));

		fprintf(fn, "\t\\node[color=darkred] at ({%.2f*\\h},0) [below] {\\tiny $x_{%d}$};\n\n",
			w(i), i);
	end
	fprintf(fn, "}\n");
end

function treppe(fn, w)
	fprintf(fn, "\\def\\treppe{\n");
	fprintf(fn, "\t\\draw[color=orange,line width=1.4pt]");
	fprintf(fn, " (-0.1,0) -- ({%.2f*\\h-0.05},0);\n", w(1));

	fprintf(fn, "\t\\draw[color=orange] ({%.2f*\\h},0.05) ", w(1));
	fprintf(fn, "arc(90:270:0.05);\n\n");

	for i = (1:9)
		fprintf(fn, "\t\\fill[color=orange] ({%.2f*\\h},{%d*\\s}) ", w(i), i);
		fprintf(fn, "circle[radius=0.05];\n");

		fprintf(fn, "\t\\draw[color=orange,line width=1.4pt]");
		fprintf(fn, " ({%.2f*\\h},{%d*\\s})", w(i), i);
		fprintf(fn, " -- ({%.2f*\\h-0.05},{%d*\\s});\n", w(i+1), i);

		fprintf(fn, "\t\\draw[color=orange] ({%.2f*\\h},{%d*\\s+0.05}) ",
			w(i+1), i);
		fprintf(fn, "arc(90:270:0.05);\n\n");

	end
	fprintf(fn, "\t\\draw[color=orange,line width=1.4pt]");
	fprintf(fn, " ({%.2f*\\h},\\h) -- ({\\h+0.1},\\h);\n", w(10));
	fprintf(fn, "\t\\fill[color=orange] ({%.2f*\\h},\\h)", w(10));
	fprintf(fn, " circle[radius=0.05];\n");
	fprintf(fn, "}\n");
end

function hintergrund(fn, w)
	mi = max(w - (0:9)/10);
	ma = max((1:10)/10 - w);
	fprintf(fn, "\\def\\hintergrund{\n");
	fprintf(fn, "\t\\fill[color=darkgreen!10] (0,0) \n");
	fprintf(fn, "\t\t-- ({%.4f*\\h},0) -- (\\h,{(1-%.4f)*\\h})\n", mi, mi);
	fprintf(fn, "\t\t-- (\\h,\\h)\n");
	fprintf(fn, "\t\t-- ({(1-%.4f)*\\h},\\h) -- (0,{%.4f*\\h})\n", ma, ma);
	fprintf(fn, "\t\t-- cycle;\n");

	fprintf(fn, "\t\\draw[color=darkgreen,line width=0.3pt]");
	fprintf(fn, " ({%.4f*\\h},0) -- (\\h,{(1-%.4f)*\\h});\n", mi, mi);

	fprintf(fn, "\t\\draw[color=darkgreen,line width=0.3pt]");
	fprintf(fn, " (0,{%.4f*\\h}) -- ({(1-%.4f)*\\h},\\h);\n", ma, ma);
	fprintf(fn, "}\n");
end

function grenzen(fn, w)
	mi = max(w - (0:9)/10);
	ma = max((1:10)/10 - w);
	fprintf(fn, "\\def\\Kplus{%.4f}\n", ma);
	fprintf(fn, "\\def\\Kminus{%.4f}\n", mi);
end

%
% Daten für Aufgabe 80000061
%
fn = fopen("../80000061/data.tex", "w");

werte(fn, wunsorted);
wertetabelle(fn, p, wunsorted);

fclose(fn);

%
% Daten für Aufgabe 80000062
%
fn = fopen("data.tex", "w");

normal(fn, p);
werte(fn, wunsorted);

vertikal(fn, w);
treppe(fn, w);
hintergrund(fn, w);

fclose(fn);

%
% Daten für Aufgabe 80000063
%
fn = fopen("../80000063/data.tex", "w");

grenzen(fn, w);

fclose(fn);

%
% Daten für Aufgabe 80000064
%
fn = fopen("../80000064/data.tex", "w");

grenzen(fn, w);

fclose(fn);
