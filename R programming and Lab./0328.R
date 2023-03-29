# 이산형 일양분포
n = 10
p = 1 / n
x = c(1:n); x
px = x * (1 / x) * p; px
plot(x, px, type = 'h', xlim = c(0, n), ylim = c(0, 1), lwd = 3)


# 실습1
n = 20
p = 1 / n
x = c(1:n)
px = x * (1 / x) * p
plot(x, px, type = 'h', xlim = c(0, n), ylim = c(0, 1), lwd = 2, col = 20)


# 이항분포
n = 10; p = .5
px = choose(n, x) * p^x * (1 - p)^(n - x); px
plot(x, px, main = '이항분포 graph', type = 'h', lwd = 2, col = 'red')


# 실습2
n = 20; p = .4
px = choose(n, x) * p^x * (1 - p)^(n - x)
plot(x, px, main = '이항분포 graph', type = 'h', lwd = 2, col = 51)


# 포아송분포
n = 100; m = 5
x = c(0:n); x
px = exp(1)^(-m) * m^x / factorial(x); px
plot(x, px, main = '포아송분포 graph', type = 'h', lwd = 2, col = 'blue')


# 실습3
n = 100; m = 10
x = c(0:n)
px = exp(1)^(-m) * m^x / factorial(x)
plot(x, px, main = '포아송분포 graph', type = 'h', lwd = 2, col = 53)


# 연속형 일양분포
n = 10
curve((x / x / n), 0, n, bty = '7', col = 2, lwd = 3)


# 실습4
n = 5
curve((x / x / n), 0, n, bty = '7', col = 54, lwd = 2)


# 정규분포
m = 0; s2 = 1
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -5, 5, bty = 'o', col = 3, lwd = 3); abline(v = 0, h = 0)


# 실습5
m = 3; s2 = .1
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -5, 5, bty = 'o', col = 55, lwd = 5); abline(v = 0, h = 0)


# 정규분포 겹쳐서
m = 0; s2 = 1
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -10, 10, col = 1); abline(v = 0, h = 0)
m = 0; s2 = 2
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -10, 10, col = 2, add = T)
m = 0; s2 = 3
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -10, 10, col = 3, add = T)
m = 0; s2 = 4
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -10, 10, col = 4, add = T)


# 실습6
m = 0; s2 = 1
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -10, 10, col = 58, lwd = 3); abline(v = 0, h = 0)
m = 1; s2 = 1.5
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -10, 10, col = 59, lwd = 3, add = T)
m = 2; s2 = 2
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -10, 10, col = 60, lwd = 3, add = T)
m = 3; s2 = 2.5
curve(1 / sqrt(2 * pi * s2) * exp(-(x - m)^2 / (2 * s2)), -10, 10, col = 61, lwd = 3, add = T)