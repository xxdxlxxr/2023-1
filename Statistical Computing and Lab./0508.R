# 예제 6.12
rm(list = ls())

n <- c(10, 20, 30, 50, 100, 500)
cv <- qnorm(.975, 0, sqrt(6 / n)); cv

sk <- function(x) {
  xbar <- mean(x)
  m3 <- mean((x - xbar)^3)
  m2 <- mean((x - xbar)^2)
  m3 / m2^1.5
}

p.reject <- numeric(length(n))
m <- 10000

for (i in 1:length(n)) {
  sktests <- numeric(m)
  
  for (j in 1:m) {
    x <- rnorm(n[i])
    sktests[j] <- as.integer(abs(sk(x)) >= cv[i])
  }
  
  p.reject[i] <- mean(sktests)
}

p.reject


# exact 분포
ex_6.12 <- function(n, cv, m) {
  p.reject <- numeric(length(n))
  
  for (i in 1:length(n)) {
    sktests <- numeric(m)
    
    for (j in 1:m) {
      x <- rnorm(n[i])
      sktests[j] <- as.integer(abs(sk(x)) >= cv[i])
    }
    
    p.reject[i] <- mean(sktests)
  }
  
  p.reject
}

n <- c(10, 20, 30, 50, 100, 500)
cv <- qnorm(.975, 0, sqrt(6 * (n - 2) / ((n + 1) * (n + 3))))

ex_6.12(n, cv, 10000)


# 예제 6.13
n <- 20
m <- 1000
mu0 <- 500
sigma <- 100
mu <- c(seq(450, 650, 10))
M <- length(mu)
power <- numeric(M)

for (i in 1:M) {
  mu1 <- mu[i]
  pvalues <- replicate(m, expr = {
    x <- rnorm(n, mean = mu1, sd = sigma)
    ttest <- t.test(x, alternative = 'greater', mu = mu0)
    ttest$p.value
  })
  power[i] <- mean(pvalues <= .05)
}

plot(mu, power)
abline(v = mu0, lty = 1)
abline(h = .05, lty = 1)


# 예제 6.14
alpha <- .1
n <- 30
m <- 2500
epsilon <- c(seq(0, .15, .01), seq(.15, 1, .05))
N <- length(epsilon)
pwr <- numeric(N)

cv <- qnorm(1 - alpha / 2, 0, sqrt(6 * (n - 2) / ((n + 1) * (n + 3))))

for (j in 1:N) {
  e <- epsilon[j]
  sktests <- numeric(m)
  
  for (i in 1:m) {
    sigma <- sample(c(1, 10), replace = TRUE, size = n, prob = c(1 - e, e))
    x <- rnorm(n, 0, sigma)
    sktests[i] <- as.integer(abs(sk(x)) >= cv)
  }
  
  pwr[j] <- mean(sktests)
}

plot(epsilon, pwr, type = 'b', xlab = bquote(epsilon), ylim = c(0, 1))
abline(h = .1, lty = 3)
se <- sqrt(pwr * (1 - pwr) / m)
lines(epsilon, pwr + se, lty = 3)
lines(epsilon, pwr - se, lty = 3)


# 7장
rm(list = ls())

X <- c(21.8, 3.6, 28.3, 42., 17.9, 16.2, 35.6, 31.9, 42.3, 67.4)
X.b <- sample(X, 10, replace = T); X.b

X.b <- matrix(0, 10000, 10)

for (i in 1:1000) X.b[i, ] <- sample(X, 10, replace = T)

head(X.b)

hat.theta.b <- rep(0, 10000)

for (i in 1:10000) hat.theta.b[i] <- mean(sample(X, 10, replace = T))

hist(hat.theta.b, prob = T, main = expression(paste('Histogram of ', hat(theta)~{}^'*')),
     xlab = expression(hat(theta)~{}^'*'))