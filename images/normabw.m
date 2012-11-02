
g = Plot[{1- Erf[epsilon/Sqrt[2]], 1/epsilon^2}, {epsilon, 0, 5},
    PlotRange -> {0, 1}, AxesLabel -> {"eps", "P"},
    PlotStyle -> {{RGBColor[0.8, 0, 0]}, {RGBColor[0, 0.6, 0]}}];

Display["!'/Applications/Mathematica 5.2.app/SystemFiles/Graphics/SystemResources/psfix' -epsf > abwnorm.eps", g];
