# Function to merge and clean the data providing X, y, features, activity_labels, subject txt file for train and test set
library(readr)
library(dplyr)

clean_data <- function(X, y, feature, activity.labels, subject) {
        
        # Load data set in environment 
        data <- read_table(X, col_names = FALSE)
        
        # Load labels into environment
        labels <- read_table(y, col_names = "activity.label")
        
        # Load feature names into environment
        feature.names <- readLines(feature)
        feature.names <- gsub("[0-9]+ ", "", feature.names) # remove the leading integer and space for variable names
        feature.names.filter <- feature.names[grepl("\\bmean()\\b|\\bstd()\\b", feature.names)] # filter the variables with mean and std
        
        # names the column with descriptive variable names
        names(data) <- feature.names
        
        # select features with mean and std
        data.mean.std <- data %>% select(feature.names.filter)
        
        # load activity labels into environment
        activity.labels <- read_table(
                activity.labels, 
                col_names = c("activity.label", "activity")
                )
        
        # load  subject data into environment
        subject <- read_table(
                subject, 
                col_names = "Subject.ID"
                )
        
        # column bind data.mean.std, labels, and subject together
        merge_tbl <- tibble(
                cbind(
                        data.mean.std, 
                        labels, 
                        subject
                        )
                )
        
        # merge with activity.labels to give descriptive activity names
        merge_tbl <- tibble(
                merge(
                        merge_tbl, 
                        activity.labels, 
                        by = "activity.label"
                        )
                ) 
}

test.data <- clean_data(
        X="./UCI HAR Dataset/test/X_test.txt", 
        y="./UCI HAR Dataset/test/y_test.txt", 
        feature="./UCI HAR Dataset/features.txt",
        activity.labels = "./UCI HAR Dataset/activity_labels.txt",
        subject = "./UCI HAR Dataset/test/subject_test.txt"
        )

train.data <- clean_data(
        X="./UCI HAR Dataset/train/X_train.txt",
        y="./UCI HAR Dataset/train/y_train.txt",
        feature="./UCI HAR Dataset/features.txt",
        activity.labels="./UCI HAR Dataset/activity_labels.txt",
        subject="./UCI HAR Dataset/train/subject_train.txt"
)

full.data <- bind_rows(test.data, train.data)

ave.full.data <- full.data %>% group_by(activity, Subject.ID) %>% summarise_all(mean)

write.table(ave.full.data, file = "tidyData.txt", row.names = FALSE)