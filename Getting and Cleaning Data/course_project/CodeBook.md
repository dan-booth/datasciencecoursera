# tidy_data.txt - Code Book

This code book document describes the variables and the data in the tidy_data.txt file.

## The variables

The variables in the data set are as follows:

1. _activity_ - The activity the subject was performing whilst wearing the smart phone
2. _subject_ - The unique identifier of each of the subjects
3. to 68. _mean_of_Y_ - The mean of the _Y_ column from the original data set (_mean_of_tBodyAcc-mean()-X_ to _mean_of_fBodyBodyGyroJerkMag-std()_)

## The data

This data set has been created using the _run_analysis.R_ script. This script has taken the raw Samsung Galaxy S accelerometer data, merged the test and training data, and calculated the mean of all the columns in the original data set that were mean or standard deviation measurements--aggregated by activity and subject.

Further details about the cleaning procedure can be found by reading _run_analysis.R_.