# library(dplyr)

# Import feature and activty labels

features <- read.table("UCI HAR Dataset\\features.txt",header = FALSE)
activitylabels <- read.table("UCI HAR Dataset\\activity_labels.txt",header = FALSE)

# Rename columns for activities

activitiesRename <- rename(activitylabels, ActivityCode = V1, Activity= V2)

# Convert features to vector

featuresVector <- as.vector(features[,2])

# Import test data

testx <- read.table("UCI HAR Dataset\\test\\X_test.txt", header = FALSE)
testy <- read.table("UCI HAR Dataset\\test\\y_test.txt",header = FALSE)
testsubject <- read.table("UCI HAR Dataset\\test\\subject_test.txt",header = FALSE)

# Rename test data

testyrename <- rename(testy, ActivityCode = V1)
testsubjectrename <- rename(testsubject, SubjectNumber = V1)

# Rename testX Columns

colnames(testx) <- featuresVector

# Import training data

trainx <- read.table("UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
trainy <- read.table("UCI HAR Dataset\\train\\y_train.txt",header = FALSE)
trainsubject <- read.table("UCI HAR Dataset\\train\\subject_train.txt",header = FALSE)

# Rename training data

trainyrename <- rename(trainy, ActivityCode = V1)
trainsubjectrename <- rename(trainsubject, SubjectNumber = V1)

# Rename trainX Columns

colnames(trainx) <- featuresVector

# Combine Test Columns

testmergecol <- cbind.data.frame(testsubjectrename,testyrename,testx)

# Combine Training Columns

trainmergecol <- cbind.data.frame(trainsubjectrename,trainyrename,trainx)

# Combine Test & Training Data Frames

datamergerow <- bind_rows(testmergecol,trainmergecol)

# Lookup & merge activity name

activitylookup <- left_join(datamergerow,activitiesRename, by = "ActivityCode")

# Subset Columns For Mean & Std And Drop Activity Code

sd <- select(activitylookup,SubjectNumber,Activity,match(colnames(activitylookup)[grep("mean()",colnames(activitylookup),fixed = TRUE)],names(activitylookup)),match(colnames(activitylookup)[grep("std()",colnames(activitylookup),fixed = TRUE)],names(activitylookup)))

# Return new grouped dataset

gds <- sd %>% 
        group_by(SubjectNumber,Activity) %>% 
        summarise_each(funs(mean))

# Write grouped data set to text file

write.table(gds,file = "SamsungAccelerometerAnalysis.txt",sep = ",", row.names = FALSE)

