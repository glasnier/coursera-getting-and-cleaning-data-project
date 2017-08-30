## Coursera - Peer-graded Assignment: Getting and Cleaning Data Course Project
## author: Gilles Lasnier
## date  : 2017-08-27
## file  : run_analysis.r

## File Description:

# This R script does the following steps on the UCI HAR Dataset:
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
# The UCI HAR Dataset is downloaded from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Code

#
# Step
# 0: Setup workspace and sources
#

# set working directory to the the UCI HAR Dataset
#setwd("/Users/gil/Desktop/projects/mooc-data_science-john_hopkins-uni/course3-cleaning-data/week4/coursera-getting-and-cleaning-data-project")

# setup data sources and workspace
sourceFilename <- "getdata_dataset.zip"

# download the dataset archive (if not present):
if (!file.exists(sourceFilename))
{
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, sourceFilename, method="curl")
}

# unzip the dataset:
if (!file.exists("UCI HAR Dataset"))
{
  unzip(sourceFilename)
}

#
# Step:
# 1. Merge the training and the test sets to create one data set.
#

# import data from files
features     = read.table('./UCI HAR Dataset/features.txt',             header = FALSE);

activityType = read.table('./UCI HAR Dataset/activity_labels.txt',      header = FALSE);

subjectTrain = read.table('./UCI HAR Dataset/train/subject_train.txt',  header = FALSE);
xTrain       = read.table('./UCI HAR Dataset/train/X_train.txt',        header = FALSE);
yTrain       = read.table('./UCI HAR Dataset/train/y_train.txt',        header = FALSE);

subjectTest  = read.table('./UCI HAR Dataset/test/subject_test.txt',    header = FALSE);
xTest        = read.table('./UCI HAR Dataset/test/X_test.txt',          header = FALSE);
yTest        = read.table('./UCI HAR Dataset/test/y_test.txt',          header = FALSE);

# set column names to imported data
colnames(activityType)  = c('activityId', 'activityType');

colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2];
colnames(yTrain)        = "activityId";

colnames(subjectTest)   = "subjectId";
colnames(xTest)         = features[,2]; 
colnames(yTest)         = "activityId";

# create the 'training' data set by merging data: subjectTrain, xTrain and yTrain
trainingDataSet = cbind(subjectTrain, xTrain, yTrain);

# create the 'test' data set by merging data: subjectTest, xTest and yTest
testDataSet = cbind(subjectTest, xTest, yTest);

# merge the training and the test sets to create one data set
dataSet = rbind(trainingDataSet, testDataSet);

# dataset column names vector
columnNames = colnames(dataSet);

#
# Step
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
#

# logicalVector which contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
logicalVector = (grepl("activity..", columnNames) | grepl("subject..", columnNames) | grepl("-mean..", columnNames) & !grepl("-meanFreq..", columnNames) & !grepl("mean..-", columnNames) | grepl("-std..", columnNames) & !grepl("-std()..-", columnNames));

# to keep only desired columns
dataSet = dataSet[logicalVector==TRUE];

#
# Step
# 3. Use descriptive activity names to name the activities in the data set
#

# merge activityType and dataSet to include descriptive activity names
dataSet = merge(activityType, dataSet, by = 'activityId', all.x = TRUE);

# update the 'columnNames' vector to include the new column names after merge
columnNames = colnames(dataSet);

#
# Step
# 4. Appropriately label the data set with descriptive activity names.
#

# cleaning up the variable names for each column
for (i in 1:length(columnNames))
{
  columnNames[i] = gsub("\\()", "", columnNames[i]) # remove parenthesis

  columnNames[i] = gsub("-std$", "StdDev", columnNames[i]) # standard deviation
  columnNames[i] = gsub("-mean", "Mean", columnNames[i]) # mean

  columnNames[i] = gsub("^(t)", "time", columnNames[i]) # t -> time
  columnNames[i] = gsub("^(f)", "frequency", columnNames[i]) #  f -> frequency

  columnNames[i] = gsub("(accjerkmag)","AccJerkMag", columnNames[i])

  columnNames[i] = gsub("([Gg]ravity)", "Gravity", columnNames[i])
  columnNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)", "Body", columnNames[i])
  columnNames[i] = gsub("[Gg]yro", "Gyro", columnNames[i])
};

# set new descriptive activity names to dataSet
colnames(dataSet) = columnNames;

#
# Step
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
#

# create a second dataSet
dataSet2 = dataSet[, names(dataSet) != 'activityType'];

# summarizing the table to include just the mean and standard deviation of each variable for each activity and each subject
tidyDataSet = aggregate(dataSet2[ , names(dataSet2) != c('activityId', 'subjectId')], by = list(activityId = dataSet2$activityId, subjectId = dataSet2$subjectId), mean);

# include descriptive activity names to the independent tidy data set
tidyDataSet = merge(activityType, tidyDataSet, by = 'activityId', all.x = TRUE);

# setup tidyDataSet filename
tidyDataSetFilename <- "./tidy_dataset.txt"

# write the tidyDataSet to file
write.table(tidyDataSet, tidyDataSetFilename, row.names = TRUE, quote = FALSE, sep = ' ')

## EOF
