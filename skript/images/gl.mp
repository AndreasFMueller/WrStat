verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

numeric hu, vu;
hu = 80;
vu = 160;

z0 = (0,0);
z1 = (3 * hu,0);
z2 = (0,1*vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 1 step 1 until 3:
	draw (x * hu, -2)--(x*hu,2);
endfor;

label.bot(btex $1$ etex, (1 * hu, -2));
label.bot(btex $2$ etex, (2 * hu, -2));
label.bot(btex $3$ etex, (3 * hu, -2));

for y = 1 step 1 until 5:
	draw (-2, 0.2 * y * vu)--(2, 0.2 * y * vu);
endfor;

label.lft(btex $0.2$ etex, (-2, 0.2 * vu));
label.lft(btex $0.4$ etex, (-2, 0.4 * vu));
label.lft(btex $0.6$ etex, (-2, 0.6 * vu));
label.lft(btex $0.8$ etex, (-2, 0.8 * vu));
label.lft(btex $1.0$ etex, (-2, 1.0 * vu));

label.top(btex $\varepsilon$ etex, z1 shifted (10,0));
label.rt(btex $P$ etex, z2 shifted (0,10));

pickup pencircle scaled 1.5pt;

numeric sigma;
sigma = 1/12;

numeric startx;
startx = sqrt(sigma);
show startx;

pickup pencircle scaled 1.5pt;
draw (startx * hu, 1 * vu)
for x = 0.3 step 0.02 until 3.01:
	--(x * hu, vu * sigma / (x * x))
endfor
withcolor green;

draw z2--(0.5*hu,0)--z1 withcolor red;

z3 = (0.4 * hu, vu*sigma/(0.4 * 0.4));
z4 = (0.25 * hu, 0.5 * vu);

label.rt(btex $P(|X-E(X)| > \varepsilon)$ etex, z4 shifted (60, 45));

label.rt(btex $\displaystyle\frac{\operatorname{var}(X)}{\varepsilon^2}\quad\text{(Tschebyscheff-Schranke)}$ etex, z3 shifted (46,10));

pickup pencircle scaled 0.5pt;

draw z4--(z4 shifted (60,45)) withcolor red;
draw z3--(z3 shifted (46,10)) withcolor green;

endfig;

%
% Diskrete Gleichverteilung
%
beginfig(2)

numeric u, v;
u = 25;
v = 100;

z0 = (0,0);
z1 = (10.5 * u, 0);
z2 = (0, 1.1 * v);
z10 = z0 shifted (0,1.5*v);
z11 = z1 shifted z10;
z12 = z2 shifted z10;


for x = 1 step 1 until 10:
	pickup pencircle scaled 5pt yscaled 0.01pt;
	draw (x * u, 0)--(x * u, v) withcolor red;
	pickup pencircle scaled 1pt;
	draw (x*u, -2)--(x*u,2);
	draw ((x*u, -2) shifted z10)--((x*u,2) shifted z10);
endfor;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

numeric mean, sigma;
mean = 5.5;
sigma = sqrt(99/12);

label.bot(btex $1$ etex, (1 * u, -2));
label.bot(btex $2$ etex, (2 * u, -2));
label.bot(btex $3$ etex, (3 * u, -2));
label.bot(btex $4$ etex, (4 * u, -2));
label.bot(btex $5$ etex, (5 * u, -2));
label.bot(btex $6$ etex, (6 * u, -2));
label.bot(btex $7$ etex, (7 * u, -2));
label.bot(btex $8$ etex, (8 * u, -2));
label.bot(btex $9$ etex, (9 * u, -2));
label.bot(btex $10$ etex, (10 * u, -2));

label.bot(btex $1$ etex, (1 * u, -2) shifted z10);
label.bot(btex $2$ etex, (2 * u, -2) shifted z10);
label.bot(btex $3$ etex, (3 * u, -2) shifted z10);
label.bot(btex $4$ etex, (4 * u, -2) shifted z10);
label.bot(btex $5$ etex, (5 * u, -2) shifted z10);
label.bot(btex $6$ etex, (6 * u, -2) shifted z10);
label.bot(btex $7$ etex, (7 * u, -2) shifted z10);
label.bot(btex $8$ etex, (8 * u, -2) shifted z10);
label.bot(btex $9$ etex, (9 * u, -2) shifted z10);
label.bot(btex $10$ etex, (10 * u, -2) shifted z10);

pickup pencircle scaled 0.3pt;
draw ((0,v)shifted z10)--((10*u,v)shifted z10);

pickup pencircle scaled 1pt;

label.lft(btex $\frac1{10}$ etex, (-2, v));
draw (-2,v)--(2,v);

label.rt(btex $P(k)$ etex, z2 shifted (0,10));
label.rt(btex $F(k)$ etex, z12 shifted (0,10));
label.top(btex $k$ etex, z1 shifted (10,0));
label.top(btex $k$ etex, z1 shifted z10 shifted (10,0));

draw (mean*u,-5)--(mean*u,v+5) withcolor (1,0.8,0);
label.top(btex $E(X)=\frac{n+1}2$ etex, (mean*u,v+5));

z3 = ((mean-sigma)*u,v/2);
z4 = ((mean      )*u,v/2);
z5 = ((mean+sigma)*u,v/2);

pickup pencircle scaled 1pt;
draw ((mean-sigma)*u,-5)--((mean-sigma)*u,v+5) withcolor (1,0.8,0);
draw ((mean+sigma)*u,-5)--((mean+sigma)*u,v+5) withcolor (1,0.8,0);

pickup pencircle scaled 0.5pt;
draw z3--z5 withcolor(1,0.8,0);
draw (z3 shifted (-2,-2))--(z3 shifted (2,2)) withcolor (1,0.8,0);
draw (z4 shifted (-2,-2))--(z4 shifted (2,2)) withcolor (1,0.8,0);
draw (z5 shifted (-2,-2))--(z5 shifted (2,2)) withcolor (1,0.8,0);

label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, ((mean-sigma*0.5)*u,v/2)) withcolor (1,0.8,0);
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, ((mean+sigma*0.5)*u,v/2)) withcolor (1,0.8,0);

pickup pencircle scaled 1pt;

drawarrow (z10 shifted (-10,0))--(z11 shifted (10,0));
drawarrow (z10 shifted (0,-10))--(z12 shifted (0,10));

def halfpoint(expr z, c) =
	pickup pencircle scaled 1.1pt;
	draw (z shifted (0,-1.3)){left}..{up}(z shifted (-1.3,0)){up}..{right}(z shifted (0,1.3)) withcolor c;
	pickup pencircle scaled 1.7pt;
	draw z withcolor white;
enddef;

def fullpoint(expr z, c) =
	pickup pencircle scaled 3pt;
	draw z withcolor c;
enddef;

pickup pencircle scaled 1.5pt;
draw (z10 shifted (-10,0))--((u,0)shifted z10) withcolor blue;
halfpoint((1*u,0) shifted z10, blue);
for x = 1 step 1 until 9:
	pickup pencircle scaled 1.5pt;
	draw ((x * u, x * 0.1 * v) shifted z10)
		--(((x+1) * u, x * 0.1 * v) shifted z10) withcolor blue;
	fullpoint((x*u, x*0.1*v) shifted z10, blue);
	halfpoint(((x+1)*u, x*0.1*v) shifted z10, blue);
endfor;
pickup pencircle scaled 1.5pt;
draw ((10*u,v)shifted z10)--((11*u,v)shifted z10) withcolor blue;
fullpoint((10*u,v)shifted z10, blue);

pickup pencircle scaled 1pt;

draw ((-2,v)shifted z10)--((2,v)shifted z10);
label.lft(btex $1$ etex, (-2,v) shifted z10);

endfig;

end
