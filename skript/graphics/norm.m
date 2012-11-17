
g = Plot[Exp[-x^2/2]/Sqrt[2 Pi], {x, -3, 3},
    PlotRange -> {0, 0.5}, AxesLabel -> {"x", "phi"},
    AspectRatio->1/6, Ticks -> {Automatic, {0, 0.5}}
];

Display["!'/Applications/Mathematica 5.2.app/SystemFiles/Graphics/SystemResources/psfix' -epsf > normphi.eps", g];

g = Plot[(1 + Erf[x/Sqrt[2]])/2, {x, -3, 3},
    PlotRange -> {0, 1}, AxesLabel -> {"x", "F"},
    AspectRatio->1/6,
    Ticks -> {Automatic, {{0, "0"}, {0.1, ""}, {0.2, ""}, {0.3, ""}, {0.4, ""}, {0.5, ""}, {0.6, ""}, {0.7, ""}, {0.8, ""}, {0.9, ""}, {1, "1"}}}
];

Display["!'/Applications/Mathematica 5.2.app/SystemFiles/Graphics/SystemResources/psfix' -epsf > normF.eps", g];
