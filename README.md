# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project:  The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

This repo contains the main script "run_analysis.R", the CodeBook for the dataset, the tidy_data.txt output and a README file.

## Requirements

The script assumes you have downloaded and unzipped the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and that your working directory contains the UCI HAR Dataset folder.

The script makes use of the tidyr and dplyr (please install them with install.packages() if you haven't already done so.

## Transformations performed by the "run_analysis.R" script

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
