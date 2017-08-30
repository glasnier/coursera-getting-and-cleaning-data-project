## README - Peer-graded Assignment Project - Getting and Cleaning Data Course (MOOC) - Coursera

(author: Gilles Lasnier)

### About

This repository hosts the R script and documentation files for the
peer-graded assignment project of the Data Science's track course 
"Getting and Cleaning data". This course is provided by Johns Hopkins University
as a MOOC and is available on Coursera.


### Files description

  * `CodeBook.md`: describes variables, data, and transformation or work performed to clean up the data
  * `run_analysis.R`: R script to transform raw data set in a tidy one
  * `README.md`: this README file
  * `tidy_dataset.txt`: (carbon) output produced by the 5th step of the R script


### Project description (from coursera)

The purpose of this project is to demonstrate your ability to collect, work
with, and clean a data set. The goal is to prepare tidy data that can be used
for later analysis. You will be graded by your peers on a series of yes/no
questions related to the project.

You will be required to submit:

  * a tidy data set as described below
  * a link to a Github repository with your script for performing the analysis, and
  * a code book that describes the variables, the data, and any transformations
    or work that you performed to clean up the data called `CodeBook.md`.
  * a `README.md` in the repo with your scripts. This file explains how all of
    the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable
computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop
the most advanced algorithms to attract new users. The data linked to from the
course website represent data collected from the accelerometers from the
Samsung Galaxy S smartphone. A full description is available at the site where
the data was obtained: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


### Project instructions (summary)

Create one R script called `run_analysis.R` that does the following:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for
    each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set
    with the average of each variable for each activity and each subject.


### How to create the tidy data set

 1. Clone this repository: git clone https://github.com/glasnier/coursera-getting-and-cleaning-data-project.git
 2. Open a R console and set the working directory to the repository root (use setwd())
 3. Source `run_analysis.R` R script: source('run_analysis.R')

The script doesn't need any data to be prepared prior to running it. It
downloads and unzips the data set in a the root repository folder prior to
cleaning up the data. As a result, you will find in the repository root
directory the `tidy_dataset.txt` file which is the the tidy data set.


### Additional information

This project used the dataset from:
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

For more information about this study and this dataset one may consult the
following publication:

[[1]](https://www.icephd.org/sites/default/files/IWAAL2012.pdf) Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.