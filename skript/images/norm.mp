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

draw 
  (0.00000*hu,1.00000*vu)
--(0.05000*hu,0.96012*vu)
--(0.10000*hu,0.92034*vu)
--(0.15000*hu,0.88076*vu)
--(0.20000*hu,0.84148*vu)
--(0.25000*hu,0.80259*vu)
--(0.30000*hu,0.76418*vu)
--(0.35000*hu,0.72634*vu)
--(0.40000*hu,0.68916*vu)
--(0.45000*hu,0.65271*vu)
--(0.50000*hu,0.61708*vu)
--(0.55000*hu,0.58232*vu)
--(0.60000*hu,0.54851*vu)
--(0.65000*hu,0.51569*vu)
--(0.70000*hu,0.48393*vu)
--(0.75000*hu,0.45325*vu)
--(0.80000*hu,0.42371*vu)
--(0.85000*hu,0.39533*vu)
--(0.90000*hu,0.36812*vu)
--(0.95000*hu,0.34211*vu)
--(1.00000*hu,0.31731*vu)
--(1.05000*hu,0.29372*vu)
--(1.10000*hu,0.27133*vu)
--(1.15000*hu,0.25014*vu)
--(1.20000*hu,0.23014*vu)
--(1.25000*hu,0.21130*vu)
--(1.30000*hu,0.19360*vu)
--(1.35000*hu,0.17702*vu)
--(1.40000*hu,0.16151*vu)
--(1.45000*hu,0.14706*vu)
--(1.50000*hu,0.13361*vu)
--(1.55000*hu,0.12114*vu)
--(1.60000*hu,0.10960*vu)
--(1.65000*hu,0.09894*vu)
--(1.70000*hu,0.08913*vu)
--(1.75000*hu,0.08012*vu)
--(1.80000*hu,0.07186*vu)
--(1.85000*hu,0.06431*vu)
--(1.90000*hu,0.05743*vu)
--(1.95000*hu,0.05118*vu)
--(2.00000*hu,0.04550*vu)
--(2.05000*hu,0.04036*vu)
--(2.10000*hu,0.03573*vu)
--(2.15000*hu,0.03156*vu)
--(2.20000*hu,0.02781*vu)
--(2.25000*hu,0.02445*vu)
--(2.30000*hu,0.02145*vu)
--(2.35000*hu,0.01877*vu)
--(2.40000*hu,0.01640*vu)
--(2.45000*hu,0.01429*vu)
--(2.50000*hu,0.01242*vu)
--(2.55000*hu,0.01077*vu)
--(2.60000*hu,0.00932*vu)
--(2.65000*hu,0.00805*vu)
--(2.70000*hu,0.00693*vu)
--(2.75000*hu,0.00596*vu)
--(2.80000*hu,0.00511*vu)
--(2.85000*hu,0.00437*vu)
--(2.90000*hu,0.00373*vu)
--(2.95000*hu,0.00318*vu)
--(3.00000*hu,0.00270*vu)
--(3.05000*hu,0.00229*vu)
--(3.10000*hu,0.00194*vu)
--(3.15000*hu,0.00163*vu)
--(3.20000*hu,0.00137*vu)
--(3.25000*hu,0.00115*vu)
--(3.30000*hu,0.00097*vu)
--(3.35000*hu,0.00081*vu)
--(3.40000*hu,0.00067*vu)
--(3.45000*hu,0.00056*vu)
--(3.50000*hu,0.00047*vu)
--(3.55000*hu,0.00039*vu)
--(3.60000*hu,0.00032*vu)
--(3.65000*hu,0.00026*vu)
--(3.70000*hu,0.00022*vu)
--(3.75000*hu,0.00018*vu)
--(3.80000*hu,0.00014*vu)
--(3.85000*hu,0.00012*vu)
--(3.90000*hu,0.00010*vu)
--(3.95000*hu,0.00008*vu)
--(4.00000*hu,0.00006*vu)
--(4.05000*hu,0.00005*vu)
--(4.10000*hu,0.00004*vu)
--(4.15000*hu,0.00003*vu)
--(4.20000*hu,0.00003*vu)
--(4.25000*hu,0.00002*vu)
--(4.30000*hu,0.00002*vu)
--(4.35000*hu,0.00001*vu)
--(4.40000*hu,0.00001*vu)
--(4.45000*hu,0.00001*vu)
--(4.50000*hu,0.00001*vu)
--(4.55000*hu,0.00001*vu)
--(4.60000*hu,0.00000*vu)
--(4.65000*hu,0.00000*vu)
--(4.70000*hu,0.00000*vu)
--(4.75000*hu,0.00000*vu)
--(4.80000*hu,0.00000*vu)
--(4.85000*hu,0.00000*vu)
--(4.90000*hu,0.00000*vu)
--(4.95000*hu,0.00000*vu)
--(5.00000*hu,0.00000*vu)
withcolor red;


z3 = (1.5 * hu, vu/(1.5 * 1.5));
z4 = (0.60000*hu,0.54900*vu);

label.rt(btex $P(|X-E(X)| > \varepsilon)$ etex, z4 shifted (65, 30));

label.urt(btex $\displaystyle\frac{1}{\varepsilon^2}\quad\text{(Tschebyscheff-Schranke)}$ etex, z3 shifted (10,10));

pickup pencircle scaled 0.5pt;

draw z4--(z4 shifted (65,30)) withcolor red;
draw z3--(z3 shifted (10,10)) withcolor green;

endfig;

end
