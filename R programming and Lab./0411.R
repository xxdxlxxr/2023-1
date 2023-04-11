# 중간고사 문제
# 1. r기초 로그 or 팩토리얼 연산
# 2. 반복문 이용한 연산
# 3. 이산형 그래프
# 4. 연속형 그래프
# 5. 유명한 그래프


# 표준정규분포
rnorm(100, mean = 0, sd = 1)

rx = rnorm(100); mean(rx); var(rx)


# 실습1
rx1 = rnorm(10); mean(rx1); sd(rx1)
rx2 = rnorm(100); mean(rx2); sd(rx2)
rx3 = rnorm(10000); mean(rx3); sd(rx3)
rx4 = rnorm(1000000); mean(rx4); sd(rx4)


hist(rx, probability = T, main = "Normal(0, 1)"); curve(dnorm(x), add = T)


# 실습2
par(mfrow = c(2, 2))
hist(rx1, probability = T, col = 58, main = "Normal(0, 1)"); curve(dnorm(x), add = T)
hist(rx2, probability = T, col = 59, main = "Normal(0, 1)"); curve(dnorm(x), add = T)
hist(rx3, probability = T, col = 60, main = "Normal(0, 1)"); curve(dnorm(x), add = T)
hist(rx4, probability = T, col = 61, main = "Normal(0, 1)"); curve(dnorm(x), add = T)
par(mfrow = c(1, 1))


# 정규분포
rx = rnorm(100, 10, 5); mean(rx); sd(rx)


# 실습3
rx1 = rnorm(10, 5, 3); mean(rx1); sd(rx1)
rx2 = rnorm(100, 5, 3); mean(rx2); sd(rx2)
rx3 = rnorm(10000, 5, 3); mean(rx3); sd(rx3)
rx4 = rnorm(1000000, 5, 3); mean(rx4); sd(rx4)


hist(rx, probability = T, xlim = c(-10, 30), ylim = c(0, .1), main = 'Normal(10, 5^2)'); curve(dnorm(x, 10, 5), add = T)


# 실습4
par(mfrow = c(2, 2))
hist(rx1, probability = T, xlim = c(-15, 25), col = 58, main = 'Normal(5, 3^2)'); curve(dnorm(x, 5, 3), add = T)
hist(rx2, probability = T, xlim = c(-15, 25), col = 59, main = 'Normal(5, 3^2)'); curve(dnorm(x, 5, 3), add = T)
hist(rx3, probability = T, xlim = c(-15, 25), col = 60, main = 'Normal(5, 3^2)'); curve(dnorm(x, 5, 3), add = T)
hist(rx4, probability = T, xlim = c(-15, 25), col = 61, main = 'Normal(5, 3^2)'); curve(dnorm(x, 5, 3), add = T)
par(mfrow = c(1, 1))


# t분포
rt(10, 10)

rx = rt(100, 10); mean(rx); var(rx)


# 실습5
rx1 = rt(10, 5); mean(rx1); var(rx1)
rx2 = rt(100, 5); mean(rx2); var(rx2)
rx3 = rt(10000, 5); mean(rx3); var(rx3)
rx4 = rt(1000000, 5); mean(rx4); var(rx4)


hist(rx, probability = T, main = 't(10)'); curve(dt(x, 10), add = T)


# 실습6
par(mfrow = c(2, 2))
hist(rx1, probability = T, col = 58, main = 't(5)'); curve(dt(x, 5), add = T)
hist(rx2, probability = T, col = 59, main = 't(5)'); curve(dt(x, 5), add = T)
hist(rx3, probability = T, col = 60, main = 't(5)'); curve(dt(x, 5), add = T)
hist(rx4, probability = T, col = 61, main = 't(5)'); curve(dt(x, 5), add = T)
par(mfrow = c(1, 1))


# 카이제곱분포
# 실습 7
rx1 = rchisq(10, 7); mean(rx1); var(rx1)
rx2 = rchisq(100, 7); mean(rx2); var(rx2)
rx3 = rchisq(10000, 7); mean(rx3); var(rx3)
rx4 = rchisq(1000000, 7); mean(rx4); var(rx4)

par(mfrow = c(2, 2))
hist(rx1, probability = T, col = 58, main = 'chisq(7)'); curve(dchisq(x, 7), add = T)
hist(rx2, probability = T, col = 59, main = 'chisq(7)'); curve(dchisq(x, 7), add = T)
hist(rx3, probability = T, col = 60, main = 'chisq(7)'); curve(dchisq(x, 7), add = T)
hist(rx4, probability = T, col = 61, main = 'chisq(7)'); curve(dchisq(x, 7), add = T)
par(mfrow = c(1, 1))