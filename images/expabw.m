
g = Plot[{1 + E^(- u - 1) - E^(Min[u - 1, 0]), 1/u^2}, {u, 0, 5},
    PlotRange -> {0, 1}, AxesLabel -> {"u", "P"},
    PlotStyle -> {{RGBColor[0.8, 0, 0]}, {RGBColor[0, 0.6, 0]}}];

Display["!'/Applications/Mathematica 5.2.app/SystemFiles/Graphics/SystemResources/psfix' -epsf > abwexp.eps", g];
