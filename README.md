# Getting and Cleaning Data Project

## Description
The goal of this project is to prepare tidy data for later analysis.
The data in this project is the data collected from the accelerometers from the Samsung Galaxy SII smartphone.
A full description is available at this site:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
And the data for the project can be downloaded at this website:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Program Files
The following files are included:
- `run_analysis.R`
This is the main R program that does the following:
    - Reads in the activity labels and the feature labels;
    - Formats the feature labels by removing non-word characters with a dot `.`;
    - Creates a data frame (by calling `get_dataset.R`) by binding the subject, features and measurements for each of the test and training sets;
    - Combines the test and training sets to `mergedData`;
    - Extracts only the mean and standard deviation measurements (i.e. those with `mean` or `std` in their names) to a new data set called `meanStdData`;
    - Creates a second data set with the average for each activity and each subject `aveData`
- `get_dataset.R`
This is a helper program to create a data frame in the test and training sets.

## How to Run
- Make sure both the `run_analysis.R` and `get_dataset.R` are in the working directory;
- Make sure that all the relevant data files are also in the working directory.