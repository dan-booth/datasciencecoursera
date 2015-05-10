corr <- function(directory, threshold = 0) {
    corr_vector <- NA
    for (i in 1:332) {
        temp <- read.table(file = sprintf("%s/%s/%03d.csv", getwd(), directory, i), header=TRUE, sep=",", stringsAsFactors = FALSE)
        # Exclude na values
        good <- complete.cases(temp)
        complete_subset <- temp[good,]
        if (nrow(complete_subset) > threshold) {
            corr_vector <- cbind(corr_vector, cor(complete_subset$sulfate, complete_subset$nitrate))
        }
    }
    if (length(corr_vector) > 1) {
        soln <- corr_vector[-1]
    } else {
        soln <- numeric()
    }
    soln
}