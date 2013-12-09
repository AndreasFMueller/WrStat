d <- read.csv("ks.csv")

n = length(d$j)

d$kp <- d$j/n - d$x
d$kplus <- sqrt(n) * d$kp
d$km <- d$x - (d$j-1)/n
d$kminus <- sqrt(n) * d$km

max(d$kplus)
max(d$kminus)

d
