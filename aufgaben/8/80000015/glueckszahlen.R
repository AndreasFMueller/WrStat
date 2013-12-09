d <- read.csv("glueckszahlen.csv")

d$p = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)

n = sum(d$haeufigkeit)

d$np = d$p * n
d$delta = d$haeufigkeit - d$np
d$D = d$delta * d$delta / d$np

d

D = sum(d$D)

sprintf("%.9f", D)
D
