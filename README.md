# Getting and Cleaning Data - Peer Assignment

## Data set for the project  
Download the data set required from the project in .zip format from:  
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
Extract the data set from the zip file to the working directory and do not change the directory structure from the zip.  
Check if the data set has been extracted into the folder 'UCI HAR Dataset' in the working directory.  

Check if "run_analysis.R" script is in the working directory  
Run the script using source command: **source("run_analysis.R")**  

# What the "run_analysis.R" does.
1. Loading the necessary library: dplyr using the **library()**
2. Check if the directory exist with assumption the data will be within
3. Read in all the relevant data set required using **'read.table()'**
4. Rename the activitylabel to be lowercase (tidy) using **'to_lower()'**
5. Map the activity labels with the descriptive activity label using **left_join() {dplyr}**
6. Merge the subject, descriptive activities and observations for both test and train data sets using **cbind()**
7. Merge the test and train data set together using **rbind()**
8. Select the column variables for measurement of mean and standard deviation using **Select()**
9. Rename the column variable names to be tidy using the **gsub(,fixed = TRUE)** 
10. Creating a tidy data set with the average of each variable for each activity and each subject using **summarise_each() {dplyr}**
11. Export the new Tidy Data set using the **write.table(,row.names = FALSE)**

# To read the data back into R  
To read the Tidy Data Set, use read.table(,header = TRUE)