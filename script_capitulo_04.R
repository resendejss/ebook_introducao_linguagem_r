################################################################################
## CAPITULO 04 - Graficos no R
## jean resende
################################################################################
plot(iris$Sepal.Length, iris$Petal.Width)

plot(Petal.Length ~ Petal.Width,
     data = iris,
     pch = 19,
     cex = 1) 

table(mtcars$cyl)

barplot(table(mtcars$cyl))

hist(mtcars$mpg)

boxplot(Petal.Length ~ Species, data = iris)

install.packages("ggplot2")
library(ggplot2)
qplot(displ, hwy, data = mpg, color = drv)
qplot(drv, hwy, data = mpg, geom = "boxplot")
qplot(drv, hwy, data = mpg, geom = "boxplot", color = manufacturer)

g <- ggplot(mpg, aes(displ, hwy))
g + geom_point()
g + geom_point() + geom_smooth()

g + geom_point() + geom_smooth(method = "lm") + ggtitle("Meu Grafico")

g + geom_point(color = "pink", size = 4, alpha = 1/2)
