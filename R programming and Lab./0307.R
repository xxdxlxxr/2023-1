x <- c(1:100)
y = (x - 50)^2
print(y)
plot(x, y)

data(volcano)
str(volcano)
contour(volcano, col = 'red')
filled.contour(volcano, color = terrain.colors, asp = 1)
persp(volcano, theta = 30, phi = 30, col = 'blue', expand = 0.5)