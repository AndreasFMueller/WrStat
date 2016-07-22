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
u := 30;

numeric r;
r := 1000;

numeric a;
a := 10;

numeric h;
h := (1 - cosd(a)) * r;

z0 = (   0, h);
z1 = (-130, 0);
z2 = ( 130, 0);
z10 = z1 shifted ((-sind(a), cosd(a)) scaled 50);
z20 = z2 shifted (( sind(a), cosd(a)) scaled 50);

def va(expr phi, w) =
	(((cosd(phi), sind(phi)) scaled w) shifted z1)
enddef;

def vb(expr phi, w) =
	(((-cosd(phi), sind(phi)) scaled w) shifted z2)
enddef;

numeric w;
w := 30;

path pa;
pa = va(0,w);
for ang = 1 step 1 until 90 + a:
	pa := pa--va(ang,w);
endfor;
pa := pa--va(90 + a, w);

path pb;
pb = vb(0,w);
for ang = 1 step 1 until 90 + a:
	pb := pb--vb(ang,w);
endfor;
pb := pb--vb(90 + a, w);

fill z1--pa--cycle withcolor 0.9;
fill z2--pb--cycle withcolor 0.9;

pickup pencircle scaled 0.7pt;

draw z1..z0..z2 withcolor blue;

pickup pencircle scaled  1 pt;

draw z1--z10;
draw z2--z20;
draw z1--z2;

pickup pencircle scaled 3pt;

draw z1;
draw z2;

label.llft(btex $A$ etex, z1);
label.lrt(btex $B$ etex, z2);

label(btex $\alpha$ etex, va(45+a/2, w * 0.6));
label(btex $\beta$ etex, vb(45+a/2, w * 0.6));
label.top(btex $l=300\text{m}$ etex, z0) withcolor blue;

endfig;

end
