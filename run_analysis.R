#Assumes that we are working in a folder which the "UCI HAR Dataset" folder has been unzipped to
setwd("C:/Users/jwilliams/SkyDrive/Study/DataScienceToolbox/GettingandCleaningData/Labs")

#Download file and unzip
if(!file.exists("./FUCIDataset.zip")) {download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./FUCIDataset.zip", mode="wb")}
unzip("./FUCIDataset.zip")

library(data.table)

#Read in feature definitions and set field names
features <- fread("./UCI HAR Dataset/features.txt")
setnames(features,c("FeatureID","FeatureName"))
features$FeatureNameClean = gsub("\\(|\\)","",gsub("\\-|\\,","_",features$FeatureName))

#Read in activity definitions and set field names
activities <- fread("./UCI HAR Dataset/activity_labels.txt")
setnames(activities,c("ActivityID","ActivityName"))

#Read in test file setting column names to the feature labels
#wanted to use fread but there is a bug and it doesn't like the leading whitespace on this file
#x_test <- as.data.table(read.table("./UCI HAR Dataset/test/x_test.txt"))
#setnames(x_test, features[,FeatureNameClean])

x_test <- as.data.table(read.table("./UCI HAR Dataset/test/x_test.txt", col.names=features$FeatureNameClean))

#Add two new columns for the subject ID and activity ID.
x_test[,c("SubjectID","ActivityID"):=c(fread("./UCI HAR Dataset/test/subject_test.txt"),fread("./UCI HAR Dataset/test/y_test.txt"))]

#Repeat with the training data set
x_train <- as.data.table(read.table("./UCI HAR Dataset/train/x_train.txt", col.names=features$FeatureNameClean))
x_train[,c("SubjectID","ActivityID"):=c(fread("./UCI HAR Dataset/train/subject_train.txt"),fread("./UCI HAR Dataset/train/y_train.txt"))]

#Get the list of column names we want to keep
cols <- c("SubjectID","ActivityID",features[FeatureNameClean %like% ".*(mean_|std|mean$){1}.*",FeatureNameClean]) 

#rowbind the two data tables together to form one data set only keeping the columns defined above
concat <- rbindlist(list(x_test,x_train))[,cols,with=FALSE]

#head(x_test,1)
setkey(concat,ActivityID,SubjectID)
setkey(activities,ActivityID)

#Join the activities data to provide descriptive activity names
HARMeanStd <- concat[activities,]

# Used copy to be sure to create an independant dataset
AvgHARMeanStd = copy(HARMeanStd[,lapply(.SD,mean),by="SubjectID,ActivityName"])
write.table(AvgHARMeanStd, file="./AvgHARMeanStd.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
