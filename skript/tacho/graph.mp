verbatimtex
\documentclass[12pt]{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

numeric tunit;
tunit = 14;
numeric xunit;
xunit := 14;
numeric vunit;
vunit := 140;

%
% system image
%
beginfig(1)

input curves.mp;

z0 = (0,0);
z1 = (10 * tunit, 0);
z2 = (20 * tunit, 10 * xunit);
z3 = (30 * tunit, 10 * xunit);

z4 = (10 * tunit, 1 * vunit);
z5 = (20 * tunit, 1 * vunit);
z6 = (20 * tunit, 0);
z7 = (30 * tunit, 0);

z8 = (0, 12 * xunit);
z9 = (0, 1.2 * vunit);
z10 = (0, -15 * xunit);

path xreal;
xreal = z0--z1--z2--z3;
path vreal;
vreal = z0--z1--z4--z5--z6--z7;

pickup pencircle scaled 1pt;

fill xerror withcolor (1,0.8,0.8);

pickup pencircle scaled 0.7pt;
drawarrow (z0 shifted (-10,0))--(z7 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z8 shifted (0,10));
label.top(btex $\mathstrut t$ etex, z7 shifted (10,0));
label.rt(btex $\mathstrut x$ etex, z8 shifted (0,10));

fill verror shifted z10 withcolor (1,0.8,0.8);

pickup pencircle scaled 0.7pt;
drawarrow ((z0 shifted (-10,0))--(z7 shifted (10,0))) shifted z10;
drawarrow ((z0 shifted (0,-10))--(z9 shifted (0,10))) shifted z10;
label.top(btex $\mathstrut t$ etex, z7 shifted (10,0) shifted z10);
label.rt(btex $v$ etex, z9 shifted (0,10) shifted z10);

pickup pencircle scaled 0.7pt;
draw zmeasured withcolor green;
pickup pencircle scaled 0.7pt;
draw xreal withcolor blue;
pickup pencircle scaled 1pt;
draw xfiltered withcolor red;

pickup pencircle scaled 0.7pt;
draw vreal shifted z10 withcolor blue;
pickup pencircle scaled 1pt;
draw vfiltered shifted z10 withcolor red;

endfig;

end
