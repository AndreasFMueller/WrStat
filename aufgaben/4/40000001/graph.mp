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
ux = 60;
uy = 0.1;

z0 = (0,0);
z1 = (4.1 * ux, 0);
z2 = (0, 2550 * uy);

pickup pencircle scaled 1pt;

for x = 1 step 1 until 4:
	draw (x * ux, -2)--(x * ux, 2);
endfor;

label.bot(btex $1$ etex, (1 * ux, -2));
label.bot(btex $2$ etex, (2 * ux, -2));
label.bot(btex $3$ etex, (3 * ux, -2));
label.bot(btex $4$ etex, (4 * ux, -2));

for y = 500 step 500 until 2500:
	draw (-2, y * uy)--(2, y * uy);
endfor;

label.lft(btex $0.5$ etex, (-2, 500 * uy));
label.lft(btex $1.0$ etex, (-2,1000 * uy));
label.lft(btex $1.5$ etex, (-2,1500 * uy));
label.lft(btex $2.0$ etex, (-2,2000 * uy));
label.lft(btex $2.5$ etex, (-2,2500 * uy));

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-5,0))--(z1 shifted (5,0));
drawarrow (z0 shifted (0,-5))--(z2 shifted (0,5));
label.top(btex $x \text{\; [$10^3$ Photonen]}$ etex, z1 shifted (5,2));
label.rt(btex $y \text{\; [$10^3$ Elektronen]}$ etex, z2 shifted (2,5));

pickup pencircle scaled 1.5pt;

z3 = (0, 4.6 * uy);
z4 = (4 * ux, 4 * 595 * uy);
draw ((-0.02)[z3,z4])--((1.02)[z3,z4]) withcolor blue;

pickup pencircle scaled 5pt;

draw (0 * ux,-5 * uy) withcolor red;
draw (1 * ux,601 * uy) withcolor red;
draw (2 * ux,1209 * uy) withcolor red;
draw (3 * ux,1795 * uy) withcolor red;
draw (4 * ux,2373 * uy) withcolor red;


endfig;

end
