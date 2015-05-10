## ==== Assignment 3 Code ==== ##

# Set the WD
setwd("~/GitHub/datasciencecoursera/data/assignments/rprog-data-ProgAssignment3-data/")

# Read in the outcome data. Note all read in as characters.
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

# There are many columns in this data. Let's get size specs
ncol(outcome)
nrow(outcome)
# Column names
names(outcome)

# Create a simple histogram of the 30-day death rates from heart attack (column 11)

# Set column to numeric
outcome[, 11] <- as.numeric(outcome[, 11])

# Create the histogram with ggplot
require(ggplot2)
# Get name of column for aes
names(outcome[11])
ggplot(outcome, aes(x = Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)) + geom_histogram()
