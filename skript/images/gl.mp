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
hu = 100;
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
u = 30;
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

%
% Verteilungsfunktion der Binomialverteilung
%
beginfig(3)

numeric u, v;
u = 30;
v = 100;

p = 0.38;
q = 1 - p;
n = 10;

z0 = (0,0);
z1 = (11 * u, 0);
z2 = (0, 1.2 * v);

pickup pencircle scaled 1pt;

drawarrow (-30,150)--(11 * u+10, 150);
label.top(btex $k$ etex, (11*u+10,150));
drawarrow (-20,140)--(-20,260);
label.rt(btex $F(k)$ etex, (-18,260));

pickup pencircle scaled 0.3pt;
draw (-20,250)--(11*u,250);

pickup pencircle scaled 1pt;
draw (-22,250)--(-18,250);
label.lft(btex $1$ etex, (-22,250));

numeric binom;
binom := 1;

numeric cumulative;
cumulative := mexp(mlog(q) * n);;

numeric scale;
scale = 4;

def halfpoint(expr z) =
	pickup pencircle scaled 1pt;
	draw (z shifted (0,-1.3)){left}..{up}(z shifted (-1.3,0)){up}
		..{right}(z shifted (0,1.3)) withcolor blue;
	pickup pencircle scaled 1.6pt;
	draw z withcolor white;
enddef;

pickup penrazor scaled 5pt;
draw (0, 0)--(0, scale * cumulative * v) withcolor red;
pickup pencircle scaled 1.5pt;
draw (-30,150)--(0,150) withcolor blue;
halfpoint((0,150));

for k = 1 step 1 until n:
	binom := binom * (n - k + 1) / k;
	numeric value;
	value := binom * mexp(mlog(p) * k) * mexp(mlog(q) * (n-k));
	cumulative := cumulative + value;
	show cumulative;
	pickup penrazor scaled 5pt;
	draw (k * u, 0)--(k * u, scale * value * v) withcolor red;
	pickup pencircle scaled 1.5pt;
	draw ((k-1) * u, v * cumulative + 150)--(k * u, v * cumulative + 150)
		withcolor blue;
	pickup pencircle scaled 4pt;
	draw ((k-1) * u, v * cumulative + 150) withcolor blue;
	halfpoint((k * u, v * cumulative + 150));
	pickup pencircle scaled 1.6pt;
endfor;

pickup pencircle scaled 1.5pt;
draw (10 * u, 250)--(11 * u, 250) withcolor blue;

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-30,0))--(z1 shifted (10,0));
label.top(btex $k$ etex, z1 shifted (10,0));
drawarrow (z0 shifted (-20,-10))--(z2 shifted (-20,10));

for x = 0 step 1 until 11:
	draw (x * u,-2)--(x * u, 2);
	draw (x * u,150-2)--(x * u, 152);
endfor;

label.bot(btex $ 0$ etex, ( 0 * u, -2));
label.bot(btex $ 1$ etex, ( 1 * u, -2));
label.bot(btex $ 2$ etex, ( 2 * u, -2));
label.bot(btex $ 3$ etex, ( 3 * u, -2));
label.bot(btex $ 4$ etex, ( 4 * u, -2));
label.bot(btex $ 5$ etex, ( 5 * u, -2));
label.bot(btex $ 6$ etex, ( 6 * u, -2));
label.bot(btex $ 7$ etex, ( 7 * u, -2));
label.bot(btex $ 8$ etex, ( 8 * u, -2));
label.bot(btex $ 9$ etex, ( 9 * u, -2));
label.bot(btex $10$ etex, (10 * u, -2));
label.bot(btex $11$ etex, (11 * u, -2));
label.bot(btex $ 0$ etex, ( 0 * u, 148));
label.bot(btex $ 1$ etex, ( 1 * u, 148));
label.bot(btex $ 2$ etex, ( 2 * u, 148));
label.bot(btex $ 3$ etex, ( 3 * u, 148));
label.bot(btex $ 4$ etex, ( 4 * u, 148));
label.bot(btex $ 5$ etex, ( 5 * u, 148));
label.bot(btex $ 6$ etex, ( 6 * u, 148));
label.bot(btex $ 7$ etex, ( 7 * u, 148));
label.bot(btex $ 8$ etex, ( 8 * u, 148));
label.bot(btex $ 9$ etex, ( 9 * u, 148));
label.bot(btex $10$ etex, (10 * u, 148));
label.bot(btex $11$ etex, (11 * u, 148));

label(btex $p=0.4$ etex, (9 * u, 0.9 * v));

label.lrt(btex $P(k)=\binom{n}{k}p^k(1-p)^{n-k}$ etex, z2 shifted (-18,10));

for yps = 1 step 1 until 3:
	draw (-22, 0.1 * v * yps * scale)--(-18, 0.1 * yps * v * scale);
endfor;
label.lft(btex $0.1$ etex, (-22, v * 0.1 * scale));
label.lft(btex $0.2$ etex, (-22, v * 0.2 * scale));
label.lft(btex $0.3$ etex, (-22, v * 0.3 * scale));

numeric mean, sigma;
mean = n * p;
sigma = sqrt(n * p * (1 - p));

draw (mean * u,-5)--(mean * u, 105) withcolor (1,0.8,0);
label.top(btex $E(X)=np$ etex, (mean*u,105));
draw ((mean-sigma) * u, -5)--((mean-sigma) * u, 105) withcolor (1,0.8,0);
draw ((mean+sigma) * u, -5)--((mean+sigma) * u, 105) withcolor (1,0.8,0);

z3 = ((mean-sigma) * u, v/2);
z4 = ((mean      ) * u, v/2);
z5 = ((mean+sigma) * u, v/2);

draw z3--z5 withcolor (1,0.8,0);

draw (z3 shifted (-2,-2))--(z3 shifted (2,2)) withcolor (1,0.8,0);
draw (z4 shifted (-2,-2))--(z4 shifted (2,2)) withcolor (1,0.8,0);
draw (z5 shifted (-2,-2))--(z5 shifted (2,2)) withcolor (1,0.8,0);

label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, 0.5[z3,z4]) withcolor (1,0.8,0);
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, 0.5[z4,z5]) withcolor (1,0.8,0);

endfig;

end
