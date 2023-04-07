# 베르누이 시행
n = 1; p = .5; x = c(0:n)
y = dbinom(x, n, p); y
plot(x, y, type = 'h', xlim = c(0, n), lwd = 3, col = 'red')

rx = rbinom(100, n, p); rx
mean(rx); var(rx)


# 실습1
n = 1; p = .5; x = c(0:n)
y = dbinom(x, n, p)

p; p * (1 - p) # 참값
rx1 = rbinom(10, n, p); mean(rx1); var(rx1)
rx2 = rbinom(100, n, p); mean(rx2); var(rx2)
rx3 = rbinom(10000, n, p); mean(rx3); var(rx3)
rx4 = rbinom(1000000, n, p); mean(rx4); var(rx4)


# 실습2
plot(x, y, type = 'h', xlim = c(0, n), col = 46, lwd = 5)

par(mfrow = c(2, 2))
plot(table(rx1), type = 'h', xlim = c(0, n), col = 51, lwd = 2, main = '10개의 난수')
plot(table(rx2), type = 'h', xlim = c(0, n), col = 52, lwd = 3, main = '100개의 난수')
plot(table(rx3), type = 'h', xlim = c(0, n), col = 53, lwd = 4, main = '10000개의 난수')
plot(table(rx4), type = 'h', xlim = c(0, n), col = 54, lwd = 5, main = '1000000개의 난수')
par(mfrow = c(1, 1))


# 이항분포
n = 10; p = .3; x = c(0:n)
y = dbinom(x, n, p); y
plot(x, y, type = 'h', xlim = c(0, n), lwd = 3, col = 'red')

rx = rbinom(100, n, p)
mean(rx); var(rx)


# 실습3
n = 20; p = .7; x = c(0:n)
y = dbinom(x, n, p)

n * p; n * p * (1 - p) # 참값
rx1 = rbinom(10, n, p); mean(rx1); var(rx1)
rx2 = rbinom(100, n, p); mean(rx2); var(rx2)
rx3 = rbinom(10000, n, p); mean(rx3); var(rx3)
rx4 = rbinom(1000000, n, p); mean(rx4); var(rx4)


# 실습4
plot(x, y, type = 'h', xlim = c(0, n), col = 46, lwd = 5)

par(mfrow = c(2, 2))
plot(table(rx1), type = 'h', xlim = c(0, n), col = 51, lwd = 2, main = '10개의 난수')
plot(table(rx2), type = 'h', xlim = c(0, n), col = 52, lwd = 3, main = '100개의 난수')
plot(table(rx3), type = 'h', xlim = c(0, n), col = 53, lwd = 4, main = '10000개의 난수')
plot(table(rx4), type = 'h', xlim = c(0, n), col = 54, lwd = 5, main = '1000000개의 난수')
par(mfrow = c(1, 1))


# 포아송분포
lambda = 3; x = c(0:8)
y = dpois(x, lambda); y
plot(x, y, type = 'h', xlim = c(0, 16), lwd = 5, col = 'red')

rx = rpois(100, lambda)
mean(rx); var(rx)


# 실습5
lambda = 5; x = c(0:15)
y = dpois(x, lambda)

lambda; lambda # 참값
rx1 = rpois(10, lambda); mean(rx1); var(rx1)
rx2 = rpois(100, lambda); mean(rx2); var(rx2)
rx3 = rpois(10000, lambda); mean(rx3); var(rx3)
rx4 = rpois(1000000, lambda); mean(rx4); var(rx4)


# 실습6
plot(x, y, type = 'h', xlim = c(0, 15), col = 46, lwd = 5)

par(mfrow = c(2, 2))
plot(table(rx1), type = 'h', xlim = c(0, 15), col = 51, lwd = 2, main = '10개의 난수')
plot(table(rx2), type = 'h', xlim = c(0, 15), col = 52, lwd = 3, main = '100개의 난수')
plot(table(rx3), type = 'h', xlim = c(0, 15), col = 53, lwd = 4, main = '10000개의 난수')
plot(table(rx4), type = 'h', xlim = c(0, 15), col = 54, lwd = 5, main = '1000000개의 난수')
par(mfrow = c(1, 1))



# 실습7
p = .3; x = c(0:15)
y = dgeom(x, p)

(1 - p) / p; (1 - p) / p^2 # 참값
rx1 = rgeom(10, p); mean(rx1); var(rx1)
rx2 = rgeom(100, p); mean(rx2); var(rx2)
rx3 = rgeom(10000, p); mean(rx3); var(rx3)
rx4 = rgeom(1000000, p); mean(rx4); var(rx4)


# 실습8
plot(x, y, type = 'h', xlim = c(0, 15), col = 46, lwd = 5)

par(mfrow = c(2, 2))
plot(table(rx1), type = 'h', xlim = c(0, 15), col = 51, lwd = 2, main = '10개의 난수')
plot(table(rx2), type = 'h', xlim = c(0, 15), col = 52, lwd = 3, main = '100개의 난수')
plot(table(rx3), type = 'h', xlim = c(0, 15), col = 53, lwd = 4, main = '10000개의 난수')
plot(table(rx4), type = 'h', xlim = c(0, 15), col = 54, lwd = 5, main = '1000000개의 난수')
par(mfrow = c(1, 1))