#
# speed.R -- compute glas breaking speed
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
d <- read.csv("data.csv")

d$t2 <- d$t^2
d$x2 <- d$x^2
d$tx <- d$t * d$x

d

summary(d)

a <- (7 * sum(d$tx) - sum(d$t) * sum(d$x)) / (7 * sum(d$t2) - sum(d$t)^2)
a
b <- mean(d$x) - a * mean(d$t)
b

r2 <- (7 * sum(d$tx) - sum(d$t) * sum(d$x))^2 / ((7 * sum(d$t2) - sum(d$t)^2) * (7 * sum(d$x2) - sum(d$x)^2))

r2

l <- lm(d$x ~ d$t)
summary(l)

