---
title| "Codebook"
output| html_document
---
#Codebook

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

These variables were then summerised by Subject and Activity taking the mean of each.


Variable|Data Type|Desc
--------|---------|-----------
SubjectID                | int|An identifier of the subject who carried out the experiment.
ActivityName             | chr|The activity label
ActivityID               | num|An identifier of the activity
tBodyAcc_mean_X          | num|All further values are the mean of the original variables
tBodyAcc_mean_Y          | num|
tBodyAcc_mean_Z          | num|
tBodyAcc_std_X           | num|
tBodyAcc_std_Y           | num|
tBodyAcc_std_Z           | num|
tGravityAcc_mean_X       | num|
tGravityAcc_mean_Y       | num|
tGravityAcc_mean_Z       | num|
tGravityAcc_std_X        | num|
tGravityAcc_std_Y        | num|
tGravityAcc_std_Z        | num|
tBodyAccJerk_mean_X      | num|
tBodyAccJerk_mean_Y      | num|
tBodyAccJerk_mean_Z      | num|
tBodyAccJerk_std_X       | num|
tBodyAccJerk_std_Y       | num|
tBodyAccJerk_std_Z       | num|
tBodyGyro_mean_X         | num|
tBodyGyro_mean_Y         | num|
tBodyGyro_mean_Z         | num|
tBodyGyro_std_X          | num|
tBodyGyro_std_Y          | num|
tBodyGyro_std_Z          | num|
tBodyGyroJerk_mean_X     | num|
tBodyGyroJerk_mean_Y     | num|
tBodyGyroJerk_mean_Z     | num|
tBodyGyroJerk_std_X      | num|
tBodyGyroJerk_std_Y      | num|
tBodyGyroJerk_std_Z      | num|
tBodyAccMag_mean         | num|
tBodyAccMag_std          | num|
tGravityAccMag_mean      | num|
tGravityAccMag_std       | num|
tBodyAccJerkMag_mean     | num|
tBodyAccJerkMag_std      | num|
tBodyGyroMag_mean        | num|
tBodyGyroMag_std         | num|
tBodyGyroJerkMag_mean    | num|
tBodyGyroJerkMag_std     | num|
fBodyAcc_mean_X          | num|
fBodyAcc_mean_Y          | num|
fBodyAcc_mean_Z          | num|
fBodyAcc_std_X           | num|
fBodyAcc_std_Y           | num|
fBodyAcc_std_Z           | num|
fBodyAccJerk_mean_X      | num|
fBodyAccJerk_mean_Y      | num|
fBodyAccJerk_mean_Z      | num|
fBodyAccJerk_std_X       | num|
fBodyAccJerk_std_Y       | num|
fBodyAccJerk_std_Z       | num|
fBodyGyro_mean_X         | num|
fBodyGyro_mean_Y         | num|
fBodyGyro_mean_Z         | num|
fBodyGyro_std_X          | num|
fBodyGyro_std_Y          | num|
fBodyGyro_std_Z          | num|
fBodyAccMag_mean         | num|
fBodyAccMag_std          | num|
fBodyBodyAccJerkMag_mean | num|
fBodyBodyAccJerkMag_std  | num|
fBodyBodyGyroMag_mean    | num|
fBodyBodyGyroMag_std     | num|
fBodyBodyGyroJerkMag_mean| num|
fBodyBodyGyroJerkMag_std | num|

