# Rohdaten einlesen
rakete <- read.csv("raw.csv")

# Daten konvertieren
rakete$t <- 0.033333 * (0:4)
rakete$y <- -0.75 * rakete$vertikal / 48
rakete$y <- rakete$y - min(rakete$y)

