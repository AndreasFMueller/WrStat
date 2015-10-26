verbatimtex
\documentclass[12pt]{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{color}
\usepackage{txfonts}
\begin{document}
etex;

numeric ux, uy;
ux = 70;
uy = 80;

def f(expr x) =
	0.75 * (1 - x * x)
enddef;

def F(expr x) =
	(((-0.25 * x * x + 0.75) * x) + 0.5)
enddef;

path p;
p = (-1 * ux, 0);
for x = -19 step 1 until 20:
	p := p--(ux * x / 20, f(x / 20) * uy);
endfor;

path q;
q = (-1 * ux, 0);
for x = -19 step 1 until 20:
	q := q--(ux * x / 20, F(x / 20) * uy);
endfor;

def phiphi(expr x) =
	((((-0.01875 * x * x + 0.375) * x) - 0.75) * x * x + 0.6)
enddef;

path r;
r = (-2 * ux, 0);
for x = -39 step 1 until 0:
	r := r--(ux * x / 20, phiphi(-x / 20) * uy);
endfor;
for x = 1 step 1 until 40:
	r := r--(ux * x / 20, phiphi(x / 20) * uy);
endfor;

def basepicture =
	z0 = (0,0);
	z1 = (-2 * ux, 0);
	z2 = ( 2 * ux, 0);
	z3 = (0, uy);

	fill p--cycle withcolor (1,0.9,0.9);

	pickup pencircle scaled 1pt;

	drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
	drawarrow (z0 shifted (0,-10))--(z3 shifted (0,10));

	label.top(btex $x$ etex, z2 shifted (10,0));
	label.rt(btex $\varphi(x)$ etex, z3 shifted (0,10));


	for k = -2 step 1 until 2:
		draw (k * ux,-2)--(k * ux,2);
	endfor;

	label.bot(btex $-2$ etex, (-2 * ux, -2));
	label.bot(btex $-1$ etex, (-1 * ux, -2));
	label.lrt(btex $ 0$ etex, ( 0 * ux, -2));
	label.bot(btex $ 1$ etex, ( 1 * ux, -2));
	label.bot(btex $ 2$ etex, ( 2 * ux, -2));

	draw (-2,uy)--(2,uy);
	label.lft(btex $1$ etex, (-2,uy));

	pickup pencircle scaled 1.5pt;

	draw (z1 shifted (-10,0))--p--(z2 shifted (5,0)) withcolor red;
enddef;

beginfig(1)
basepicture;
endfig;

beginfig(2)
basepicture;
pickup pencircle scaled 1.5pt;
draw (z0 shifted (0,-5))--(z3 shifted (0,5)) withcolor blue;
label.llft(btex $E(X)$ etex, z0 shifted (0,-2)) withcolor blue;
numeric v;
v = sqrt(1/5);
draw (z0 shifted (-v*ux,-5))--(z3 shifted (-v*ux,5)) withcolor blue;
draw (z0 shifted ( v*ux,-5))--(z3 shifted ( v*ux,5)) withcolor blue;
pickup pencircle scaled 0.4pt;
draw (z0 shifted (-v*ux, 0.5*uy))--(z0 shifted(v*ux, 0.5*uy)) withcolor blue;
draw (z0 shifted (-v*ux-2, 0.5*uy-2))--(z0 shifted (-v*ux+2, 0.5*uy+2)) withcolor blue;
draw (z0 shifted (     -2, 0.5*uy-2))--(z0 shifted (     +2, 0.5*uy+2)) withcolor blue;
draw (z0 shifted ( v*ux-2, 0.5*uy-2))--(z0 shifted ( v*ux+2, 0.5*uy+2)) withcolor blue;
label.top(btex $\tiny\sqrt{\operatorname{var}(X)}$ etex, (0.5*v*ux, 0.5*uy)) withcolor blue;
label.top(btex $\tiny\sqrt{\operatorname{var}(X)}$ etex, (-0.5*v*ux, 0.5*uy)) withcolor blue;
endfig;

beginfig(3)
	z0 = (0,0);
	z1 = (-2 * ux, 0);
	z2 = ( 2 * ux, 0);
	z3 = (0, uy);

	pickup pencircle scaled 0.3pt;
	draw (z0 shifted (0, uy))--(z2 shifted (0, uy));

	pickup pencircle scaled 1pt;

	drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
	drawarrow (z0 shifted (0,-10))--(z3 shifted (0,10));

	label.top(btex $x$ etex, z2 shifted (10,0));
	label.rt(btex $F(x)$ etex, z3 shifted (0,10));

	for k = -2 step 1 until 2:
		draw (k * ux,-2)--(k * ux,2);
	endfor;

	label.bot(btex $-2$ etex, (-2 * ux, -2));
	label.bot(btex $-1$ etex, (-1 * ux, -2));
	label.lrt(btex $ 0$ etex, ( 0 * ux, -2));
	label.bot(btex $ 1$ etex, ( 1 * ux, -2));
	label.bot(btex $ 2$ etex, ( 2 * ux, -2));

	draw (-2,uy)--(2,uy);
	label.lft(btex $1$ etex, (-2,uy));

	pickup pencircle scaled 1.5pt;

	draw (z1 shifted (-10,0))--q--(z2 shifted (10,uy)) withcolor red;
endfig;

beginfig(4)
	z0 = (0,0);
	z1 = (-2 * ux, 0);
	z2 = ( 2 * ux, 0);
	z3 = (0, uy);

	fill r--z2--z1--cycle withcolor (1,0.9,0.9);

	pickup pencircle scaled 1pt;

	drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
	drawarrow (z0 shifted (0,-10))--(z3 shifted (0,10));

	label.top(btex $x$ etex, z2 shifted (10,0));
	label.rt(btex $\varphi_{X+Y}(x)$ etex, z3 shifted (0,10));

	for k = -2 step 1 until 2:
		draw (k * ux,-2)--(k * ux,2);
	endfor;

	label.bot(btex $-2$ etex, (-2 * ux, -2));
	label.bot(btex $-1$ etex, (-1 * ux, -2));
	label.lrt(btex $ 0$ etex, ( 0 * ux, -2));
	label.bot(btex $ 1$ etex, ( 1 * ux, -2));
	label.bot(btex $ 2$ etex, ( 2 * ux, -2));

	draw (-2,uy)--(2,uy);
	label.lft(btex $1$ etex, (-2,uy));

	pickup pencircle scaled 1.5pt;

	draw (z1 shifted (-10,0))--r--(z2 shifted (5,0)) withcolor red;

endfig;

end
