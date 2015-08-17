# == Getting and Cleaning Data - Quiz 4 == #

# = Q1 = #
# Download the file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# Windows
setwd("~/GitHub/datasciencecoursera/Getting and Cleaning Data")
# Mac
setwd("/Users/Daniel/RStudio/datasciencecoursera/Getting and Cleaning Data/")

# Save
setInternet2(TRUE) # This is supposed to resolve the https download.file
# issue, but I can't seem to install the utils package
download.file(url = fileURL, destfile = "data/q4_housing_survey.csv")

# Read in the data
housing <- read.table("data/q4_housing_survey.csv", sep = ",", header = TRUE)
str(housing)

# String split
strsplit(x = names(housing), split = "wgtp")[123]

# = Q2 = #

# Download the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "data/q4_gdp.csv")

# Read in the data
gdp <- read.table("data/q4_gdp.csv", sep = ",", header = TRUE)
str(gdp)
head(gdp)
# There is an issue with the read.table import around Cameroon it doesn't pick up new lines so try read.csv
gdp <- read.csv("data/q4_gdp.csv", header = TRUE)
# Inspect the data
gdp
# We see we only need rows 5:194
# Cleaning
# Only take the neccessary rows and columns
gdp <- gdp[5:194,c(1:2,4:5)]
# name the column
names(gdp) <- c("COUNTRY_ISO3","RANKING","COUNTRY_DISPLAY","GDP_MILL_USD")

# Average
# use gsub to replace the multiple ","
mean(as.numeric(gsub(pattern = ",", replacement = "", x = gdp$GDP_MILL_USD)))

# = Q3 = #
# Count the number of countries whose name begins with "United"
length(grep("^United", gdp$COUNTRY_DISPLAY))

# = Q4 = #

# Download and read in the educational data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "data/q4_education.csv")
education <- read.csv("data/q4_education.csv", header = TRUE)
head(education)

# Match the data
matches <- merge(gdp, education, by.x = "COUNTRY_ISO3", by.y = "CountryCode", all = FALSE)

# Find the fiscal year in June
# Fiscal year details stored in the Special.Notes column
# For example
education$Special.Notes[3]
# So
length(grep("Fiscal year end: June", matches$Special.Notes))

# = Q5 = #
# Download data on Amazon's stock price and get the times the data was sampled
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

# Inspect
str(sampleTimes)

# Values collected in 2012
length(which(format(sampleTimes,"%Y") == 2012))
# Values collected on Mondays in 2012
library(lubridate)
length(which((format(sampleTimes,"%Y") == 2012) & (wday(sampleTimes) == 2)))