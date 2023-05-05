# 자료입력
k_score = c(96, 80, 76, 96 ,88, 75, 78, 89, 92, 70); k_score
k_score_2 = c(67, 83, 96, 90, 85, 75, 82, 89, 92, 75); k_score_2
score = c(k_score, k_score_2); score; mean(score)

ls()
rm(bmi); ls()
rm(list = ls()); ls()

mydata <- edit(data.frame())
edit(mydata)
y
attach(mydata)
mean(y)

data = read.csv('C:/Users/xxdxlxxr/Desktop/knu/2023-1/R프로그래밍및실험/data/Rtest.csv', header = T)
head(data)
attach(data)
weight; length(weight)

mean = (mid + final) / 2; mean
bmi = (weight / height ** 2) * 10000; bmi

table(gender)
table(eco)

gender <- factor(gender, labels = c('남자', '여자'))
eco <- factor(eco, labels = c('상', '중', '하'))
table(gender)
table(eco)

barplot(table(gender), xlab = '성별', ylab = '도수')
barplot(table(eco), xlab = '경제력', ylab = '도수')

pie(table(gender), main = '성별')
pie(table(eco), main = '경제력')

stem(height)

boxplot(height, main = '키')

hist(height, prob = T, main = '우리들의 키')
lines(density(height))

mean(height)
median(height)

var(height)
sd(height)
range(height)
IQR(height)
quantile(height)
summary(height)

scale(height)
mean(scale(height))
var(scale(height))
summary(scale(height))

n = length(height)
xbar = mean(height)
se = sd(height) / sqrt(n)
lb = xbar - qt(.975, n - 1) * se
ub = xbar + qt(.975, n - 1) * se
cat(' ============ 일표본 신뢰구간 ============\n
표본평균 = ', xbar, ' 95% 신뢰구간 ( ', lb, ub, ')\n')

t.test(height)


# 연습
stem(bmi)

boxplot(bmi, main = 'BMI')

hist(bmi, prob = T, main = '우리들의 BMI')
lines(density(bmi))

mean(bmi)
median(bmi)

var(bmi)
sd(bmi)
range(bmi)
IQR(bmi)
quantile(bmi)
summary(bmi)

head(scale(bmi))
mean(scale(bmi))
var(scale(bmi))
summary(scale(bmi))

n = length(bmi)
xbar = mean(bmi)
se = sd(bmi) / sqrt(n)
lb = xbar - qt(.975, n - 1) * se
ub = xbar + qt(.975, n - 1) * se
cat(' ================== 일표본 신뢰구간 ==================\n
표본평균 = ', xbar, ' 95% 신뢰구간 ( ', lb, ub, ')\n')

t.test(bmi)