#
# lm.R
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
d <- read.csv("data.csv")

d$x2 = d$x * d$x
d$y2 = d$y * d$y
d$xy = d$x * d$y

d
summary(d)
colSums(d)

l <- lm(d$y ~ d$x)
summary(l)
