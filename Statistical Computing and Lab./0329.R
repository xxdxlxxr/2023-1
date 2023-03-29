# 예제 4.5
rm(list = ls())

n <- 1000
k <- 0
j <- 0
y <- numeric(n)

while (k < n) {
  u <- runif(1)
  j <- j + 1
  x <- runif(1)
  
  if (u < x * (1 - x)) {
    k <- k + 1
    y[k] <- x
  }
}

# 함수 정의
rm(list = ls())

beta2 <- function(n, M) {
  k <- 0; j <- 0
  y <- numeric(n)
  
  while (k < n) {
    u <- runif(1)
    j <- j + 1
    x <- runif(1)
    
    if (u < 6 * x * (1 - x) / M) {
      k <- k + 1
      y[k] <- x
    }
  }
  
  cat('Total # of iterations:', j, '\n')
  y
}

y <- rbeta(10000, 2, 2)
y1 <- beta2(10000, 6)
y2 <- beta2(10000, 3 / 2)

ks.test(y, y1)
ks.test(y, y2)

c(mean(y), mean(y1), mean(y2))
c(sd(y), sd(y1), sd(y2))
c(mean(y^3), mean(y1^3), mean(y2^3))
c(mean(y^4), mean(y1^4), mean(y2^4))


y <- beta2(1000, 6)

p <- seq(.1, .9, .1)
Qhat <- quantile(y, p)
Q <- qbeta(p, 2, 2)
round(rbind(Qhat, Q, se), 3)

plot(p, Q, pch = 20, col = 'blue')
points(p, Qhat, pch = 2)


rm(list = ls())

f <- function(x) (-abs(x) + 1) * (x > -1 & x < 1)

plot(f, -2, 2, ylim = c(0, 3))

x <- seq(-2, 2, .01)
lines(x, 5 * dnorm(x))

y <- rnorm(10000) # g로부터 난수 생성
u <- runif(10000) # y가 결정되었을 때 채택 여부를 결정짓는기 위해 균일 분포에서의 난수 생성
accept <- u < f(y) / (5 * dnorm(y)) # 조건이 TRUE면 해당 난수 채택

hist(y[accept], prob = T, nclass = 20) # 채택된 난수만을 이용하여 20개의 구간으로 나눈 히스토그램
lines(x, f(x)) # 관심있는 분포인 f와 비교