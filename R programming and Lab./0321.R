# 간단한 그래프
x = (0:100) * pi / 50; x
ycos = cos(x); ycos
plot(x, ycos)

ysin = sin(x); ysin
plot(x, ysin)

x1 = seq(-5, 5, by = 0.1); x1
y1 = x1^2; y1
plot(x1, y1)

y2 = x1^3; y2
plot(x1, y2, ylab = expression(x^3))

y3 = exp(x1); y3
plot(x1, y3, ylab = expression(exp(x)))

y4 = (x1 - 1)^2; y4
plot(x1, y4, ylab = expression((x - 1)^2))


# 그래프 조절
plot(x1, y1, xlab = expression(x), ylab = expression(x^2))
plot(x1, y3, main = '그래프', sub = '표1', xlab = expression(x), ylab = expression(exp(x)))

plot(x1, y1, main = '그래프', type = 'p')
plot(x1, y1, main = '이차함수 그래프', sub = '표1',
xlab = expression(x), ylab = expression(exp(x)), type = 'l')

colors()
plot(x1, y1, type = 'p', col = 'green')
plot(x1, y1, type = 'l', col = 'pink')

plot(x1, y1, type = 'l', col = 'red', lty = 1, lwd = 5)

plot(x1, y1, type = 'p', col = 'blue', lty = 1, lwd = 5, pch = 11)


# 연습1
x = (0:100) * pi / 50; x
ysin = sin(x); ysin
plot(x, ysin,
main = '사인 그래프', sub = '표1', xlab = expression(x), ylab = expression(sin(x)),
type = 'l', col = 100, lty = 1, lwd = 5)
abline(v = 0, h = 0)

x1 = seq(-5, 5, by = 0.1); x1
y2 = x1^3 - x1^2 + x1 - 1; y2
plot(x, y2,
main = '삼차함수 그래프', sub = '표2', xlab = expression(x), ylab = expression(x^3 - x^2 + x - 1),
type = 'h', col = 150, lty = 2, lwd = 1, pch = 1)
abline(v = 0, h = 0)

x1 = seq(-5, 5, by = 0.1); x1
y3 = exp(-x1); y3
plot(x, y3,
main = '지수함수 그래프', sub = '표3', xlab = expression(x), ylab = expression(exp(-x)),
type = 'o', col = 200, lty = 5, lwd = 1, pch = 5)
abline(v = 0, h = 0)


# 연습2
x = seq(0.1, 3, by = 0.1)
y = log(x) * exp(x)
plot(x, y,
main = '로그함수와 지수함수의 곱의 함수 그래프', sub = '표4', xlab = expression(x), ylab = expression(log(x) * exp(x)),
type = 'o', col = 250, lty = 2, lwd = 2, pch = 5)
abline(v = 0, h = 0)

x = seq(-3, 3, by = 0.1)
y = exp(-x^2 / 2) / sqrt(2 * pi)
plot(x, y,
main = '표준정규분포 그래프', sub = '표5', xlab = expression(x), ylab = expression(exp(-x^2 / 2) / sqrt(2 * pi)),
type = 'l', col = 300, lty = 5, lwd = 1)
abline(v = 0, h = 0)


# 다양한 그래프
x = (0:100) * pi / 50; ycos = cos(x); ysin = sin(x)
x1 = seq(-5, 5, by = 0.01); y1 = x1^2; y2 = x1^3
y3 = exp(x1); y4 = (x1 - 1)^2; y4

plot(x, ycos, type = 'l', pch = 19, col = 'red', lwd = 5)
abline(v = 0, h = 0)

plot(x, ycos, type = 'l', bty = 'o', pch = 19, col = 'red', lwd = 5)
abline(v = 0, h = 0)

par(mfrow = c(2, 1))
plot(x, ycos); text(3, .5, 'cox(x)')
abline(v = 0, h = 0, lwd = 5)
plot(x, ysin); text(5, .5, 'sin(x)')
abline(v = 0, h = 0)
par(mfrow = c(1, 1))

par(mfrow = c(1, 2))
plot(x, ycos); text(3, .5, 'cos(x)'); abline(v = 0, h = 0)
plot(x, ysin); text(5, .5, 'sin(x)'); abline(v = 0, h = 0)
par(mfrow = c(1, 1))

par(mfrow = c(2, 2))
plot(x1, y1); text(0, 10, 'y1 = x^2'); abline(v = 0, h = 0)
plot(x1, y2); text(0, 10, 'y2 = x^3'); abline(v = 0, h = 0)
plot(x1, y3); text(0, 10, 'y3 = exp(x)'); abline(v = 0, h = 0)
plot(x1, y4); text(0, 10, 'y4 = (x - 1)^2'); abline(v = 0, h = 0)
par(mfrow = c(1, 1))


# 연습3
par(mfrow = c(2, 2))
x = seq(-5, 5, by = 0.1)
plot(x1, dt(x, 3), type = 'l', col = rainbow(4)[1], lty = 2, lwd = 2); text(3, .35, '자유도가 3인 t분포'); abline(v = 0, h = 0)
x = seq(0, 10, by = 0.1)
plot(x, dexp(x, 2), type = 'l', col = rainbow(4)[2], lty = 3, lwd = 3); text(6, 1, '모수가 2인 지수분포'); abline(v = 0, h = 0)
plot(x, dchisq(x, 5), type = 'l', col = rainbow(4)[3], lty = 4, lwd = 4); text(4, .05, '자유도가 5인 카이제곱분포'); abline(v = 0, h = 0)
x = seq(0, 1, by = 0.01)
plot(x, dbeta(x, 2, 2), type = 'l', col = rainbow(4)[4], lty = 5, lwd = 5); text(.5, .5, '모수가 (2, 2)인 베타분포'); abline(v = 0, h = 0)
par(mfrow = c(1, 1))