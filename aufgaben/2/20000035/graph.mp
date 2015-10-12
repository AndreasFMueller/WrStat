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
ux = 17;
uy = 20;

z0 = (-ux,0);
z1 = (13*ux, 0);
z2 = (-ux, 5 * uy);

pickup pencircle scaled 7pt yscaled 0.1pt;

draw ( 0 * ux, 0)--( 0 * ux, 1 * uy) withcolor red;
draw ( 1 * ux, 0)--( 1 * ux, 1 * uy) withcolor red;
draw ( 2 * ux, 0)--( 2 * ux, 2 * uy) withcolor red;
draw ( 3 * ux, 0)--( 3 * ux, 2 * uy) withcolor red;
draw ( 4 * ux, 0)--( 4 * ux, 3 * uy) withcolor red;
draw ( 5 * ux, 0)--( 5 * ux, 3 * uy) withcolor red;
draw ( 6 * ux, 0)--( 6 * ux, 4 * uy) withcolor red;
draw ( 7 * ux, 0)--( 7 * ux, 3 * uy) withcolor red;
draw ( 8 * ux, 0)--( 8 * ux, 3 * uy) withcolor red;
draw ( 9 * ux, 0)--( 9 * ux, 2 * uy) withcolor red;
draw (10 * ux, 0)--(10 * ux, 2 * uy) withcolor red;
draw (11 * ux, 0)--(11 * ux, 1 * uy) withcolor red;
draw (12 * ux, 0)--(12 * ux, 1 * uy) withcolor red;

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-5,0))--(z1 shifted (5,0));
drawarrow (z0 shifted (0,-5))--(z2 shifted (0,5));

for x = 0 step 1 until 12:
	draw (ux*x,-2)--(ux*x,2);
endfor;

label.bot(btex $ 0$ etex, ( 0 * ux, -2));
label.bot(btex $ 1$ etex, ( 1 * ux, -2));
label.bot(btex $ 2$ etex, ( 2 * ux, -2));
label.bot(btex $ 3$ etex, ( 3 * ux, -2));
label.bot(btex $ 4$ etex, ( 4 * ux, -2));
label.bot(btex $ 5$ etex, ( 5 * ux, -2));
label.bot(btex $ 6$ etex, ( 6 * ux, -2));
label.bot(btex $ 7$ etex, ( 7 * ux, -2));
label.bot(btex $ 8$ etex, ( 8 * ux, -2));
label.bot(btex $ 9$ etex, ( 9 * ux, -2));
label.bot(btex $10$ etex, (10 * ux, -2));
label.bot(btex $11$ etex, (11 * ux, -2));
label.bot(btex $12$ etex, (12 * ux, -2));

for y = 1 step 1 until 4:
	draw (-2-ux, y * uy)--(2-ux,y * uy);
endfor;

label.lft(btex $1$ etex, (-2-ux, 1 * uy));
label.lft(btex $2$ etex, (-2-ux, 2 * uy));
label.lft(btex $3$ etex, (-2-ux, 3 * uy));
label.lft(btex $4$ etex, (-2-ux, 4 * uy));

label.top(btex $X$ etex, z1);

endfig;

end
