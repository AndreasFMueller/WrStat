verbatimtex
\documentclass[12pt]{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;


numeric u, v;
u := 80;
v := 120;
numeric pi;
pi := 3.1415926;
numeric a;
a := 1/(pi - 2);

def f(expr x) =
	(a * (1 - sind(180 * x / pi)))
enddef;

def bild =
	z0 = (      0  * u, 0 * v);
	z1 = (     -1  * u, 0 * v);
	z2 = ((pi + 1) * u, 0 * v);
	z3 = (      0  * u, 1 * v);
	z4 = ( pi      * u, 0 * v);
	z5 = ( pi/2    * u, 0 * v);

	path p, q;
	p := (z0 shifted (0, f(0) * v));
	for x = 0.01 step 0.01 until 3.14:
		p := p--(x * u, f(x) * v);
	endfor;

	q := p--(pi * u, 0)--z0--cycle;

	fill q withcolor (1,0.9,0.9);

	pickup pencircle scaled 1pt;
	draw (-2,v)--(2,v);

	pickup pencircle scaled 1pt;
	drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
	drawarrow (z0 shifted (0,-10))--(z3 shifted (0,10));
	label.top(btex $x$ etex, z2 shifted (10,0));
	label.rt(btex $\varphi_X(x)$ etex, z3 shifted (0,10));
	label.lft(btex $1$ etex, z0 shifted (-2,v));

	pickup pencircle scaled 1.5pt;
	draw p withcolor red;
	draw (pi * u, 0)--(z2 shifted (5,0)) withcolor red;
	draw (-u, 0)--z0 withcolor red;

	draw (z1 shifted (0,-2))--(z1 shifted (0,2));
	draw (z4 shifted (0,-2))--(z4 shifted (0,2));
	draw (z5 shifted (0,-2))--(z5 shifted (0,2));
	label.llft(btex $0$ etex, z0);
	label.bot(btex $-1$ etex, z1 shifted (0,-2));
	label.bot(btex $\mathstrut\pi$ etex, z4 shifted (0,-2));
	label.bot(btex $\displaystyle\frac{\pi}2$ etex, z5 shifted (0,-2));
enddef;

beginfig(1)
bild;
endfig;

beginfig(2)

bild;

numeric m, var;
m = pi/2;
var = sqrt(1.44452);

draw (m * u, -5)--(m * u, v + 1) withcolor blue;
draw ((m - var) * u, -5)--((m - var) * u, v + 1) withcolor blue;
draw ((m + var) * u, -5)--((m + var) * u, v + 1) withcolor blue;

z10 = (m * u, 0.65 * v);
z11 = z10 shifted (-var * u, 0);
z12 = z10 shifted ( var * u, 0);
pickup pencircle scaled 0.7pt;

draw (z10 shifted (-2,-2))--(z10 shifted (2,2)) withcolor blue;
draw (z11 shifted (-2,-2))--(z11 shifted (2,2)) withcolor blue;
draw (z12 shifted (-2,-2))--(z12 shifted (2,2)) withcolor blue;
draw z11--z12 withcolor blue;
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, 0.5[z10,z11]) withcolor blue;
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, 0.5[z10,z12]) withcolor blue;

label.top(btex $E(X)$ etex, (m * u, v + 1)) withcolor blue;


endfig;

end
