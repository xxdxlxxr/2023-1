# 이항분포에서의 중심극한정리
n1 = 30; p = .1; mu = n1 * p; var = n1 * p * (1 - p)

m = 10
n = 100

xbar = rep(0, m)

for (i in 1:m) {
x = rbinom(n, n1, p)
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

n1 = 50; p = .7; mu = n1 * p; var = n1 * p * (1 - p)

for (j in 10^c(1, 2, 3, 5)) {
m = 1000
n = j

xbar = rep(0, m)

for (i in 1:m) {
x = rbinom(n, n1, p)
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
x = rbinom(n, n1, p)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)


# 포아송 분포
lambda = 500; mu = lambda; var = lambda

m = 10
n = 100

xbar = rep(0, m)

for (i in 1:m) {
x = rpois(n, lambda)
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

lambda = 200; mu = lambda; var = lambda

for (j in 10^c(1, 2, 3, 5)) {
m = 1000
n = j

xbar = rep(0, m)

for (i in 1:m) {
x = rpois(n, lambda)
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
x = rpois(n, lambda)
xbar[i] = mean(x)
}

xbar_mu = mean(xbar)
xbar_var = var(xbar)

cat('표본의 개수 = ', n, ', 자료 set의 개수 = ', m, '\n',
'모평균 = ', mu, ', 표본평균의 평균 = ', xbar_mu, '\n',
'모분산 = ', var, ', var / n = ', var / n, ', 표본평균의 분산 = ', xbar_var, '\n')

hist(xbar, breaks = 'fd', prob = T)
curve(dnorm(x, mu, sqrt(var / n)), add = T)