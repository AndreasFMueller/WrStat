import graph;

size(200,200,IgnoreAspect);
real a = 2.1;

real W(real x) { return x^(2-a); }
real P(real x) { return x^(1-a); }

draw((0.2,0.0)--(0.2,0.8)--(0.0,0.8), dashed);
draw((1,0)--(1,1)--(0,1));

a = 2.01;
draw(graph(P,W,1,100,100,operator ..),red, "$\alpha=2.01$");
a = 2.161;
draw(graph(P,W,1,100,100,operator ..),green, "$\alpha=2.161$");
a = 2.6;
draw(graph(P,W,1,100,100,operator ..),blue, "$\alpha=2.6$");
a = 3.6;
draw(graph(P,W,1,100,100,operator ..),black, "$\alpha=3.6$");

attach(legend(), point(E),0, UnFill);

xaxis("$P(x)$",0,1,RightTicks(0.2,0.1));
yaxis("$W(x)$",0,1,LeftTicks(0.2,0.1));


