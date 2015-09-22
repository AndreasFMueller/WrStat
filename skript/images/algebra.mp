beginfig(1)
verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

draw (-100,-70)--(100,-70)--(100,70)--(-100,70)--cycle;

path a;
a = (-90,-20)..(-80,-50)..(-40,-60)..(-60,-10)..cycle;
fill a withcolor (1,0.8,0.8);
draw a;
path b;
b = (-10,-40)..(40,-50)..(80,-30)..(70,10)..(20,20)..(0,-10)..cycle;
fill b withcolor (1,0.8,0.8);
draw b;
path c;
c = (-80,50)..(-70,0)..(-10,20)..(30,50)..(0,60)..cycle;
fill c withcolor (1,0.8,0.8);
draw c;


label.llft(btex $B$ etex, (60,42));
label.llft(btex $\Omega$ etex, (100,70));

draw (-60,-42)--(60,-42)--(60,42)--(-60,42)--(-60,42)--cycle;

endfig;

beginfig(2)

draw (-100,-70)--(100,-70)--(100,70)--(-100,70)--cycle;

path a;
a = (-90,-20)..(-80,-50)..(-40,-60)..(-60,-10)..cycle;
path b;
b = (-10,-40)..(40,-50)..(80,-30)..(70,10)..(20,20)..(0,-10)..cycle;
path c;
c = (-80,50)..(-70,0)..(-10,20)..(30,50)..(0,60)..cycle;

fill a withcolor (1,0.8,0.8);
draw a;
fill b withcolor (1,0.8,0.8);
draw b;
fill c withcolor (1,0.8,0.8);
draw c;


label.llft(btex $B$ etex, (60,42));
label.llft(btex $\Omega$ etex, (100,70));

draw (-60,-42)--(60,-42)--(60,42)--(-60,42)--(-60,42)--cycle;

clip currentpicture to (-60.3,-42.3)--(60.3,-42.3)--(60.3,42.3)--(-60.3,42.3)--(-60.3,42.3)--cycle;

draw (-100,-70)--(100,-70)--(100,70)--(-100,70)--cycle withcolor 0.6white;
label.llft(btex $\Omega$ etex, (100,70)) withcolor 0.6white;

endfig;

end
