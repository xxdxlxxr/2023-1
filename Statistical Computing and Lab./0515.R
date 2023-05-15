# 예제 7.5
rm(list = ls())

library(bootstrap)

B <- 2000
n <- nrow(patch)
theta.b <- rep(0, B)

for (b in 1:B) {
  i <- sample(1:n, size = n, replace = TRUE)
  y <- patch$y[i]
  z <- patch$z[i]
  theta.b[b] <- mean(y) / mean(z)
}

hat.theta <- mean(patch$y) / mean(patch$z)

# 정규 붓스트랩 신뢰구간
s.e <- sd(theta.b)
L.n <- hat.theta - qnorm(.975) * s.e
U.n <- hat.theta + qnorm(.975) * s.e
c(L.n, U.n)

# 백분위 붓스트랩 신뢰구간
L.q <- quantile(theta.b, .025)
U.q <- quantile(theta.b, .975)
c(L.q, U.q)

# 기본 붓스트랩 신뢰구간
L.b <- 2 * hat.theta - U.q
U.b <- 2 * hat.theta - L.q
c(L.b, U.b)


# 예제 7.10
rm(list = ls())

B <- 2000
n <- nrow(law)
theta.b <- rep(0, B)

for (b in 1:B) {
  i <- sample(1:n, size = n, replace = TRUE)
  LSAT <- law$LSAT[i]
  GPA <- law$GPA[i]
  theta.b[b] <- cor(LSAT, GPA)
}

hat.theta <- cor(law$LSAT, law$GPA)

# 정규 붓스트랩 신뢰구간
s.e <- sd(theta.b)
L.n <- hat.theta - qnorm(.975) * s.e
U.n <- hat.theta + qnorm(.975) * s.e
c(L.n, U.n)

# 백분위 붓스트랩 신뢰구간
L.q <- quantile(theta.b, .025)
U.q <- quantile(theta.b, .975)
c(L.q, U.q)

# 기본 붓스트랩 신뢰구간
L.b <- 2 * hat.theta - U.q
U.b <- 2 * hat.theta - L.q
c(L.b, U.b)


# 예제 7.12
rm(list = ls())

B <- 5000
n <- nrow(patch)
hat.theta <- mean(patch$y) / mean(patch$z)
theta.b <- t.b <- rep(0, B)

for (b in 1:B) {
  i <- sample(1:n, size = n, replace = TRUE)
  y <- patch$y[i]
  z <- patch$z[i]
  theta.b[b] <- mean(y) / mean(z)
}

se <- sd(theta.b)
t.b <- (theta.b - hat.theta) / se
hist(t.b, nclass = 30)
quantile(t.b, c(.025, .975))

L <- quantile(t.b, .025)
U <- quantile(t.b, .975)

abline(v = L, col = 'red')
abline(v = U, col = 'red')

hat.theta - U * se
hat.theta - L * se