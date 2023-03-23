# 한 개의 그림에 여러 개를 겹쳐서 표현
x1 = seq(-5, 5, .1)
y1 = x1^2
y2 = x1^3
y3 = exp(x1)
y4 = (x1 - 1)^2

x = (0:100) * pi / 50; ycos = cos(x); ysin = sin(x); ysin2 = sin(x)^2

yy = cbind(ycos, ysin, ysin2)
matplot(x, yy)
matplot(x, yy, type = 'l', pch = '*'); abline(v = 0, h = 0)

plot(x, ycos)
abline(v = 0, h = 0)
lines(x, ysin)
lines(x, ysin2)

plot(x1, y1, type = 'l', pch = 1, col = 'blue', lwd = 2)
abline(v = 0, h = 0)
lines(x1, y2, type = 'o', pch = 2, col = 'red', lwd = 3)
lines(x1, y3, type = 'p', pch = 3, col = 'black', lwd = 4)
lines(x1, y4, type = 'b', pch = 4, col = 'yellow', lwd = 5)

plot(x1, y2, type = 'l', pch = 1, col = 'blue', lwd = 2)
abline(v = 0, h = 0)
lines(x1, y1, type = 'o', pch = 2, col = 'red', lwd = 3)
lines(x1, y3, type = 'p', pch = 3, col = 'black', lwd = 4)
lines(x1, y4, type = 'b', pch = 4, col = 'yellow', lwd = 5)


# 연습4
x = seq(-3, 3, by = 0.1); y1 = dt(x, 3)
plot(x, y1, ylab = '여러가지 분포함수 그래프', type = 'l', pch = 1, col = 'red', lwd = 2); abline(v = 0, h = 0)
x = seq(0, 10, by = 0.1); y2 = dexp(x, 2); y3 = dchisq(x, 5)
lines(x, y2, type = 'o', pch = 2, col = 'yellow', lwd = 3)
lines(x, y3, type = 'p', pch = 3, col = 'green', lwd = 4)
x = seq(0, 1, by = 0.01); y4 = dbeta(x, 2, 2)
lines(x, y4, type = 'b', pch = 4, col = 'blue', lwd = 5)
legend('topright', legend = c('t', 'exp', 'chisq', 'beta'), fill = c('red', 'yellow', 'green', 'blue'))


# 산점도
data()
attach(cars); cars
mean(speed); mean(dist)

plot(speed, dist, pch = 1); abline(v = 15.4, lwd = 2)
plot(speed, dist, pch = 2); abline(h = 42.98)
plot(speed, dist, pch = 3); abline(v = 15.4, h = 42.98)
plot(speed, dist, pch = 8); abline(-17, 4, v = 15.4, h = 42.98)


# 실습1
attach(trees)
mean(Height); mean(Volume)

plot(Height, Volume, pch = 1, col = 8); abline(v = mean(Height), lwd = 2)
plot(Height, Volume, pch = 2, col = 3); abline(h = mean(Volume), lwd = 3)
plot(Height, Volume, pch = 3, col = 2); abline(v = mean(Height), h = mean(Volume), lty = 2)
plot(Height, Volume, pch = 8, col = 4)
abline(lm(Volume ~ Height)$coefficients[1], lm(Volume ~ Height)$coefficients[2], v = mean(Height), h = mean(Volume), lty = 3, col = 'red')


# 히스토그램
attach(cars)
hist(speed)
hist(speed, probability = T)
hist(speed, probability = T, main = 'dist of Speed')
lines(density(speed))


# 실습2
attach(trees)
hist(Height, col = 'red')
hist(Height, probability = T, col = 'green')
hist(Height, probability = T, main = 'dist of Height', col = 'skyblue')
lines(density(Height), col = 'navy')


# curve
curve(x^2, -2, 2, bty = 'u', col = 1, lwd = 3); abline(v = 0, h = 0, lwd = 3)
curve(x^3, -2, 2, bty = 'o', col = 2, lwd = 3); abline(v = 0, h = 0, col = 1, lwd = 3)
curve(1 * x, -2, 2, bty = 'n', col = 3, lwd = 3); abline(v = 0, h = 0)

e = exp(1)
curve(e^(-1 * x^2), -2, 2, bty = '7', col = 4, lwd = 3); abline(v = 0, h = 0)
curve(e^(abs(x)), -2, 2, bty = 'c', col = 5, lwd = 3); abline(v = 0, h = 0)
curve(e^(-1 * abs(x)), -2, 2, bty = 'n', col = 6, lwd = 3); abline(v = 0, h = 0)
curve(log(x), 0, 10, bty = 'n', col = 7, lwd = 3); abline(v = 0, h = 0)
curve(log(x) * e^x, .1, 10, bty = 'n', col = 8, lwd = 3); abline(v = 0, h = 0)


# 실습3
curve(dt(x, 3), -3, 3, bty = '7', col = 10, lwd = 2); abline(v = 0, h = 0, col = 'gray')
curve(dexp(x, 2), 0, 3, bty = 'n', col = 5, lwd = 3); abline(v = 0, h = 0, col = 'pink')
curve(dchisq(x, 5), 0, 20, bty = 'o', col = 7, lwd = 4); abline(v = 0, h = 0, col = 'orange')
curve(dbeta(x, 2, 2), 0, 1, bty = 'u', col = 3, lwd = 5); abline(v = 0, h = 0, col = 'purple')


# add = T
curve(x^2, -5, 5, bty = 'n', col = 1, lwd = 1); abline(v = 0, h = 0)
curve(x^3, -5, 5, bty = 'o', col = 2, lwd = 2, add = T)

curve(x^2, bty = '7', xlim = c(-3, 3), ylim = c(-10, 10), col = 1, lwd = 1); abline(v = 0, h = 0)
curve(x^3, bty = 'u', col = 2, lwd = 2, add = T)
curve(2 * x, bty = 'c', col = 3, lwd = 3, add = T)


# 실습4
curve(dt(x, 3), -3, 3, ylab = '여러가지 분포함수 그래프', bty = '7', col = 3, lwd = 2)
curve(dexp(x, 2), 0, 3, bty = 'o', col = 7, lwd = 3, add = T)
curve(dchisq(x, 5), 0, 3, bty = 'c', col = 5, lwd = 4, add = T)
curve(dbeta(x, 2, 2), 0, 1, bty = 'u', col = 10, lwd = 5, add = T)