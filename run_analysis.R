library(data.table)

gcd.x_headers <- NULL
gcd.activity_labels <- NULL
gcd.subjects <- NULL

subset_headers <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z",
             "tBodyAcc-std()-X", "tBodyAcc-std()-Y","tBodyAcc-std()-Z", 
             "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y","tGravityAcc-mean()-Z",
             "tGravityAcc-std()-X", "tGravityAcc-std()-Y","tGravityAcc-std()-Z",
             "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z",
             "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z",
             "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z",
             "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z",
             "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z",
             "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z"
             )

gcd.x_headers.init <- function(base_path) {
  gcd.x_headers <<- fread(input = paste("./", base_path, "/features.txt", sep = ""), 
                   header = FALSE)[,V2]
  gcd.x_headers
}

gcd.activity_labels.init <- function(base_path) {
  gcd.activity_labels <<- fread(input = paste("./", base_path, "/activity_labels.txt", sep = ""), 
                                header = FALSE)
  gcd.activity_labels
}

gcd.load.set <- function(base_path, set) {
  ## prepare path prefix
  path <- paste("./", base_path, "/", set, "/", sep = "")
  
  ## prepare measurements column
  x_buffer <- fread(input = paste(path, "X_", set, ".txt", sep = ""), 
                    header = FALSE)
  names(x_buffer) <- gcd.x_headers
  
  ## prepare activity column
  y_buffer <- fread(input = paste(path, "Y_", set, ".txt", sep = ""),
                    header = FALSE)
  y_buffer <- merge(y_buffer, gcd.activity_labels, by.x = "V1", by.y = "V1")[, "V2", with = FALSE]
  names(y_buffer) <- c("activity")
  
  s_buffer <- fread(input = paste(path, "subject_", set, ".txt", sep = ""),
                    header = FALSE)
  names(s_buffer) <- "subject"
  buffer <- cbind(s_buffer, y_buffer, x_buffer)[, paste(c("subject", "activity", subset_headers), sep = ""), with = FALSE]
}

gcd.load.merged <- function(base_path, sets) {
  gcd.x_headers.init(base_path)
  gcd.activity_labels.init(base_path)
  
  result <- data.frame()
  for (set in sets) {
    buffer <- gcd.load.set(base_path, set)
    result <- rbind(result, buffer)
  }
  result
}

gcd.tidy_data.create <- function(data) {
  ## calculate 
  result <- aggregate(res, by = list(res$subject, res$activity), mean)

  ## ok, quite a hack, but didn't find a other solution in the remaining time
  setnames(result, "subject", "drop")
  setnames(result, "activity", "drop")
  setnames(result, "Group.1", "subject")
  setnames(result, "Group.2", "activity")
  result[, !names(result) %in% c("drop")]
  
  write.table(result, file = "tidy_data.txt", row.names = FALSE)
}

## main function call
gcd.tidy_data.create(gcd.load.merged("UCI HAR Dataset", c("train", "test")))

