data <- read.csv("data.csv")

data$X = log2(data$n)
data$Y = log2(data$t)
data$X2 = data$X * data$X
data$Y2 = data$Y * data$Y
data$XY = data$X * data$Y

data

sum(data$X)
sum(data$Y)
sum(data$X2)
sum(data$Y2)
sum(data$XY)

a = (mean(data$XY) - mean(data$X) * mean(data$Y)) / (mean(data$X2) - mean(data$X)^2)
b = mean(data$Y) - a * mean(data$X)

a
b

X = 5
Y = a * X + b

Y
2^Y

r2 = 
(mean(data$XY) - mean(data$X) * mean(data$Y))^2 /
((mean(data$X2) - mean(data$X)^2)
*
(mean(data$Y2) - mean(data$Y)^2)
)
r2

pdf(file = "log.pdf", width = 8, height = 6)
plot(data$X, data$Y,
	xlab = "log2(n)", ylab = "log2(t)",
	main = "Abhängigkeit der Laufzeit von n")
xvalues = c(1,4)
yvalues = a * xvalues + b
lines(xvalues, yvalues, col = "red")
