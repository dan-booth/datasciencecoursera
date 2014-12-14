# == Getting and Cleaning Data - Quiz1 == #

# Q1
# Download file
setwd("C:/Users/daniel/Documents/GitHub/datasciencecoursera/Getting and Cleaning Data/data/")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "microdata.csv")

#read.data
q1 <- read.csv("microdata.csv", header = TRUE)
# Property values $1,000,000+
# Looking at the DATA DICTIONARY (https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf), the ID
# for $1,000,000+ is 24
length(which(q1$VAL == 24))

# Q3
# Download file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "natural_gas_aquisition.xlsx")
library(xlsx)
dat <- read.xlsx("getdata-data-DATA.gov_NGAP.xlsx", sheetIndex = 1, header = TRUE, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

# Q4
library(XML)
baltimore <- xmlTreeParse("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal = TRUE)
...

# Q5
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "Idaho.csv")
DT <- fread("Idaho.csv")
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(rowMeans(DT)[DT$SEX==1])
