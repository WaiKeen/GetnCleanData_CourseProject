# Loading the necessary library: dplyr
library(dplyr)

# Check if the directory exist with assumption the data will be within
if (!file.exists("UCI HAR Dataset")) {
    cat("Raw File does not exist, please extract")
}

# Read in all the relevant data set required
features <- read.table("UCI HAR Dataset/features.txt")
activitylabel <- read.table("UCI HAR Dataset/activity_labels.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features[,2])
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",col.names = features[,2])
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subject")

# Rename the activitylabel to be lowercase (tidy)
activitylabel$V2 <- tolower(activitylabel$V2)

# Map the activity labels with the descriptive activity label using left_join (dplyr)
y_test_activity <- left_join(y_test,activitylabel,by = "V1")
y_train_activity <- left_join(y_train,activitylabel,by = "V1")

# Merge the subject, descriptive activities and observations for both test and train data sets
test_combine <- cbind(subject_test,activity = y_test_activity[,2],X_test)
train_combine <- cbind(subject_train,activity = y_train_activity[,2],X_train)

# Merge the test and train data set together
data_combine <- rbind(test_combine,train_combine)

# Select the column variables for measurement of mean and standard deviation
data_final <- select(data_combine,subject,activity,contains("mean"),contains("std"),-contains("meanFreq"),-contains("angle"))

# Rename the column variable names to be tidy
names(data_final) <- gsub(".","_",names(data_final), fixed = TRUE)
names(data_final) <- gsub("__","",names(data_final), fixed = TRUE)

# Creating a tidy data set with the average of each variable for each activity and each subject.
mean_data <- summarise_each(group_by(data_final,subject,activity),funs(mean))

# Export tidy data set of the mean_data
write.table(mean_data, "tidy_average_data.txt", row.names = FALSE)