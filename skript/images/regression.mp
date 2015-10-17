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

numeric v, a;
v = 2;
a = 2;

def f(expr spannung) =
	(spannung * 0.9106 + 0.2436)
enddef;

def i(expr spannung, strom) =
	( spannung * v, (10 * (f(spannung) - strom) + strom) * a)
enddef;


z10 = i( 10,  9.4);
z11 = i( 20, 18.4);
z12 = i( 30, 27.4);
z13 = i( 40, 36.9);
z14 = i( 50, 45.9);
z15 = i( 60, 54.9);
z16 = i( 70, 63.9);
z17 = i( 80, 72.9);
z18 = i( 90, 82.0);
z19 = i(100, 91.5);
z20 = i(110,100.5);

z0 = (0,0);
z1 = (110 * v, 0);
z2 = (0, 100 * a);

z30 = (0,0.2436 * a);
z31 = (110 * v, (110 * 0.9106 + 0.2436) * a);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 10 step 10 until 110:
	draw (x * v, -2)--(x * v, 2);
endfor;

for y = 10 step 10 until 100:
	draw (-2, y * a)--(2, y * a);
endfor;

draw ((-0.01)[z30,z31])--((1.01)[z30,z31]) withcolor blue;

pickup pencircle scaled 3pt;

draw z10 withcolor red;
draw z11 withcolor red;
draw z12 withcolor red;
draw z13 withcolor red;
draw z14 withcolor red;
draw z15 withcolor red;
draw z16 withcolor red;
draw z17 withcolor red;
draw z18 withcolor red;
draw z19 withcolor red;
draw z20 withcolor red;

label.top(btex $U \text{[mV]}$ etex, z1 shifted (10,0));
label.lft(btex $I \text{[$\mu$A]}$ etex, z2 shifted (0,10));

label.bot(btex $ 10$ etex, ( 10 * v, -2));
label.bot(btex $ 20$ etex, ( 20 * v, -2));
label.bot(btex $ 30$ etex, ( 30 * v, -2));
label.bot(btex $ 40$ etex, ( 40 * v, -2));
label.bot(btex $ 50$ etex, ( 50 * v, -2));
label.bot(btex $ 60$ etex, ( 60 * v, -2));
label.bot(btex $ 70$ etex, ( 70 * v, -2));
label.bot(btex $ 80$ etex, ( 80 * v, -2));
label.bot(btex $ 90$ etex, ( 90 * v, -2));
label.bot(btex $100$ etex, (100 * v, -2));
label.bot(btex $110$ etex, (110 * v, -2));

label.lft(btex $ 10$ etex, (-2,  10 * a));
label.lft(btex $ 20$ etex, (-2,  20 * a));
label.lft(btex $ 30$ etex, (-2,  30 * a));
label.lft(btex $ 40$ etex, (-2,  40 * a));
label.lft(btex $ 50$ etex, (-2,  50 * a));
label.lft(btex $ 60$ etex, (-2,  60 * a));
label.lft(btex $ 70$ etex, (-2,  70 * a));
label.lft(btex $ 80$ etex, (-2,  80 * a));
label.lft(btex $ 90$ etex, (-2,  90 * a));
label.lft(btex $100$ etex, (-2, 100 * a));

endfig;

end
