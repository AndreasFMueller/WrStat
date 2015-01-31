a = c(31.6, 27.8, 31.9)
b = c(32.5, 32.9, 31.3)

ma = mean(a)
ma
mb = mean(b)
mb

sa = sqrt(var(a))
sa
sb = sqrt(var(b))
sb

t = ((ma - mb) / sqrt(2 * sa + 2 * sb)) * sqrt(3 * 3 * (3 + 3 - 2) / (3 + 3))
t
f = 3 + 3 - 2
f
