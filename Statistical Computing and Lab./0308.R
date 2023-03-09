# 카이제곱 검정
chi2.gof <- function(U, k) {
  n <- (1:k) / k
  X <- rep(0, k)
  X[1] <- length(U[U <= n[1]])
  
  for (i in 2:k) {
    X[i] <- length(U[U > n[i - 1] & U <= n[i]])
  }
  
  n <- length(U)
  E <- n / k
  chisq <- sum((X - E)^2 / E)
  
  cat('P-value:', 1 - pchisq(chisq, k - 1))
}

U <- runif(1000)
chi2.gof(U, 10)

X <- rchisq(1000, 3)
X <- X / max(X)
chi2.gof(X, 10)

# 콜모고로프-스미르노프 검정
ks.test(U, 'punif')

# 독립성 검정: Run 검정
if(!require(randtests)) {
  install.packages('randtests')
  library(randtests)
}

runs.test(U)

# 예제 3.3
k <- 0
n <- 1000

for (i in 1:n) {
  u <- runif(10)
  C <- u > 1 / 2
  
  for (j in 2:9) {
    if (C[j - 1] == C[j] & C[j] == C[j + 1]) {
      k <- k + 1
      break
    }
  }
}

k / n

# 예제 3.3
sim.Q1 <- function(n, r) {
  k <- 0
  
  for (i in 1:r) {
    u <- runif(n)
    C <- u > 1 / 2
    
    for (j in 2:(n - 1)) {
      if (C[j - 1] == C[j] & C[j] == C[j + 1]) {
        k <- k + 1
        break
      }
    }
  }
  
  k / r
}

sim.Q1(10, 1000)