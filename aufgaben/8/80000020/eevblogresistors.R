#
# eevblogresistors.R -- analyze EEVblog resistor data
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
resistors <- read.csv("eevblogresistors.csv")
m <- mean(resistors$resistance)
s <- sqrt(var(resistors$resistance))
m
s

1 - pnorm(1005, m = m, s = s) - pnorm(995, m = m, s = s)
1 - pnorm(1010, m = m, s = s) + pnorm(990, m = m, s = s)

pdf("ecdf.pdf", 8, 6)
Fn <- ecdf(resistors$resistance)
plot(Fn, main = "Resistance", col =" red")
x = seq(m - 4 * s, m + 4 * s, s / 10)
y = pnorm(x, m = m, s = s)
points(x, y, type = "l", col = "blue")

pdf("qq.pdf", 8, 6)

qqnorm(resistors$resistance, datax = TRUE, col = "red")
qqline(resistors$resistance, datax = TRUE, col = "blue")

ks.test(resistors$resistance + runif(400, min = -0.001, max = 0.001), "pnorm")

shapiro.test(resistors$resistance)
