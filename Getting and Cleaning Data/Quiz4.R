# == Getting and Cleaning Data - Quiz 4 == #

# = Q1 = #
# Download the file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# Windows
setwd("~/GitHub/datasciencecoursera/Getting and Cleaning Data")
# Mac
setwd("/Users/Daniel/RStudio/datasciencecoursera/Getting and Cleaning Data/")

# Save
# setInternet2(TRUE) -- This is supposed to resolve the https download.file
# issue, but I can't seem to install the utils package
download.file(url = fileURL, destfile = "data/q4_housing_survey.csv")

# Read in the data
housing <- read.table("data/q4_housing_survey.csv", sep = ",", header = TRUE)
str(housing)

# String split
strsplit(x = names(housing), split = "wgtp")[123]

# = Q2 = #

# Download the file
download.file