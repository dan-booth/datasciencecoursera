# ==== Quiz 3 ==== #

# Q1
library(datasets)
data(iris)
?iris
# One way
virginica_data  <- iris$Species == "virginica"
mean(iris$Sepal.Length[virginica_data])
# Another way
tapply(iris[, "Sepal.Length"], iris[, "Species"], mean)

# Q2
apply(iris[, 1:4], 2, mean)

# Q3
library(datasets)
data(mtcars)
?mtcars
sapply(split(mtcars$mpg, mtcars$cyl), mean)

# Q4
hp_averages <- sapply(split(mtcars$hp, mtcars$cyl), mean)
hp_averages
abs(hp_averages[1] - hp_averages[3])

# Q5
debug(ls)
ls()