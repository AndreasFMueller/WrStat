n = 2^(1:4)

t = 3.1 * log2(n) - 6 + rnorm(length(n), 0, 1)

#pow(10, t)
2^t
