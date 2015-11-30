verbatimtex
\documentclass[12pt]{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

numeric u;
u := 120;

%
% system image
%
beginfig(1)

z0 = (0,0);
z1 = (u,u);
z2 = z1 shifted (30,-10);

pickup pencircle scaled 1.5pt;
draw z0{dir angle (z1-z0)}..tension 1.9 ..{dir angle (z2-z1)}z2;

pickup pencircle scaled 1pt;
drawarrow z0--z1;
drawarrow z1--z2;

pickup pencircle scaled 4pt;
draw z0;
draw z1;
draw z2;
pickup pencircle scaled 3pt;
draw z0 withcolor white;
draw z1 withcolor white;
draw z2 withcolor white;

label.lft(btex $x_k$ etex, z0);
label.ulft(btex $\varphi_k x_k$ etex, z1);
label.rt(btex $x_{k+1}$ etex, z2);
label.urt(btex $u_{k+1}$ etex, 0.35[z1,z2]);

endfig;

%
% prediction/correction image
%
beginfig(2)

z0 = (0,0);
z1 = (u,u);
z2 = z1 shifted (30,-10);
z3 = (-20,-20);
z4 = (xpart(z1),ypart(z3));
z5 = (xpart(z2),ypart(z3));
z6 = (220,160);
z7 = (xpart(z2) + 15, ypart(z3));
z8 = (xpart(z2),ypart(z6));
z9 = (xpart(z2) + 15, ypart(z6));

color pink;
pink = (1,0.95,0.95);

pickup pencircle scaled 35pt;
draw z0 withcolor pink;
pickup pencircle scaled 70pt;
draw z1 withcolor pink;
numeric w;
w := 20;
fill (z7 shifted (-w,0))
	--(z7 shifted (w,0))
	--(z9 shifted (w,0))
	--(z9 shifted (-w,0))--cycle withcolor pink;

pickup pencircle scaled 0.5pt;

drawarrow z3 shifted(-10,0)--(xpart(z6),ypart(z3));
drawarrow z3 shifted(0,-10)--(xpart(z3),ypart(z6));

draw z1--z4;
draw z7--z9;

pickup pencircle scaled 1pt;
draw (z4 shifted (0,-2))--(z4 shifted (0,2));
draw (z7 shifted (0,-2))--(z7 shifted (0,2));
drawarrow z0--z1;
drawarrow z1--z2 withcolor blue;

pickup pencircle scaled 0.1pt yscaled 20;
draw z4--z7 withcolor blue;

z10 = (0.5[z4,z7]) shifted (0,20);
z11 = (0.5[z1,z2]) shifted (-2,-5);
z12 = (0.5[z10,z11]) shifted (-2,0);

pickup pencircle scaled 1pt;
drawarrow z10..z12..z11 withcolor blue;
label.lft(btex $K$ etex, z12) withcolor blue;

pickup pencircle scaled 4pt;
draw z0;
draw z1;
draw z2;
pickup pencircle scaled 3pt;
draw z0 withcolor white;
draw z1 withcolor white;
draw z2 withcolor white;

label.lft(btex $\hat x_k$ etex, z0);
label.ulft(btex $\hat x_{k+1|k}$ etex, z1);
label.bot(btex $z_{k+1}\mathstrut$ etex, z7);
label.bot(btex $H\hat x_{k+1|k}$ etex, z4 shifted (-10,0));
label.top(btex $z_{k+1}-H\hat x_{k+1|k}$ etex, 0.5[z4,z7]) withcolor blue;
label.rt(btex $\hat x_{k+1}$ etex, z2);

endfig;

end
