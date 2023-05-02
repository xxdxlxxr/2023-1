# 일양분포

mu = .5; var = 1 / 12
m = 10
n = 100
xbar = rep(0, m)

for (i in 1:m) {
x = runif(n)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)


# 실습1
par(mfrow = c(2, 2))

mu = .5; var = 1 / 12
m = 1000
xbar = rep(0, m)

for (j in 10^c(1, 2, 3, 5)) {
n = j

for (i in 1:m) {
x = runif(n)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)
}

par(mfrow = c(1, 1))


# 실습2
m = 100000
n = 100000
xbar = rep(0, m)

for (i in 1:m) {
x = runif(n)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)


# 정규분포
mu = 10; var = 25
m = 10
n = 100
xbar = rep(0, m)

for (i in 1:m) {
x = rnorm(n, mu, sqrt(var))
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)


# 실습3
par(mfrow = c(2, 2))

mu = -10; var = 10
m = 1000
xbar = rep(0, m)

for (j in 10^c(1, 2, 3, 5)) {
n = j

for (i in 1:m) {
x = rnorm(n, mu, sqrt(var))
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)
}

par(mfrow = c(1, 1))


# 실습4
m = 100000
n = 100000
xbar = rep(0, m)

for (i in 1:m) {
x = rnorm(n, mu, sqrt(var))
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)


# 지수분포
dexp(1, 1)
pexp(1, 1, lower.tail = T)
pexp(2, 1) - pexp(1, 1)

x = seq(0, 20, by = .01)
y1 = dexp(x, 1)
plot(x, y1, type = 'l', col = 'red')

y2 = dexp(x, 5)
y3 = dexp(x, 10)
plot(x, y1, type = 'l', col = '2', ylim = c(0, .8))
lines(x, y2, type = 'l', col = '4')
lines(x, y3, type = 'l', col = '6')

par(mfrow = c(2, 3))

for (i in 10^(1:6)) {
y = rexp(i, 1)
hist(y, ylim = c(0, .5), prob = T)
curve(dnorm(x, 1, 1), add = T)
}

par(mfrow = c(1, 1))

rx = rexp(100, 5)
mean(rx); sd(rx)

hist(rx, probability = T, xlim = c(0, 3), ylim = c(0, 4), main = 'Exponential(5)')
curve(dexp(x, 5), add = T)


lambda = 1; mu = 1 / lambda; var = 1 / lambda^2
m = 10
n = 100
xbar = rep(0, m)

for (i in 1:m) {
x = rexp(n, lambda)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)


# 실습5
par(mfrow = c(2, 2))

lambda = 2; mu = 1 / lambda; var = 1 / lambda^2
m = 1000
xbar = rep(0, m)

for (j in 10^c(1, 2, 3, 5)) {
n = j

for (i in 1:m) {
x = rnorm(n, mu, sqrt(var))
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)
}

par(mfrow = c(1, 1))


# 실습6
m = 100000
n = 100000
xbar = rep(0, m)

for (i in 1:m) {
x = rexp(n, lambda)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)


# 실습7
par(mfrow = c(2, 2))

df = 10; mu = 0; var = df / (df - 2)
m = 1000
xbar = rep(0, m)

for (j in 10^c(1, 2, 3, 5)) {
n = j

for (i in 1:m) {
x = rt(n, df)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)
}

par(mfrow = c(1, 1))


# 실습8
par(mfrow = c(2, 2))

df = 5; mu = df; var = 2 * df
m = 1000
xbar = rep(0, m)

for (j in 10^c(1, 2, 3, 5)) {
n = j

for (i in 1:m) {
x = rchisq(n, df)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)
}

par(mfrow = c(1, 1))
