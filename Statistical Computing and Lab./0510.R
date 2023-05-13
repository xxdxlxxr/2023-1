# 7장
rm(list = ls())

X <- c(21.8, 3.6, 28.3, 42., 17.9, 16.2, 35.6, 31.9, 42.3, 67.4)
X.b <- sample(X, 10, replace = T); X.b

X.b <- matrix(0, 10000, 10)

for (i in 1:1000) X.b[i, ] <- sample(X, 10, replace = T)

head(X.b)

hat.theta.b <- rep(0, 10000)

for (i in 1:10000) hat.theta.b[i] <- mean(sample(X, 10, replace = T))

hist(hat.theta.b, prob = T, main = expression(paste('Histogram of ', hat(theta)~{}^'*')),
     xlab = expression(hat(theta)~{}^'*'))

sd(hat.theta.b)
sd(X) / sqrt(10)
20 / sqrt(10)

mean(hat.theta.b) - mean(X)


# 예제 7.2
rm(list = ls())

library(bootstrap)

B <- 200
n <- nrow(law)
R <- numeric(B)

for (b in 1:B) {
  i <- sample(1:n, size = n, replace = TRUE)
  LSAT <- law$LSAT[i]
  GPA <- law$GPA[i]
  R[b] <- cor(LSAT, GPA)
}

hist(R, prob = TRUE, col = 'gray')

print(se.R <- sd(R))


# 예제 7.4
rm(list = ls())

theta.hat <- cor(law$LSAT, law$GPA)
B <- 2000
n <- nrow(law)
theta.b <- numeric(B)

for (b in 1:B) {
  i <- sample(1:n, size = n, replace = TRUE)
  LSAT <- law$LSAT[i]
  GPA <- law$GPA[i]
  theta.b[b] <- cor(LSAT, GPA)
}

mean(theta.b) - theta.hat


# 예제 7.5
rm(list = ls())

n <- nrow(patch)
B <- 2000
theta.b <- numeric(B)
theta.hat <- mean(patch$y) / mean(patch$z)

for (b in 1:B) {
  i <- sample(1:n, size = n, replace = TRUE)
  y <- patch$y[i]
  z <- patch$z[i]
  theta.b[b] <- mean(y) / mean(z)
}

bias <- mean(theta.b) - theta.hat
se <- sd(theta.b)

print(list(est = theta.hat, bias = bias, se = se, cv = bias / se))