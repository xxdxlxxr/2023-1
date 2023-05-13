# 시험은 양측검정만
# 결론에 '유의수준 5%에서' & 크다 혹은 작다까지 써주기
x = c(8.3, 9.5, 9.6, 8.75, 8.4, 9.1, 8.15, 8.8)

t.test(x, mu = 8.5)
t.test(x, mu = 8.0)

T_test_1 = function(x, mu0) {
n = length(x); xbar = mean(x); se = sd(x) / sqrt(n)
lb = xbar - qt(.975, n - 1) * se
ub = xbar + qt(.975, n - 1) * se
T = (xbar - mu0) / se; T
pvalue = 2 * (1 - pt(abs(T), n - 1))
cat(' =================== 일표본 평균 검정 ===================\n
 표본 평균 = ', xbar, ' 95% 신뢰구간 ( ', lb, ub, ' )\n
 T = ', T, ' , P - value = ', pvalue, '\n')
}

mu0 = 8.5

t.test(x, mu = mu0)

T_test_1(x, mu0)
T_test_1(x, 9)
T_test_1(c(1, 3, 5, 7, 8, 9), 8)

load("C:\\Users\\xxdxlxxr\\Desktop\\knu\\2023-1\\R프로그래밍및실험\\workspace\\Rtest_0509.RData")
attach(data)

t.test(height, mu = 160)
T_test_1(height, mu = 160)
t.test(height, mu = 60)
T_test_1(height, mu = 60)


# 과제21
T_test_1 = function(x, mu0) {
n = length(x); xbar = mean(x); se = sd(x) / sqrt(n)
lb = xbar - qt(.975, n - 1) * se
ub = xbar + qt(.975, n - 1) * se
T = (xbar - mu0) / se; T
pvalue = 2 * (1 - pt(abs(T), n - 1))
cat(' =================== 일표본 평균 검정 ===================\n
 표본 평균 = ', xbar, ' 95% 신뢰구간 ( ', lb, ub, ' )\n
 T = ', T, ' , P - value = ', pvalue, '\n')
}

load("C:\\Users\\xxdxlxxr\\Desktop\\knu\\2023-1\\R프로그래밍및실험\\workspace\\Rtest_0509.RData")
attach(data)

t.test(weight, mu = 70)
T_test_1(weight, mu = 70)

t.test(bmi, mu = 20)
T_test_1(bmi, mu = 20)


save.image("C:\\Users\\xxdxlxxr\\Desktop\\knu\\2023-1\\R프로그래밍및실험\\workspace\\Rtest_0511.RData")