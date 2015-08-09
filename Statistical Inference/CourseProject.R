# == Statistical Inference - Course Project ==


hist(rexp(1000,0.2))

# Distributions of the averages
avgs = NULL
for (i in 1 : 1000) avgs = c(avgs, mean(rexp(40,0.2)))
hist(avgs)