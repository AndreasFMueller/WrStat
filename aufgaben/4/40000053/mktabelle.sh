#
# mktabelle.sh
#
# (c) 2023 Prof Dr Andreas Müller
#
LANG=C awk -F, 'BEGIN {
	X = 0
	X2 = 0
	Y = 0
	Y2 = 0
	XY = 0
	i = 0
	printf("\\def\\tabelle{\n")
	printf("\\begin{tabular}{|>{$}c<{$}|>{$}r<{$}|>{$}r<{$}|>{$}r<{$}|>{$}r<{$}|>{$}r<{$}|}\n")
	printf("\\hline\n")
	printf("     i      &   x_i\\phantom{.00}&       x_i^2\\phantom{.00}&     y_i\\phantom{.00}&        y_i^2\\phantom{.00}&     x_iy_i\\phantom{.00}\\\\\n")
	printf("\\hline\n")
}
{
	if ($1 == "tage")
		next
	x = $1
	x2 = x*x
	y = $2
	y2 = y*y
	xy = x*y
	X = X + x
	Y = Y + y
	X2 = X2 + x2
	Y2 = Y2 + y2
	XY = XY + xy
	i = i + 1
	punkte = punkte sprintf("\\punkt{%.4f}{%.4f}\n", x, y / 1000);
	printf("     %d      & %5d\\phantom{.00}&  %10d\\phantom{.00}& %7d\\phantom{.00}& %12d\\phantom{.00}& %10d\\phantom{.00}\\\\\n", i, x, x2, y, y2, xy)
}
END {
	printf("\\hline\n", i)
	printf("\\text{Summe}& %5.0f\\phantom{.00}&  %10.0f\\phantom{.00}& %7.0f\\phantom{.00}& %12.0f\\phantom{.00}& %10.0f\\phantom{.00}\\\\\n", X, X2, Y, Y2, XY)
	printf("\\hline\n")
	EX = X/i
	EX2 = X2/i
	EY = Y/i
	EY2 = Y2/i
	EXY = XY/i
	printf("E(\\,\\cdot\\,)& %5.2f&  %10.2f& %7.2f& %12.2f& %10.2f\\\\\n", EX, EX2, EY, EY2, EXY)
	printf("\\hline\n")
	printf("\\end{tabular}\n")
	printf("}\n")
	# varianzen, a, b und r
	varX = EX2 - EX*EX
	varY = EY2 - EY*EY
	covXY = EXY - EX*EY
	a = covXY / varX
	b = EY - EX * a
	r = covXY / sqrt(varX*varY)
	r2 = r*r
	printf("\\def\\resultate{\n")
	printf("\\begin{align*}\n")
	printf("\\operatorname{var}(X)  &= %10.2f & a &= \\phantom{0}%.4f&&\\\\\n",
		varX, a) 
	printf("\\operatorname{var}(Y)  &= %10.2f & b &=           %.4f&&\\\\\n",
		varY, b)
	printf("\\operatorname{cov}(X,Y)&= %10.2f & r &= \\phantom{00}%.8f&r^2&=%.8f\n",
		covXY,  r, r2)
	printf("\\end{align*}\n")
	printf("}\n")
	# Teilaufgabe a)
	printf("\\def\\aufgabea{\n")
	printf("x = 365\\qquad\\Rightarrow\\qquad y = a\\cdot 365 + b = %.4f", 365 * a + b)
	printf("}\n")
	printf("\\def\\awert{%.4f}\n", (365 * a + b) / 1000);
	# Teilaufgabe b)
	printf("\\def\\aufgabeb{\n")
	printf("10000 = ax+b\\quad\\Rightarrow\\qquad x = \\frac{10000-b}{a}= \\frac{10000-%.2f}{%.2f} = %.2f\n", b, a, (10000-b)/a)
	printf("}\n")
	printf("\\def\\bwert{%.4f}\n", (10000 - b) / a);
	# Teilaufgabe c)
	printf("\\def\\aufgabec{\n")
	printf("r^2=%.6f\\quad\\Rightarrow\\quad r = %.8f\n", r2, r)
	printf("}\n")
	printf("\\def\\punkte{\n")
	printf("%s", punkte)
	printf("}\n")
	printf("\\def\\gerade{\n")
	printf("\\draw[color=blue,line width=1pt] (0,{%.4f*\\dy}) -- ({400*\\dx},{%.4f*\\dy});\n", b / 1000, (a * 400 + b) / 1000)
	printf("}\n")
}' downloads.csv > tabelle.tex
