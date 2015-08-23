# == Getting and Cleaning Data - Course Project - Tidying Recipe == #

# Download the zip file
setInternet2(TRUE) # Resolves some Windows PCs' issues with https download.file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Have to take off the https for mac
fileURL_mac <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setwd("~/GitHub/datasciencecoursera/Getting and Cleaning Data") # Windows
setwd("~/RStudio/datasciencecoursera/Getting and Cleaning Data/course_project/") # Mac
download.file(fileURL_mac, destfile = "data_in/UCI_HAR.zip")

# Unzip
unzip("data/UCI_HAR.zip",exdir = "data")

# Import the 