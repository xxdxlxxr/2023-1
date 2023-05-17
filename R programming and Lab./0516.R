# 일표본비율
prop.test(x = 110, n = 150, p = .85)

# 과제22
Z_prop_1 = function(x, n, p0) {
phat = x / n; se = sqrt(phat * (1 - phat) / n)
lb = phat - qnorm(.975) * se
ub = phat + qnorm(.975) * se
se = sqrt(p0 * (1 - p0) / n)
Z = (phat - p0) / se
pvalue = 2 * (1 - pnorm(abs(Z)))
cat(' ====================== 일표본 비율 검정 ======================\n',
' 표본비율 = ', phat, ' 95% 신뢰구간 ( ', lb, ub, ' )\n',
' Z = ', Z, ' P - value = ', pvalue, '\n')
}

prop.test(x = 110, n = 150, p = .85)
Z_prop_1(x = 110, n = 150, p = .85)

load("C:\\Users\\xxdxlxxr\\Desktop\\knu\\2023-1\\R프로그래밍및실험\\workspace\\Rtest_0511.RData")
attach(data)

table(gender)
prop.test(x = 33, length(gender), p = .5)
Z_prop_1(x = 33, length(gender), p = .5)


save.image("C:\\Users\\xxdxlxxr\\Desktop\\knu\\2023-1\\R프로그래밍및실험\\workspace\\Rtest_0516.RData")