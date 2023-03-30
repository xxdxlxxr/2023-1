# 이항분포
dbinom(0, size = 10, p = .3)
pbinom(5, size = 10, p = .3)
pbinom(5, 10, .3) - pbinom(2, 10, .3)


# 실습1
dbinom(20, 50, .5) # B(50, 0.5)에서 x = 20일 확률
pbinom(3, 20, .4) # B(20, 0.4)에서 x <= 3일 확률
qbinom(.3, 30, .3) # B(30, 0.3)에서 x <= a일 확률이 0.3일 때 a


n = 10; p = .3; x = c(0:n)

# p(x)를 계산
y1 = choose(n, x) * p^x * (1 - p)^(n - x); y1
plot(x, y1, type = 'h', lwd = 3, col = 'red')

# p(x)를 이용
y2 = dbinom(x, n, p); y2
plot(x, y2, type = 'h', lwd = 3, col = 'red')


# 실습2
n = 20; p = .4; x = c(0:n)

y3 = dbinom(x, n, p)
plot(x, y3, type = 'h', lwd = 5, col = 55)


# 분포함수 그래프
n = 10; p = .3; x = c(0:n)

y4 = pbinom(x, n, p); y4
plot(x, y4, type = 's', lwd = 3, col = 'red')


# 실습3
n = 20; p = .4; x = c(0:n)

y5 = pbinom(x, n, p)
plot(x, y5, type = 's', lwd = 5, col = 59)


# 평균, 분산
n = 10; p = .3; x = c(0:n)

y = dbinom(x, n, p)

ex = 0; ex2 = 0

for (i in 1:length(x)) {
ex = ex + x[i] * y[i]
ex2 = ex2 + x[i]^2 * y[i]
}

v = ex2 - ex^2
ex; v; sqrt(v)


# 실습4
n = 20; p = .4; x = c(0:n)

y = dbinom(x, n, p)

ex = 0; ex2 = 0

for (i in 1:length(x)) {
ex = ex + x[i] * y[i]
ex2 = ex2 + x[i]^2 * y[i]
}

v = ex2 - ex^2
ex; v; sqrt(v) # np = 8, npq = 4.8 확인


# 포아송분포
dpois(0, lambda = 3)
ppois(5, lambda = 3)
ppois(5, 3) - ppois(2, 3)


# 실습5
dpois(2, lambda = 5) # 모수가 5인 포아송분포에서 x = 2일 확률
ppois(3, lambda = 6) # 모수가 6인 포아송분포에서 x <= 3일 확률
qpois(.4, lambda = 3) # 모수가 3인 포아송분포에서 x <= a일 확률이 0.4일 때 a


ppois(15, 3)
ppois(16, 3) # x = 0부터 x = 16까지의 확률의 합이 1

n = 16; lambda = 3; x = c(0:n)

# p(x)를 계산
y1 = lambda^x * exp(-lambda) / factorial(x); y1
plot(x, y1, type = 'h', lwd = 10, col = 'red')


# p(x)를 이용
y2 = dpois(x, lambda); y2
plot(x, y2, type = 'h', lwd = 10, col = 'red')


# 실습6
ppois(20, 5)
ppois(21, 5) # x = 0부터 x = 21까지의 확률의 합이 1

n = 21; lambda = 5; x = c(0:n)

y2 = dpois(x, lambda)
plot(x, y2, type = 'h', lwd = 5, col = 'orange')


# 분포함수 그래프
n = 16; lambda = 3; x = c(0:n)

y4 = ppois(x, lambda); y4
plot(x, y4, type = 's', lwd = 3, col = 'red')


# 실습7
ppois(18, 4)
ppois(19, 4) # x = 0부터 x = 19까지의 확률의 합이 1

n = 19; lambda = 4; x = c(0:n)

y5 = ppois(x, lambda)
plot(x, y5, type = 's', lwd = 3, col = 'purple')


# 평균, 분산
n = 16; lambda = 3; x = c(0:n)

y = dpois(x, lambda)

ex = 0; ex2 = 0

for (i in 1:length(x)) {
ex = ex + x[i] * y[i]
ex2 = ex2 + x[i]^2 * y[i]
}

v = ex2 - ex^2
ex; v; sqrt(v)


# 실습8
ppois(12, 2)
ppois(13, 2) # x = 0부터 x = 13까지의 확률의 합이 1

n = 13; lambda = 2; x = c(0:n)

y = dpois(x, lambda)

ex = 0; ex2 = 0

for (i in 1:length(x)) {
ex = ex + x[i] * y[i]
ex2 = ex2 + x[i]^2 * y[i]
}

v = ex2 - ex^2
ex; v; sqrt(v) # 평균 : 3, 분산 : 3 확인


# 과제9
dgeom(1, .5) # G(0.5)에서 x = 1일 확률
pgeom(3, .4) # G(0.4)에서 x <= 3일 확률
qgeom(.2, .1) # G(0.3)에서 x <= a일 확률이 0.3일 때 a


pgeom(100, .1)
pgeom(200, .1)
pgeom(150, .1)
pgeom(158, .1)
pgeom(159, .1) # x = 0에서 x = 159까지의 확률의 합이 1
n = 159; p = .1; x = c(1:n)

y1 = (1 - p)^(x - 1) * p
plot(x, y1, type = 'h', col = 100)

y2 = dgeom(x, p)
plot(x, y2, type = 'h', col = 101)


y3 = pgeom(x, p)
plot(x, y3, type = 's', lwd = 3, col = 500)


y4 = dgeom(x, p)

ex = 0; ex2 = 0

for (i in 1:length(x)) {
ex = ex + x[i] * y4[i]
ex2 = ex2 + x[i]^2 * y4[i]
}

v = ex2 - ex^2
ex; v; sqrt(v) # 1 / p = 10, (1 – p) / p^2 = 90 확인