# 예제 6.1
rm(list = ls())

m <- 10000

x1 <- rnorm(m); x2 <- rnorm(m)
g <- abs(x1 - x2)
layout(t(c(1, 2)))
hist(g, col = 'gray')
hist(g, col = 'gray', prob = T)
layout(t(c(1, 1)))

mean(g)
sum((g - mean(g))^2) / m


# 예제 6.2
rm(list = ls())

ex_6.2 <- function(n, m) {
  tmean <- numeric(m)
  
  for (i in 1:m) {
    x <- sort(rnorm(n))
    tmean[i] <- mean(x[-c(1, n)])
  }
  
  layout(t(c(1, 2)))  
  hist(tmean, col = 'gray')
  hist(g <- tmean^2, col = 'gray', main = 'Empirical dist. of tmean^2', prob = T)
  layout(t(c(1, 1)))
  cat('hat.mse =', mean(g), '\n')
  cat('hat.se =', sqrt(sum((g - mean(g))^2) / m), '\n')
}

ex_6.2(20, 10000)


# 예제 6.3
rm(list = ls())

trimmed.mse <- function(n, m, k, p) {
  tmean <- numeric(m)
  
  for (i in 1:m) {
    sigma <- sample(c(1, 10), size = n, replace = T, prob = c(p, 1 - p))
    x <- sort(rnorm(n, 0, sigma))
    tmean[i] <- mean(x[(k + 1):(n - k)])
  }
  
  g <- tmean^2
  hat.mse <- mean(g)
  hat.se <- sqrt(sum((g - mean(g))^2) / m)
  
  n * hat.mse
}

table <- matrix(0,
                nrow = 10,
                ncol = 3,
                dimnames = list(0:9, c('p = 1', 'p = 0.95', 'p = 0.90')))

for (i in 0:9) for (j in 1:3) table[i + 1, j] <- trimmed.mse(20, 10000, i, 1.05 - j * .05); table