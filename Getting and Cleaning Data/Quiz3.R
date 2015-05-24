# == Getting and Cleaning Data - Quiz 3 == #

# = Q1 = #
# Download the file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
setwd("~/GitHub/datasciencecoursera/Getting and Cleaning Data")
download.file(fileURL, destfile = "data/quiz3_Idaho.csv")
# Read in the data
acs <- read.table("data/quiz3_Idaho.csv", header = TRUE, sep = ",")
head(acs)
# Create a logical vector that identifies households on greater than 10 acres
# who sold more than $10,000 worth agriculture products
agricultureLogical <- (acs$ACR == 3 & acs$AGS == 6)
# Find the first 3 rows where the logical vector is TRUE
head(which(agricultureLogical), n = 3)

# = Q2 = #
# Load the jpeg package
library(jpeg)
# Learn about the package to see how to read in an image
??jpeg
# Download the image
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileURL, destfile = "data/jeff.jpg")
# Read in the image
jeff_image <- readJPEG("data/jeff.jpg", native = TRUE)
# quantiles
quantile(jeff_image, probs = c(0.3, 0.8))

# = Q3 = #
# Download and import the GDP file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, destfile = "data/gdp.csv")
gdp <- read.table("data/gdp_TO_LOAD.csv", header = TRUE, sep = ",", quote = "\"")
head(gdp)
tail(gdp)
# Download the and import the Education file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL, destfile = "data/fedstats.csv")
fedstats <- read.table("data/fedstats_TO_LOAD.csv", header = TRUE, sep = ",", quote = "\"")
head(fedstats)
tail(fedstats)
# Match the data
# Check names
names(gdp)
names(fedstats)
q3 <- merge(gdp, fedstats, by.x = "COUNTRY", by.y = "CountryCode", all = FALSE)
head(q3)
# Check number of matches of Rankings
nrow(q3[which(is.na(q3$Ranking) == FALSE),])
# 13th Descending
library(plyr)
arrange(q3, desc(Ranking))[13,"Short.Name"]

# = Q4 = #
library(dplyr)
# One way
aggregate(Ranking ~ Income.Group, data = q3, FUN = mean)
# Alternative way
q4 <- group_by(q3, Income.Group)
summarise(q4, Average.GDP.Ranking = mean(Ranking, na.rm = TRUE))
# = Q5 = #
# Add in the quantile classification
q5 <- q3 %>% arrange(Ranking) %>% select(Ranking, Income.Group)
nrow(q5[which(q5$Ranking <= 38 & q5$Income.Group == "Lower middle income"),])
