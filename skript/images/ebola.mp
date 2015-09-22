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

numeric width, height;
width = 140;
height = 100;

z0 = (0,0);
z1 = (width, 0);
z2 = (width, height);
z3 = (0, height);

z4 = (60, 30);
z5 = z4 shifted (20,0);
z6 = z4 shifted (20,30);
z7 = z4 shifted (0,30);

z15 = z4 shifted (-2, -2);
z8 = z15 shifted (40,0);
z9 = z15 shifted (40, 40);
z10 = z15 shifted (0, 40);

z11 = (20,20);
z12 = z11 shifted (65,0);
z13 = z11 shifted (65,20);
z14 = z11 shifted (0, 20);

def roundedbox(expr p, q, r, s) =
	draw 	(p shifted (-5,0)){down}..(p shifted (0,-5))
		--(q shifted (0,-5)){right}..{up}(q shifted (5,0))
		--(r shifted (5,0)){up}..{left}(r shifted (0,5))
		--(s shifted (0,5)){left}..{down}(s shifted (-5,0))--cycle;
enddef;

pickup pencircle scaled 1pt;

draw z0--z1--z2--z3--cycle;

label.ulft(btex $\Omega$ etex, z2);

roundedbox(z4, z5, z6, z7);

label(btex $E$ etex, (0.5[z4, z6]) shifted (0,10));

roundedbox(z15, z8, z9, z10);

label(btex $K$ etex, (0.7[z8,z9]) shifted (-5,0));

roundedbox(z11, z12, z13, z14);

label(btex $T$ etex, (0.5[z11,z14]) shifted (5,0));

endfig;

end
