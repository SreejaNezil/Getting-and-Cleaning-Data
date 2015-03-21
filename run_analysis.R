
## The data zip file was downloaded to the current working directory
## Contents of the zip file were extracted to a folder UCIHARDataset
## Reading data from the existing files

########## Course Project Step 1 - Merges the training and the test sets to create one data set

## Read the training Labels data
trainLables <- read.table(".//UCIHARDataset//train//y_train.txt")

## Read the training data set
trainData <- read.table(".//UCIHARDataset//train//x_train.txt")

## Read training subject data
trainSubjects <- read.table(".//UCIHARDataset//train//subject_train.txt")

## Merge all training data into one data frame
TrainingSet <- cbind(trainSubjects, trainLables,trainData)

##########################################################################################

## Read the Test Labels data
testLables <- read.table(".//UCIHARDataset//test//y_test.txt")

## Read the Test data set
testData <- read.table(".//UCIHARDataset//test//x_test.txt")

## Read test subject data
testSubjects <- read.table(".//UCIHARDataset//test//subject_test.txt")

## Merge all test data into one data frame
TestSet <- cbind(testSubjects,testLables,testData)

##########################################################################################

## Merge the training and test data -> this gives 7352 + 2947 = 10299 rows

masterData <- rbind(TrainingSet,TestSet)

########## Course Project Step 1 - Ends here

##=================================================================================================================

########## Course Project Step 4 - Appropriately labels the data set with descriptive variable names
## Read the feature names/column names from the text file
featureNames <- read.table(".//UCIHARDataset//features.txt")
## featureNames is a data frame with 2 columns V1 and V2. V2 contains the activity IDs (numbers 1,2,3,4,5,6)

## Add names for the first 2 columns in the master data frame i.e. Subject ID and activity ID 
varNames <- c("SubjectID", "Activity Names", as.character(featureNames$V2))

## Now set the column names for all 563 columns in the masterData
names(masterData) <- varNames

## was getting duplicate columns error if this is not done
valid_column_names <- make.names(names=names(masterData), unique=TRUE, allow_ = TRUE)
names(masterData) <- valid_column_names

## Please note there are still some extra ... in the column names, however ignoring this they are all meaning full column names

########## Course Project Step 4 - Ends here

##=================================================================================================================

########## Course Project Step 2 - 2.Extracts only the measurements on the mean and standard deviation for each measurement


## Extract the column numbers which contain mean. or sd. in the variable names
x <- which(grepl("mean.|std.", names(masterData), ignore.case = TRUE))

## Load required packages
install.packages("dplyr")
library(dplyr)

## Subset the master data to extract only the required columns/variables
subsetData <- select(masterData,1,2,x)

########## Course Project Step 2 - Ends here

##=================================================================================================================

########## Course Project Step 3 - 3.Uses descriptive activity names to name the activities in the data set

## Activity numbers were stored as intergers in the data frame - converting them to factors
subsetData$Activity.Names <- as.factor(subsetData$Activity.Names)

## Getting a new vector with Activity Names column values mapped to descriptive names

library(plyr)
mappedCol <- mapvalues(subsetData$Activity.Names, from = c("1", "2", "3", "4", "5", "6"), to = c("WALKING",  "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

## Replacing the original column in the dataframe
subsetData$Activity.Names <- mappedCol


########## Course Project Step 3 - Ends here

##=================================================================================================================
########## Course Project Step 4 - Completed Above
##=================================================================================================================

########## Course Project Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

finalDataSet <- subsetData %>% group_by(SubjectID, Activity.Names) %>% summarise_each(funs(mean))

## Writing the final data set into a text file
write.table(finalDataSet, file = "finalDataSet.txt", row.names=FALSE)

########## Course Project Step 5 - Ends here

