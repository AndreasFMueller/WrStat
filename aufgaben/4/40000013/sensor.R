sensor <- read.csv("sensor.csv")
l <- lm(abweichung ~ zeit, data = sensor)
summary(l)

pdf("sensor.pdf")
plot(sensor$zeit, sensor$abweichung,
        main = "Sensorabweichung",
        xlab = "Uhrzeit [h]", ylab = "Abweichung [s]",
        pch = 18)
abline(l)
