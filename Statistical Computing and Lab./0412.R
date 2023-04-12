# 예제 5.6
rm(list = ls())

g <- function(x) 1 / (1 + x^2)

plot(g, 0, 2)

m <- 10000
x <- runif(m, 0, 2)
y <- runif(m, 0, 1)
points(x, y, pch = 20)
points(x[y < g(x)], y[y < g(x)], col = 'red')

2 * sum(y < g(x)) / m


# 예제 5.8
rm(list = ls())

f <- function(u) exp(-.5) / (1 + u^2)
g <- function(u) exp(-u) / (1 + u^2)

u <- runif(10000)
B <- f(u)
A <- g(u)

cor(A, B)

a <- -cov(A, B) / var(B); a


comp_5.8 <- function(n, cstar, r) {
  T1 <- T2 <- numeric(r)
  a <- cstar
  
  for (i in 1:r) {
    u <- runif(n)
    T1[i] <- mean(g(u))
    T2[i] <- mean(g(u) + a * (f(u) - exp(-.5) * pi / 4))
  }
  
  layout(matrix(c(1, 2), 1, 2, byrow = T))
  hist(T1, col = 'gray', nclass =30)
  hist(T2, col = 'gray', xlim = c(min(T1), max(T1)), nclass = 30)
  layout(matrix(c(1, 1)))
}

comp_5.8(10000, a, 10000)