## run_analysis.R
## by Carlos Gutierrez Sanchez Del Rio  
## The following script assumes you have downloaded and unzipped the
## "Human Activity Recognition Using Smartphones Data Set" to the "UCI HAR Dataset" directory
## from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## --------------------------------------------------------------------------------------------
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


require(dplyr)
require(tidyr)

## 1. Merges the training and the test sets to create one data set
## To increase file reading speed, I include estimated num rows, define the colClasses and comment.char=""
merged<-rbind(
  cbind(
    read.table("UCI HAR Dataset//train/subject_train.txt",nrows=8000,comment.char = "",colClasses = c("integer")),
    read.table("UCI HAR Dataset//train/y_train.txt",nrows=8000,comment.char = "",colClasses = c("integer")),
    read.table("UCI HAR Dataset//train/X_train.txt",nrows=8000,comment.char = "",colClasses = c(rep("numeric",561)))),
  cbind(
    read.table("UCI HAR Dataset//test/subject_test.txt",nrows=3000,comment.char = "",colClasses = c("integer")),
    read.table("UCI HAR Dataset//test/y_test.txt",nrows=3000,comment.char = "",colClasses = c("integer")),
    read.table("UCI HAR Dataset//test/X_test.txt",nrows=3000,comment.char = "",colClasses = c(rep("numeric",561))))
)
## Set column names as per the features file
X_colnames<-read.table("UCI HAR Dataset//features.txt",colClasses="character")
colnames(merged)<-c("subject","activity",X_colnames[,2])

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
extract<-merged[,c(1,2,grep("mean\\(|std\\(",colnames(merged)))]

## 3. Uses descriptive activity names to name the activities in the data set
## Read the activities file
activities<-read.table("UCI HAR Dataset//activity_labels.txt",col.names = c("activity","activityname"))
## Match the activity names with the activity numbers by merging both data frames by the activity column
extract<-merge(x=extract,y=activities,by="activity")
## Replace numbers with text and remove extra column
extract[,1]<-extract[,69]
extract<-extract[,1:68]

## 4. Appropriately labels the data set with descriptive variable names.
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

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.
tidy_data<-tbl_df(extract)%>%
  group_by(subject,activity)%>%
  summarise_each(funs(mean))%>%
  gather(measurement,mean,3:68)%>%
  arrange(subject,activity)
## Write to text file
write.table(tidy_data,"UCI HAR Dataset//tidy_data.txt",row.names=FALSE)