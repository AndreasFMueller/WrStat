%
% f.m -- build the F tables
%
% (c) 2022 Prof Dr Andreas Müller
%
global nvalues;
nvalues = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 20, 24, 30 ];
global mvalues;
mvalues = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 24, 30, 40, 60, 120 ];
global alphavalues;
alphavalues = [ 0.25, 0.1, 0.05, 0.025, 0.01, 0.005 ];

function alpharow(fn, n, alpha)
	n
	alpha
end

function nblock(fn, n)
	global mvalues;
	global alphavalues;
	for ai = (1:size(alphavalues)(2))
		if (ai == 1)
			fprintf(fn, "%d", n);
		end
		alpha = alphavalues(ai);
		fprintf("&%.3f", alpha)
		alpharow(fn, n, alpha);
	end
end

function retval = ftable(fn)
	global nvalues;
	l = size(nvalues)(2)
	for i = (1:l)
		nblock(fn, nvalues(i));
	end
end

fn = fopen("ftable.tex", "w");
fprintf(fn, "n&\\alpha&");
l = size(mvalues)(2)
for i = (1:l)
	fprintf(fn, "&%d", mvalues(i));
end
fprintf(fn,"\\n\n");
ftable(fn);
fclose(fn);
