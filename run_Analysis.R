# Getting and Cleaning Data - Course Project
#
#

# Part 1A: Set the working directory and download the identified data file. Note that this
# portion is set up to run on a Windows-based computer and should be adjusted for computers
# running other operating systems.
#
# This script should be run from working directory 

download.file(
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile = "dataset.zip")
download.date = date()
unzip("dataset.zip")

# Part 1B: Read in the data tables

feature.names = read.table("./UCI HAR Dataset/features.txt")
activity.labels = read.table("./UCI HAR Dataset/activity_labels.txt")
x.train = read.table("./UCI HAR Dataset/train/X_train.txt")
y.train = read.table("./UCI HAR Dataset/train/y_train.txt")
subject.train = read.table("./UCI HAR Dataset/train/subject_train.txt")
x.test = read.table("./UCI HAR Dataset/test/X_test.txt")
y.test = read.table("./UCI HAR Dataset/test/y_test.txt")
subject.test = read.table("./UCI HAR Dataset/test/subject_test.txt")

# Part 1C: Merges the training and test datasets to create one data set. 
# The same is down for the y (activity) vector and the subject vector and
# the column names from the features.names file are inserted as the names
# for the measurement variables and subject and activity.no names are assigned
# to these variables.

totalds = rbind(x.train, x.test)
names(totalds) = feature.names$V2
dim(totalds)
totalds_col_no = ncol(totalds) # Used for renaming subject and activity vectors
totalsubject = rbind(subject.train, subject.test)
dim(totalsubject)
totaly = rbind(y.train, y.test)
dim(totaly)
totalds = cbind(totalds, subject = totalsubject, activity.no = totaly)
names(totalds)[ (totalds_col_no + 1)] = "subject"
names(totalds)[ (totalds_col_no + 2)] = "activity.no"

# Part 2: Rename the columns in this dataset which are currently V1 ... V561
# to the names provided by the feature.names dataset. Once done, then identify
# only those columns which include the mean or standard deviation and adjust
# the data set to only include those columns.
#
# Extraction of the means is presumed to include the extraction of those measurements
# which include the mean Frequency

revisedcolumns = sort( c( grep( "-mean", names(totalds)), grep( "-std", names(totalds))))
revisedcolumns = c( revisedcolumns, (totalds_col_no + 1), (totalds_col_no + 2)  )
totalds = totalds[ , revisedcolumns ]

# Change the subject to a factor variable
totalds$subject = as.factor(totalds$subject)

# Part 3: Uses descriptive activity names to name the activities in the data set.
# First step is to combine activity vector, which currently has only the activity number,
# with the activity.labels table which has the descriptive labels.

totalds$activity.no = as.factor(totaly[,1])
totalds = merge( totalds, activity.labels, by.x = "activity.no", by.y = "V1", 
                 all = FALSE, sort = FALSE)
totalds$activity = as.factor(totalds$V2)

# Remove the columns activity.no and V2 as they are redundant

totalds = subset( totalds , select = -c( V2, activity.no) )

# Part 4: Appropriately labels the data set with descriptive activity names.
# This part of the objective is taken to mean that the variable names assigned should
# be modified to match the approriate syntax according to the Google R Style guide.
#
# The variable names are then modified to all lower case, exclude hyphens, underscores, and
# parentesis, and words are seperated by dots.

vn <- names(totalds)      
vn <- gsub("[()]","",vn)           # Remove parenthesis signs
vn <- gsub("-",".", vn)            # Replace - with .
vn <- gsub('([A-Z])','.\\1', vn)   # Insert a . before every capital letter
vn <- gsub( "[.][.]" , ".", vn)    # Replaces two periods with one
vn <- gsub("^t", "time", vn)       # Replace t with more descriptive 'time'
vn <- gsub("^f", "freq", vn)       # Replace f with more descritpive 'freq'
vn <- tolower(vn)                  # Change all to lower case
names(totalds) <- vn

# Part 5: Create a second, independent tidy data set with the average for each
# activity and each subject combination.

library(reshape2) # Required for the dcast()

dsmelt <- melt( totalds, id = c("subject", "activity"), measure.vars = vn[1:(ncol(totalds)-2)] )
tidyds <- dcast(dsmelt, subject + activity ~ variable , mean)

# Write the tidy dataset to .csv file

write.csv(tidyds, file = "MeanValuesBySubjAct.csv")

# write.csv(tidyds, file = "MeanValuesBySubjAct.txt") 
# Not - only written to a .txt file for submission to the Coursera project submission site.
