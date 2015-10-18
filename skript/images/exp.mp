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
hu = 60;
vu = 160;

z0 = (0,0);
z1 = (5 * hu,0);
z2 = (0,1*vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

for x = 1 step 1 until 5:
	draw (x * hu, -2)--(x*hu,2);
endfor;

label.bot(btex $1$ etex, (1 * hu, -2));
label.bot(btex $2$ etex, (2 * hu, -2));
label.bot(btex $3$ etex, (3 * hu, -2));
label.bot(btex $4$ etex, (4 * hu, -2));
label.bot(btex $5$ etex, (5 * hu, -2));

for y = 1 step 1 until 5:
	draw (-2, 0.2 * y * vu)--(2, 0.2 * y * vu);
endfor;

label.lft(btex $0.2$ etex, (-2, 0.2 * vu));
label.lft(btex $0.4$ etex, (-2, 0.4 * vu));
label.lft(btex $0.6$ etex, (-2, 0.6 * vu));
label.lft(btex $0.8$ etex, (-2, 0.8 * vu));
label.lft(btex $1.0$ etex, (-2, 1.0 * vu));

label.top(btex $\varepsilon$ etex, z1 shifted (10,0));
label.rt(btex $P$ etex, z2 shifted (0,10));

pickup pencircle scaled 1.5pt;

draw (1 * hu, 1 * vu)
for x = 1.1 step 0.1 until 5.01:
	--(x * hu, vu * 1 / (x * x))
endfor
withcolor green;

draw (0, 1 * vu)
for x = 0.1 step 0.1 until 1.01:
	--(x * hu, (1 - mexp(256 * (x - 1)) + mexp(256 * (-x-1))) * vu)
endfor
withcolor red;

draw (1 * hu, mexp(256 * -2) * vu)
for x = 1.1 step 0.1 until 5.01:
	--(x * hu, mexp(256 * (-x-1)) * vu)
endfor
withcolor red;

z3 = (1.5 * hu, vu/(1.5 * 1.5));
z4 = (0.7 * hu, (1 - mexp(256 * (0.7 - 1)) + mexp(256 * (-0.7-1))) * vu);

label.urt(btex $P(|X-E(X)| > \varepsilon)$ etex, z4 shifted (60, 45));

label.urt(btex $\displaystyle\frac{1}{\varepsilon^2}\quad\text{(Tschebyscheff-Schranke)}$ etex, z3 shifted (10,10));

pickup pencircle scaled 0.5pt;

draw z4--(z4 shifted (60,45)) withcolor red;
draw z3--(z3 shifted (10,10)) withcolor green;

endfig;

end
