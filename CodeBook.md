# Setup

The data to be analysed is accelerometer & gyroscope data from the Samsung Galaxy S Smartphone.
The run_analysis.R script will summarise the data for the mean and standard deviation across multiple test subjects and activities.

# Expirimental Design & Background

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

# Raw Data

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

# Transformation Process

