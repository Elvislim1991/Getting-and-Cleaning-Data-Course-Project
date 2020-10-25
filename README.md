# Getting-and-Cleaning-Data-Course-Project

This is an coursera project on working with Human Activity Recognition Using Smartphones Data Set to: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Data Source

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# run_analysis.R script Working instruction

The script is using following r package with version dplyr {1.0.0}, readr {1.3.1}
1. Download and unzip the file from the link of the Data Source session. You will find a folder named UCI HAR Dataset.
2. Download the run_analysis.R script from [here](https://github.com/Elvislim1991/Getting-and-Cleaning-Data-Course-Project/raw/473bf52e7545e4a72a430046a8b325aa78ef0213/run_analysis.R).
3. Save both the UCI HAR Dataset folder and run_analysis.R from step 1 and 2 in same directory.
3. Run the run_analysis.R and you will successfully generate tidyData.txt in your directory. 
