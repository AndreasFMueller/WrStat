data <- read.csv("data.csv")

d <- data.frame(woche = 1:50)

d$jahr2020 <- data$jahr2020
d$vorjahre <- data$jahr2019 + data$jahr2018 + data$jahr2017 + data$jahr2016 + data$jahr2015

m <- data.frame(gruppe = 1:10)
m

m$jahr2020 <- c(
sum(d$jahr2020[seq(1,4,1)]),
sum(d$jahr2020[seq(5,9,1)]),
sum(d$jahr2020[seq(10,14,1)]),
sum(d$jahr2020[seq(15,19,1)]),
sum(d$jahr2020[seq(20,24,1)]),
sum(d$jahr2020[seq(25,29,1)]),
sum(d$jahr2020[seq(30,34,1)]),
sum(d$jahr2020[seq(35,39,1)]),
sum(d$jahr2020[seq(40,44,1)]),
sum(d$jahr2020[seq(45,49,1)])
)
m$vorjahre <- c(
sum(d$vorjahre[seq(1,4,1)]),
sum(d$vorjahre[seq(5,9,1)]),
sum(d$vorjahre[seq(10,14,1)]),
sum(d$vorjahre[seq(15,19,1)]),
sum(d$vorjahre[seq(20,24,1)]),
sum(d$vorjahre[seq(25,29,1)]),
sum(d$vorjahre[seq(30,34,1)]),
sum(d$vorjahre[seq(35,39,1)]),
sum(d$vorjahre[seq(40,44,1)]),
sum(d$vorjahre[seq(45,49,1)])
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
D = sum(m$D)

D

chisq.test(m$jahr2020, p = m$vorjahre / sum(m$vorjahre))

pdf("ueber.pdf")
m$vorjahre / sum(m$vorjahre)
plot(m$jahr2020/sum(m$jahr2020), col="red", type="h", lwd = 10)
points(m$vorjahre/sum(m$vorjahre), col="blue", type="l", xlab="Wochengruppe", ylab="Häufigkeit", lwd=2)

