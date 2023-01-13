#
# d.R
#
# (c) 2022 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#

d <- data.frame(Sternzeichen = 1:12)
d$zeichen <- c( "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces")
d$ni <- c( 29, 24, 22, 19, 21, 18, 19, 20, 23, 18, 20, 23 )
d$pi <- rep(1/12, 12)
n <- sum(d$ni)

d$npi <- d$pi * n
d$diff <- d$ni - d$npi
d$diff2 <- (d$diff * d$diff)/ d$npi

D <- sum(d$diff2)

d
D

chisq.test(d$ni, p = d$pi)

dsmall = d[1:6,]
dsmall

dsmall$pi <- rep(1/6, 6)
n <- sum(dsmall$ni)
n

dsmall$npi <- dsmall$pi * n
dsmall$diff <- dsmall$ni - dsmall$npi
dsmall$diff2 <- (dsmall$diff * dsmall$diff)/ dsmall$npi

Dsmall <- sum(dsmall$diff2)

chisq.test(dsmall$ni, p = dsmall$pi)

dsmall
Dsmall
