#CodeBook for the Getting and Cleaning Data Course Project Dataset

This CodeBook describes the data set which is obtained as an output of the run_analysis.R script contained within this repository. 
The tidy flat text file can be read back into R by using data.table to create a data table for further analysis.

tidy_data <- data.table("tidy_data.txt")

The run_analysis.R script creates a tidy, condensed version of the University of California Irvine's (UCI's) dataset for Human Activity Recognition (HAR) using Samsung smartphones that can be used for further research and analysis. The original UCI HAR Dataset is a public domain dataset built from the recordings of subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensor (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The original dataset comes from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each subject performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing, and laying) wearing a Samsung Galaxy S II smartphone on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, so a filter with a 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The script generates a combined subset of the original data by extracting the mean and standard deviation features for each of the 33 processed signals, for a total of 66 features (out of the 561 available features from the original feature vector). 

## Requirements
The script assumes you have downloaded and unzipped the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and that your working directory contains the UCI HAR Dataset folder.

The script makes use of the tidyr and dplyr (please install them with install.packages() if you haven't already done so. 

## Transformations performed by the Script 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Variable name cleanup

As part of the tidying process the variable names are cleaned up using the following transformations using the guidelines described in the lesson (lower case, no underscores, descriptive names...):

column_names<-colnames(extract) 
column_names<-gsub("\\(\\)","",column_names)  
column_names<-gsub("^t","time-",column_names) 
column_names<-gsub("^f","frequency-",column_names)  
column_names<-gsub("Acc","-accelerometer",column_names) 
column_names<-gsub("Gyro","-gyroscope",column_names)  
column_names<-gsub("Mag","-magnitude",column_names) 
column_names<-gsub("BodyBody|Body","body",column_names) 
column_names<-gsub("Jerk","-jerk",column_names) 
colnames(extract)<-tolower(column_names)  

##Description of the UCI HAR variables

The Tidy dataset consists of 11880 observations summarized by activity (6 categories) and subject (30 volunteers) pairs. For each observation (row) in the Tidy dataset, the following 4 columns are provided:

subject
activity
measurement
mean

### 1. subject

A numeric identifier (1-30) of the subject who carried out the experiment.

### 2. activity

The activity name with the following possible values.

LAYING
SITTING
STANDING
WALKING
WALKING_DOWNSTAIRS
WALKING_UPSTAIRS

### 3. measurement

The name of the measurement for which the mean is calculated. This variable can contain one of the following 66 variables. Please refer the codebook with the original dataset for the explanation of these different variables.

frequency-body-accelerometer-jerk-magnitude-mean  
frequency-body-accelerometer-jerk-magnitude-std 
frequency-body-accelerometer-jerk-mean-x  
frequency-body-accelerometer-jerk-mean-y  
frequency-body-accelerometer-jerk-mean-z  
frequency-body-accelerometer-jerk-std-x 
frequency-body-accelerometer-jerk-std-y 
frequency-body-accelerometer-jerk-std-z 
frequency-body-accelerometer-magnitude-mean 
frequency-body-accelerometer-magnitude-std  
frequency-body-accelerometer-mean-x 
frequency-body-accelerometer-mean-y 
frequency-body-accelerometer-mean-z 
frequency-body-accelerometer-std-x  
frequency-body-accelerometer-std-y  
frequency-body-accelerometer-std-z  
frequency-body-gyroscope-jerk-magnitude-mean  
frequency-body-gyroscope-jerk-magnitude-std 
frequency-body-gyroscope-magnitude-mean 
frequency-body-gyroscope-magnitude-std  
frequency-body-gyroscope-mean-x 
frequency-body-gyroscope-mean-y 
frequency-body-gyroscope-mean-z 
frequency-body-gyroscope-std-x  
frequency-body-gyroscope-std-y  
frequency-body-gyroscope-std-z  
time-body-accelerometer-jerk-magnitude-mean 
time-body-accelerometer-jerk-magnitude-std  
time-body-accelerometer-jerk-mean-x 
time-body-accelerometer-jerk-mean-y 
time-body-accelerometer-jerk-mean-z 
time-body-accelerometer-jerk-std-x  
time-body-accelerometer-jerk-std-y  
time-body-accelerometer-jerk-std-z  
time-body-accelerometer-magnitude-mean  
time-body-accelerometer-magnitude-std 
time-body-accelerometer-mean-x  
time-body-accelerometer-mean-y  
time-body-accelerometer-mean-z  
time-body-accelerometer-std-x 
time-body-accelerometer-std-y 
time-body-accelerometer-std-z 
time-body-gyroscope-jerk-magnitude-mean 
time-body-gyroscope-jerk-magnitude-std  
time-body-gyroscope-jerk-mean-x 
time-body-gyroscope-jerk-mean-y 
time-body-gyroscope-jerk-mean-z 
time-body-gyroscope-jerk-std-x  
time-body-gyroscope-jerk-std-y  
time-body-gyroscope-jerk-std-z  
time-body-gyroscope-magnitude-mean  
time-body-gyroscope-magnitude-std 
time-body-gyroscope-mean-x  
time-body-gyroscope-mean-y  
time-body-gyroscope-mean-z  
time-body-gyroscope-std-x 
time-body-gyroscope-std-y 
time-body-gyroscope-std-z 
time-gravity-accelerometer-magnitude-mean 
time-gravity-accelerometer-magnitude-std  
time-gravity-accelerometer-mean-x 
time-gravity-accelerometer-mean-y 
time-gravity-accelerometer-mean-z 
time-gravity-accelerometer-std-x  
time-gravity-accelerometer-std-y  
time-gravity-accelerometer-std-z  
  
### 4. mean

The mean of the measurements
