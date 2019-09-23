#
# trump.R
#
# (c) 2018 Prof Dr Andreas Müller
#
X = 1.6
Y = 1.8
SX = 0.23
SY = 0.24
n = 11
m = 13
k = m + n - 2

s <- sqrt(n*m*(n+m-2)/(n+m))
t <- s * (X-Y) / sqrt((n-1)*SX^2 + (m-1)*SY^2)
t

alpha = 0.95
qt(alpha, k)
