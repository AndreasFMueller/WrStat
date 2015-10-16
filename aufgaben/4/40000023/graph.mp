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

numeric ux, uy;
ux = 25;
uy = 7;

numeric e;
e = 1.694;
numeric v;
v = sqrt(1.4344);

color c;
c = (1, 0.8, 0);

z0 = (0,0);
z1 = (7 * ux, 0);
z2 = (0, 25 * uy);

pickup pencircle scaled 7pt yscaled 0.1pt;

draw (1 * ux, 0)--(1 * ux, 23 * uy) withcolor red;
draw (2 * ux, 0)--(2 * ux,  7 * uy) withcolor red;
draw (3 * ux, 0)--(3 * ux,  3 * uy) withcolor red;
draw (4 * ux, 0)--(4 * ux,  1 * uy) withcolor red;
draw (5 * ux, 0)--(5 * ux,  1 * uy) withcolor red;
draw (6 * ux, 0)--(6 * ux,  1 * uy) withcolor red;

pickup pencircle scaled 1pt;

for x = 1 step 1 until 6:
	draw (x * ux, -2)--(x * ux, 2);
endfor;

label.bot(btex $1$ etex, (1 * ux, -2));
label.bot(btex $2$ etex, (2 * ux, -2));
label.bot(btex $3$ etex, (3 * ux, -2));
label.bot(btex $4$ etex, (4 * ux, -2));
label.bot(btex $5$ etex, (5 * ux, -2));
label.bot(btex $6$ etex, (6 * ux, -2));

for y = 0 step 10 until 25:
	draw (-2, y * uy)--(2, y * uy);
endfor;

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-5,0))--(z1 shifted (5,0));
drawarrow (z0 shifted (0,-5))--(z2 shifted (0,5));
label.top(btex $g$ etex, z1);
label.rt(btex $p$ etex, z2);

pickup pencircle scaled 1.5pt;

draw ((e + v) * ux, -10)--((e + v) * ux, 23 * uy + 10) withcolor c;
draw ((e - v) * ux, -10)--((e - v) * ux, 23 * uy + 10) withcolor c;

drawarrow (e * ux, 13 * uy)--((e + v) * ux, 13 * uy) withcolor c;
drawarrow (e * ux, 13 * uy)--((e - v) * ux, 13 * uy) withcolor c;

draw (e * ux, -10)--(e * ux, 23 * uy + 10) withcolor blue;
label.rt(btex $E(X)$ etex, (e * ux, 23 * uy)) withcolor blue;

label(btex $\sqrt{\operatorname{var(X)}}$ etex, (0,0))
	rotated 90
	shifted ((e + 0.5*v) * ux, 13 * uy + 18) withcolor c;
label(btex $\sqrt{\operatorname{var(X)}}$ etex, (0,0))
	rotated 90
	shifted ((e - 0.5*v) * ux, 13 * uy + 18) withcolor c;

label.lft(btex $10$ etex, (-2, 10 * uy));
label.lft(btex $20$ etex, (-2, 20 * uy));


endfig;

end
