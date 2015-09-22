verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

numeric s;
s = 6;
numeric delta;
delta = 0.5;
numeric st;
st = 40;

def wuerfel(expr o, a, c) =
	path p;
	p = (o shifted (-s/2-delta, -s/2)){down}
		..{right}(o shifted (-s/2,-s/2-delta))
	--(o shifted (s/2,-s/2-delta)){right}
		..{up}(o shifted (s/2+delta,-s/2))
	--(o shifted (s/2+delta, s/2)){up}
		..{left}(o shifted (s/2, s/2+delta))
	--(o shifted (-s/2, s/2+delta)){left}
		..{down}(o shifted (-s/2-delta, s/2))
	--cycle;
	pickup pencircle scaled 0.5pt;
	fill p withcolor c;
	draw p withcolor c;
	pickup pencircle scaled 1.5pt;
	if a = 1:
		draw o withcolor white;
	elseif a = 2:
		draw (o shifted (-s/3,-s/3)) withcolor white;
		draw (o shifted (+s/3,+s/3)) withcolor white;
	elseif a = 3:
		draw o withcolor white;
		draw (o shifted (-s/3,-s/3)) withcolor white;
		draw (o shifted (+s/3,+s/3)) withcolor white;
	elseif a = 4:
		draw (o shifted (-s/3,-s/3)) withcolor white;
		draw (o shifted (+s/3,+s/3)) withcolor white;
		draw (o shifted (-s/3,+s/3)) withcolor white;
		draw (o shifted (+s/3,-s/3)) withcolor white;
	elseif a = 5:
		draw o withcolor white;
		draw (o shifted (-s/3,-s/3)) withcolor white;
		draw (o shifted (+s/3,+s/3)) withcolor white;
		draw (o shifted (-s/3,+s/3)) withcolor white;
		draw (o shifted (+s/3,-s/3)) withcolor white;
	elseif a = 6:
		draw (o shifted (-s/3,-s/3)) withcolor white;
		draw (o shifted (+s/3,+s/3)) withcolor white;
		draw (o shifted (-s/3,+s/3)) withcolor white;
		draw (o shifted (+s/3,-s/3)) withcolor white;
		draw (o shifted (-s/3,0)) withcolor white;
		draw (o shifted (+s/3,0)) withcolor white;
	fi;
enddef;

def wuerfelpaar(expr o, a, b) =
	wuerfel(o shifted (-0.8 * s, 0), a, red);
	wuerfel(o shifted (+0.8 * s, 0), b, blue);
enddef;

def punkt(expr r,b) =
	(st * r, -st * b)
enddef;

beginfig(1)

% Ereignis S_7
path p;

p = (punkt(1,6) shifted (st/4,-st/4))--(punkt(6,1) shifted (st/4,-st/4))
	..(punkt(6,1) shifted (st/4,st/4))..
	(punkt(6,1) shifted (-st/4,st/4))--(punkt(1,6) shifted (-st/4,st/4))
	..(punkt(1,6) shifted (-st/4,-st/4))..cycle;
fill p withcolor 0.95;
p := (punkt(2,1) shifted (st/3,0))--(punkt(2,6)shifted(st/3,0))
	..(punkt(2,6)shifted(0,-st/3))..
(punkt(2,6)shifted(-st/3,0))--(punkt(2,1) shifted (-st/3,0))
	..(punkt(2,1)shifted(0,+st/3))..cycle;
fill p withcolor 0.95;
p := (punkt(1,3) shifted(0,st/3))--(punkt(6,3)shifted(0,st/3))
	..(punkt(6,3)shifted(st/3,0))..
	(punkt(6,3)shifted(0,-st/3))--(punkt(1,3) shifted(0,-st/3))
	..(punkt(1,3)shifted(-st/3,0))..cycle;
fill p withcolor 0.95;
p := (punkt(6,4)shifted(st/4,-st/4))--(punkt(4,6)shifted(st/4,-st/4))
	..(punkt(4,6)shifted(-st/4,-st/4))..
	(punkt(4,6)shifted(-st/4,st/4))--(punkt(6,4)shifted(-st/4,st/4))
	..(punkt(6,4)shifted(st/4,st/4))..cycle;
fill p withcolor 0.95;

p := (punkt(1,6) shifted (st/4,-st/4))--(punkt(6,1) shifted (st/4,-st/4))
	..(punkt(6,1) shifted (st/4,st/4))..
	(punkt(6,1) shifted (-st/4,st/4))--(punkt(1,6) shifted (-st/4,st/4))
	..(punkt(1,6) shifted (-st/4,-st/4))..cycle;
color scolor;
scolor = (1,0.4,1);
draw p withcolor scolor;
label(btex $S_7$ etex, 0.5[punkt(5,2),punkt(6,1)]) withcolor scolor;

% Ereignis X_2
p := (punkt(2,1) shifted (st/3,0))--(punkt(2,6)shifted(st/3,0))
	..(punkt(2,6)shifted(0,-st/3))..
(punkt(2,6)shifted(-st/3,0))--(punkt(2,1) shifted (-st/3,0))
	..(punkt(2,1)shifted(0,+st/3))..cycle;
color darkgreen;
darkgreen = (0.2,0.6,0.2);
draw p withcolor darkgreen;
label(btex $X_2$ etex, 0.5[punkt(2,2),punkt(2,1)]) withcolor darkgreen;

p := (punkt(1,3) shifted(0,st/3))--(punkt(6,3)shifted(0,st/3))
	..(punkt(6,3)shifted(st/3,0))..
	(punkt(6,3)shifted(0,-st/3))--(punkt(1,3) shifted(0,-st/3))
	..(punkt(1,3)shifted(-st/3,0))..cycle;
color yellow;
yellow = (0.8,0.8,0);
draw p withcolor yellow;
label(btex $Y_3$ etex, 0.5[punkt(5,3),punkt(6,3)]) withcolor yellow;

p := (punkt(6,4)shifted(st/4,-st/4))--(punkt(4,6)shifted(st/4,-st/4))
	..(punkt(4,6)shifted(-st/4,-st/4))..
	(punkt(4,6)shifted(-st/4,st/4))--(punkt(6,4)shifted(-st/4,st/4))
	..(punkt(6,4)shifted(st/4,st/4))..cycle;
color orange;
orange = (1,0.4,0);
draw p withcolor orange;
label(btex $S_{10}$ etex, 0.5[punkt(6,4),punkt(5,5)]) withcolor orange;

for r = 1 step 1 until 6:
	for b = 1 step 1 until 6:
		wuerfelpaar(punkt(r, b), r, b);
	endfor;
endfor;

pickup pencircle scaled 1pt;

z0 = (st/2,-st/2);
z1 = (st/2 + 6 * st, -st/2);
z2 = (st/2 + 6 * st, -st/2 - 6 * st);
z3 = (st/2, -st/2 - 6 * st);

draw z0--z1--z2--z3--cycle;

label.ulft(btex $\Omega$ etex, z1);


% Ereignis D_2
%draw (punkt(3,1) shifted(st/4,st/4))--(punkt(6,4)shifted(st/4,st/4))
%	..(punkt(6,4)shifted(st/4,-st/4))..
%	(punkt(6,4)shifted(-st/4,-st/4))--(punkt(3,1) shifted(-st/4,-st/4))
%	..(punkt(3,1)shifted(-st/4,+st/4))..cycle
%;

% Ereignis D_0



endfig;

end
