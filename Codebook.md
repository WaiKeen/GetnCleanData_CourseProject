============================================================================  
Human Activity Recognition Using Smartphones Dataset  
Version 1.0  
============================================================================  

# Experiment Subjects

* 30 volunteers participated in the experiment
* Age bracket of 19 to 48 years
* Volunteers are identified by integer 1 to 30 in column 'subject'
* Each volunteer are tracked using a Samsung Galaxy S II smartphone performing each activities

# Number of activities

* There are six (6) different activities
* Activities is all in tidied to lowercase
* List to activities as follow:

1. walking
2. walking_upstairs
3. walking_downstairs
4. sitting
5. standing
6. laying

# Variables tracked

* All variables tracked with Hz units (time) 
* Leading t representing Time Domain Signal
* Leading f representing Frequency Domain Signal
* Column names with the feature name:
    + tBodyAcc-XYZ
    + tGravityAcc-XYZ
    + tBodyAccJerk-XYZ
    + tBodyGyro-XYZ
    + tBodyGyroJerk-XYZ
    + tBodyAccMag
    + tGravityAccMag
    + tBodyAccJerkMag
    + tBodyGyroMag
    + tBodyGyroJerkMag
    + fBodyAcc-XYZ
    + fBodyAccJerk-XYZ
    + fBodyGyro-XYZ
    + fBodyAccMag
    + fBodyAccJerkMag
    + fBodyGyroMag
    + fBodyGyroJerkMag

* Measure Type & Axis is separated with underscore (_) and named as follow:
    + mean or std (for standard deviation)
    + X or Y or Z (for the respective axis)

# Tidy data set

* Single data set with the following information:
    + Subject (volunteers) identifed as an integer from 1 to 30
    + Activities tracked and the descriptive labels 
    + Variables tracked on the variables with appropriate labels
 
* Tidy data set is in WIDE format
    + Each variable is for Each Feature, Axis and Measures on each Column
    + All observation are arrange on each ROW
    
* Measures are calculated for:
    + Mean
    + Standard Deviation
    
* Tidy data set is with the average of each variable for each activity and each subject.

# Transformation performed from the original data set
* Merged the subject, activities, and tracking data set together
* Replaced the activities identifier with the descriptive activities labels
* Renamed the activities labels to be tidy
* Selected only the mean and standard deviation (std) variables
* Combined both test and train data set together
* Rename the variable names appropriately
* Calculated the mean of each variables according to subjects and activities