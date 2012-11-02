beginfig(1)
verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\begin{document}
etex;

def	drawblock(expr x, y) =
	fill (x,0)--(x+20,0)--(x+20,y)--(x,y)--cycle withcolor (0.9,0.9,0.9);
	draw (x,0)--(x+20,0)--(x+20,y)--(x,y)--cycle;
enddef;

pickup pencircle scaled 0.7pt;

drawblock(20, 20);
drawblock(60, 40);
drawblock(80, 100);
drawblock(100, 120);
drawblock(120, 180);
drawblock(140, 160);
drawblock(160, 40);
drawblock(180, 80);
drawblock(220, 40);
drawblock(260, 20);

pickup pencircle scaled 1pt;

draw (-10,0)--(290,0);
draw (0,-5)--(0,210);

pickup pencircle scaled 1.5pt;

draw (127,-20)--(127,200) withcolor red;

draw (80.622,-20)--(80.622,200) withcolor (1,0.8,0);
draw (173.38,-20)--(173.38,200) withcolor (1,0.8,0);

label.top(btex $E(X)$ etex, (127,200));

pickup pencircle scaled 1pt;
drawarrow (127,-10)--(80.622,-10);
drawarrow (127,-10)--(173.38,-10);
label.bot(btex $\sqrt{\operatorname{var}(X)}$ etex, (103.81, -15));
label.bot(btex $\sqrt{\operatorname{var}(X)}$ etex, (150.19, -15));

endfig;

beginfig(2)

pickup pencircle scaled 1pt;

draw (-20,-20)--(120,120) withcolor white;

draw (0,0)--(100,0)--(100,100)--(0,100)--cycle;

draw (0,20){right}..{right}(100,10);
draw (0,40){right}..{right}(100,20);
draw (0,80){right}..{right}(100,90);

label.lft(btex $A_1$ etex, (0,10));
label.lft(btex $A_2$ etex, (0,30));
label.lft(btex $\vdots$ etex, (0,60));
label.lft(btex $A_n$ etex, (0,90));

draw (20,0){up}..{up}(25,100);
draw (50,0){up}..{up}(40,100);
draw (80,0){up}..{up}(75,100);

label.bot(btex $B_1$ etex, (10,0));
label.bot(btex $B_2$ etex, (35,0));
label.bot(btex $\dots\mathstrut$ etex, (65,0));
label.bot(btex $B_m$ etex, (90,0));

endfig;

beginfig(3)

pickup pencircle scaled 1pt;

draw (-20,-20)--(120,120) withcolor white;

draw (0,0)--(100,0)--(100,100)--(0,100)--cycle;

draw (20,0){up}..{up}(25,100);
draw (50,0){up}..{up}(40,100);
draw (80,0){up}..{up}(75,100);

label.bot(btex $B_1$ etex, (10,0));
label.bot(btex $B_2$ etex, (35,0));
label.bot(btex $\dots\mathstrut$ etex, (65,0));
label.bot(btex $B_m$ etex, (90,0));

endfig;

beginfig(4)

pickup pencircle scaled 1pt;

draw (-20,-20)--(120,120) withcolor white;

draw (0,0)--(100,0)--(100,100)--(0,100)--cycle;

draw (0,20){right}..{right}(100,10);
draw (0,40){right}..{right}(100,20);
draw (0,80){right}..{right}(100,90);

label.lft(btex $A_1$ etex, (0,10));
label.lft(btex $A_2$ etex, (0,30));
label.lft(btex $\vdots$ etex, (0,60));
label.lft(btex $A_n$ etex, (0,90));

endfig;

end
