# 조건문
# 간단한 사용법1
x <- 2; if (x >= 0) sqrt(x) else abs(x)
x <- -3; if (x >= 0) sqrt(x) else abs(x)
x <- 100; if (x >= 0) sqrt(x) else abs(x)

# 간단한 사용법2
x = c(1, -2, -3, 4, 0)
y = rep(0, 5); y

for (i in 1:length(x)) {
if (x[i] >= 0) y[i] = 1
else y[i] = 0
}

y

# 범위 구하기
x = c(1, 12, 10, 14, 15, 6, 7, 63, 60, 55, 55, 100); x
max(x); min(x); range(x); r = max(x) - min(x); r

max = x[1]; min = x[1]
for (i in 2:length(x)) {
if (x[i] > max) max = x[i]
if (x[i] < min) min = x[i]
}

max; min; range = max - min; range

# 연습1
set.seed(123)
x = 3 * rnorm(1000) + 10 # 평균이 10이고 표준편차가 3인 정규분포를 따르는 1000개의 난수
y = rep(0, length(x))

for (i in 1:length(x)) {
if (x[i] >= 10) y[i] = 1
else y[i] = 0
}

sum(y) # 10 이상인 난수의 개수

max(x); min(x); range(x); r = max(x) - min(x); r

max = x[1]; min = x[1]
for (i in 2:length(x)) {
if (x[i] > max) max = x[i]
if (x[i] < min) min = x[i]
}

max; min; range = max - min; range

# for문에서 if break 사용
n1 <- 0; n2 <- 0; n3 <- 1

for (i in 1:100000) {
n1 <- n1 + i
n2 <- n2 + i^2
n3 <- n3 * i
if (n1 >= 500) break
}

i; n1; n2; n3

# 활용
n1 <- 0; n2 <- 1

for (i in 1:100000) {
n1 <- n1 + i^3
n2 <- n2 * i^2
if (n2 >= 10000000) break
}

i; n1; n2

# EXCEL 파일 읽기
test = read.csv("C:/Users/xxdxlxxr/Desktop/knu/2023-1/R프로그래밍및실험/test.csv", header = T); test

ls()
mean(test)
mean(eco)

attach(test)
ls()
mean(eco)
mean(height)
mean(weight)
mean(a)

# 패키지 설치
data()

BOD
attach(BOD)
mean(demand)

library(UsingR) # 패키지 설치가 되어 있지 않아서 에러 발생

if(!require(UsingR)) {
  install.packages('UsingR') # 패키지 설치
  library(UsingR)
}

yellowfin
attach(yellowfin)
mean(count)