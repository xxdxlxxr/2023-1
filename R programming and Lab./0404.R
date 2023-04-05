# 정규분포
dnorm(0, 0, 1)
pnorm(1, 0, 1)
pnorm(1.96, 0, 1)
pnorm(2.58, 0, 1)
pnorm(2, 0, 1) - pnorm(1, 0, 1)


# 실습1
dnorm(2, 0, 1)
pnorm(2, 0, 1)
pnorm(1.645, 0, 1)
pnorm(-1.96, 0, 1)
pnorm(-1, 0, 1) - pnorm(-2, 0, 1)


x = seq(-5, 5, by = .01)
y1 = dnorm(x, 0, 1)
plot(x, y1, type = 'l', col = 'red'); abline(v = 0, h = 0)

x = seq(0, 10, by = .01)
y2 = dnorm(x, 5, 1)
plot(x, y2, type = 'l', col = 'red'); abline(v = 0, h = 0)

y3 = dnorm(x, 5, 10)
plot(x, y3, type = 'l', col = 'red'); abline(v = 0, h = 0)


# 실습2
x = seq(0, 20, by = .01)
y3 = dnorm(x, 10, 3)
plot(x, y3, type = 'l', col = 91); abline(v = 0, h = 0)


#실습3
x = seq(-5, 5, .01)
y4 = pnorm(x, 0, 1)
plot(x, y4, type = 'l', col = 'red'); abline(v = 0, h = .5)


x = seq(-10, 0, .01)
y4 = pnorm(x, -5, 1)
plot(x, y4, type = 'l', col = 55); abline(v = 0, h = .5)


x = seq(-5, 5, .01)
y1 = dnorm(x, 0, 1); y2 = dnorm(x, 0, 2); y3 = dnorm(x, 0, 3)
plot(x, y1, type = 'l', col = 'blue', xlim = c(-5, 5), ylim = c(0, .5)); abline(v = 0, h = 0)
lines(x, y2, type = 'l', col = 'purple')
lines(x, y3, type = 'l', col = 'green')


# 실습4
x = seq(-7, 13, .01)
y1 = dnorm(x, 3, 2); y2 = dnorm(x, 3, 3); y3 = dnorm(x, 3, 4)
plot(x, y1, type = 'l', col = 58, xlim = c(-7, 13), ylim = c(0, .3)); abline(v = 0, h = 0)
lines(x, y2, type = 'l', col = 59)
lines(x, y3, type = 'l', col = 60)


# t분포
dt(0, 5)
pt(0, 5)
pt(1.96, 5)
pt(2.58, 5)
pt(2, 5) - pt(1, 5)


# 실습5
dt(0, 3)
pt(0, 3)
pt(1.96, 7)
pt(2.58, 7)
pt(5, 8) - pt(3, 8)


x = seq(-5, 5, .01)
yt = dt(x, 5)
plot(x, yt, type = 'l', col = 'blue')


# 실습6
x = seq(-5, 5, .01)
yt = dt(x, 1)
plot(x, yt, type = 'l', col = 'orange')


x = seq(-5, 5, .01)
ypt = pt(x, 5)
plot(x, ypt, type = 'l', col = 'blue'); abline(v = 0, h = .5)


# 실습7
x = seq(-5, 5, .01)
ypt = pt(x, 1)
plot(x, ypt, type = 'l', col = 74); abline(v = 0, h = .5)


x = seq(-5, 5, .01)
y1 = dnorm(x, 0, 1)
plot(x, y1, type = 'l', col = 'blue')
lines(x, yt, type = 'l', col = 'red')

plot(x, yt, type = 'l', col = 'blue', xlim = c(-5, 5), ylim = c(0, .4))
lines(x, y1, type = 'l', col = 'red')

yt1 = dt(x, 1); yt2 = dt(x, 10); yt3 = dt(x, 30); yt4 = dt(x, 50)

plot(x, y1, type = 'l', col = 'blue', xlim = c(-5, 5), ylim = c(0, .5)); abline(v = 0, h = 0)
lines(x, yt1, type = 'l', col = 'red')
lines(x, yt2, type = 'l', col = 'purple')
lines(x, yt3, type = 'l', col = 'green')
lines(x, yt4, type = 'l', col = 'black')


# 실습8
x = seq(-5, 5, .01)
y1 = dnorm(x, 0, 1)
yt1 = dt(x, 3); yt2 = dt(x, 5); yt3 = dt(x, 10); yt4 = dt(x, 30)

plot(x, y1, type = 'l', col = 32, xlim = c(-5, 5), ylim = c(0, .5)); abline(v = 0, h = 0)
lines(x, yt1, type = 'l', col = 33)
lines(x, yt2, type = 'l', col = 34)
lines(x, yt3, type = 'l', col = 35)
lines(x, yt4, type = 'l', col = 36)


# 카이제곱분포
dchisq(1, 1)
pchisq(1, 1)
pchisq(2, 1) - pchisq(1, 1)


# 실습9
dchisq(2, 5)
pchisq(3, 3)
pchisq(5, 7) - pchisq(3, 7)


x = seq(0, 20, .01)
y1 = dchisq(x, 1)
plot(x, y1, type = 'l', col = 'red')

y2 = dchisq(x, 5)
y3 = dchisq(x, 10)

plot(x, y1, type = 'l', col = '2', ylim = c(0, .8))
lines(x, y2, type = 'l', col = '4')
lines(x, y3, type = 'l', col = '6')


# 실습10
x = seq(0, 20, .01)
y1 = dchisq(x, 3)
y2 = dchisq(x, 7)
y3 = dchisq(x, 15)

plot(x, y1, type = 'l', col = '3')
lines(x, y2, type = 'l', col = '6')
lines(x, y3, type = 'l', col = '8')


y2 = pchisq(x, 1)
plot(x, y2, type = 'l', col = 'red'); abline(v = 0, h = .5)


# 실습11
y2 = pchisq(x, 3)
plot(x, y2, type = 'l', col = 'green'); abline(v = 0, h = .5)