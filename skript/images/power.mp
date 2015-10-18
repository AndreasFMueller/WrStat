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
hu = 50;
vu = 140;

z0 = (0,0);
z1 = (5 * hu, 0);
z2 = (0, vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 1 step 1 until 5:
	draw (x * hu, -2)--(x * hu, 2);
endfor;

label.bot(btex $1^{\phantom{1}}$ etex, (1 * hu, -2));
label.bot(btex $10^{\phantom{1}}$ etex, (2 * hu, -2));
label.bot(btex $10^2$ etex, (3 * hu, -2));
label.bot(btex $10^3$ etex, (4 * hu, -2));
label.bot(btex $10^4$ etex, (5 * hu, -2));

label.top(btex $\log x$ etex, z1 shifted (10,0));
label.rt(btex $\log \varphi(x)$ etex, z2 shifted (0,10));

endfig;

%
% Dichtefunktion und Verteilungsfunktion der Pareto-Verteilung
%
beginfig(2)

numeric alpha, xmin, xmina;
xmin = 0.8;
alpha = 2.5;
xmina = mexp(mlog(xmin)*(1-alpha));

numeric hu, vu;
hu = 60;
vu = 120;

z0 = (0,0);
z1 = (4 * hu, 0);
z2 = (0, vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

path p, q;

q := (xmin * hu, ((alpha - 1) * xmina) * mexp((-alpha)*mlog(xmin)) * vu);
for x = xmin + 0.1 step 0.1 until 4.01:
	q := q--(x * hu, ((alpha - 1) * xmina) * mexp((-alpha)*mlog(x)) * vu);
endfor;
p = (4 * hu, 0)--(xmin * hu,0)--q--cycle;
fill p withcolor (0.8,0.8,1);
draw q;

endfig;

end
