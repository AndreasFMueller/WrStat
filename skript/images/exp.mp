verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

%
% Abweichungswahrscheinlichkeit der Exponentialverteilung (Tschebyscheff)
%
beginfig(1)

numeric hu, vu;
hu = 60;
vu = 160;

z0 = (0,0);
z1 = (5 * hu,0);
z2 = (0,1*vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 1 step 1 until 5:
	draw (x * hu, -2)--(x*hu,2);
endfor;

label.bot(btex $1$ etex, (1 * hu, -2));
label.bot(btex $2$ etex, (2 * hu, -2));
label.bot(btex $3$ etex, (3 * hu, -2));
label.bot(btex $4$ etex, (4 * hu, -2));
label.bot(btex $5$ etex, (5 * hu, -2));

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

draw (1 * hu, 1 * vu)
for x = 1.1 step 0.1 until 5.01:
	--(x * hu, vu * 1 / (x * x))
endfor
withcolor green;

draw (0, 1 * vu)
for x = 0.1 step 0.1 until 1.01:
	--(x * hu, (1 - mexp(256 * (x - 1)) + mexp(256 * (-x-1))) * vu)
endfor
withcolor red;

draw (1 * hu, mexp(256 * -2) * vu)
for x = 1.1 step 0.1 until 5.01:
	--(x * hu, mexp(256 * (-x-1)) * vu)
endfor
withcolor red;

z3 = (1.5 * hu, vu/(1.5 * 1.5));
z4 = (0.7 * hu, (1 - mexp(256 * (0.7 - 1)) + mexp(256 * (-0.7-1))) * vu);

label.urt(btex $P(|X-E(X)| > \varepsilon)$ etex, z4 shifted (60, 45));

label.urt(btex $\displaystyle\frac{1}{\varepsilon^2}\quad\text{(Tschebyscheff-Schranke)}$ etex, z3 shifted (10,10));

pickup pencircle scaled 0.5pt;

draw z4--(z4 shifted (60,45)) withcolor red;
draw z3--(z3 shifted (10,10)) withcolor green;

endfig;

%
%  Poissonverteilung
%
beginfig(2)

numeric u,v;
u = 35;
v = 600;
numeric lambda;
lambda = 4.2;

z0 = (0,0);
z1 = (12 * u, 0);
z2 = (0, 0.2 * v);

pickup penrazor scaled 5pt;

numeric f;
f = mexp(-lambda * 256);
show f;

draw (0,0)--(0, f*v) withcolor red;

for x = 1 step 1 until 12:
	f := f * (lambda/x);
	show f;
	draw (x*u,0)--(x*u, f*v) withcolor red;
endfor;

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

pickup pencircle scaled 1.5pt;

for x = 1 step 1 until 12:
	draw (x * u, -2)--(x * u, 2);
endfor;

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
label.bot(btex $12$ etex, (12 * u, -2));

label.rt(btex $P(k)$ etex, z2 shifted (0,10));

pickup pencircle scaled 1.5pt;

draw (lambda * u, -5)--(lambda * u, 0.2 * v) withcolor (1,0.8,0);
label.top(btex $E(X)=\lambda$ etex, (lambda * u, 0.2 * v));

draw ((lambda - sqrt(lambda))*u, -2)--((lambda - sqrt(lambda))*u,0.2 * v)
	withcolor (1,0.8,0);;
draw ((lambda + sqrt(lambda))*u, -2)--((lambda + sqrt(lambda))*u,0.2 * v)
	withcolor (1,0.8,0);;
pickup pencircle scaled 0.7pt;

z3 = ((lambda - sqrt(lambda))*u, 0.1 * v);
z4 = ((lambda               )*u, 0.1 * v);
z5 = ((lambda + sqrt(lambda))*u, 0.1 * v);

draw z3--z5 withcolor (1,0.8,0);

draw (z3 shifted (-2,-2))--(z3 shifted (2,2)) withcolor (1,0.8,0);
draw (z4 shifted (-2,-2))--(z4 shifted (2,2)) withcolor (1,0.8,0);
draw (z5 shifted (-2,-2))--(z5 shifted (2,2)) withcolor (1,0.8,0);

label.top(btex $\sqrt{\lambda}$ etex, 0.5[z3,z4]) withcolor (1,0.8,0);
label.top(btex $\sqrt{\lambda}$ etex, 0.5[z4,z5]) withcolor (1,0.8,0);
label.top(btex $k$ etex, z1 shifted (10,0));

endfig;

end
