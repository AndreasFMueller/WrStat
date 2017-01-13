#
# schuhe.R -- lineare Regression für Schuhmodell
#
d <- read.csv("schuhe.csv")

d$kk <- d$koerpergroesse * d$koerpergroesse
d$ss <- d$schuhnummer * d$schuhnummer
d$ks <- d$schuhnummer * d$koerpergroesse

d
ek = mean(d$koerpergroesse)
es = mean(d$schuhnummer)
ek2 = mean(d$kk)
es2 = mean(d$ss)
eks = mean(d$ks)

a <- (eks - ek*es)/(ek2 - ek^2)
a
b <- es - ek * a
b

r2 <- (eks - ek * es)/(sqrt( (ek2 - ek^2)*(es2 - es^2)))
r2
sqrt(r2)

summary(d)
