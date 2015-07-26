# == Getting and Cleaning Data - Quiz 2 == #

# = Q1 = #
# Load the httr library
library(httr)

# Find OAuth settings for GitHub
oauth_endpoints("github")

# Define your GitHub application using oauth_app(application, key, secret)
myapp <- oauth_app("github", "enter_client_id_here", "enter_secret_key_here")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Now use the GitHub API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Store all the information about the repos
repos <- content(req)

# Loop through to get the names of each repo
for (i in 1:30) {
    print(sprintf("List ID: %i Repo Name: %s",i, repos[[i]]$name))
}

# Data sharing is repo 6, so get the created date
repos[[6]]$created_at

# = Q2 = #
# Download the file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# Windows
setwd("~/GitHub/datasciencecoursera/Getting and Cleaning Data")
# Mac
setwd("/Users/Daniel/RStudio/datasciencecoursera/Getting and Cleaning Data/")
download.file(fileURL, destfile = "data/q2.csv")
# Read in data
acs <- read.table("data/q2.csv", header = TRUE, sep = ",")
head(acs)
# Test the correct response
library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")

# = Q3 = #
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")

# = Q4 = #

# pull down HTML
connection = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(connection)
close(connection)
htmlCode

# Count characters in each line
for (i in c(10, 20, 30, 100)) {
    print(nchar(htmlCode[i]))
}

# = Q5 = #

# Download the file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
setwd("~/GitHub/datasciencecoursera/Getting and Cleaning Data")
download.file(fileURL, destfile = "data/q5.for")

# Googled Fixed Width File R Package and we have the read.fwf function in the utils package
library(utils)
q5data <- read.fwf("data/q5.for", widths = c(15, 4, 4, 5, 4, 4, 5, 4, 4, 5, 4, 4), skip = 2)
head(q5data)

# need to remove the first two rows and the redundant NA columns
q5data_cleaned <- q5data[-c(1,2),c(1,2,3,5,6,8,9,11,12)]
# now sum the fourth column
sum(as.numeric(as.character(q5data_cleaned[,4])))