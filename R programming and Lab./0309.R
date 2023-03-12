2 + 3
2 * 3
2 - 3
2 / 3
2^3
3 - 2 * 1 + 4
2 + 3; 2 * 3; 2 - 3; 2 / 3; 2^3 # ;을 이용하여 한 줄에 여러 코드 입력 가능
(20 + 3 * 2) / 3
options(digits = 10); (20 + 3 * 2) / 3 # 소수점 자리수 옵션 설정

pi # 원주율은 소문자
PI
sqrt(100)
sin(pi)
cos(pi / 2)
tan(pi / 4)
sin(3.14)
cos(1)
asin(1) # arcsin
acos(1)
atan(1)
exp(500)
exp(1000)
log(10)
log(e) # e X
log(exp(1)) # exp(1) O
log(exp(100))
log(exp(1000))
log(10, base = 10) # base 옵션은 밑
log(100, base = 10)
log(2, base = 10)
log(1000, base = 10)
log(10, base = 3)
log(100, base = 3)
log(2, base = 3)
log(1000, base = 3)
abs(-3)
abs(3)
abs(-100)
factorial(5)
factorial(100)
factorial(200)

2^1023 # 표현 가능
2^1024 # 표현 불가능
2^1024 - 1 # 표현 불가능
2^1024 - 10000 # 표현 불가능
2^1023 + 1 # 표현 가능
2^1023 + 10000 # 표현 가능
2^1023 + 2^1022 # 표현 가능

3^100
3^1000
3^500
3^750
3^600
3^670
3^630
3^650
3^640
3^645
3^647 # 부터 표현 불가능
3^646 # 까지 표현 가능

choose(5, 2)
choose(10, 2)
choose(100, 50)
choose(1000, 500)
choose(1010, 500)
choose(1020, 500)
choose(1030, 500) # 표현 불가능
choose(1025, 500)
choose(1028, 500)
choose(1029, 500) # 까지 표현 가능

log(e) # e를 정의해야 함
log(exp(1)) # exp라는 함수를 이용해서 우리가 흔히 아는 'e'를 표현
square(3) # square라는 함수는 없음
3^2 # 제곱을 표현
squareroot(3) # squareroot라는 함수는 없음
sqrt(3) # 제곱급 표현
sqrt(-3) # 음수를 입력하면 NaN을 생성
a

x1 = 9; x1
x2 <- 18; x2
x1 + x2
x1 - x2
x1 * x2
x2 / x1
x2^x1
x = 7; x + 9
e
e <- exp(1); e
y <- e^3; y
z = x + y; z

a = 100; a
b <- 50; b
c <- a + b; c
d = a * b * c; d

ls() # 지금까지 할당된 변수들
a
g

1:20
seq(1:20)
seq(1, 20)
15:1
rev(1:15)
seq(1, 10, by = 3)
seq(1, 10, by = 0.3)
seq(from = 2, to = 12, by = 3)
rep(1, 15)
rep(1:5, 5)
rep(c(5, 3, 2), 3)
a = rep(NA, 10); a

k_score = 1:20
sum(k_score)
mean(k_score)
median(k_score)
max(k_score)
min(k_score)
range(k_score) # 최소값, 최대값을 차례로
var(k_score) # 분산
sd(k_score) # 표준편차
length(k_score) # 열의 길이

LETTERS[1:20] # 연속되는 대문자 알파벳
letters[1:20] # 연속되는 소문자 알파벳
month.name # 월
month.abb # 월을 간단하게
state.name # 미국의 50개 주
