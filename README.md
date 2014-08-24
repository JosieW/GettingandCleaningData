---
title: "run_analysis.R"
output: html_document
---
###Introduction
A single script run_analysis.R has been created to obtain and manipulate the "Human Activity Recognition Using Smartphones Data Set "[1] originally obtained from this source http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones to provide a summmary of key variables in the data by Subject and Activity.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

###Obtain Data
First download and uncompress the data set
```
#Download file and unzip
if(!file.exists("./FUCIDataset.zip")) {download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./FUCIDataset.zip", mode="wb")}
unzip("./FUCIDataset.zip")
```
###Load and cleanse
Next read in two of the supporting files which contain descriptions for the variables (Features) and activities.
```
#Read in feature definitions and set field names
features <- fread("./UCI HAR Dataset/features.txt")
setnames(features,c("FeatureID","FeatureName"))
```

```
#Read in activity definitions and set field names
activities <- fread("./UCI HAR Dataset/activity_labels.txt")
setnames(activities,c("ActivityID","ActivityName"))
```

The feature names contain some characters that are not suitable as variable names in R, so replace '-' or ',' with _ and remove the braces '()'.
```
features$FeatureNameClean = gsub("\\(|\\)","",gsub("\\-|\\,","_",features$FeatureName))
```

Once cleansed the feature names are used as the column names when reading in the x data sets.
```
#Read in test file setting column names to the feature labels
x_test <- as.data.table(read.table("./UCI HAR Dataset/test/x_test.txt", col.names=features$FeatureNameClean))
```
The subject and activity information is added as two aditional columns.
```
#Add two new columns for the subject ID and activity ID.
x_test[,c("SubjectID","ActivityID"):=c(fread("./UCI HAR Dataset/test/subject_test.txt"),fread("./UCI HAR Dataset/test/y_test.txt"))]
```
Repeat these steps for the training data set
```
#Repeat with the training data set
x_train <- as.data.table(read.table("./UCI HAR Dataset/train/x_train.txt", col.names=features$FeatureNameClean))
x_train[,c("SubjectID","ActivityID"):=c(fread("./UCI HAR Dataset/train/subject_train.txt"),fread("./UCI HAR Dataset/train/y_train.txt"))]
```

###Subset data
For this exercise only return the mean and standard deviation variables.  These can be identified by 'mean' or 'std' in the variable names, so first a list of the required columns is created.
```
#Get the list of column names we want to keep
cols <- c("SubjectID","ActivityID",features[FeatureNameClean %like% ".*(mean_|std|mean$){1}.*",FeatureNameClean])
```

Combine both the test and training datasets together to create one large dataset. With data tables this is done using rbindlist.  The column list created in the previous step to specify which columns to include. 
```
#rowbind the two data tables together to form one data set only keeping the columns defined above
concat <- rbindlist(list(x_test,x_train))[,cols,with=FALSE]
```
Use the activies data set to provide descriptions for the activityID.  Set the keys first to enable the join.
```
#Set the keys in both data sets
setkey(concat,ActivityID,SubjectID)
setkey(activities,ActivityID)
```

```
#Join the activities data to provide descriptive activity names
HARMeanStd <- concat[activities,]
```

###Calculate Summary
Lastly create the summerised dataset giving an average for each variable by Subject and Activity and write it to a file
```
# Used copy to be sure to create an independant dataset
AvgHARMeanStd = copy(HARMeanStd[,lapply(.SD,mean),by="SubjectID,ActivityName"])
write.table(AvgHARMeanStd, file="./AvgHARMeanStd.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
```



