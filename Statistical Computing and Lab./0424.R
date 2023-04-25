# 예제 5.10
rm(list = ls())

m <- 10000
theta.hat <- se <- numeric(5)
g <- function(x) exp(-x -log(1 + x^2)) * (x > 0) * (x < 1)

x <- runif(m)
fg <- g(x)
theta.hat[1] <- mean(fg)
se[1] <- sd(fg)

x <- rexp(m, 1)
fg <- g(x) / exp(-x)
theta.hat[2] <- mean(fg)
se[2] <- sd(fg)

x <- rcauchy(m)
i <- c(which(x > 1), which(x < 0))
x[i] <- 2
fg <- g(x) / dcauchy(x)
theta.hat[3] <- mean(fg)
se[3] <- sd(fg)

u <- runif(m)
x <- -log(1 - u * (1 - exp(-1)))
fg <- g(x) / (exp(-x) / (1 - exp(-1)))
theta.hat[4] <- mean(fg)
se[4] <- sd(fg)

u <- runif(m)
x <- tan(pi * u / 4)
fg <- g(x) / (4 / ((1 + x^2) * pi))
theta.hat[5] <- mean(fg)
se[5] <- sd(fg)

rbind(theta.hat, se)
rbind(theta.hat, se / sqrt(m))