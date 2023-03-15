rm(list = ls())

# 뷔퐁의 바늘실험(a, θ를 하나씩 비교)
Buffon.prob1 <- function(n, l, d) {
  if (l > d) stop('l is greater than d')
  
  K <- 0
  
  for (i in 1:n) if(runif(1, 0, d / 2) < 0.5 * l * sin(runif(1, 0, pi))) K <- K + 1
  
  cat('True prob. =', 2 * l / pi / d, '\n')
  cat('Estimated prob. via simulation =', K / n, '\n')
}

Buffon.prob1(100000, 3, 5)

# 뷔퐁의 바늘실험(a, θ를 n개 생성 후 한꺼번에 비교)
Buffon.prob2 <- function(n, l, d) {
  if (l > d) stop('l is greater than d')
  
  K <- sum(runif(n, 0, d / 2) < 0.5 * l * sin(runif(n, 0, pi)))
  
  cat('True prob. =', 2 * l / pi / d, '\n')
  cat('Estimated prob. via simulation =', K / n, '\n')
}

Buffon.prob2(100000, 3, 5)

# 두 함수의 실행시간 비교
system.time(Buffon.prob1(100000, 3, 5))
system.time(Buffon.prob2(100000, 3, 5))

# π의 분포
Buffon.prob2 <- function(n, l, d) {
  if (l > d) stop('l is greater than d')
  
  K <- sum(runif(n, 0, d / 2) < 0.5 * l * sin(runif(n, 0, pi)))
  K / n
  # cat('True prob. =', 2 * l / pi / d, '\n')
  # cat('Estimated prob. via simulation =', K / n, '\n')
}

dist.hat.pi <- function(n, l, d, r) {
  hat.pi <- rep(0, r)
  
  for (i in 1:r) hat.pi[i] <- 2 * l / Buffon.prob2(n, l, d) / d
  
  layout(c(1, 2))
  hist(hat.pi, col = 'gray')
  qqnorm(hat.pi); qqline(hat.pi)
  cat('hat.se :', sd(hat.pi))
}

dist.hat.pi(100000, 3, 5, 1000)