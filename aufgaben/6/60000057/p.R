#
# p.R -- display power law samples
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#

d <- read.csv("data.csv")
d$F = (100 - d$j) / 100
d$logF = log(d$F)
d$logx = log(d$x)
regression = lm(logF ~ logx, d)
regression
pdf("d.pdf", 7, 5);
plot(d$F ~ d$x, col = "red", log = "xy", xlab = "x", ylab = "log(1-F(x))")
abline(regression, col = "blue")


