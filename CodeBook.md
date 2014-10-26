Getting and Cleaning Data Project

Ho Ji Weng

### Description
Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

### Source Data
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The 'tidy_dataset.txt' file is a tab-delimited (also known as 'tab-separated') text file.

### Explanation to run_analysis.R
To execute the program the dataset’s folder “UCI HAR Dataset” must be located in R’s working directory. From R’s command line load the source file source(“run_analysis.R”) and the script will run automatically generating the resultant file “Tidydata.csv” in the working directory. This script does not require any additional librarys beyond the base package.

First the table of activity code and activity are read into the variable “activity”. The columns are re-labeled and converted in a factor. Then the features table is read into the variable “features”. This is a 561 parameter list which is reduced down to just the variable set of interest (see requirement 1c) The original data set contain looked at 30 subjects performing 6 different activities and collected 561 parameters per sample repeated. Approximately 5.7 million data points were collected in this study. For the purpose of this analysis the 561 features parameters were reduced down by only looking at the mean and standard deviation feature parameters. The reduction was perform by looking for any expression that contained “mean()” or “std()”

               features[grep("mean\\(|std\\(", features$feature),]
This resulted in a reduced list of only 66 parameters reducing the dataset size by ~88%:

"tBodyAcc-mean-X" "tBodyAcc-mean-Y" "tBodyAcc-mean-Z"

"tBodyAcc-std-X" "tBodyAcc-std-Y" "tBodyAcc-std-Z"

"tGravityAcc-mean-X" "tGravityAcc-mean-Y" "tGravityAcc-mean-Z"

"tGravityAcc-std-X" "tGravityAcc-std-Y" "tGravityAcc-std-Z"

"tBodyAccJerk-mean-X" "tBodyAccJerk-mean-Y" "tBodyAccJerk-mean-Z"

"tBodyAccJerk-std-X" "tBodyAccJerk-std-Y" "tBodyAccJerk-std-Z"

"tBodyGyro-mean-X" "tBodyGyro-mean-Y" "tBodyGyro-mean-Z"

"tBodyGyro-std-X" "tBodyGyro-std-Y" "tBodyGyro-std-Z"

"tBodyGyroJerk-mean-X" "tBodyGyroJerk-mean-Y" "tBodyGyroJerk-mean-Z"

"tBodyGyroJerk-std-X" "tBodyGyroJerk-std-Y" "tBodyGyroJerk-std-Z"

"tBodyAccMag-mean" "tBodyAccMag-std" "tGravityAccMag-mean"

"tGravityAccMag-std" "tBodyAccJerkMag-mean" "tBodyAccJerkMag-std"

"tBodyGyroMag-mean" "tBodyGyroMag-std" "tBodyGyroJerkMag-mean"

"tBodyGyroJerkMag-std" "fBodyAcc-mean-X" "fBodyAcc-mean-Y"

"fBodyAcc-mean-Z" "fBodyAcc-std-X" "fBodyAcc-std-Y"

"fBodyAcc-std-Z" "fBodyAccJerk-mean-X" "fBodyAccJerk-mean-Y"

"fBodyAccJerk-mean-Z" "fBodyAccJerk-std-X" "fBodyAccJerk-std-Y"

"fBodyAccJerk-std-Z" "fBodyGyro-mean-X" "fBodyGyro-mean-Y"

"fBodyGyro-mean-Z" "fBodyGyro-std-X" "fBodyGyro-std-Y"

"fBodyGyro-std-Z" "fBodyAccMag-mean" "fBodyAccMag-std"

"fBodyBodyAccJerkMag-mean "fBodyBodyAccJerkMag-std" "fBodyBodyGyroMag-mean"

"fBodyBodyGyroMag-std" "fBodyBodyGyroJerkMag-mean" "fBodyBodyGyroJerkMag-std"