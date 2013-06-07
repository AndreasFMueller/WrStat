pdf(file = "aufg7.pdf")

x = runif(30, 1, 10)
y = 2 * x - 11 + runif(30, -1, 1)

f = data.frame(t = x, v = y)

plot(0, 0, type = "n", main = "Zeit-Geschwindigkeit",
	xlab = "Zeit", ylab = "Geschwindigkeit",
	xlim = c(1,10), ylim=c(-10, 10))

points(f$t, f$v, col = "red", pch = 3)

x = 1:10
y = 2 * x - 11
lines(x, y, col = "blue")

