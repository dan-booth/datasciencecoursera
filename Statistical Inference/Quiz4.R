# == Statistical Inference - Quiz 4 == #
# Q1
# Create the data frame
baseline <- c(140,138,150,148,135)
week2 <- c(132,135,151,146,130)
pbplm <- as.data.frame(cbind(baseline,week2))
# Two-sample paired T-test
t.test(pbplm$baseline,pbplm$week2, paired = TRUE)

# Q2
1100 + c(-1,1) * qt(0.975,8) * 30/sqrt(9)

# Q3

# Q7
alpha = 0.05
z = qnorm(1-alpha)
mu0 = 0
mua = 0.01
sigma = 0.04
n = 100
pnorm(mu0 + z * sigma/sqrt(n), mean = mu0, sd = sigma/sqrt(n), lower.tail = FALSE)
pnorm(mu0 + z * sigma/sqrt(n), mean = mua, sd = sigma/sqrt(n), lower.tail = FALSE)
