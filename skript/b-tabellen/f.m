%
% f.m -- build the F tables
%
% (c) 2022 Prof Dr Andreas Müller
%
pkg load statistics

global mvalues;
mvalues = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 20, 24, 30 ];
global mcount;
mcount = size(mvalues)(2);
global nvalues;
nvalues = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 24, 30, 40, 60, 120, 200, 300, 500 ];
global ncount;
ncount = size(nvalues)(2);
global alphavalues;
alphavalues = [ 0.25, 0.1, 0.05, 0.025, 0.01, 0.005 ];
global alphacount;
alphacount = size(alphavalues)(2);

function zahl(fn, f)
	s = log10(f);
	if (s >= 5)
		fprintf(fn, "&%.0f\\rlap{e2}\\phantom{000}", f / 100);
		return;
	end
	if (s >= 4)
		fprintf(fn, "&%.1f\\rlap{e2}\\phantom{00}", f / 100);
		return;
	end
	if (s >= 3)
		fprintf(fn, "&%.0f\\phantom{.000}", f);
		return;
	end
	if (s >= 2)
		fprintf(fn, "&%.1f\\phantom{00}", f);
		return;
	end
	if (s >= 1)
		fprintf(fn, "&%.2f\\phantom{0}", f);
		return;
	end
	if (s >= 0)
		fprintf(fn, "&%.3f", f);
		return;
	end
	fprintf(fn, "&%.3f", f);
end

function alpharow(fn, n, alpha, mvalues)
	mcount = size(mvalues)(2);
	for mi = (1:mcount)
		m = mvalues(mi);
		f = finv(1-alpha, m, n);
		zahl(fn, f);
	end
	fprintf(fn, "\\\\\n");
end

function alphaformat(fn, alpha)
	fprintf(fn, "&%.1f", 100 * alpha);
end

function nblock(fn, n, mvalues, alphavalues)
	alphacount = size(alphavalues)(2);;
	for ai = (1:alphacount)
		if (ai == 1)
			fprintf(fn, "%d", n);
		end
		alpha = alphavalues(ai);
		alphaformat(fn, alpha);
		alpharow(fn, n, alpha, mvalues);
	end
	fprintf(fn, "\\hline\n");
end

function retval = ftable(fn, nvalues, mvalues, alphavalues)
	ncount = size(nvalues)(2);
	for i = (1:ncount)
		nblock(fn, nvalues(i), mvalues, alphavalues);
	end
end


function tabelle(fn, nvalues, mvalues, alphavalues)
	mcount = size(mvalues)(2);
	fprintf(fn, "%%\\rowcolors{2}{gray!25}{white}\n");
	fprintf(fn, "\\begin{table}\n");
	fprintf(fn, "\\centering\n");
	fprintf(fn, "\\renewcommand{\\tabcolsep}{3pt}\n");
	fprintf(fn, "\\renewcommand{\\arraystretch}{1.1}\n");
	fprintf(fn, "\\begin{tabular}{|>{$}r<{$}|>{$}r<{$}|");
	for i = (1:mcount)
		fprintf(fn, "r");
	end
	fprintf(fn, "|}\n");
	fprintf(fn, "\\hline\n");
	fprintf(fn, "\\multicolumn{2}{|>{$}c<{$}|}{F_{n,m}^\\alpha\\raisebox{7pt}{\\mathstrut}\\raisebox{-6pt}{\\mathstrut}}&\\multicolumn{%d}{c|}{$m$}\\\\\n", mcount);
	fprintf(fn, "\\hline\n");
	fprintf(fn, "\\;n\\mathstrut\\raisebox{6pt}{\\mathstrut}\\raisebox{-5pt}{\\mathstrut}");
	fprintf(fn, "&\\;\\alpha\\,[\\%%]");
	for i = (1:mcount)
		fprintf(fn, "&%d", mvalues(i));
	end
	fprintf(fn, "\\\\\n");
	fprintf(fn, "\\hline\n");
	ftable(fn, nvalues, mvalues, alphavalues);
	fprintf(fn, "\\end{tabular}\n");
	fprintf(fn, "\\caption{Quantilen-Tabelle der $F$-Verteilung}\n");
	fprintf(fn, "\\end{table}\n");
end

fn = fopen("ftable.tex", "w");

tabelle(fn, nvalues(1:4), mvalues(1:8), alphavalues)
tabelle(fn, nvalues(1:4), mvalues(9:16), alphavalues)
tabelle(fn, nvalues(5:8), mvalues(1:16), alphavalues)
tabelle(fn, nvalues(9:12), mvalues(1:16), alphavalues)
tabelle(fn, nvalues(13:16), mvalues(1:16), alphavalues)
tabelle(fn, nvalues(17:20), mvalues(1:16), alphavalues)
tabelle(fn, nvalues(21:24), mvalues(1:16), alphavalues)
tabelle(fn, nvalues(25:28), mvalues(1:16), alphavalues)

fclose(fn);
