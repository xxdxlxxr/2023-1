# 예제 3.7
rm(list = ls())

p <- .15; n <- 1500
1 - pbinom(.16 * n, n, p) # P(p_hat >= 0.16)

mu <- p; sigma <- sqrt(p * (1 - p) / n)
mu
sigma
1 - pnorm(.16, mu, sigma) # 위의 값과 비교(CLT)

dist.hat.p <- function(n, p, r, values = F) {
  hat.p <- rep(0, r)
  
  for (i in 1:r) {
    u <- runif(n)
    hat.p[i] <- sum(u < p) / n
  }
  
  hist(hat.p, col = 'gray', prob = T,
       main = expression(paste('Empirical dist. of ', hat(p))))
  
  if (values) hat.p
}

dist.hat.p(1500, .15, 100000)

hat.p <- dist.hat.p(1500, .15, 100000, T)
mean(hat.p > .16)

hat.p <- dist.hat.p(1500, .15, 500000, T)
mean(hat.p > .16)

hat.p <- dist.hat.p(1500, .15, 1000000, T)
mean(hat.p > .16)

1 - pbinom(0.16 * n, n, p) # 위의 값들과 비교


sum(c(TRUE, TRUE, FALSE, TRUE))
mean(c(TRUE, TRUE, FALSE, TRUE))


# 예제 3.8
rm(list = ls())

n <- 1000
x <- numeric(n)
u <- runif(n)

for (i in 1:n) {
  if (u[i] < 0.03) x[i] <- 0
  else if (0.03 < u[i] & u[i] < 0.19) x[i] <- 1
  else if (0.19 < u[i] & u[i] < 0.49) x[i] <- 2
  else if (0.49 < u[i] & u[i] < 0.72) x[i] <- 3
  else if (0.72 < u[i] & u[i] < 0.89) x[i] <- 4
  else x[i] <- 5
}

head(u)


# toss some coins
sample(0:1, size = 10, replace = TRUE) # replace 옵션으로 복원추출

# choose some lottery numbers
sample(1:100, size = 6, replace = TRUE)

# sample from a multinomial distribution
x <- sample(1:3, size = 100, replace = TRUE, prob = c(.2, .3, .5)); x

sample(0:5, 1, replace = T, prob = c(.03, .16, .30, .23, .17, .11))


# 예제 3.10
rm(list = ls())

k <- 0
n <- 1000

for (i in 1:n) {
  B <- sample(c(rep(1, 8), rep(2, 5), rep(3, 7)), size = 3, replace = F)
  t <- tabulate(B)
  
  if (t[1] == 2 & t[2] == 1) k <- k + 1
}

p <- k / n; p


B <- sample(c(rep(1, 8), rep(2, 5), rep(3, 7)), size = 3, replace = F); B
tabulate(B)
B <- sample(c(rep(1, 8), rep(2, 5), rep(3, 7)), size = 3, replace = F); B
tabulate(B)