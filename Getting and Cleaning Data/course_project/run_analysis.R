# == Getting and Cleaning Data - Course Project - Tidying Recipe == #

# Download the file
setInternet2(TRUE) # Resolves some PCs' issues with https download.file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setwd("~/GitHub/datasciencecoursera/Getting and Cleaning Data")
download.file(fileURL, destfile = "data/UCI_HAR.zip")

# Unzip
unzip("data/UCI_HAR.zip",exdir = "data")

# Import the 