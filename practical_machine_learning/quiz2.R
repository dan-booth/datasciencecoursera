# === Practical Machine Learning - Quiz 2 === #

# = Q1 = #
# Load the Alzheimer's disease data using the commands
library(AppliedPredictiveModeling)
library(caret)
data(AlzheimerDisease)

# Create the training and testing sets
adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

# = Q2 = #
# Prep
data(concrete)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

# Histogram
library(ggplot2)
ggplot(data = concrete) + geom_histogram(aes(x = Superplasticizer))

# There are 0 values in the data
table(concrete$Superplasticizer)
# So can't use log transform

# = Q3 = #
# Prep
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[inTrain,]
testing = adData[-inTrain,]

# Find all the predictor variables in the training set that begin with IL
grep("^IL", names(training))
# 58:69
# Perform the PCA
preProc <- preProcess(training[, 58:69], method = "pca", thresh = 0.9)
preProc # See we need 9 components to capture 90 percent of the variance

# = Q4 = #
# No PCA fit
modelFit <- train(training$diagnosis ~ ., method = "glm", data = training[, 58:69])
testFit <- predict(modelFit, testing[, 58:69])
confusionMatrix(testing$diagnosis, testFit) # Accuracy 0.64

# PCA fit
preProc2 <- preProcess(training[, 58:69], method = "pca", thresh = 0.8)
trainPC <- predict(preProc2, training[, 58:69])
PCAmodelFit <- train(training$diagnosis ~ ., method = "glm", data = trainPC)
testPC <- predict(preProc2, testing[, 58:69])
confusionMatrix(testing$diagnosis, predict(PCAmodelFit, testPC)) # Accuracy 0.7195