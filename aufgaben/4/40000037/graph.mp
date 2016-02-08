verbatimtex
\documentclass[12pt]{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

numeric u, v;
u := 3;
v := 30;

z0 = (0,0);
z1 = (100 * u, 0);
z2 = (0, 7 * v);

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z2 shifted (0,10));

z10 = (96.930 * u, 5.21 * v);
z11 = (54.370 * u, 4.93 * v);
z12 = (40.001 * u, 4.00 * v);
z13 = ( 1.608 * u, 1.90 * v);
z14 = (86.468 * u, 6.44 * v);

pickup pencircle scaled 4pt;
draw z10 withcolor red;
draw z11 withcolor red;
draw z12 withcolor red;
draw z13 withcolor red;

pickup pencircle scaled 6pt;
draw z14 withcolor red;
label.top(btex CH etex, z14) withcolor red;

numeric a, b;

a := 0.03495;
b := 2.3244;

pickup pencircle scaled 0.5pt;

draw z10--(x10, (96.930 * a + b) * v) withcolor red;
draw z11--(x11, (54.370 * a + b) * v) withcolor red;
draw z12--(x12, (40.001 * a + b) * v) withcolor red;
draw z13--(x13, ( 1.608 * a + b) * v) withcolor red;

pickup pencircle scaled 1pt;

draw z14--(x14, (86.468 * a + b) * v) withcolor red;

z20 = (-2 * u, (-2 * a + b) * v);
z21 = (100 * u, (100 * a + b) * v);

z22 = 0[z20,z21];
z23 = 1[z20,z21];

draw z22--z23 withcolor blue;

endfig;

end
