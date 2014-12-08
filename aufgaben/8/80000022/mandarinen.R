#
# Skript zum Test der Mandarinendurchmesser auf Normalverteilung
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
mandarinen <- read.csv("mandarinen.csv")
d = mandarinen$durchmesser
m = mean(d)
s = sqrt(var(d))

# Berechnung der Breite des Intervals fuer die Darstellung der
# Verteilungsfunktion
# w = ceiling(10 * max(abs(d - m) / s)) / 10
w = 2.5	# robuste Variante, ignoriert Ausreisser
xmin = m - w * s
xmax = m + w * s

# Plot der Verteilungsfunktion
pdf("mandarinen.pdf", width = 8, height = 6)
f <- ecdf(d)
plot(f, main = "Verteilungsfunktion", xlab = "Mandarinendurchmesser [mm]",
	ylab = "Wahrscheinlichkeit", col = "blue",
	xlim = c(xmin, xmax))
x = seq(from = xmin, to = xmax, length.out = 200)
y = pnorm(x, m, s)
lines(x, y, col = "red")
dev.off()

# Q-Q-Plot, vergleicht Quantilien der beiden Verteilungen ("linearisierte"
# Variante der der Verteilungsfunktion)
pdf("mandarinenqq.pdf", width = 8, height = 6)
stats::qqnorm(d, col = "blue",
	main = "Q-Q-Plot der Verteilung der Mandarinendurchmesser",
	xlab = "Quantilen der Standardnormalverteilung",
	ylab = "Qauntilen der empirischen Verteilung")
x = c(-w, w)
y = m + s * x
lines(x, y, col = "red")
dev.off()

# kleine Werte addieren, um duplizierte Daten zu verhindern (wird von
# der ks.test Funktion verlangt)

# 1. Moeglichkeit: kleines Inkrement proportional zur Positionsnummer in der
#                  Liste der Messdaten und kleiner als die Messgenauigkeit
#d = d + seq(from = 0, to = 0.01, length.out = length(d))

# 2. Moeglichkeit: normalverteilte Zufallsvariablen mit Standardabweichung
#                  kleiner als Messgenauigkeit. Vorteil dieser Methode: wenn
#                  die Daten normalverteilt sind, wird diese Eigenschaft durch
#                  die Addition nicht zerstoert
d = d + rnorm(length(d), mean=0, sd=0.001)

# Mittelwert und Standardabweichung ermitteln
m = mean(d)
s = sqrt(var(d))

# standardisieren
standardisiert = (d - m) / s

# Kolmogorov-Smirnov-Test
ks.test(standardisiert, "pnorm")

# Shapiro-Wilk-Test
shapiro.test(d)
