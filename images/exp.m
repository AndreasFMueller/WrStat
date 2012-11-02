
g = Plot[Exp[-x] UnitStep[x], {x, -1, 3},
    PlotRange -> {{-1, 3}, {0, 1}}, AxesLabel -> {"x", "phi"},
    AspectRatio->1/4,
    Ticks->{{-1, 0, 1, 2, 3}, {0, 1}}
];

Display["!'/Applications/Mathematica 5.2.app/SystemFiles/Graphics/SystemResources/psfix' -epsf > expphi.eps", g];

g = Plot[(1-Exp[-x]) UnitStep[x], {x, -1, 3},
    PlotRange -> {{-1, 3}, {0, 1}}, AxesLabel -> {"x", "F"},
    AspectRatio->1/4,
    Ticks->{{-1, 0, 1, 2, 3}, {0, 1}}
];

Display["!'/Applications/Mathematica 5.2.app/SystemFiles/Graphics/SystemResources/psfix' -epsf > expF.eps", g];
