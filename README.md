# SamsungAccelerometerAnalysis

## Setup

The data to be analysed is accelerometer & gyroscope data from the Samsung Galaxy S Smartphone.
The run_analysis.R script will summarise the data for the mean and standard deviation across multiple test subjects and activities.

## Expirimental Design & Background

30 subjects have been split into two groups
9 subjects are in the test group and 21 subjects are in the training group
Each subject perfoms 6 activities, listed below;

* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting 
* Standing
* Laying

Raw accelerometer and gyroscope data is captured for each activity per subject for analysis. 

## Raw Data

The raw data analysed within the UCI HAR DATASET folder and it's sub folders by run_analysis.R is listed below;

* activity_labels.txt 
 * This file acts as a lookup table for the specific activities performed by the subjects
* features.txt
 * This file holds the full list of measurements taken and calculations created from the raw accelerometer & gyroscope data
* subject_test.txt
 * This file holds a single column of test subjects repeated in line with the number of measurements taken per activity.
* X_test.txt
 * This file holds all the test measurement data without column names or subject & activity labels.
* Y_test.txt
 * This file holds a single column of activities repeated in line with the number of measurements taken per test subject.
* subject_train.txt
 * This file holds a single column of training subjects repeated in line with the number of measurements taken per activity.
* X_train.txt
 * This file holds all the training measurement data without column names or subject & activity labels.
* Y_train.txt
 * This file holds a single column of activities repeated in line with the number of measurements taken per training subject.

Data from the training and test sub folder "Inertial Signals" was ignored as it was not required for the analysis.

The files will be combined into a single file of test and training subjects with columns and row headings matched 
and descriptive names added where applicable so the mean and standard deviation data can be summarised per subject 
and activity.

## Transformation Process

1. read.table is used on features.txt and the result bound to variable features.
2. read.table is used on activity_labels.txt and the result is bound to variable activitylabels.
3. The columns for activitylabels data frame are renamed as such, V1 = ActivityCode and V2 = Activity and bound to variable activitiesrename.
4. The 2nd column of the features data frame is converted to a vector for later application to the measurement data.
5. read.table is used on X_test.txt, Y_test.txt and subject_test.txt and the data written to the following corresponding variables.
 1. testx
 2. testy
 3. testsubject
6. The column V1 for testy variable is renamed to ActivityCode and bound to variable testyrename.
7. The column V1 for testsubject variable is renamed to SubjectNumber and bound to variable testsubjectrename.
8. The colnames function is applied to the testx data set using the features vector.
9. read.table is used on X_train.txt, Y_train.txt and subject_train.txt and the data written to the following corresponding variables.
 1. trainx
 2. trainy
 3. trainsubject
10. The column V1 for trainy variable is renamed to ActivityCode and bound to variable trainyrename.
11. The column V1 for trainsubject variable is renamed to SubjectNumber and bound to variable trainsubjectrename.
12. The colnames function is applied to the trainx data set using the features vector.
13. cbind.data.frame is applied to testsubjectrename, testyrename and testx variables and bound to testmergecol variable.
14. cbind.data.frame is applied to trainsubjectrename, trainyrename and trainx variables and bound to trainmergecol variable.
15. dplyr bind_rows is applied to testmergecol and trainmergecol and bound to datamergerow variable.
16. dply left_join is applied to datamergerow and activitiesrename variables to add the descriptive activity name results are bound to variable activitylookup.
17. select, match and grep functions are combind to return only the SubjectNumber, Activity and any variable column contaning mean() or std() and the result bound to variable sd.
18. sd dataset is grouped on subjectnumber and activity and the mean is returned for all other columns is returned. Results are bound to gds variable.
19. contents of the gds variable are written to a text file in the wokring directory in comma seperated format.