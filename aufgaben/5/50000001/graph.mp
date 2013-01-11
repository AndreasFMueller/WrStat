\beginfig(1)
verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\begin{document}
etex;

pickup pencircle scaled 1pt;

draw(-350,0)--(150,0);
draw(-300,-3)--(-300,3);
draw(-200,-3)--(-200,3);
draw(-100,-3)--(-100,3);
draw(0,-3)--(0,3);
draw(100,-3)--(100,3);
draw(0,-5)--(0,105);
draw(-3,100)--(3,100);

pickup pencircle scaled 2pt;
draw (-350,0)--(-300,0)--(0,50)--(100,0)--(150,0);

label.bot(btex $-3$ etex, (-300,-3));
label.bot(btex $-2$ etex, (-200,-3));
label.bot(btex $-1$ etex, (-100,-3));
label.bot(btex $0$ etex, (0,-3));
label.bot(btex $1$ etex, (100,-3));
label.bot(btex $x$ etex, (150,-3));

label.rt(btex $\varphi(x)$ etex, (3,100));

endfig;

beginfig(2)

pickup pencircle scaled 1pt;

draw(-350,0)--(150,0);
draw(0,-5)--(0,105);
draw(-3,100)--(3,100);
draw(-300,-3)--(-300,3);
draw(-200,-3)--(-200,3);
draw(-100,-3)--(-100,3);
draw(0,-3)--(0,3);
draw(100,-3)--(100,3);

pickup pencircle scaled 2pt;

draw(-350,0)--(-300,0){right}..(-200,100/12)..(-150,225/12)..(-100,400/12)..(-50,625/12)..(0,900/12){dir 26.565}..(50,100-100/16)..{right}(100,100)--(150,100);

label.bot(btex $-3$ etex, (-300,-3));
label.bot(btex $-2$ etex, (-200,-3));
label.bot(btex $-1$ etex, (-100,-3));
label.bot(btex $0$ etex, (0,-3));
label.bot(btex $1$ etex, (100,-3));
label.bot(btex $x$ etex, (150,-3));

label.lft(btex $F(x)$ etex, (-3,100));

endfig;


end
