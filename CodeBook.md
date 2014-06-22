# Getting and Cleaning Data Code Book

## `Subject.ID`
Type: Integer
Value: 1-30 inclusive
Description: ID of each subject in the experiment. This is taken from the 'test/subject_test.txt' and 'train/subject_train.txt'

## `Activity`
Type: Character
Value:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING
Description: Activity the subject underwent for each observation

## Other variables
Type: Numeric
Value: bounded between -1 and 1
Description: 561 feature measurements for each observation. The full list and explanation can be found at the following link:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)