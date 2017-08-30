## CodeBook - Peer-graded Assignment Project - Getting and Cleaning Data Course (MOOC) - Coursera

(author: Gilles Lasnier)

### Description

This `CodeBook` is related to the 'Peer-graded Assignment Project' of the
Getting and Cleaning Data Course MOOC from Johen Hopkins University, available
on Coursera.

This `CodeBook`summarizes the resulting tidy data set (stored in `tidy_dataset.txt`)
produced by the `run_analysis.R` R script on the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) from the [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) project.

For more information about the R script and how to reproduce the result, one
may consult the `README.md` file from this repository.

### Project data set information

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular
velocity at a constant rate of 50Hz. The experiments have been video-recorded
to label the data manually. The obtained dataset has been randomly partitioned
into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and
50% overlap (128 readings/window). The sensor acceleration signal, which has
gravitational and body motion components, was separated using a Butterworth
low-pass filter into body acceleration and gravity. The gravitational force is
assumed to have only low frequency components, therefore a filter with 0.3 Hz
cutoff frequency was used. From each window, a vector of features was obtained
by calculating variables from the time and frequency domain.

#### Attribute Information

For each record in the dataset it is provided:

+ Triaxial acceleration from the accelerometer (total acceleration) and the 
estimated body acceleration.
+ Triaxial Angular velocity from the gyroscope.
+ A 561-feature vector with time and frequency domain variables.
+ Its activity label.
+ An identifier of the subject who carried out the experiment.


### Identifiers

+ activityId: type of activity performed when the corresponding measurements were taken
+ subjectId: ID of the test subject


### Activity labels

+ WALKING (value 1): subject was walking during the test
+ WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
+ WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
+ SITTING (value 4): subject was sitting during the test
+ STANDING (value 5): subject was standing during the test
+ LAYING (value 6): subject was laying down during the test


### Measurements


+ timeBodyAccMagMean
+ timeBodyAccMagStdDev          
+ timeGravityAccMagMean
+ timeGravityAccMagStdDev
+ timeBodyAccJerkMagMean
+ timeBodyAccJerkMagStdDev      
+ timeBodyGyroMagMean
+ timeBodyGyroMagStdDev
+ timeBodyGyroJerkMagMean
+ timeBodyGyroJerkMagStdDev     
+ frequencyBodyAccMagMean
+ frequencyBodyAccMagStdDev
+ frequencyBodyAccJerkMagMean
+ frequencyBodyAccJerkMagStdDev
+ frequencyBodyGyroMagMean
+ frequencyBodyGyroMagStdDev
+ frequencyBodyGyroJerkMagMean
+ frequencyBodyGyroJerkMagStdDev


### Additional information

This project used the dataset from:
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

For more information about this study and this dataset one may consult the
following publication:

[[1]](https://www.icephd.org/sites/default/files/IWAAL2012.pdf) Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.