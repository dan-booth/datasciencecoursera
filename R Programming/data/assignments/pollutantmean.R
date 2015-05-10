pollutantmean <- function(directory, pollutant, id = 1:332) {
    combined_pollutant  <- c(NA)
    for (i in id) {
        temp <- read.table(file = sprintf("%s/%s/%03d.csv", getwd(), directory, i), header=TRUE, sep=",", stringsAsFactors = FALSE)
        combined_pollutant <- rbind(combined_pollutant, temp[pollutant])
    }
    signif(colMeans(combined_pollutant, na.rm = TRUE), digits = 4)
}

