for (i in 1:4)
print(i) # for문을 이용하여 1부터 4까지를 차례로 출력

sum = 0
for (i in 1:100) sum = sum + i
sum # for문을 이용하여 1부터 100까지를 차례로 더함

k1 = 1; k2 = 100
sum = 0
for (i in k1:k2) sum = sum + i
sum # for문을 이용하여 k1부터 k2까지를 차례로 더함

# 연습1
sum = 0
for (i in 100:200) sum = sum + i
sum

# 연습2
answer = 1
for (i in 1:100) answer = answer * i
answer # for문을 이용하여 1부터 100까지를 차례로 곱함
factorial(100) # 위의 값과 결과가 같음

x = c(100, 120, 130, 124, 150, 167, 170, 163, 160, 155, 145, 168); x
sum(x); mean(x); var(x); sd(x)

sum1 = 0; sum2 = 0
for (i in 1:length(x)) {
sum1 = sum1 + x[i]
sum2 = sum2 + x[i]^2
}
sum1 # x의 모든 원소의 합
m = sum1 / length(x); m # 그 합을 x의 크기로 나누어서 평균을 구함
v1 = (sum2 - length(x) * m^2) / (length(x) - 1); v1 # 분산
s1 = sqrt(v1); s1 # 표준편차

# 연습3
set.seed(123)
x = 3 * rnorm(1000) + 10 # 평균이 10이고 표준편차가 3인 1000개의 난수
sum1 = 0; sum2 = 0
for (i in 1:length(x)) {
sum1 = sum1 + x[i]
sum2 = sum2 + x[i]^2
}
sum1 # x의 모든 원소의 합
m = sum1 / length(x); m # 그 합을 x의 크기로 나누어서 평균을 구함
v1 = (sum2 - length(x) * m^2) / (length(x) - 1); v1 # 분산
s1 = sqrt(v1); s1 # 표준편차

n = 0; sum = 0
while (n <= 100) {
n = n + 1
sum = sum + n
}
n; sum

# 연습4
n = 99; sum = 0
while (n <= 199) {
n = n + 1
sum = sum + n
}
n; sum

# 연습5
n = 0; answer = 1
while (n <= 99) {
n = n + 1
answer = answer * n
}
answer; factorial(100) # 같음

n = 0; sum = 0
while(sum <= 100) {
n = n + 1
sum = sum + n
}
n; sum

sum = 0
for (i in 1:14) sum = sum + i
sum # 14까지 더하면 105가 됨)

# 연습6
n = 0; sum = 0
while(sum <= 100000) {
n = n + 1
sum = sum + n
}
n; sum

sum = 0
for (i in 1:446) sum = sum + i
sum # 446까지의 합 확인
sum + i + 1 # 447까지의 합 확인

# 연습7
n = 0; sum = 0
while(sum <= 1000000) {
n = n + 1
sum = sum + n
}
n; sum

sum = 0
for (i in 1:1413) sum = sum + i
sum # 1413까지의 합 확인
sum + i + 1 # 1414까지의 합 확인

x = c(100, 120, 130, 124, 150, 167, 170, 163, 160, 155, 145, 157); x
sum(x); mean(x); var(x); sd(x)

n = 0; sum1 = 0; sum2 = 0;
while (n < length(x)) {
n = n + 1
sum1 = sum1 + x[n]
sum2 = sum2 + x[n]^2
}
sum1
m = sum1 / length(x); m
v1 = (sum2 - length(x) * m^2) / (length(x) - 1); v1
s1 = sqrt(v1)

# 연습8
set.seed(123)
x = 3 * rnorm(1000) + 10 # 평균이 10이고 표준편차가 3인 1000개의 난수
n = 0; sum1 = 0; sum2 = 0;
while (n < length(x)) {
n = n + 1
sum1 = sum1 + x[n]
sum2 = sum2 + x[n]^2
}
sum1
m = sum1 / length(x); m
v1 = (sum2 - length(x) * m^2) / (length(x) - 1); v1
s1 = sqrt(v1); s1