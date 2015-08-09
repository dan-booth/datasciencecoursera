# == Statistical Inference - HW 3 == #

# Q1
library(datasets)
# Calculate the t test and return the 95% confidence interval
t.test(mtcars$mpg)$conf.int

# Q2
# Average difference is the mean difference
# With a t_n-1 distribution and n = 9, lower CI touching zero is
# x - t_{0.975,n-1} * sd / sqrt(n) = 0
# So x_bar = t_{0.975,n-1} * sd / sqrt(n)
qt(0.975, df = 8) * 1/sqrt(9)

# Q4
# Calculate the t test and return the 95% confidence interval, constant variance, comparison 4 - 6
t.test(mtcars$mpg[mtcars$cyl == 4],mtcars$mpg[mtcars$cyl == 6],var.equal = TRUE)$conf.int

# Q6
# The sample sizes are equal, so the pooled variance is the average of the individual variances
(1.5^2+1.8^2)/2
