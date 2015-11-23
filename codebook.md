---
title: "codebook"
author: "Christian Schroeder"
date: "23. November 2015"
output: html_document
---

The following data sets are being processed by the script:
- activity_labels.txt: This will provide the script with writen activity names, for the specific column in the tables, to replace the numeric counterparts
- features.txt: This contains the feature column names, which will allow easy setting of the measurement columns
- subject_test.txt: This is the list of IDs of all subjects measures in the different samples. Subject IDs are integers between[1, 30]
- X_test.txt: The measurements for each subject.
- Y_test.txt: The activities qualifying the different measurement sets

All other files were not included
For the last three files mentioned above, each one of them is being read from the "test" and "train" directories

On the X_test.txt files:
- Containes the measurements for acceleration and rotation of the actual subject. 
- For the tidy data set, only the mean and standard deviation values were extracted.
- All measurements are between [-1, 1]

On Y_test.txt files:
- This includes the activities as numeric codes. The activity_lables.txt file is being needed to make the codes human readable
- Codes are between [1, 6]

On the tidy_data.txt
- The activity names have been integrated, all names being in capital letters.
- From the original data sets, the following measurment variables have been collected for the result set
  - tBodyAcc-mean()-X
  - tBodyAcc-mean()-Y
  - tBodyAcc-mean()-Z
  - tBodyAcc-std()-X
  - tBodyAcc-std()-Y
  - tBodyAcc-std()-Z
  - tGravityAcc-mean()-X
  - tGravityAcc-mean()-Y
  - tGravityAcc-mean()-Z
  - tGravityAcc-std()-X
  - tGravityAcc-std()-Y
  - tGravityAcc-std()-Z
  - tBodyAccJerk-mean()-X
  - tBodyAccJerk-mean()-Y
  - tBodyAccJerk-mean()-Z
  - tBodyAccJerk-std()-X
  - tBodyAccJerk-std()-Y
  - tBodyAccJerk-std()-Z
  - tBodyGyro-mean()-X
  - tBodyGyro-mean()-Y
  - tBodyGyro-mean()-Z
  - tBodyGyro-std()-X
  - tBodyGyro-std()-Y
  - tBodyGyro-std()-Z
  - tBodyGyroJerk-mean()-X
  - tBodyGyroJerk-mean()-Y
  - tBodyGyroJerk-mean()-Z
  - tBodyGyroJerk-std()-X
  - tBodyGyroJerk-std()-Y
  - tBodyGyroJerk-std()-Z
- For each measurement, and grouped along teh subject and activity, the 
- 


