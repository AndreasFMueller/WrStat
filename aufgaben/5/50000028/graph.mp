verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;


numeric unit;
unit := 120;


def axes =
	pickup pencircle scaled 0.7pt;

	drawarrow (z1 shifted (-10,  0))--(z2 shifted (10, 0));
	drawarrow (z3 shifted (  0,-10))--(z4 shifted ( 0,10));

	draw (1.5 * unit, -2)--(1.5 * unit, 2);
		label.bot(btex $1.5$ etex, (1.5 * unit,-2));
	draw (1 * unit, -2)--(1 * unit, 2);
		label.bot(btex $1$ etex, (1 * unit,-2));
	draw (0.5 * unit, -2)--(0.5 * unit, 2);
		label.bot(btex $0.5$ etex, (0.5 * unit,-2));
	draw (-1.5 * unit, -2)--(-1.5 * unit, 2);
		label.bot(btex $-1.5$ etex, (-1.5 * unit,-2));
	draw (-1 * unit, -2)--(-1 * unit, 2);
		label.bot(btex $-1$ etex, (-1 * unit,-2));
	draw (-0.5 * unit, -2)--(-0.5 * unit, 2);
		label.bot(btex $-0.5$ etex, (-0.5 * unit,-2));

	draw (-2, 1 * unit)--(2, 1 * unit);
		label.lft(btex $1$ etex, (-2,1 * unit));
	draw (-2, 0.5 * unit)--(2, 0.5 * unit);
		label.ulft(btex $0.5$ etex, (-2,0.5 * unit));
	draw (-2, 0.25 * unit)--(2, 0.25 * unit);
		label.rt(btex $0.25$ etex, (+2,0.25 * unit));
	draw (-2, 0.75 * unit)--(2, 0.75 * unit);
		label.lft(btex $0.75$ etex, (-2,0.75 * unit));
enddef;

\beginfig(1)

z1 = (-1.5 * unit,   0 * unit);
z2 = ( 1.5 * unit,   0 * unit);
z3 = (   0 * unit,   0 * unit);
z4 = (   0 * unit, 1.0 * unit);
z5 = (-  1 * unit, 0.25 * unit);
z6 = (   1 * unit, 0.75 * unit);
z7 = (-  1 * unit, 0);
z8 = (   1 * unit, 0);

fill z7--z8--z6--z5--cycle withcolor (0.9,0.9,0.9);

pickup pencircle scaled 0.3pt;
draw z5--(0,0.25 * unit);
draw z6--(0,0.75 * unit);

axes;

pickup pencircle scaled 1.5pt;
draw (z1 shifted (-3,0))--(-unit,0);
draw (unit,0)--(z2 shifted (3, 0));
draw z5--z6;

label.top(btex $x$ etex, z2 shifted (10, 0));
label.rt(btex $\varphi(x)$ etex, z4 shifted (0,10));

endfig;

beginfig(2)

z1 = (-1.5 * unit,   0 * unit);
z2 = ( 1.5 * unit,   0 * unit);
z3 = (   0 * unit,   0 * unit);
z4 = (   0 * unit, 1.0 * unit);
z5 = (-  1 * unit, 0.25 * unit);
z6 = (   1 * unit, 0.75 * unit);
z7 = (-  1 * unit, 0);
z8 = (   1 * unit, 0);

axes;

pickup pencircle scaled 1.5pt;

draw z1--z7;
draw (z8--z2) shifted (0, 1 * unit);

path p;
p := z7;
for x = -0.9 step 0.1 until 1.01:
	p := p--(x * unit, (0.125 * x * x + 0.5 * x + 0.375) * unit);
endfor;
draw p;

label.top(btex $x$ etex, z2 shifted (10, 0));
label.rt(btex $F(x)$ etex, z4 shifted (0,10));

endfig;

\beginfig(3)

z1 = (-1.5 * unit,   0 * unit);
z2 = ( 1.5 * unit,   0 * unit);
z3 = (   0 * unit,   0 * unit);
z4 = (   0 * unit, 1.0 * unit);
z5 = (-  1 * unit, 0.25 * unit);
z6 = (   1 * unit, 0.75 * unit);
z7 = (-  1 * unit, 0);
z8 = (   1 * unit, 0);

fill z7--z8--z6--z5--cycle withcolor (0.9,0.9,0.9);

%pickup pencircle scaled 0.3pt;
%draw z5--(0,0.25 * unit);
%draw z6--(0,0.75 * unit);

axes;

pickup pencircle scaled 1.5pt;

draw (z1 shifted (-3,0))--(-unit,0);
draw (unit,0)--(z2 shifted (3,0));
draw z5--z6;

label.top(btex $x$ etex, z2 shifted (10, 0));
label.rt(btex $\varphi(x)$ etex, z4 shifted (0,10));

pickup pencircle scaled 1pt;

z9 = (1/6 * unit, 0);
z10 = (1/6 * unit, unit);

numeric var, sigma;
var = 11/36;
sigma := sqrt(var) * unit;
z11 = (1/6 * unit - sigma, 0);
z12 = (1/6 * unit - sigma, unit);
z13 = (1/6 * unit + sigma, 0);
z14 = (1/6 * unit + sigma, unit);


draw (z9 shifted (0,-5))--(z10 shifted (0,0)) withcolor blue;
label.bot(btex $E(X)$ etex, (z9 shifted (0,-5))) withcolor blue;

draw (z11 shifted (0,-5))--z12 withcolor blue;
draw (z13 shifted (0,-5))--z14 withcolor blue;

pickup pencircle scaled 0.5pt;
drawarrow ((z9--z11) shifted (0, 0.30 * unit)) withcolor blue;
drawarrow ((z9--z13) shifted (0, 0.30 * unit)) withcolor blue;
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex,
	(0.5[z9,z11]) shifted (0, 0.30 * unit)) withcolor blue;
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex,
	(0.5[z9,z13]) shifted (0, 0.30 * unit)) withcolor blue;

label.top(btex $x$ etex, z2 shifted (10, 0));
label.rt(btex $\varphi(x)$ etex, z4 shifted (0,10));

endfig;

end
