# == Getting and Cleaning Data - Course Project - Tidying Recipe == #

# = First download the zip file = #
# If using windows
setInternet2(TRUE) # Resolves some Windows PCs' issues with https download.file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setwd("~/GitHub/datasciencecoursera/Getting and Cleaning Data/course_project/")
download.file(fileURL, destfile = "data_in/UCI_HAR.zip")
# If using Mac
# Have to take off the https for mac
fileURL_mac <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
setwd("~/RStudio/datasciencecoursera/Getting and Cleaning Data/course_project/")
download.file(fileURL_mac, destfile = "data_in/UCI_HAR.zip")
# Now unzip
unzip("data_in/UCI_HAR.zip",exdir = "data_in")
# remove the zip file to free space
file.remove("data_in/UCI_HAR.zip")

# = Import the the training and test data sets = #
# Prepare the column names for these data sets
features <- read.table("data_in/UCI HAR Dataset/features.txt")
# Import Test - X
test <- read.table("data_in/UCI HAR Dataset/test/X_test.txt")
# Set the names
names(test) <- features$V2
# We only require the measurements on the mean and standard deviation for each measurement
# These will be the columns with names
features[grep("mean\\(\\)|std\\(\\)",features$V2),]
# So only keep the required columns
test <- test[,features[grep("mean\\(\\)|std\\(\\)",features$V2),]$V1]
# Now to prepare activity
# Import the activity labels
activity_labels <- read.table("data_in/UCI HAR Dataset/activity_labels.txt")
# Import Test - Y (Activity)
test_activity <- read.table("data_in/UCI HAR Dataset/test/Y_test.txt")
# Add a unique ID for sorting purposes
test_activity$UID <- 1:2947
# Merge to match on activity labels
test_activity <- merge(test_activity, activity_labels, by = "V1", all = FALSE)
# Arrange to orginal sorting
library(dplyr)
test_activity <- arrange(test_activity, UID)
# Add the activity labels to the test data set
test$activity <- test_activity$V2
# Import and add in Test - Subject
test$subject <- as.factor(unlist(read.table("data_in/UCI HAR Dataset/test/subject_test.txt")))

# Import Train - X
train <- read.table("data_in/UCI HAR Dataset/train/X_train.txt")
# Set the names
names(train) <- features$V2
# Again only keep the required columns
train <- train[,features[grep("mean\\(\\)|std\\(\\)",features$V2),]$V1]
# Import Train - Y (Activity)
train_activity <- read.table("data_in/UCI HAR Dataset/train/Y_train.txt")
# Add a unique ID for sorting purposes
train_activity$UID <- 1:7352
# Merge to match on activity labels
train_activity <- merge(train_activity, activity_labels, by = "V1", all = FALSE)
# Arrange to orginal sorting
train_activity <- arrange(train_activity, UID)
# Add the activity labels to the train data set
train$activity <- train_activity$V2
# Import and add in Train - Subject
train$subject <- as.factor(unlist(read.table("data_in/UCI HAR Dataset/train/subject_train.txt")))

# Remove data objects no longer needed
rm(activity_labels)
rm(features)
rm(test_activity)
rm(train_activity)

# = Merge the two data sets = #
full_set <- bind_rows(test, train)
# Change subject back to factor
full_set$subject <- as.factor(full_set$subject)

# = Create the tidy data set with the average of each
# variable for each activity and each subject = #
tidy_set <- aggregate(full_set[,1:66], by = list(full_set$activity, full_set$subject), mean)
# Rename the colums
names(tidy_set)[1:2] <- c("activity", "subject")
names(tidy_set)[-1:-2] <- paste0("mean_of_",names(tidy_set)[-1:-2])

# remove data objects no longer needed
rm(test)
rm(train)
rm(full_set)

# Export our tidy data
write.table(tidy_set, "data_in/tidy_data.txt", row.names = FALSE)
