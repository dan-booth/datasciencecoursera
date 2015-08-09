# == Statistical Inference - Quiz 3 == #

# Q1
# CI is x_bar +- t_{0.975,n-1} * sd / sqrt(n)
# 95% CI
1100 + c(-1,1) * qt(0.975,9-1)*30/sqrt(9)

# Q2
# We want x_bar + t_{0.975,n-1} * sd / sqrt(n) = 0
# Adding our given values
# So t_{0.975,8} * sd / sqrt(9) = 2
# sd = (2 * sqrt(9)) / t_{0.975,8}
(2 * sqrt(9)) / qt(0.975,8)

# Q4
# NEW: n = 10, mean = 3 , var = 0.6
# OLD: n = 10, mean = 5, var = 0.68
# We have contant variance so
# Y - X CI: mean_Y - mean_X +- t_{0.975,n_x+n_y-2} * S_p * sqrt(1/n_x + 1/n_y)
# Here Y ~ NEW, X ~ OLD
s_p <- sqrt(((10 - 1) * 0.68 + (10 - 1) * 0.6)/(10+10-2))
# 95% CI
(3-5) + c(-1,1) * qt(0.975,(10+10-2))*s_p*sqrt(1/10 + 1/10)

# Q6
# NEW: n = 100, mean = 4 , var = 0.5
# OLD: n = 100, mean = 6, var = 2
# We have unqual variances and assume Normal Dist so
# Y - X CI: mean_Y - mean_X +- Z{0.975} sqrt(var_X/n_x + var_Y/n_y)
# Here Y ~ OLD, X ~ NEW
# 95% CI
(6-4) + c(-1,1) * qnorm(0.975)*sqrt(0.5/100 + 2/100)

# Q7
# TREATED: n = 9, mean = -3, sd = 1.5
# PLACEBO: n  9, mean = 1, sd = 1.8
# Constant variance
# 90% CI
# Here Y ~ TREATED, X ~ PLACEBO
s_p <- sqrt(((9 - 1) * 1.8^2 + (9 - 1) * 1.5^2)/(9+9-2))
# 90% CI
(-3-1) + c(-1,1) * qt(0.95,(9+9-2))*s_p*sqrt(1/9 + 1/9)
