# 예제 7.13
rm(list = ls())

boottesttwo <- function(x, y, b) {
  n1 <- length(x)
  n2 <- length(y)
  v <- mean(y) - mean(x)
  
  z<-c(x, y)
  counter <- 0
  teststatall <- rep(0, b)
  
  for (i in 1:b) {
    xstar <- sample(z, n1, replace = T)
    ystar <- sample(z, n2, replace = T)
    vstar <- mean(ystar) - mean(xstar)
    
    if (vstar >= v) counter <- counter + 1
    
    teststatall[i] <- vstar
  }
  
  pvalue <- counter / b
  hist(teststatall, col = 'gray', nclass = 1 + 3.3 * log(b))
  abline(v = v, col = 'red')
  list(origtest = v, pvalue = pvalue, teststatall = teststatall)
}

x <- c(94.2, 111.3, 90.0, 99.7, 116.8, 92.2, 166.0, 95.7,
       109.3, 106.0, 111.7, 111.9, 111.6, 146.4, 103.9)
y <- c(125.5, 107.1, 67.9, 98.2, 128.6, 123.5, 116.5, 143.2,
       120.3, 118.6, 105.0, 111.8, 129.3, 130.8, 139.8)

boottesttwo(x, y, b = 3000)[-3]
t.test(x, y, alt = 'less', var.equal = TRUE)

boottesttwo(x, y, b = 3000)[2]
boottesttwo(x, y + 5, b = 3000)[2]
boottesttwo(x, y + 10, b = 3000)[2]
boottesttwo(x, y + 20, b = 3000)[2]
boottesttwo(x, y - 20, b = 3000)[2]
boottesttwo(x, y - 10, b = 3000)[2]


# 예제 7.14
rm(list = ls())

boottestone <- function(x, theta0, b) {
  n <- length(x)
  xbar <- mean(x)
  
  z <- x - mean(x) + theta0
  counter <- 0
  teststatall <- rep(0, b)
  
  for (i in 1:b) {
    xstar <- sample(z, n, replace = T)
    vstar <- mean(xstar)
    
    if (vstar >= xbar) counter <- counter + 1
    
    teststatall[i] <- vstar
  }
  
  pvalue <- counter / b
  hist(teststatall, col = 'gray', nclass = 1 + 3.3 * log(b))
  abline(v = xbar, col = 'red')
  list(origtest = xbar, pvalue = pvalue, teststatall = teststatall)
}

x <- c(119.7, 104.1, 92.8, 85.4, 108.6, 93.4, 67.1, 88.4, 101.0,
       97.2, 95.4, 77.2, 100.0, 114.2, 150.3, 102.3, 105.8, 107.5, 0.9, 94.1)

boottestone(x, theta0 = 90, b = 3000)[-3]
t.test(x, alternative = 'greater', mu = 90)


# 예제 7.15
rm(list = ls())

if(!require(DAAG)) {
  install.packages('DAAG')
  library(DAAG)
}

attach(ironslag)
n <- length(magnetic)
e1 <- e2 <- e3 <- e4 <- numeric(n)

for (k in 1:n) {
  y <- magnetic[-k]; x <- chemical[-k]
  y.k <- magnetic[k]; x.k <- chemical[k]
  
  e1[k] <- y.k - sum(lm(y ~ x)$coef * c(1, x.k))
  e2[k] <- y.k - sum(lm(y ~ x + I(x^2))$coef * c(1, x.k, x.k^2))
  e3[k] <- y.k - exp(sum(lm(log(y) ~ x)$coef * c(1, x.k)))
  e4[k] <- y.k - exp(sum(lm(log(y) ~ log(x))$coef * c(1, log(x.k))))
}

apply(cbind(e1^2, e2^2, e3^2, e4^2), 2, mean)

L2 <- lm(magnetic ~ chemical + I(chemical^2)); L2

par(mfrow = c(1, 2))
plot(L2$fit, L2$res); abline(0, 0)
qqnorm(L2$res); qqline(L2$res)
par(mfrow = c(1, 1))