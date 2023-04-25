# 모의실험
# 동전 던지기
n = 10
rn = rep(0, n); zrn = rep(0, n)
x = runif(n, min = 0, max = 1)

for (i in 1:n) {
if (x[i] < 1 / 2) rn[i] = 1
else rn[i] = 2
}

zrn = rn < 2
sum(zrn)
p = sum(zrn) / n; p

plot(table(rn), type = 'h', col = 'red', lwd = 10)


# 실습1
par(mfrow = c(2, 3))

for (j in 10^(1:6)) {
n = j
rn = rep(0, n); zrn = rep(0, n)
x = runif(n, min = 0, max = 1)

for (i in 1:n) {
if (x[i] < 1 / 2) rn[i] = 1
else rn[i] = 2
}

zrn = rn < 2; cat('sum =', sum(zrn), '\n')
p = sum(zrn) / n; cat('p =', p, '\n\n')

plot(table(rn), type = 'h', col = 'red', lwd = 10)
}

par(mfrow = c(1, 1))


# 주사위 던지기
n = 60
rn = rep(0, n); zrn = rep(0, n)
x = runif(n, min = 0, max = 1)

for (i in 1:n) {
if (x[i] < 1 / 6) rn[i] = 1
else if (x[i] < 2 / 6) rn[i] = 2
else if (x[i] < 3 / 6) rn[i] = 3
else if (x[i] < 4 / 6) rn[i] = 4
else if (x[i] < 5 / 6) rn[i] = 5
else rn[i] = 6
}

zrn = rn < 2; sum(zrn)
p = sum(zrn) / n; p

plot(table(rn), type = 'h', col = 'red', lwd = 3)


# 실습2
par(mfrow = c(2, 3))

for (j in 6 * 10^(1:6)) {
n = j
rn = rep(0, n); zrn = rep(0, n)
x = runif(n, min = 0, max = 1)

for (i in 1:n) {
if (x[i] < 1 / 6) rn[i] = 1
else if (x[i] < 2 / 6) rn[i] = 2
else if (x[i] < 3 / 6) rn[i] = 3
else if (x[i] < 4 / 6) rn[i] = 4
else if (x[i] < 5 / 6) rn[i] = 5
else rn[i] = 6
}

zrn = rn < 2; cat('sum =', sum(zrn), '\n')
p = sum(zrn) / n; cat('p =', p, '\n\n')

plot(table(rn), type = 'h', col = 'red', lwd = 3)
}


# 이항분포의 정규근사
n = 100; p = .5
bn = c(5, 10, 15, 30, 50, 1000)

par(mfrow = c(2, 3))

for (i in 1:6) {
res = rbinom(n, bn[i], p)
hist(res, breaks = 'fd', prob = T)
curve(dnorm(x, bn[i] * p, sqrt(bn[i] * p * (1 - p))), add = T)
}


# 실습3
n = 100; p = .5
par(mfrow = c(2, 3))
bn = c(5, 10, 15, 30, 50, 1000)

for (i in 1:6) {
res = rbinom(n, bn[i], p)
hist(res, breaks = 'fd', prob = T)
curve(dnorm(x, bn[i] * p, sqrt(bn[i] * p * (1 - p))), add = T)
}

n = 1000; p = .5
par(mfrow = c(2, 3))
bn = c(5, 10, 15, 30, 50, 1000)

for (i in 1:6) {
res = rbinom(n, bn[i], p)
hist(res, breaks = 'fd', prob = T)
curve(dnorm(x, bn[i] * p, sqrt(bn[i] * p * (1 - p))), add = T)
}

n = 10000; p = .5
par(mfrow = c(2, 3))
bn = c(5, 10, 15, 30, 50, 1000)

for (i in 1:6) {
res = rbinom(n, bn[i], p)
hist(res, breaks = 'fd', prob = T)
curve(dnorm(x, bn[i] * p, sqrt(bn[i] * p * (1 - p))), add = T)
}

n = 100000; p = .5
par(mfrow = c(2, 3))
bn = c(5, 10, 15, 30, 50, 1000)

for (i in 1:6) {
res = rbinom(n, bn[i], p)
hist(res, breaks = 'fd', prob = T)
curve(dnorm(x, bn[i] * p, sqrt(bn[i] * p * (1 - p))), add = T)
}

n = 1000000; p = .5
par(mfrow = c(2, 3))
bn = c(5, 10, 15, 30, 50, 1000)

for (i in 1:6) {
res = rbinom(n, bn[i], p)
hist(res, breaks = 'fd', prob = T)
curve(dnorm(x, bn[i] * p, sqrt(bn[i] * p * (1 - p))), add = T)
}


# 포아송분포의 정규근사
n = 100
lam = c(.5, 1, 10, 100, 1000, 5000)

for (i in 1:6) {
res = rpois(n, lam[i])
hist(res, prob = T)
curve(dnorm(x, lam[i], sqrt(lam[i])), add = T)
}


# 실습4
n = 100
lam = c(.5, 1, 10, 100, 1000, 5000)

for (i in 1:6) {
res = rpois(n, lam[i])
hist(res, prob = T)
curve(dnorm(x, lam[i], sqrt(lam[i])), add = T)
}

n = 1000
lam = c(.5, 1, 10, 100, 1000, 5000)

for (i in 1:6) {
res = rpois(n, lam[i])
hist(res, prob = T)
curve(dnorm(x, lam[i], sqrt(lam[i])), add = T)
}

n = 10000
lam = c(.5, 1, 10, 100, 1000, 5000)

for (i in 1:6) {
res = rpois(n, lam[i])
hist(res, prob = T)
curve(dnorm(x, lam[i], sqrt(lam[i])), add = T)
}

n = 100000
lam = c(.5, 1, 10, 100, 1000, 5000)

for (i in 1:6) {
res = rpois(n, lam[i])
hist(res, prob = T)
curve(dnorm(x, lam[i], sqrt(lam[i])), add = T)
}

n = 1000000
lam = c(.5, 1, 10, 100, 1000, 5000)

for (i in 1:6) {
res = rpois(n, lam[i])
hist(res, prob = T)
curve(dnorm(x, lam[i], sqrt(lam[i])), add = T)
}

par(mfrow = c(1, 1))


# 이하 시험에 안 나옴
# 카이제곱분포
n = 100
rx = rnorm(n, 0, 1)
y = rx^2

hist(y, breaks = 'fd', ylim = c(0, 1), prob = T)
x = seq(0, 5, by = .01)
lines(x, dchisq(x, 1))


# 실습5
par(mfrow = c(2, 3))

for (i in 10^(2:7)) {
n = i
rx = rnorm(n, 0, 1)
y = rx^2

hist(y, breaks = 'fd', ylim = c(0, 1), prob = T)
x = seq(0, 5, by = .01)
lines(x, dchisq(x, 1))
}

par(mfrow = c(1, 1))


# t분포
n = 100
x = seq(-3, 3, by = .01)
rz = rnorm(n, mean = 0, sd = 1)
rv = rchisq(n, df = 5)
t = rz / sqrt(rv / 5)

hist(t, breaks = 'fd', xlim = c(-3, 3), ylim = c(0, .5), prob = T)
lines(x, dt(x, 5))


# 실습6
par(mfrow = c(2, 3))

for (i in 10^(2:7)) {
n = i
x = seq(-3, 3, by = .01)
rz = rnorm(n, mean = 0, sd = 1)
rv = rchisq(n, df = 5)
t = rz / sqrt(rv / 5)

hist(t, breaks = 'fd', xlim = c(-3, 3), ylim = c(0, .5), prob = T)
lines(x, dt(x, 5))
}

par(mfrow = c(1, 1))


# 일양분포에서 변수변환
n = 100
x = seq(0, 10, by = .01)
rx = runif(n, min = 0, max = 1)
y = -log(rx)

hist(y, breaks = 'fd', ylim = c(0, 1), prob = T)
lines(x, dexp(x, 1))


# 실습7
par(mfrow = c(2, 3))

for (i in 10^(2:7)) {
n = i
x = seq(0, 10, by = .01)
rx = runif(n, min = 0, max = 1)
y = -log(rx)

hist(y, breaks = 'fd', ylim = c(0, 1), prob = T)
lines(x, dexp(x, 1))
}

par(mfrow = c(1, 1))
