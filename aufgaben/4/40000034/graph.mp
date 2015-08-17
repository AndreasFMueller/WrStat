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

numeric u;
u = 10;
numeric v;
v = 4;

numeric a;
a = 1.89954;
numeric b;
b = -10.46575;

z1 = (15*u, 20*v);
z2 = (19*u, 23*v);
z3 = (22*u, 30*v);
z4 = (25*u, 39*v);

pickup pencircle scaled 0.1pt;

for x = 0 step 1 until 25:
	draw (x*u, -11*v-5)--(x*u,40*v+5) withcolor 0.9;
endfor;

for y = -11 step 1 until 40:
	draw (-5, y*v)--(25 * u+5,y*v) withcolor 0.9;
endfor;

pickup pencircle scaled 1.5pt;

draw (-0.5 * u, (-0.5 * a + b) * v)--(25.5 * u, (25.5 * a + b) * v);

pickup pencircle scaled 1pt;

drawarrow (-10,0)--(25*u+10,0);
drawarrow (  0,-11*v-10)--(0,40*v+10);

label.top(btex $t$ etex, (25*u+8, 0));
label.rt(btex $n$ etex, (0,40*v+8));

pickup pencircle scaled 1.1pt;
draw (0,0)--(0,b*v) withcolor red;
label.lft(btex $b=-10.465$ etex, (0,b*v/2)) withcolor red;

label.top(btex $a=1.8995$ etex, (0,0)) rotated angle(1, a * v / u) shifted (12.5 * u, (a * 12.5 + b) * v) withcolor blue;

pickup pencircle scaled 1pt;
for x = 15 step 5 until 25:
	draw (x * u, -2)--(x * u, 2);
endfor;
for y = 20 step 10 until 40:
	draw (-2, y * v)--(2, y * v);
endfor;
label.bot(btex 15 etex, (15 * u, -2));
label.bot(btex 20 etex, (20 * u, -2));
label.bot(btex 25 etex, (25 * u, -2));
label.lft(btex 20 etex, (-2, 20 * v));
label.lft(btex 30 etex, (-2, 30 * v));
label.lft(btex 40 etex, (-2, 40 * v));

pickup pencircle scaled 4pt;

draw z1 withcolor green;
draw z2 withcolor green;
draw z3 withcolor green;
draw z4 withcolor green;

endfig;

end
