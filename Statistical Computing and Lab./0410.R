rm(list = ls())

g <- function(x) exp(-x)

int.g <- function(m, r) {
  hat.theta <- numeric(r)
  
  for (i in 1:r) {
    x <- runif(m)
    hat.theta[i] <- mean(g(x))
  }
  
  hist(hat.theta, col = 'gray')
  cat('estimated s.e. : ', sd(hat.theta), '\n')
}

int.g(10000, 10000)