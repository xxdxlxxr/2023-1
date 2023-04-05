# 예제 5.1
rm(list = ls())

var(exp(-runif(10000)))
-1.5 * exp(-2) + 2 * exp(-1) - 0.5


n <- 10000
x <- runif(n)
theta.hat <- mean(exp(-x))

theta.hat # 추정치
1 - exp(-1) # 추정대상

sqrt(var(exp(-x))) / sqrt(n) # sum(e^(-Xi)) / n 의 표준오차의 추정치
sqrt(-1.5 * exp(-2) + 2 * exp(-1) - 0.5) / sqrt(n) # sum(e^(-Xi)) / n 의 표준오차