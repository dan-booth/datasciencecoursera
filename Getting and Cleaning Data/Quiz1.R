# == Getting and Cleaning Data - Quiz1 == #

# Q1
# Download file
# Windows
setwd("C:/Users/daniel/Documents/GitHub/datasciencecoursera/Getting and Cleaning Data/data/")
# Mac
setwd("/Users/Daniel/RStudio/datasciencecoursera/Getting and Cleaning Data/data/")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "microdata.csv")

#read.data
q1 <- read.csv("microdata.csv", header = TRUE)
# Property values $1,000,000+
# Looking at the DATA DICTIONARY (https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf), the ID
# for $1,000,000+ is 24
length(which(q1$VAL == 24))

# Q3
# Download file -- Note this downloaded a corrupt file so had to manually download
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "getdata-data-DATA.gov_NGAP.xlsx")
# Read in the data
library(xlsx)
dat <- read.xlsx("getdata-data-DATA.gov_NGAP.xlsx", sheetIndex = 1, header = TRUE, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

# Q4
# Download the XML file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", "restaurants.xml")
# Read in the data
library(XML)
baltimore <- xmlTreeParse("restaurants.xml", useInternal = TRUE)
rootNode <- xmlRoot(baltimore)
# List name of root node
xmlName(rootNode)
# Delve deeper to see the XML structure tag names
names(rootNode)
names(rootNode[[1]][[1]])
# Extract the zipcode data
zipcodes <- data.frame(zipcode = xpathSApply(rootNode, "//zipcode", xmlValue))
# View the data imported correctly
head(zipcodes)
# Number of postcodes 21231
length(which(zipcodes$zipcode == 21231))

# Q5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "Idaho.csv")
library(data.table)
DT <- fread("Idaho.csv")
# Test system time but put replicate to make it easier to compare
system.time(replicate(1000, tapply(DT$pwgtp15,DT$SEX,mean)))
system.time(replicate(1000, DT[,mean(pwgtp15),by=SEX]))
system.time(replicate(1000, mean(DT[DT$SEX==1,]$pwgtp15)))
system.time(replicate(1000, mean(DT[DT$SEX==2,]$pwgtp15)))
system.time(replicate(1000, rowMeans(DT)[DT$SEX==1]))
system.time(replicate(1000, rowMeans(DT)[DT$SEX==2]))
system.time(replicate(1000, sapply(split(DT$pwgtp15,DT$SEX),mean)))
system.time(replicate(1000, mean(DT$pwgtp15,by=DT$SEX)))
# For some reason sapply(split(DT$pwgtp15,DT$SEX),mean) is actually the right answer (even though mean(DT$pwgtp15,by=DT$SEX) is the shortest