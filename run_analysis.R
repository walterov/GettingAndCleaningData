setwd("~/Data Science/Class Assigments/UCI HAR Dataset")
library(plyr)

## Merge the test data set.

xtest = read.table("./test/X_test.txt")

ytest = read.table("./test/y_test.txt")

subjecttest = read.table("./test/subject_test.txt")

actlabels = read.table("./activity_labels.txt")

features = read.table("./features.txt")

# Replace activity codes for descriptive names and rename column
ytest <- join(ytest,actlabels)
ytest<-rename(ytest, c("V2"="Activity"))
keep=c("Activity")
ytest<-ytest[,keep,drop=FALSE]
subjecttest<-rename(subjecttest, c("V1"="Subject"))

#rename DF columns to descriptive names
names(xtest) = features$V2

#Add indexes to each DF and join them
xtest["id"]<- NA
xtest$id<-seq(1, nrow(xtest))
ytest["id"]<- NA
ytest$id<-seq(1, nrow(ytest))
subjecttest["id"]<- NA
subjecttest$id<-seq(1, nrow(subjecttest))

#Join the test data set into a single DF
dfList<-list(xtest,ytest,subjecttest)
mergedxystest<-join_all(dfList)

## Merge the training data set.

xtrain = read.table("./train/X_train.txt")

ytrain = read.table("./train/y_train.txt")

subjecttrain = read.table("./train/subject_train.txt")

# Replace activity codes for descriptive names and rename column
ytrain <- join(ytrain,actlabels)
ytrain<-rename(ytrain, c("V2"="Activity"))
keep=c("Activity")
ytrain<-ytrain[,keep,drop=FALSE]
subjecttrain<-rename(subjecttrain, c("V1"="Subject"))

#rename DF columns to descriptive names
names(xtrain) = features$V2

#Add indexes to each DF and join them
xtrain["id"]<- NA
xtrain$id<-seq(1, nrow(xtrain))
ytrain["id"]<- NA
ytrain$id<-seq(1, nrow(ytrain))
subjecttrain["id"]<- NA
subjecttrain$id<-seq(1, nrow(subjecttrain))

#Join the train data set into a single DF
dfList<-list(xtrain,ytrain,subjecttrain)
mergedxystrain<-join_all(dfList)

## Merge the test and training data sets

# makesure train ids donot colide with test ids
mergedxystrain$id <- mergedxystrain$id + nrow(xtest)

# add column to each set indicating factor: test or train
mergedxystest["Type"]<- NA
mergedxystrain["Type"]<- NA
mergedxystest$Type<- "test"
mergedxystrain$Type<- "train"

# merge and order
mergedData = merge(mergedxystest,mergedxystrain, all=TRUE)
mergedData = mergedData[order(mergedData$id),]

# extract only the measurements on the mean and standard deviation for each measurement
mergedData <- mergedData[, which(grepl("(id)|(Subject)|(Activity)|(Type)|(.?mean.?)|(.?std.?)", colnames(mergedData)))]

## Create a second, independent tidy data set with the average of each variable for each activity and each subject.

finalData <- aggregate(mergedData[,1:79], mergedData[c("Activity", "Subject")], mean)
write.table(finalData,"./FinalDataSet.txt",row.name = FALSE) 
