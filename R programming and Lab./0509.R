# 범주형자료의 이원분할표
x = rbind(c(54, 3), c(7, 12))
rownames(x) = c('아이착용', '아이미착용')
colnames(x) = c('부모착용', '부모미착용')

margin.table(x, 1)
margin.table(x, 2)

addmargins(x)
prop.table(x)

par(mfrow = c(1, 2))
barplot(x, main = '벨트착용유무', legend.text = T)
barplot(x, main = '벨트착용유무', legend.text = T, beside = T)
par(mfrow = c(1, 1))

load("C:\\Users\\xxdxlxxr\\Desktop\\knu\\2023-1\\R프로그래밍및실험\\workspace\\Rtest.RData")

attach(data)
x = table(eco, gender)

addmargins(x)
prop.table(x)

par(mfrow = c(1, 2))
barplot(x, main = '성별 경제력', legend.text = T)
barplot(x, main = '성별 경제력', legend.text = T, beside = T)
par(mfrow = c(1, 1))


# 상관계수(선형적인 관계만 나타냄)
machine = c(68, 82, 94, 106, 92, 80, 76, 74, 110, 93, 86, 65, 74, 84, 100)
expert = c(72, 84, 89, 100, 97, 88, 84, 70, 103, 84, 86, 63, 69, 87, 93)

plot(machine, expert)

cor(machine, expert)
cor(machine, expert, method = 'spearman')
cor.test(machine, expert)

r1 = cov(machine, expert) / (sd(machine) * sd(expert)); r1

x = machine; y = expert
xbar = mean(x); ybar = mean(y)
sum1 = 0; sum2 = 0; sum3 = 0

for (i in 1:length(x)) {
sum1 = sum1 + (x[i] - xbar)^2
sum2 = sum2 + (y[i] - ybar)^2
sum3 = sum3 + (x[i] - xbar) * (y[i] - ybar)
}

r2 = sum3 / sqrt(sum1 * sum2); r2

plot(height, weight)
cor(height, weight)
r = cov(height, weight) / (sd(height) * sd(weight)); r

cor(height, weight, method = 'spearman')
cor.test(height, weight)

plot(mid, final)
cor(mid, final)
cor(mid, final, method = 'spearman')
cor.test(mid, final)


# 과제1
x = rbind(c(190, 206), c(110, 464))
rownames(x) = c('주름있음', '주름없음')
colnames(x) = c('흡연', '비흡연')

margin.table(x, 1)
margin.table(x, 2)

addmargins(x)
prop.table(x)

par(mfrow = c(1, 2))
barplot(x, legend.text = T)
barplot(x, legend.text = T, beside = T)
par(mfrow = c(1, 1))


# 과제2
load("C:\\Users\\xxdxlxxr\\Desktop\\knu\\2023-1\\R프로그래밍및실험\\workspace\\Rtest.RData")

attach(data)
x = table(eco, gender)

addmargins(x)
prop.table(x)

par(mfrow = c(1, 2))
barplot(x, main = '성별 경제력', legend.text = T)
barplot(x, main = '성별 경제력', legend.text = T, beside = T)
par(mfrow = c(1, 1))


# 과제3
plot(height, mean)

cor(height, mean)
cor(height, mean, method = 'spearman')
cor.test(height, mean)

r1 = cov(height, mean) / (sd(height) * sd(mean)); r1

x = height; y = mean
xbar = mean(x); ybar = mean(y)
sum1 = 0; sum2 = 0; sum3 = 0

for (i in 1:length(x)) {
sum1 = sum1 + (x[i] - xbar)^2
sum2 = sum2 + (y[i] - ybar)^2
sum3 = sum3 + (x[i] - xbar) * (y[i] - ybar)
}

r2 = sum3 / sqrt(sum1 * sum2); r2


save.image("C:\\Users\\xxdxlxxr\\Desktop\\knu\\2023-1\\R프로그래밍및실험\\workspace\\Rtest_0509.RData")