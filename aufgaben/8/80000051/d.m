%
% d.m
%
% (c) 2023 Prof Dr Andreas Müller
%

D = zeros(4,3);
D(:,1) = (1:4)
D(:,2) = [ 61; 32; 18; 42 ];
D(:,3) = [ 0.3342; 0.2426; 0.1806; 0.2426 ];
n = sum(D(:,2))
D(:,4) = n * D(:,3);
D(:,5) = D(:,2) - D(:,4);
D(:,6) = D(:,5) .* D(:,5) ./ D(:,4);
D

D0 = sum(D(:,6))

fn = fopen("d.tex", "w");
fprintf(fn, "\\def\\tabelle{\n");
for i = (1:4)
	fprintf(fn, "%d & %7d & %6.4f & %8.4f & %8.4f & %11.4f \\\\\n",
		i, D(i, 2), D(i, 3), D(i, 4), D(i, 5), D(i, 6));
end
fprintf(fn, "\\hline\n");
fprintf(fn, "  & n = %d &        &          &          & D = %.4f \\\\\n", n, D0);
fprintf(fn, "}\n");
fprintf(fn, "\\def\\D{%.4f}\n", D0);

fclose(fn);
