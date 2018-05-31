
# downloding and unzipping
if(!file.exists("C:/Users/Raj/Documents/R/data")){dir.create("C:/Users/Raj/Documents/R/data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="C:/Users/Raj/Documents/R/data/Dataset.zip")

# Unzipping dataSet
unzip(zipfile="C:/Users/Raj/Documents/R/data/Dataset.zip",exdir="C:/Users/Raj/Documents/R/data")

# Reading trainings tables
x_train <- read.table("C:/Users/Raj/Documents/R/data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/Raj/Documents/R/data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/Raj/Documents/R/data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables
x_test <- read.table("C:/Users/Raj/Documents/R/data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/Raj/Documents/R/data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/Raj/Documents/R/data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature 
features <- read.table('C:/Users/Raj/Documents/R/data/UCI HAR Dataset/features.txt')

# Reading activity labels
activityLabels = read.table('C:/Users/Raj/Documents/R/data/UCI HAR Dataset/activity_labels.txt')
colnames(activityLabels) <- c('activityId','activityType')

# Assigning column names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

#merging Data
merged_Data <- rbind(cbind(y_train, subject_train, x_train) ,cbind(y_test, subject_test, x_test))

#Extract only the measurements on the mean and standard deviation for each measurement
# determine columns of data set to keep based on column name...
columns_needed <- grepl("subjectId|activityId|mean|std", colnames(merged_Data))
mean_and_std_set <- merged_Data[ , columns_needed == TRUE]

library(dplyr)

# Using descriptive activity names to name the activities in the data set:
setWithActivityNames <- merge(mean_and_std_set, activityLabels, by ='activityId',all.x=TRUE)


## Creating a second, independent tidy data set with the average of each variable for each activity and each subject:
# group by subject and activity and summarise using mean
mean_and_std_setMeans <- mean_and_std_set %>% 
  group_by(subjectId, activityId) %>%
  summarise_each(funs(mean))

# output to file "tidydata.txt"
write.table(mean_and_std_setMeans, "tidydata.txt", row.names = FALSE, 
            quote = FALSE)