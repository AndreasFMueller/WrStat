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
% Rahmen
draw (-100,-70)--(100,-70)--(100,70)--(-100,70)--cycle;

path c;
c = (-80,20)..(-70,-30)..(-10,-10)..(80,20)..(0,30)..cycle;
fill c withcolor (1,0.8,0.8);
draw c;

draw (-50,-70)--(-50,70);
draw (-10,-70)--(-10,70);
draw ( 40,-70)--( 40,70);

label.llft(btex $\Omega$ etex, (100,70));
label.top(btex $A$ etex, (15,5));
label.top(btex $B_1$ etex, (-75,-60));
label.top(btex $B_2$ etex, (-30,-60));
label.top(btex $\dots$ etex, (15,-60));
label.top(btex $B_n$ etex, (70,-60));

endfig;

end
