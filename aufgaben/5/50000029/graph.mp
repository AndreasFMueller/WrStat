verbatimtex
\documentclass[12pt]{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;


numeric u, v;
u := 80;
v := 120;
numeric pi;
pi := 3.1415926;

beginfig(1)

z0 = (0,0);
z1 = (-1 * u, 0);
z2 = ((pi + 1) * u, 0);
z3 = (0,1 * v);
z4 = (pi * u, 0);

path p, q;
p := (z1 shifted (-10,0))--z0;
for x = 0.01 step 0.01 until 3.14:
	p := p--(x * u, 0.5 * (1 - cosd(180 * x / pi)) * v);
endfor;
p := p--(pi * u, v);

q := p--(pi * u, 0)--(z2 shifted (5,0))--cycle;
fill q withcolor (1,0.9,0.9);


z5 = (0.5 * pi * u, 0.5 * v);

pickup pencircle scaled 0.5pt;
draw (0, 0.5*v)--z5;
pickup pencircle scaled 1pt;
draw (-2,0.5*v)--(2,0.5*v);
draw (-2,v)--(2,v);

pickup pencircle scaled 4pt;
draw z5 withcolor red;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z3 shifted (0,10));
label.top(btex $x$ etex, z2 shifted (10,0));
label.rt(btex $\varphi_X(x)$ etex, z3 shifted (0,10));
label.lft(btex $a$ etex, z0 shifted (-2,0.5*v));
label.lft(btex $2a$ etex, z0 shifted (-2,v));

pickup pencircle scaled 1.5pt;
draw p withcolor red;
draw (pi * u, 0)--(z2 shifted (5,0)) withcolor red;

draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z4 shifted (0,-2))--(z4 shifted (0,2));
label.bot(btex $-1$ etex, z1 shifted (0,-2));
label.bot(btex $\mathstrut\pi$ etex, z4 shifted (0,-2));

endfig;

beginfig(2)

z0 = (0,0);
z1 = (-1 * u, 0);
z2 = ((pi + 1) * u, 0);
z3 = (0,1 * v);
z4 = (pi * u, 0);

path p, q;
p := (z1 shifted (-10,0))--z0;
for x = 0.01 step 0.01 until 3.14:
	p := p--(x * u, 0.5 * (1 - cosd(180 * x / pi)) * v);
endfor;
p := p--(pi * u, v);

q := p--(pi * u, 0)--(z2 shifted (5,0))--cycle;
fill q withcolor (1,0.9,0.9);


z5 = (0.5 * pi * u, 0.5 * v);

pickup pencircle scaled 0.5pt;
draw (0, 0.5*v)--z5;
pickup pencircle scaled 1pt;
draw (-2,0.5*v)--(2,0.5*v);
draw (-2,v)--(2,v);

pickup pencircle scaled 4pt;
draw z5 withcolor red;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z3 shifted (0,10));
label.top(btex $x$ etex, z2 shifted (10,0));
label.rt(btex $\varphi_X(x)$ etex, z3 shifted (0,10));
label.lft(btex $a$ etex, z0 shifted (-2,0.5*v));
label.lft(btex $2a$ etex, z0 shifted (-2,v));

pickup pencircle scaled 1.5pt;
draw p withcolor red;
draw (pi * u, 0)--(z2 shifted (5,0)) withcolor red;

draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z4 shifted (0,-2))--(z4 shifted (0,2));
label.bot(btex $-1$ etex, z1 shifted (0,-2));
label.bot(btex $\mathstrut\pi$ etex, z4 shifted (0,-2));

numeric m, var;
m = 2.207416;
var = 0.6489651;

draw (m * u, -5)--(m * u, v + 1) withcolor blue;
draw ((m - var) * u, -5)--((m - var) * u, v + 1) withcolor blue;
draw ((m + var) * u, -5)--((m + var) * u, v + 1) withcolor blue;

z10 = (m * u, 0.25 * v);
z11 = z10 shifted (-var * u, 0);
z12 = z10 shifted ( var * u, 0);
pickup pencircle scaled 0.7pt;

draw (z10 shifted (-2,-2))--(z10 shifted (2,2)) withcolor blue;
draw (z11 shifted (-2,-2))--(z11 shifted (2,2)) withcolor blue;
draw (z12 shifted (-2,-2))--(z12 shifted (2,2)) withcolor blue;
draw z11--z12 withcolor blue;
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, 0.5[z10,z11]) withcolor blue;
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, 0.5[z10,z12]) withcolor blue;

label.top(btex $E(X)$ etex, (m * u, v + 1)) withcolor blue;


endfig;

end
