beginfig(1)
verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\begin{document}
etex;

path p, q, r;
p = (-100,-10)--(-20,-10)--(-20,70)--(-100,70)--cycle;
fill p withcolor (0.8,0.8,1);
q = (-20,-70)--(100,-70)--(100,-10)--(-20,-10)--cycle;
fill q withcolor (1,0.8,0.8);
r = (-100,-70)--(-20,-70)--(-20,-10)--(-100,-10)--cycle;
fill r withcolor (0.8,0.64,0.8);

draw (-100,-70)--(100,-70)--(100,70)--(-100,70)--(-100,70)--cycle;
draw (-20,-70)--(-20,70);
draw (-100,-10)--(100,-10);

label.llft(btex $A$ etex, (-30,60));
label.llft(btex $B$ etex, (90,-20));
label.llft(btex $A\cap B$ etex, (-30,-20));

endfig;

beginfig(2)

path p, q, r;
p = (-100,-70)--(-20,-70)--(-20,70)--(-100,70)--cycle;
fill p withcolor (0.8,0.8,1);

q = (-60,-30)..(-10,-50)..(60,-30)..(60,60)..(-10,0)..(-60,-10)..cycle;
fill q withcolor (0.8,0.64,0.8);
r = buildcycle(q, (-20,70)--(-20,-70));
fill r withcolor (1,0.8,0.8);
draw q;
label.llft(btex $B$ etex, (70,40));

draw (-100,-70)--(100,-70)--(100,70)--(-100,70)--(-100,70)--cycle;
draw (-20,-70)--(-20,70);

label.llft(btex $A$ etex, (-30,60));
label.top(btex $A\cap B$ etex, (-40,-20));

endfig;

beginfig(3)

pickup pencircle scaled 1pt;
draw (0,0)--(200,0)--(200,140)--(0,140)--cycle;
draw (60,0)--(60,140);
draw (0,40)--(200,40);

fill (1,1)--(59,1)--(59,39)--(1,39)--cycle withcolor (1.0,0.8,0.8);
draw (1,1)--(59,1)--(59,39)--(1,39)--cycle withcolor (1.0,0.0,0.0);

draw (-1,-1)--(201,-1)--(201,141)--(-1,141)--cycle withcolor (0.0,0.0,1.0);

label(btex $A\cap B$ etex, (30,20));
label(btex $A$ etex, (30, 90));
label(btex $B$ etex, (130,20));
label.top(btex $\Omega$ etex, (190,140));

label.bot(btex $P(A\cap B)$ etex, (100,-5));

endfig;

beginfig(4)

pickup pencircle scaled 1pt;
draw (0,0)--(200,0)--(200,140)--(0,140)--cycle;
draw (60,0)--(60,140);
draw (0,40)--(200,40);

fill (1,1)--(59,1)--(59,39)--(1,39)--cycle withcolor (1.0,0.8,0.8);
draw (1,1)--(59,1)--(59,39)--(1,39)--cycle withcolor (1.0,0.0,0.0);

draw (-1,-1)--(61,-1)--(61,141)--(-1,141)--cycle withcolor (0.0,0.0,1.0);

label(btex $A\cap B$ etex, (30,20));
label(btex $A$ etex, (30, 90));
label(btex $B$ etex, (130,20));
label.top(btex $\Omega$ etex, (190,140));

label.bot(btex $P(B|A)$ etex, (100,-5));

endfig;

beginfig(5)

pickup pencircle scaled 1pt;
draw (0,0)--(200,0)--(200,140)--(0,140)--cycle;
draw (60,0)--(60,140);
draw (0,40)--(200,40);

fill (1,1)--(59,1)--(59,39)--(1,39)--cycle withcolor (1.0,0.8,0.8);
draw (1,1)--(59,1)--(59,39)--(1,39)--cycle withcolor (1.0,0.0,0.0);

draw (-1,-1)--(201,-1)--(201,41)--(-1,41)--cycle withcolor (0.0,0.0,1.0);

label(btex $A\cap B$ etex, (30,20));
label(btex $A$ etex, (30, 90));
label(btex $B$ etex, (130,20));
label.top(btex $\Omega$ etex, (190,140));

label.bot(btex $P(A|B)$ etex, (100,-5));

endfig;

end
