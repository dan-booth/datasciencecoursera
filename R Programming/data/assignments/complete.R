complete <- function(directory, id = 1:332) {
    combined <- data.frame(id = NA, nobs = NA)
    for (i in id) {
        temp <- read.table(file = sprintf("%s/%s/%03d.csv", getwd(), directory, i), header=TRUE, sep=",", stringsAsFactors = FALSE)
        # Exclude na values
        good <- complete.cases(temp)
        combined <- rbind(combined, c(id = i, nobs = nrow(temp[good,])))
    }
    # Remove first row
    combined <- combined[-1,]
    combined
}