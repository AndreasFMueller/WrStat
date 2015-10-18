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

numeric hu, vu;
hu = 50;
vu = 140;

z0 = (0,0);
z1 = (5 * hu, 0);
z2 = (0, vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 1 step 1 until 5:
	draw (x * hu, -2)--(x * hu, 2);
endfor;

label.bot(btex $1^{\phantom{1}}$ etex, (1 * hu, -2));
label.bot(btex $10^{\phantom{1}}$ etex, (2 * hu, -2));
label.bot(btex $10^2$ etex, (3 * hu, -2));
label.bot(btex $10^3$ etex, (4 * hu, -2));
label.bot(btex $10^4$ etex, (5 * hu, -2));

label.top(btex $\log x$ etex, z1 shifted (10,0));
label.rt(btex $\log \varphi(x)$ etex, z2 shifted (0,10));

endfig;

%
% Dichtefunktion und Verteilungsfunktion der Pareto-Verteilung
%
beginfig(2)

numeric alpha, xmin, xmina;
xmin = 0.8;
alpha = 2.5;
xmina = mexp(mlog(xmin)*(1-alpha));

numeric hu, vu;
hu = 60;
vu = 120;

z0 = (0,0);
z1 = (4 * hu, 0);
z2 = (0, vu);

pickup pencircle scaled 1pt;

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $\varphi$ etex, z2 shifted (0,10));

path p, q;

q := (xmin * hu, mexp((-alpha)*mlog(xmin/xmin)) * vu);
for x = xmin + 0.02 step 0.02 until 4.01:
	q := q--(x * hu, mexp((-alpha)*mlog(x/xmin)) * vu);
endfor;
p = (4 * hu, 0)--(xmin * hu,0)--q--cycle;
fill p withcolor (0.8,0.8,1);

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

pickup pencircle scaled 1.5pt;

draw q withcolor blue;
draw z0--(xmin*hu,0) withcolor blue;

pickup pencircle scaled 1pt;

draw (xmin*hu,-2)--(xmin*hu,2);
label.bot(btex $x_{\text{min}}$ etex, (xmin*hu,-2));

numeric mean;
mean = ((alpha-1)/(alpha-2))*xmin;

draw (mean*hu,-10)--(mean*hu,vu) withcolor (1,0.8,0);
label.top(btex $E(X)$ etex, (mean*hu,vu)) withcolor (1,0.8,0);

label.llft(btex $\alpha=2.5$ etex, z1 shifted z2);

endfig;

%
% Dichtefunktion und Verteilungsfunktion der Pareto-Verteilung
%
beginfig(3)

numeric alpha, xmin, xmina;
xmin = 0.8;
alpha = 3.5;
xmina = mexp(mlog(xmin)*(1-alpha));

numeric hu, vu;
hu = 60;
vu = 120;

z0 = (0,0);
z1 = (4 * hu, 0);
z2 = (0, vu);

pickup pencircle scaled 1pt;

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $\varphi$ etex, z2 shifted (0,10));

path p, q;

q := (xmin * hu, mexp((-alpha)*mlog(xmin/xmin)) * vu);
for x = xmin + 0.02 step 0.02 until 4.01:
	q := q--(x * hu, mexp((-alpha)*mlog(x/xmin)) * vu);
endfor;
p = (4 * hu, 0)--(xmin * hu,0)--q--cycle;
fill p withcolor (0.8,0.8,1);

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

pickup pencircle scaled 1.5pt;

draw q withcolor blue;
draw z0--(xmin*hu,0) withcolor blue;

pickup pencircle scaled 1pt;

draw (xmin*hu,-2)--(xmin*hu,2);
label.bot(btex $x_{\text{min}}$ etex, (xmin*hu,-2));

numeric mean;
mean = ((alpha-1)/(alpha-2))*xmin;

draw (mean*hu,-10)--(mean*hu,vu) withcolor (1,0.8,0);
label.top(btex $E(X)$ etex, (mean*hu,vu)) withcolor (1,0.8,0);

numeric var;
var = sqrt((alpha-1)/(alpha-3) - ((alpha-1)/(alpha-2))*((alpha-1)/(alpha-2)))*xmin;
draw ((mean-var)*hu,-10)--((mean-var)*hu,vu) withcolor (1,0.8,0);
draw ((mean+var)*hu,-10)--((mean+var)*hu,vu) withcolor (1,0.8,0);

pickup pencircle scaled 0.5pt;

z10 = ((mean-var)*hu, vu/2);
z11 = ((mean+var)*hu,vu/2);
z12 = (mean*hu, vu/2);
drawarrow z12--z10 withcolor (1,0.8,0);
drawarrow z12--z11 withcolor (1,0.8,0);

label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, ((mean-0.5*var)*hu,vu/2)) withcolor (1,0.8,0);
label.top(btex $\sqrt{\operatorname{var}(X)}$ etex, ((mean+0.5*var)*hu,vu/2)) withcolor (1,0.8,0);

label.llft(btex $\alpha=3.5$ etex, z1 shifted z2);

endfig;

beginfig(4)

numeric u;

u = 240;

z0 = (0,0);
z1 = (u,0);
z2 = (0,u);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 0.2 step 0.2 until 1.01:
	draw (x * u, -2)--(x * u, 2);
	draw (-2, x * u)--(2, x * u);
endfor

label.lft(btex $0.2$ etex, (-2, 0.2 * u));
label.lft(btex $0.4$ etex, (-2, 0.4 * u));
label.lft(btex $0.6$ etex, (-2, 0.6 * u));
label.lft(btex $0.8$ etex, (-2, 0.8 * u));
label.lft(btex $1.0$ etex, (-2, 1.0 * u));

label.bot(btex $0.2$ etex, (0.2 * u, -2));
label.bot(btex $0.4$ etex, (0.4 * u, -2));
label.bot(btex $0.6$ etex, (0.6 * u, -2));
label.bot(btex $0.8$ etex, (0.8 * u, -2));
label.bot(btex $1.0$ etex, (1.0 * u, -2));

pickup pencircle scaled 0.5pt;

draw z1--(z1 shifted z2)--z2;

def W(expr P, alpha) =
mexp(mlog(P)*(alpha-2)/(alpha-1))
enddef;

def curve(expr alpha, c) =
	path p;
	p = (u,u);
	for P = 1-0.005 step -0.005 until 0:
		p := p--(P * u, W(P, alpha) * u);
	endfor;
	p := p--(0,0);
	draw p withcolor c;
enddef;

pickup pencircle scaled 1.5pt;

curve(3.6, black);
curve(2.6, blue);
curve(2.161, green);
curve(2.01, red);

%z10 = (0.75 * u, 0.75 * u   );
%z11 = (0.75 * u, 0.75 * u-13);
%z12 = (0.75 * u, 0.75 * u-26);
%z13 = (0.75 * u, 0.75 * u-39);

z10 = (0.1 * u, 0.95 * u);
z11 = (0.3 * u - 2, 0.88 * u);
z12 = (0.35 * u - 5, 0.75 * u - 5);
z13 = (0.35 * u, 0.45 * u);

label.rt(btex $\alpha = 2.01$  etex, z10) withcolor red;
label.lft(btex $\alpha = 2.161$ etex, z11) withcolor green;
label.lft(btex $\alpha = 2.6$   etex, z12) withcolor blue;
label.rt(btex $\alpha = 3.6$   etex, z13);

pickup pencircle scaled 0.5pt;

%draw z10--(0.6 * u, W(0.6, 2.01) * u) withcolor red;
%draw z11--(0.5 * u, W(0.5, 2.161) * u) withcolor green;
%draw z12--(0.4 * u, W(0.4, 2.6) * u) withcolor blue;
%draw z13--(0.3 * u, W(0.3, 3.6) * u);

draw z10--(0.05 * u, W(0.05, 2.01) * u) withcolor red;
draw z11--(0.35 * u, W(0.35, 2.161) * u) withcolor green;
draw z12--(0.4 * u, W(0.4, 2.6) * u) withcolor blue;
draw z13--(0.3 * u, W(0.3, 3.6) * u);

label.top(btex $P(x)$ etex, z1 shifted (10,0));
label.rt(btex $W(x)$ etex, z2 shifted (0,10));

endfig;

end
