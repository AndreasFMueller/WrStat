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

numeric hu, vu;
hu = 150;
vu = 150;

%
% Regressionskoeffizient
%
beginfig(2)

z0 = (0,0);
z1 = (hu, 0);
z2 = (0, vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

pickup pencircle scaled 3pt;

draw(0.670479*hu, 0.279813*vu) withcolor red;
draw(0.986575*hu, 0.632615*vu) withcolor red;
draw(0.761177*hu, 0.974867*vu) withcolor red;
draw(0.698520*hu, 0.117430*vu) withcolor red;
draw(0.433240*hu, 0.793708*vu) withcolor red;
draw(0.610104*hu, 0.240127*vu) withcolor red;
draw(0.706132*hu, 0.943316*vu) withcolor red;
draw(0.629500*hu, 0.090773*vu) withcolor red;
draw(0.122080*hu, 0.251093*vu) withcolor red;
draw(0.104028*hu, 0.859506*vu) withcolor red;
draw(0.816845*hu, 0.677778*vu) withcolor red;
draw(0.436655*hu, 0.557662*vu) withcolor red;
draw(0.992280*hu, 0.287552*vu) withcolor red;
draw(0.255050*hu, 0.857213*vu) withcolor red;
draw(0.798837*hu, 0.992949*vu) withcolor red;
draw(0.708528*hu, 0.940474*vu) withcolor red;
draw(0.766076*hu, 0.459841*vu) withcolor red;
draw(0.719703*hu, 0.538362*vu) withcolor red;
draw(0.824787*hu, 0.850503*vu) withcolor red;
draw(0.482193*hu, 0.535652*vu) withcolor red;
draw(0.485500*hu, 0.794590*vu) withcolor red;
draw(0.674954*hu, 0.969337*vu) withcolor red;
draw(0.520236*hu, 0.858344*vu) withcolor red;
draw(0.457465*hu, 0.752095*vu) withcolor red;
draw(0.600732*hu, 0.138776*vu) withcolor red;
draw(0.183771*hu, 0.979139*vu) withcolor red;
draw(0.473389*hu, 0.124899*vu) withcolor red;
draw(0.805254*hu, 0.738049*vu) withcolor red;
draw(0.334176*hu, 0.025111*vu) withcolor red;
draw(0.295484*hu, 0.022015*vu) withcolor red;
draw(0.137352*hu, 0.032026*vu) withcolor red;
draw(0.703231*hu, 0.822776*vu) withcolor red;
draw(0.644556*hu, 0.258281*vu) withcolor red;
draw(0.483571*hu, 0.649815*vu) withcolor red;
draw(0.325144*hu, 0.061358*vu) withcolor red;
draw(0.274261*hu, 0.691256*vu) withcolor red;
draw(0.517077*hu, 0.982420*vu) withcolor red;
draw(0.825207*hu, 0.493928*vu) withcolor red;
draw(0.166609*hu, 0.693683*vu) withcolor red;
draw(0.705854*hu, 0.791341*vu) withcolor red;
draw(0.207532*hu, 0.020439*vu) withcolor red;
draw(0.207537*hu, 0.868515*vu) withcolor red;
draw(0.184666*hu, 0.945428*vu) withcolor red;
draw(0.335557*hu, 0.336453*vu) withcolor red;
draw(0.904023*hu, 0.251637*vu) withcolor red;
draw(0.777881*hu, 0.914636*vu) withcolor red;
draw(0.266260*hu, 0.588751*vu) withcolor red;
draw(0.952981*hu, 0.541334*vu) withcolor red;
draw(0.481352*hu, 0.859439*vu) withcolor red;
draw(0.221659*hu, 0.614516*vu) withcolor red;
draw(0.343490*hu, 0.514057*vu) withcolor red;
draw(0.293057*hu, 0.258180*vu) withcolor red;
draw(0.561704*hu, 0.943981*vu) withcolor red;
draw(0.609449*hu, 0.218571*vu) withcolor red;
draw(0.524599*hu, 0.447090*vu) withcolor red;
draw(0.108785*hu, 0.771575*vu) withcolor red;
draw(0.670212*hu, 0.339462*vu) withcolor red;
draw(0.437260*hu, 0.936036*vu) withcolor red;
draw(0.641796*hu, 0.340977*vu) withcolor red;
draw(0.035438*hu, 0.134420*vu) withcolor red;
draw(0.057648*hu, 0.238505*vu) withcolor red;
draw(0.117784*hu, 0.173559*vu) withcolor red;
draw(0.320938*hu, 0.612854*vu) withcolor red;
draw(0.819972*hu, 0.553318*vu) withcolor red;
draw(0.378582*hu, 0.295180*vu) withcolor red;
draw(0.466747*hu, 0.199476*vu) withcolor red;
draw(0.165507*hu, 0.484231*vu) withcolor red;
draw(0.554702*hu, 0.427912*vu) withcolor red;
draw(0.028886*hu, 0.849413*vu) withcolor red;
draw(0.592862*hu, 0.903848*vu) withcolor red;
draw(0.125970*hu, 0.872429*vu) withcolor red;
draw(0.195169*hu, 0.664209*vu) withcolor red;
draw(0.259538*hu, 0.197918*vu) withcolor red;
draw(0.238054*hu, 0.935794*vu) withcolor red;
draw(0.201190*hu, 0.056024*vu) withcolor red;
draw(0.729048*hu, 0.973239*vu) withcolor red;
draw(0.041296*hu, 0.880353*vu) withcolor red;
draw(0.461802*hu, 0.391795*vu) withcolor red;
draw(0.889501*hu, 0.277679*vu) withcolor red;
draw(0.720225*hu, 0.853008*vu) withcolor red;
draw(0.055401*hu, 0.101402*vu) withcolor red;
draw(0.774637*hu, 0.938829*vu) withcolor red;
draw(0.847922*hu, 0.518228*vu) withcolor red;
draw(0.377141*hu, 0.663879*vu) withcolor red;
draw(0.234197*hu, 0.304463*vu) withcolor red;
draw(0.027557*hu, 0.023079*vu) withcolor red;
draw(0.560096*hu, 0.588526*vu) withcolor red;
draw(0.909151*hu, 0.590483*vu) withcolor red;
draw(0.065083*hu, 0.284429*vu) withcolor red;
draw(0.213123*hu, 0.642773*vu) withcolor red;
draw(0.376733*hu, 0.662369*vu) withcolor red;
draw(0.241812*hu, 0.599699*vu) withcolor red;
draw(0.952750*hu, 0.271765*vu) withcolor red;
draw(0.135378*hu, 0.673545*vu) withcolor red;
draw(0.293888*hu, 0.603592*vu) withcolor red;
draw(0.918245*hu, 0.105428*vu) withcolor red;
draw(0.089794*hu, 0.283472*vu) withcolor red;
draw(0.801240*hu, 0.984330*vu) withcolor red;
draw(0.205984*hu, 0.347644*vu) withcolor red;
draw(0.457871*hu, 0.425198*vu) withcolor red;

label.top(btex $r^2=0.02013$ etex, (0.5*hu, 1*vu));

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z2 shifted (0,10));

pickup pencircle scaled 1pt;

draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z2 shifted (-2,0))--(z2 shifted (2,0));

label.bot(btex $1$ etex, z1 shifted (0,-2));
label.lft(btex $1$ etex, z2 shifted (-2,0));
label.llft(btex $0$ etex, z0);





endfig

end
