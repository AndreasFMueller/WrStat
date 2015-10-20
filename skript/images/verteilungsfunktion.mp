verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

%
% Zufallsvariable
%
beginfig(1)

draw (0,0)..(100,0);
draw (100,0)..(100,80);
draw (100,80)..(0,80);
draw (0,0)..(0,80);
label.ulft(btex \scriptsize $\Omega$ etex, (100,80));

path pnull; pnull = (0,40)..(10,43)..(30,30)..(50,20)..(70,0);
path peins; peins = (0,60)..(10,63)..(30,50)..(50,40)..(70,20)..(90,10)..(100,5);
path pzwei; pzwei =         (10,80)..(30,70)..(50,60)..(70,40)..(90,30)..(100,25);
path pdrei; pdrei =                           (50,80)..(70,60)..(90,50)..(100,45);
draw pnull;
draw peins;
draw pzwei;
draw pdrei;

label.llft(btex \scriptsize $X\le 0$ etex, (40,20));
label.llft(btex \scriptsize $X\le 1$ etex, (55,40));
label.llft(btex \scriptsize $X\le 2$ etex, (53,60));
label.llft(btex \scriptsize $X\le 3$ etex, (51,80));

drawarrow (110,40)..(150,60)..(190,50);
label.top(btex\scriptsize  $X$ etex, (150,60));

drawarrow (200,-20)..(200,100);
label.urt(btex \scriptsize $\mathbb{R}$ etex, (205,100));
draw (197,20)..(203,20); label.rt(btex \scriptsize $0$ etex, (205,20));
draw (197,40)..(203,40); label.rt(btex \scriptsize $1$ etex, (205,40));
draw (197,60)..(203,60); label.rt(btex \scriptsize $2$ etex, (205,60));
draw (197,80)..(203,80); label.rt(btex \scriptsize $3$ etex, (205,80));
endfig;

%
%  Verteilungsfunktion
%
beginfig(2)

picture q;
q = thelabel.top(btex Wahrscheinlichkeit etex, (0,0));

pickup pencircle scaled 1pt;

drawarrow (-105,0)..(205,0);
drawarrow (0,-5)..(0,110);
draw (-2,100)..(2,100);
draw q rotated 90 shifted (-2,75);
label.top(btex $x$ etex, (205,0));

pickup pencircle scaled 1.5pt;
path startcircle;
startcircle = fullcircle scaled 4pt;
path endcircle;
endcircle = halfcircle scaled 4pt rotated 90;

def drawsegment(expr p, c) =
    draw startcircle shifted point 0 of p withcolor c;
    fill startcircle shifted point 0 of p withcolor c;
    draw endcircle shifted point 1 of p withcolor c;
    draw subpath (0, xpart(p intersectiontimes endcircle shifted point 1 of p))
	of p withcolor c;
enddef;

def leftopensegment(expr p, c) =
    draw endcircle shifted point 1 of p withcolor c;
    draw subpath (0, xpart(p intersectiontimes endcircle shifted point 1 of p))
	of p withcolor c;
enddef;

def rightopensegment(expr p, c) =
    draw startcircle shifted point 0 of p withcolor c;
    fill startcircle shifted point 0 of p withcolor c;
    draw p withcolor c;
enddef;

leftopensegment((-100,2){dir 1}..{dir 10}(-30,15), blue);
drawsegment((-30,25){dir 0}..{dir 0}(20,35), blue);
drawsegment((20,50){dir 0}..{dir 0}(40,55), blue);
drawsegment((40,65){dir 0}..{dir 0}(80,65), blue);
drawsegment((80,75){dir 0}..{dir 0}(120,75), blue);
rightopensegment((120,85){dir 30}..(160,92)..{dir 3}(200,98), blue);

endfig;

%
% Verteilungsfunktion einer diskreten Zufallsvariable
%
beginfig(3)

pickup pencircle scaled 1pt;

drawarrow (-105,0)..(205,0);
drawarrow (0,-5)..(0,110);
draw (-2,100)..(2,100);
draw q rotated 90 shifted (-2,75);
label.top(btex $x$ etex, (205,0));

pickup pencircle scaled 1.5pt;

leftopensegment((-100,0){dir 0}..{dir 0}(-30,0), blue);
drawsegment((-30,10){dir 0}..{dir 0}(20,10), blue);
drawsegment((20,25){dir 0}..{dir 0}(40,25), blue);
drawsegment((40,35){dir 0}..{dir 0}(80,35), blue);
drawsegment((80,45){dir 0}..{dir 0}(120,45), blue);
rightopensegment((120,55){dir 0}..{dir 0}(200,55), blue);
endfig;

%
% Verteilungsfunktion einer stetigen Zufallsvariable
%
beginfig(4)

pickup pencircle scaled 1pt;

drawarrow (-105,0)..(205,0);
drawarrow (0,-5)..(0,110);
draw (-2,100)..(2,100);
draw q rotated 90 shifted (-2,75);
label.top(btex $x$ etex, (205,0));

pickup pencircle scaled 1.5pt;
draw (-100,2){dir 1}..{dir 10}(-30,15){dir 0}..{dir 0}(20,25){dir 0}..{dir 0}(40,30){dir 0}..{dir 0}(80,30){dir 0}..{dir 0}(120,30){dir 30}..{dir 0}(160,37){dir 0}..{dir 3}(200,43) withcolor blue;
endfig;

picture r;
r = thelabel.top(btex Dichte etex, (0,0));

%
% diskrete Wahrscheinlichkeitsverteilung
%
beginfig(5)

pickup penrazor scaled 5pt;

draw (-30,0)--(-30,20) withcolor red;
draw (20,0)--(20,30) withcolor red;
draw (40,0)--(40,20) withcolor red;
draw (80,0)--(80,20) withcolor red;
draw (120,0)--(120,20) withcolor red;

pickup pencircle scaled 1pt;

drawarrow (-105,0)..(205,0);
drawarrow (0,-5)..(0,110);
draw (-2,100)..(2,100);
draw q rotated 90 shifted (-2,75);
label.lrt(btex $x$ etex, (205,0));


endfig;

%
% Wahrscheinlichkeitsdichte
%
beginfig(6)

pickup pencircle scaled 1.5pt;

def derivative(expr t, p) =
    (xpart(point t of p), 100 * ypart(direction t of p)/xpart(direction t of p))
enddef;

def drawdirections(expr p, h) =
    begingroup
	pair next;
	path result;
	result = derivative(0, p)..derivative(h, p);
	for t = h step h until (length p):
	    next := derivative(t, p);
	    result := result..next ;
	endfor;
	fill (xpart(next),0)--(xpart(point 0 of result),0)
		--result--cycle withcolor (0.9,0.9,1);
	draw result withcolor blue;
    endgroup;
enddef;

h := 0.01;

drawdirections((-100,2){dir 1}..{dir 10}(-30,15), h) ;
drawdirections((-30,25){dir 0}..{dir 0}(20,35), h) ;
drawdirections((20,50){dir 0}..{dir 0}(40,55), h) ;
drawdirections((40,65){dir 0}..{dir 0}(80,65), h) ;
drawdirections((80,75){dir 0}..{dir 0}(120,75), h) ;
drawdirections((120,85){dir 30}..(160,92)..{dir 3}(200,98), h) ;

pickup pencircle scaled 1pt;

drawarrow (-105,0)..(205,0);
drawarrow (0,-5)..(0,105);
draw r rotated 90 shifted (-2,90);
label.top(btex $x$ etex, (205,0));

pickup pencircle scaled 1.5pt;
draw (40,0)--(120,0) withcolor blue;

endfig;

%
% Verteilungsfunktion und Wahrscheinlichkeitsdichte der Gleichverteilung
%
beginfig(7)

pickup pencircle scaled 1pt;

fill (-30,0)--(120,0)--(120,66)--(-30,66)--cycle withcolor (0.9,0.9,1);

drawarrow (-105,120)..(205,120);
drawarrow (0,115)..(0,225);
draw q rotated 90 shifted (-2,190);
label.top(btex $x$ etex, (205,120));

drawarrow (-105,0)..(205,0);
drawarrow (0,-5)..(0,105);
draw r rotated 90 shifted (-2,90);
label.top(btex $x$ etex, (205,0));

pickup pencircle scaled 1.5pt;

draw (-100,120)--(-30,120) withcolor blue;
label.bot(btex $\mathstrut a$ etex, (-34,118));
draw (-30,120)--(120,210) withcolor blue;
label.bot(btex $b$ etex, (124,118));
draw (120,210)--(200,210) withcolor blue;

draw (-100,0)--(-30,0) withcolor blue;
label.bot(btex $\mathstrut a$ etex, (-34,-2));
draw (-30,66)--(120,66) withcolor blue;
label.bot(btex $b$ etex, (124,-2));
draw (120,0)--(200,0) withcolor blue;

pickup pencircle scaled 1pt;

draw (45,220)--(45,-2) withcolor (1,0.8,0);
draw (87.75,220)--(87.75,-2) withcolor (1,0.8,0);
draw (2.25,220)--(2.25,-2) withcolor (1,0.8,0);

label.bot(btex $E(X)$ etex, (45,0));

%label.bot(btex $E(X)+\sqrt{\operatorname{var}(X)}$ etex, (87.75,0));
%label.bot(btex $E(X)-\sqrt{\operatorname{var}(X)}$ etex, (2.25,0));

pickup pencircle scaled 0.1pt;

draw (-30,0)--(-30,220);
draw (120,0)--(120,220);

endfig;

%
% Verteilungsfunktion and Wahrscheinlichkeitsverteilung der
%  Exponentialverteilung
%
beginfig(8)

path p;
p = (0,100.00)
..(25,77.88)
..(50,60.65)
..(75,47.23)
..(100,36.78)
..(125,28.65)
..(150,22.31)
..(175,17.37)
..(200,13.53)
..(225,10.53)
..(250,8.20);
path q;
q = p--(250,0)--(0,0)--cycle;

fill q withcolor (0.9,0.9,1);

pickup pencircle scaled 0.3pt;

draw (0,250)--(250,250);

pickup pencircle scaled 1pt;

drawarrow (-55,150)..(255,150);
drawarrow (0,145)..(0,260);

pickup pencircle scaled 1.5pt;
draw (-50,150)--
(0,150.00)
..(25,172.11)
..(50,189.34)
..(75,202.76)
..(100,213.21)
..(125,221.34)
..(150,227.68)
..(175,232.62)
..(200,236.46)
..(225,239.46)
..(250,241.79)
withcolor(0.0,0.0,1.0);

pickup pencircle scaled 1pt;

drawarrow (-55,0)..(255,0);
drawarrow (0,-5)..(0,110);

pickup pencircle scaled 1.5pt;
draw (-50,0)--(0,0) withcolor(0.0,0.0,1.0);

draw p withcolor(0.0,0.0,1.0);

draw (0,-5)--(0,255) withcolor(1.0,0.8,0.0);
draw (100,-5)--(100,255) withcolor(1.0,0.8,0.0);
draw (200,-5)--(200,255) withcolor(1.0,0.8,0.0);

label.lrt(btex $0$ etex, (0,0));
label.lrt(btex $E(X)$ etex, (100,0));
label.top(btex $x$ etex, (255,0));
label.top(btex $x$ etex, (255,150));
label.lft(btex $1$ etex, (-3,250));
pickup pencircle scaled 1pt;
draw (-3,250)--(3,250);

picture q;
q = thelabel.ulft(btex Wahrscheinlichkeit etex, (0,0));
draw q rotated 90 shifted (0,245);

picture r;
r = thelabel.ulft(btex Dichte etex, (0,0));
draw r rotated 90 shifted (0,100);

endfig;

%
% Verteilungsfunktion und Wahrscheinlichkeitsdichte der Normalverteilung
%
beginfig(9)

pickup pencircle scaled 1.5pt;

draw
((-300,0.13)
..(-275,0.29)
..(-250,0.62)
..(-225,1.22)
..(-200,2.27)
..(-175,4.00)
..(-150,6.68)
..(-125,10.56)
..(-100,15.86)
..(-75,22.66)
..(-50,30.85)
..(-25,40.12)
..(0,50.00)
..(25,59.87)
..(50,69.14)
..(75,77.33)
..(100,84.13)
..(125,89.43)
..(150,93.31)
..(175,95.99)
..(200,97.72)
..(225,98.77)
..(250,99.37)
..(275,99.70)
..(300,99.86))
shifted (0,150)
withcolor(0.0,0.0,1.0);

pickup pencircle scaled 1pt;

drawarrow (-310,150)--(310,150);
drawarrow (0,140)--(0,260);

pickup pencircle scaled 1.5pt;

path p;
p = (-300,1.11090)
..(-275,2.27942)
..(-250,4.39369)
..(-225,7.95595)
..(-200,13.53353)
..(-175,21.62652)
..(-150,32.46525)
..(-125,45.78334)
..(-100,60.65307)
..(-75,75.48396)
..(-50,88.24969)
..(-25,96.92332)
..(0,100)
..(25,96.92332)
..(50,88.24969)
..(75,75.48396)
..(100,60.65307)
..(125,45.78334)
..(150,32.46525)
..(175,21.62652)
..(200,13.53353)
..(225,7.95595)
..(250,4.39369)
..(275,2.27942)
..(300,1.11090);
path q;
q = p--(300,0)--(-300,0)--cycle;
fill q withcolor (0.9,0.9,1.0);
draw p withcolor(0.0,0.0,1.0);

pickup pencircle scaled 1pt;

for x = -300 step 100 until 300:
	draw (x,-2)--(x,2);
endfor;
for x = -300 step 100 until 300:
	draw (x,148)--(x,152);
endfor;

drawarrow (-310,0)--(310,0);
drawarrow (0,-10)--(0,110);

draw (0,-5)--(0,255) withcolor(1.0,0.8,0.0);
draw (-100,-5)--(-100,255) withcolor(1.0,0.8,0.0);
draw (100,-5)--(100,255) withcolor(1.0,0.8,0.0);

label.lrt(btex $E(X)=0$ etex, (0,125)) withcolor (1,0.8,0);
label.llft(btex $0$ etex, (0,0));

label.lrt(btex $\mathstrut\sigma$ etex, (100,0));
label.llft(btex $\mathstrut-\sigma$ etex, (-100,0));

picture q;
q = thelabel.ulft(btex Wahrscheinlichkeit etex, (0,0));
draw q rotated 90 shifted (-2,280);

picture r;
r = thelabel.ulft(btex Dichte etex, (0,0));
draw r rotated 90 shifted (-2,130);

label.top(btex $x$ etex, (310,2));
label.top(btex $x$ etex, (310,152));

endfig;

%
% Faltung von Gleichverteilungen
%
beginfig(10)


fill (-173.21,500)--(-173.21,590.0)--(173.21,590.0)--(173.21,500.0)--cycle
	withcolor(0.9,0.9,1.0);

%pickup pencircle scaled 1.5pt;
%draw (-300,500)--(-173.21,500) withcolor blue;

pickup pencircle scaled 1pt;
drawarrow (-310,500)--(310,500);
drawarrow (0,495)--(0,605);

pickup pencircle scaled 1.5pt;
draw (-300,500)--(-173.21,500) withcolor blue;
draw (-173.21,590.0)--(173.21,590.0) withcolor blue;
draw (173.21,500)--(300,500) withcolor blue;

pickup pencircle scaled 0.1pt;
draw (-173.21,500)--(-173.21,590.0) withcolor blue;
draw (173.21,590.0)--(173.21,500) withcolor blue;

fill ((-244.95,0)--(0,90)--(244.95,0)--cycle) shifted (0,400) withcolor(0.9,0.9,1.0);

pickup pencircle scaled 1pt;
drawarrow(-310,400)--(310,400);
drawarrow(0,395)--(0,497);

pickup pencircle scaled 1.5pt;
draw ((-300,0)--(-244.95,0)--(0,90)--(244.95,0)--(300,0)) shifted (0,400) withcolor(0.0,0.0,1.0);

path p;
p = (-300,300){dir 0}..(-200,311.25)..(-100,360)..(0,390)..(100,360)..(200,311.25)..{dir 0}(300,300);
fill p--cycle withcolor (0.9,0.9,1);

pickup pencircle scaled 1pt;
drawarrow(-310,300)--(310,300);
drawarrow(0,295)--(0,397);

pickup pencircle scaled 1.5pt;
draw p withcolor blue;


p := ((-300,1.5){dir 1.068}..(-173.21,15)..(0,90)..(173.21,15)..{dir -1.068}(300,1.5));

fill ((300,0)--(-300,0)--p--cycle) shifted (0,200) withcolor (0.9,0.9,1);

pickup pencircle scaled 1pt;
drawarrow(-310,200)--(310,200);
drawarrow(0,195)--(0,297);

pickup pencircle scaled 1.5pt;
draw p shifted (0,200) withcolor blue;


p := (-300,1.11090*0.9)
..(-275,2.27942*0.9)
..(-250,4.39369*0.9)
..(-225,7.95595*0.9)
..(-200,13.53353*0.9)
..(-175,21.62652*0.9)
..(-150,32.46525*0.9)
..(-125,45.78334*0.9)
..(-100,60.65307*0.9)
..(-75,75.48396*0.9)
..(-50,88.24969*0.9)
..(-25,96.92332*0.9)
..(0,100*0.9)
..(25,96.92332*0.9)
..(50,88.24969*0.9)
..(75,75.48396*0.9)
..(100,60.65307*0.9)
..(125,45.78334*0.9)
..(150,32.46525*0.9)
..(175,21.62652*0.9)
..(200,13.53353*0.9)
..(225,7.95595*0.9)
..(250,4.39369*0.9)
..(275,2.27942*0.9)
..(300,1.11090*0.9);

fill ((300,0)--(-300,0)--p--cycle) shifted (0,50) withcolor (0.9,0.9,1);

draw p shifted(0,50) withcolor blue;

pickup pencircle scaled 1pt;
drawarrow(-310,50)--(310,50);
drawarrow(0,40)--(0,150);

pickup pencircle scaled 1.5pt;
draw (-100,45)--(-100,605) withcolor(1.0,0.8,0.0);
draw (0,45)--(0,605) withcolor(1.0,0.8,0.0);
draw (100,45)--(100,605) withcolor(1.0,0.8,0.0);

endfig;

end
