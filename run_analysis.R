## This script is used to:
## 1. Merge the training and the test sets to one data set
## 2. Extracts the mean and std for each measurement
## 3. Uses descriptive na

## Get Activities Names
activities <- read.table("activity_labels.txt",
                         sep=" ",
                         col.names=c("Activity.Code","Activity"))

## Get Features Names
features <- read.table("features.txt",
                       sep=" ",
                       col.names=c("ID","Feature"))

## Replace the following characters
## ()-,
## with .
## in feature names
features <- features$Feature
patt <- c("[(),-]")
features <- gsub(patt,".",features)

## Replace extra dots with just 1 dot
patt <- c("\\.\\.+")
features <- gsub(patt,".",features)

## Replace dot at the end
patt <- c("\\.$")
features <- gsub(patt,"",features)

## Get test data
source("get_dataset.R")
testData <- getData("./test/subject_test.txt",
                    "./test/y_test.txt",
                    "./test/X_test.txt",
                    activities,
                    features)
## Get training data
trainData <- getData("./train/subject_train.txt",
                     "./train/y_train.txt",
                     "./train/X_train.txt",
                     activities,
                     features)

## Get merged data
mergedData <- rbind(testData,trainData)

## Extract only the measurements on the mean and std
## for each measurement
meanFeatures <- grep("mean",features,
                     ignore.case=TRUE,
                     value=TRUE)
stdFeatures <- grep("std",features,
                    ignore.case=TRUE,
                    value=TRUE)
meanAndStd <- c("Subject.ID",
                "Activity",
                meanFeatures,stdFeatures)
meanStdData <- mergedData[,meanAndStd]

## Write the data set as a txt file
write.table(meanStdData,"data.txt",sep=",")

## Create a second data set with the average of each
## variable for each activity and each subject
measurements <- mergedData[,features]
aveData <- with(mergedData,aggregate(measurements,
                                     by=list(Subject.ID,
                                             Activity),
                                     mean))
colnames(aveData)[1:2] <- c("Subject.ID","Activity")
