#
# d.R
#
# (c) 2022 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#

d <- data.frame(klasse = 1:5)
d$selbst <- c(17, 25, 39, 52, 32)
d$hosp <- c(0.037, 0.157, 0.254, 0.366, 0.186)
n <- sum(d$selbst)
n

d$npi <- d$hosp * n
d$diff <- d$selbst - d$npi
d$diff2 <- (d$diff * d$diff)/ d$npi

D <- sum(d$diff2)

d
D

chisq.test(d$selbst, p = d$hosp)
