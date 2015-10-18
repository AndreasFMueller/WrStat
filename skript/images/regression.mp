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
hu = 120;
vu = 120;

def punkt(expr u,v) =
	draw(u * hu, v * vu) withcolor red;
enddef;

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

punkt(0.670479, 0.279813);
punkt(0.986575, 0.632615);
punkt(0.761177, 0.974867);
punkt(0.698520, 0.117430);
punkt(0.433240, 0.793708);
punkt(0.610104, 0.240127);
punkt(0.706132, 0.943316);
punkt(0.629500, 0.090773);
punkt(0.122080, 0.251093);
punkt(0.104028, 0.859506);
punkt(0.816845, 0.677778);
punkt(0.436655, 0.557662);
punkt(0.992280, 0.287552);
punkt(0.255050, 0.857213);
punkt(0.798837, 0.992949);
punkt(0.708528, 0.940474);
punkt(0.766076, 0.459841);
punkt(0.719703, 0.538362);
punkt(0.824787, 0.850503);
punkt(0.482193, 0.535652);
punkt(0.485500, 0.794590);
punkt(0.674954, 0.969337);
punkt(0.520236, 0.858344);
punkt(0.457465, 0.752095);
punkt(0.600732, 0.138776);
punkt(0.183771, 0.979139);
punkt(0.473389, 0.124899);
punkt(0.805254, 0.738049);
punkt(0.334176, 0.025111);
punkt(0.295484, 0.022015);
punkt(0.137352, 0.032026);
punkt(0.703231, 0.822776);
punkt(0.644556, 0.258281);
punkt(0.483571, 0.649815);
punkt(0.325144, 0.061358);
punkt(0.274261, 0.691256);
punkt(0.517077, 0.982420);
punkt(0.825207, 0.493928);
punkt(0.166609, 0.693683);
punkt(0.705854, 0.791341);
punkt(0.207532, 0.020439);
punkt(0.207537, 0.868515);
punkt(0.184666, 0.945428);
punkt(0.335557, 0.336453);
punkt(0.904023, 0.251637);
punkt(0.777881, 0.914636);
punkt(0.266260, 0.588751);
punkt(0.952981, 0.541334);
punkt(0.481352, 0.859439);
punkt(0.221659, 0.614516);
punkt(0.343490, 0.514057);
punkt(0.293057, 0.258180);
punkt(0.561704, 0.943981);
punkt(0.609449, 0.218571);
punkt(0.524599, 0.447090);
punkt(0.108785, 0.771575);
punkt(0.670212, 0.339462);
punkt(0.437260, 0.936036);
punkt(0.641796, 0.340977);
punkt(0.035438, 0.134420);
punkt(0.057648, 0.238505);
punkt(0.117784, 0.173559);
punkt(0.320938, 0.612854);
punkt(0.819972, 0.553318);
punkt(0.378582, 0.295180);
punkt(0.466747, 0.199476);
punkt(0.165507, 0.484231);
punkt(0.554702, 0.427912);
punkt(0.028886, 0.849413);
punkt(0.592862, 0.903848);
punkt(0.125970, 0.872429);
punkt(0.195169, 0.664209);
punkt(0.259538, 0.197918);
punkt(0.238054, 0.935794);
punkt(0.201190, 0.056024);
punkt(0.729048, 0.973239);
punkt(0.041296, 0.880353);
punkt(0.461802, 0.391795);
punkt(0.889501, 0.277679);
punkt(0.720225, 0.853008);
punkt(0.055401, 0.101402);
punkt(0.774637, 0.938829);
punkt(0.847922, 0.518228);
punkt(0.377141, 0.663879);
punkt(0.234197, 0.304463);
punkt(0.027557, 0.023079);
punkt(0.560096, 0.588526);
punkt(0.909151, 0.590483);
punkt(0.065083, 0.284429);
punkt(0.213123, 0.642773);
punkt(0.376733, 0.662369);
punkt(0.241812, 0.599699);
punkt(0.952750, 0.271765);
punkt(0.135378, 0.673545);
punkt(0.293888, 0.603592);
punkt(0.918245, 0.105428);
punkt(0.089794, 0.283472);
punkt(0.801240, 0.984330);
punkt(0.205984, 0.347644);
punkt(0.457871, 0.425198);

label.top(btex $r^2=0.02013$ etex, (0.5*hu, 1*vu));

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z2 shifted (0,10));

pickup pencircle scaled 1pt;

draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z2 shifted (-2,0))--(z2 shifted (2,0));

label.bot(btex $1$ etex, z1 shifted (0,-2));
label.lft(btex $1$ etex, z2 shifted (-2,0));
label.llft(btex $0$ etex, z0);

endfig;

%
% r close to 1
%
beginfig(3)

z0 = (0,0);
z1 = (hu, 0);
z2 = (0, vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

pickup pencircle scaled 3pt;

punkt( 0.527632, 0.576167);
punkt( 0.244704, 0.192308);
punkt( 0.575716, 0.563614);
punkt( 0.681144, 0.609262);
punkt( 0.199681, 0.286879);
punkt( 0.780296, 0.726096);
punkt( 0.732840, 0.595476);
%punkt( 0.988336, 1.002981);
punkt( 0.374269, 0.457146);
punkt( 0.098993, 0.092839);
punkt( 0.463866, 0.519030);
punkt( 0.504242, 0.428007);
punkt( 0.275299, 0.281369);
punkt( 0.381284, 0.385196);
punkt( 0.522472, 0.420474);
%punkt( 1.063342, 1.141153);
punkt( 0.300053, 0.282550);
%punkt( 1.005947, 0.967313);
punkt( 0.382951, 0.386364);
punkt( 0.924601, 0.889654);
punkt( 0.270963, 0.308188);
punkt( 0.331215, 0.277212);
punkt( 0.907876, 0.946728);
punkt( 0.554996, 0.638784);
punkt( 0.626040, 0.642729);
punkt( 0.407962, 0.477650);
%punkt(-0.065283,-0.039422);
punkt( 0.410510, 0.500026);
punkt( 0.709800, 0.703381);
punkt( 0.789303, 0.690967);
punkt( 0.639156, 0.605721);
punkt( 0.345072, 0.412391);
punkt( 0.832633, 0.891423);
punkt( 0.630072, 0.555130);
punkt( 0.512936, 0.562964);
punkt( 0.449521, 0.415263);
%punkt( 1.111057, 1.153919);
punkt( 0.242068, 0.226869);
%punkt(-0.017640,-0.043049);
punkt( 0.934890, 0.913046);
punkt( 0.942681, 0.888829);
punkt( 0.498578, 0.461670);
punkt( 0.845712, 0.907644);
punkt( 0.346679, 0.330446);
punkt( 0.266799, 0.268785);
punkt( 0.376836, 0.326870);
punkt( 0.549734, 0.473384);
punkt( 0.715705, 0.752901);
punkt( 0.689891, 0.756480);
punkt( 0.825610, 0.753155);
punkt( 0.378049, 0.438570);
punkt( 0.717516, 0.692871);
punkt( 0.410821, 0.435884);
punkt( 0.838093, 0.866943);
punkt( 0.570041, 0.585793);
punkt( 0.497844, 0.482074);
punkt( 0.565485, 0.584653);
punkt( 0.442146, 0.436350);
punkt( 0.432936, 0.500793);
punkt( 0.629408, 0.671434);
punkt( 0.477328, 0.424425);
punkt( 0.432771, 0.455478);
punkt( 0.108822, 0.072169);
punkt( 0.325750, 0.282318);
punkt( 0.405475, 0.421917);
punkt( 0.589806, 0.522964);
punkt( 0.242646, 0.243921);
%punkt( 1.243138, 1.174234);
punkt( 0.419450, 0.395356);
punkt( 0.247408, 0.264385);
punkt( 0.620944, 0.650795);
punkt( 0.454498, 0.503553);
punkt( 0.278124, 0.352359);
punkt( 0.558887, 0.560437);
%punkt( 1.071493, 1.072785);
punkt( 0.319105, 0.361113);
punkt( 0.681386, 0.646903);
punkt( 0.545772, 0.581723);
punkt( 0.510041, 0.458666);
punkt( 0.393322, 0.338351);
punkt( 0.510892, 0.422371);
punkt( 0.829851, 0.818329);
punkt( 0.550137, 0.549718);
punkt( 0.731102, 0.752945);
punkt( 0.131149, 0.063451);
punkt( 0.295826, 0.342952);
punkt( 0.636167, 0.600782);
%punkt( 1.083057, 1.109839);
punkt( 0.697176, 0.745666);
punkt( 0.100463, 0.139192);
punkt( 0.668726, 0.709187);
punkt( 0.383739, 0.387106);
punkt( 0.785724, 0.705390);
punkt( 0.716689, 0.702333);
punkt( 0.312086, 0.312260);
%punkt( 1.229585, 1.276881);
punkt( 0.543092, 0.543307);
punkt( 0.789109, 0.816351);
%punkt( 1.501292, 1.519921);
punkt( 0.560714, 0.502849);

label.top(btex $r=0.9847$ etex, (0.5*hu, 1*vu));

z30 = (0, 0.003875 * vu);
z31 = (1*hu, (0.991142 + 0.003875) * vu);

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z2 shifted (0,10));

pickup pencircle scaled 1pt;

%draw z30--z31 withcolor blue;
draw ((-0.01)[z30,z31])--((1.01)[z30,z31]) withcolor blue;

draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z2 shifted (-2,0))--(z2 shifted (2,0));

label.bot(btex $1$ etex, z1 shifted (0,-2));
label.lft(btex $1$ etex, z2 shifted (-2,0));
label.llft(btex $0$ etex, z0);

endfig;

%
% r close to -1
%
beginfig(4)

z0 = (0,0);
z1 = (hu, 0);
z2 = (0, vu);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

pickup pencircle scaled 3pt;

punkt( 0.2630000, 0.7650000);
punkt( 0.4620000, 0.4910000);
punkt( 0.3440000, 0.6610000);
punkt( 0.7330000, 0.2700000);
punkt( 0.6520000, 0.4470000);
punkt( 0.5080000, 0.4680000);
punkt( 0.1840000, 0.7830000);
punkt( 0.7180000, 0.2710000);
punkt( 0.4710000, 0.5540000);
punkt( 0.7490000, 0.3540000);
punkt( 0.6060000, 0.3180000);
punkt( 0.6560000, 0.3910000);
punkt( 0.5490000, 0.4070000);
punkt( 0.1090000, 0.7840000);
punkt( 0.5830000, 0.3590000);
punkt( 0.4500000, 0.4710000);
%punkt( 1.2090000,-0.1660000);
punkt( 0.0350000, 0.9240000);
punkt( 0.4510000, 0.4970000);
punkt( 0.5320000, 0.4630000);
punkt( 0.3170000, 0.7660000);
punkt( 0.5350000, 0.4780000);
punkt( 0.6680000, 0.3980000);
punkt( 0.8640000, 0.1270000);
punkt( 0.6580000, 0.4030000);
punkt( 0.3470000, 0.6660000);
punkt( 0.3280000, 0.5880000);
punkt( 0.0410000, 0.9920000);
punkt( 0.4960000, 0.4650000);
punkt( 0.3620000, 0.7570000);
punkt( 0.3860000, 0.5630000);
punkt( 0.8020000, 0.2690000);
punkt( 0.3530000, 0.7460000);
%punkt(-0.4530000, 1.4690000);
punkt( 0.5710000, 0.3850000);
punkt( 0.5620000, 0.5440000);
punkt( 0.6910000, 0.3670000);
punkt( 0.3210000, 0.6930000);
punkt( 0.5090000, 0.5220000);
punkt( 0.7300000, 0.3440000);
punkt( 0.5690000, 0.3110000);
punkt( 0.5610000, 0.4150000);
punkt( 0.0410000, 0.9580000);
punkt( 0.4350000, 0.5440000);
punkt( 0.3740000, 0.6380000);
%punkt(-0.2290000, 1.2370000);
punkt( 0.9100000, 0.0870000);
punkt( 0.8110000, 0.1840000);
punkt( 0.6220000, 0.4130000);
punkt( 0.5540000, 0.3890000);
punkt( 0.6040000, 0.4490000);
punkt( 0.5460000, 0.3770000);
punkt( 0.6380000, 0.3830000);
punkt( 0.4900000, 0.4460000);
punkt( 0.4460000, 0.6740000);
punkt( 0.2180000, 0.7560000);
punkt( 0.6400000, 0.3940000);
punkt( 0.3760000, 0.5970000);
%punkt( 1.4280000,-0.3490000);
punkt( 0.4140000, 0.7000000);
punkt( 0.4340000, 0.6440000);
punkt( 0.4560000, 0.5340000);
punkt( 0.3220000, 0.6470000);
punkt( 0.6980000, 0.2970000);
punkt( 0.3240000, 0.6610000);
punkt( 0.4560000, 0.5510000);
%punkt( 1.0330000,-0.0560000);
punkt( 0.2280000, 0.7950000);
punkt( 0.8230000, 0.2370000);
punkt( 0.5930000, 0.3530000);
punkt( 0.1790000, 0.8300000);
punkt( 0.6980000, 0.3850000);
punkt( 0.9800000, 0.1010000);
punkt( 0.6980000, 0.4070000);
punkt( 0.3550000, 0.6710000);
punkt( 0.4210000, 0.6100000);
punkt( 0.5070000, 0.5860000);
punkt( 0.1510000, 0.8350000);
%punkt(-0.2320000, 1.2670000);
%punkt(-0.2070000, 1.1630000);
punkt( 0.3570000, 0.6530000);
punkt( 0.9870000, 0.1050000);
punkt( 0.7250000, 0.2890000);
punkt( 0.6420000, 0.3420000);
punkt( 0.6770000, 0.3990000);
punkt( 0.9960000, 0.0010000);
punkt( 0.8040000, 0.2130000);
punkt( 0.3930000, 0.7610000);
punkt( 0.7280000, 0.3560000);
punkt( 0.7310000, 0.2640000);
punkt( 0.4930000, 0.4950000);
punkt( 0.8810000, 0.1080000);
punkt( 0.3390000, 0.5920000);
punkt( 0.6490000, 0.3540000);
punkt( 0.6130000, 0.4370000);
punkt( 0.7240000, 0.2180000);
punkt( 0.7100000, 0.3130000);
punkt( 0.8030000, 0.2100000);
punkt( 0.4320000, 0.5350000);
punkt( 0.2150000, 0.7950000);

label.top(btex $r=-0.9816$ etex, (0.5*hu, 1*vu));

z30 = (0, 0.9921 * vu);
z31 = (1*hu, (-0.9608 + 0.9921) * vu);

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z2 shifted (0,10));

pickup pencircle scaled 1pt;

%draw z30--z31 withcolor blue;
draw ((-0.01)[z30,z31])--((1.01)[z30,z31]) withcolor blue;

draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z2 shifted (-2,0))--(z2 shifted (2,0));

label.bot(btex $1$ etex, z1 shifted (0,-2));
label.lft(btex $1$ etex, z2 shifted (-2,0));
label.llft(btex $0$ etex, z0);

endfig;

end
