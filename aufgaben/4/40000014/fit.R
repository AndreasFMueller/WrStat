# Polynom zweiten Grades fitten
acc <- nls(y ~ 0.5 * a * t * t + b * t + c, data = rakete,
        start = list(a = 40 * 9.81, b = 0, c = 0))

summary(acc)
