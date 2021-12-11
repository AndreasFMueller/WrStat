data <- read.csv("data.csv")

d <- data.frame(woche = 1:50)

d$jahr2020 <- data$jahr2020
d$vorjahre <- data$jahr2019 + data$jahr2018 + data$jahr2017 + data$jahr2016 + data$jahr2015

m <- data.frame(gruppe = 1:5)
m

m$jahr2020 <- c(
sum(d$jahr2020[seq( 1,10,1)]),
sum(d$jahr2020[seq(11,20,1)]),
sum(d$jahr2020[seq(21,30,1)]),
sum(d$jahr2020[seq(31,40,1)]),
sum(d$jahr2020[seq(41,50,1)])
)
m$vorjahre <- c(
sum(d$vorjahre[seq( 1,10,1)]),
sum(d$vorjahre[seq(11,20,1)]),
sum(d$vorjahre[seq(21,30,1)]),
sum(d$vorjahre[seq(31,40,1)]),
sum(d$vorjahre[seq(41,50,1)])
)

m

m$p = m$vorjahre / sum(m$vorjahre)
m$pj = m$jahr2020 / sum(m$jahr2020)
m

n = sum(m$jahr2020)
n
m$np = n * m$p
m$np
m$D = (m$np - m$jahr2020)^2 / m$np

m

D = sum(m$D)

D

chisq.test(m$jahr2020, p = m$vorjahre / sum(m$vorjahre))

pdf("ueber.pdf")
m$vorjahre / sum(m$vorjahre)
plot(m$jahr2020/sum(m$jahr2020), col="red", type="h", lwd = 10, ylab = "Todesfallhäufigkeit", main = "Todesfallhäufigkeit 20-39jährige", xlab="Wochengruppe")
points(m$vorjahre/sum(m$vorjahre), col="blue", type="l", xlab="Wochengruppe", ylab="Häufigkeit", lwd=3)

