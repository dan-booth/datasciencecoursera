# == Statistical Inference - HW 4 == #
# Q1
# Load the data
library(datasets)
x_bar <- mean(mtcars$mpg)
s <- sd(mtcars$mpg)
n <- nrow(mtcars)
# Now we want to solve
# ((sqrt(n)*(x_bar - u_0)) / s = Z_0.05
# i.e. u_0 = x_bar - Z_0.05 * s/sqrt(n)
x_bar - qnorm(0.05) * s/sqrt(n)

# Q2
# Get our subsets
m4 <- mtcars$mpg[mtcars$cyl == 4]
m6 <- mtcars$mpg[mtcars$cyl == 6]
# Calculate the p-value
t.test(m4, m6, paired = FALSE, alternative="two.sided", var.equal=FALSE)$p.value

# Q3
3.0 + c(-1,1) * qnorm(0.95) * 1.1/sqrt(100)

# Q4
pbinom(54, prob = .5, size = 100, lower.tail = FALSE)
qbinom(p = 0.05, size = 100, prob = .5, lower.tail = FALSE)
# Cannot reject since 54 not > 58

# Q5
ppois(15800 - 1, lambda = 520 * 30, lower.tail = FALSE)
qpois(p = 0.05, lambda = 520 * 30, lower.tail = FALSE)
# Cannot reject since 15800 not > 15806

# Q7 Z-Test of equivalence
# Means
m1 <- 10
m2 <- 11
# Sample size
n1 <- n2 <- 100
# Common SD
s <- 4
# Standard error
se <- s * sqrt(1 / n1 + 1 / n2)
# Test statistic
ts <- (m2 - m1) / se
# Test
2 * pnorm(-abs(ts))

# Q8
# H0: X_bar ~ N(10,0.4)
# H1: Y_bar ~ N(11,0.4)
# Reject when Y_bar >= 10 + Z_(0.95) * 0.4
pnorm(10 + qnorm(0.95) * 0.4, mean = 11, sd = 0.4, lower.tail = FALSE)

# Q9
(qnorm(.95) + qnorm(.8)) ^ 2 * .04 ^ 2 / .01^2

# Q11

# Get our subsets
m6 <- mtcars$mpg[mtcars$cyl == 6]
m8 <- mtcars$mpg[mtcars$cyl == 8]
n6 <- length(m6)
n8 <- length(m8)
s6 <- sd(m6)
s8 <- sd(m8)
# p-value of test comparing MPG for 6 and 8 cylinders
t.test(m8, m6, paired = FALSE, alternative="two.sided", var.equal=TRUE)$p.value
# Z-Test p value
mixprob <- (n8 - 1) / (n8 + n6 - 2)
s <- sqrt(mixprob * s8 ^ 2  +  (1 - mixprob) * s6 ^ 2)
z <- (mean(m8) - mean(m6)) / (s * sqrt(1 / n8 + 1 / n6))
# P-value
2 * pnorm(-abs(z))
