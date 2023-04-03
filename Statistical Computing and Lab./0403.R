# 예제 4.10
# 합성곱
rm(list = ls())

n <- 5000
x1 <- rnorm(n, 0, 1)
x2 <- rnorm(n, 3, 1)
s <- x1 + x2

plot(density(s), xlim = c(-5, 10), ylim = c(0, .4), lty = 1, xlab = 'x', main = '')
lines(density(x1), lty = 3)
lines(density(x2), lty = 2)
legend(7, .4, c('X1', 'X2', 'X1 + X2'), lty = 3:1)


# 이산혼합
rm(list = ls())

n <- 5000
x1 <- rnorm(n, 0, 1)
x2 <- rnorm(n, 3, 1)

k <- sample(c(0, 1), size = n, replace = TRUE)
x <- k * x1 + (1 - k) * x2

k <- sample(c(0, 3), size = n, replace = TRUE)
x <-rnorm(n, k, 1)

plot(density(x), xlim = c(-5, 12), ylim = c(0, .4), lty = 1, xlab = 'x', main = '')
lines(density(rnorm(n, 0, 1)), lty = 3)
lines(density(rnorm(n, 3, 1)), lty = 2)
legend(7, .4, c('X1', 'X2', '이산혼합분포 추정'), lty = 3:1) # N(0, 1)과 N(3, 1)의 이산혼합분포의 pdf를 추정한 것(혼합 비율 0.5:0.5)


# 예제 4.11
# 합성곱과 이산혼합
rm(list = ls())

n <- 5000
x1 <- rgamma(n, 2, 2)
x2 <- rgamma(n, 2, 4)
s <- x1 + x2
u <- runif(n)
k <- u > 0.5
x <- k * x1 + (1 - k) * x2

par(mfcol = c(1, 2))
hist(s, col = 'gray', prob = TRUE, nclass = 30)
hist(x, col = 'gray', prob = TRUE, nclass = 30)
par(mfcol = c(1, 1))


# 예제 4.15
# 포아송-감마 연속혼합
rm(list = ls())

n <- 1000
r <- 4
beta <- 3
lambda <- rgamma(n, r, beta)

x <- rpois(n, lambda)

mix <- tabulate(x + 1) / n
negbin <- round(dnbinom(0:max(x), r, beta / (1 + beta)), 3)
se <-sqrt(negbin * (1 - negbin) / n)

round(rbind(mix, negbin, se), 3)


r.negbin <- function(n, r, p) {
  if (p == 1) numeric(n)
  else {
    beta <- p / (1 - p)
    lambda <- rgamma(n, r, beta)
    rpois(n, lambda)
  }
}

x <- r.negbin(10000, 4, .75)

round(rbind(table(x) / 10000, dnbinom(0:max(x), 4, .75)), 3)


# 예제 4.6
rm(list = ls())

n <- 10000
u <- runif(n)
e <- -log(u)
g <-function(x) exp(-x)
f.hn <- function(x) {2 * dnorm(x) * (x > 0)}

u1 <- runif(n); M <- 2
cc <- u1 < f.hn(e) / (M * g(e))
HN <- e[cc]

SS <- sample(c(-1, 1), length(HN), replace = T, prob = c(.5, .5))

Z <- HN * SS

ks.test(Z, 'pnorm')

hist(Z, prob = T, nclass= 30)

x <- seq(-4, 4, .01)
lines(x, dnorm(x), col = 'red')


r.norm <- function(n, mu, sigma) {
  u <- runif(n)
  e <- -log(u)
  g <- function(x) exp(-x)
  f.hn <- function(x) 2 * dnorm(x) * (x > 0)
  
  u1 <- runif(n); M <- 2
  cc <- u1 < f.hn(e) / (M * g(e))
  HN <- e[cc]
  
  SS <- sample(c(-1, 1), length(HN), replace = T, prob = c(.5, .5))
  Z <- HN * SS
  
  N <- mu + sigma * Z
  
  print(ks.test(N, 'pnorm', mu, sigma))
  
  hist(N, prob = T, nclass = 30)
  
  x <- seq(mu - 4 * sigma, mu + 4 * sigma, .01)
  
  lines(x, dnorm(x, mu, sigma), col = 'red')
  
  N
}

Z <- r.norm(50000, 3, 1)


r.norm <- function(n, mu = 0, sigma = 1) {
  z <- numeric(n)
  
  for (i in 1:n) {
    repeat {
      u1 <- runif(1); u2 <- runif(1); u3 <- runif(1)
      E1 <- -log(u1); E2 <- -log(u2)
      
      if (E2 > ((E1 - 1)^2 / 2)) {
        z[i] <- E1
        
        if (u3 < .5) z[i] <- -z[i]
        
        break
      }
    }
  }
  
  mu + sigma * z
}

hist(r.norm(10000), freq = F, col = 'gray')