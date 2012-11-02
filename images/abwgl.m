
g = Plot[{(1-2u) UnitStep[1/2 -u], 1/(12 u^2)}, {u, 0, 3},
    PlotRange -> {0, 1}, AxesLabel -> {"u", "P"},
    PlotStyle -> {{RGBColor[0.8, 0, 0]}, {RGBColor[0, 0.6, 0]}}];

Display["!'/Applications/Mathematica 5.2.app/SystemFiles/Graphics/SystemResources/psfix' -epsf > abwgl.eps", g];
