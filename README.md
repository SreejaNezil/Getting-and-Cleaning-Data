### Getting-and-Cleaning-Data - Course Project submission
###### Tidy Data set created from the Human Activity Recognition Using Smartphones Dataset

The raw data is taken from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Each record in the raw data had the following 
* An identifier of the subject who carried out the experiment
* The type of activity performed,indicated using codes 1,2,3,4,5,6
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
* Triaxial Angular velocity from the gyroscope
* A 561-feature vector with time and frequency domain variables

The raw data present in multiple files was then cleansed and reshaped to make the final tidy data set.
In this final tidy data set, each record indicates
* An identifier of the subject who carried out the experiment
* The type of activity performed 
* Average value calculated for each Subject for each kind of activity for variables indicating the mean and standard deviation of measurements from the experiment


The dataset includes the following files
1. finalDataSet.txt - This is the final data frame writting into a .txt file. It can be read into R data frame using read.table function.
2. Codebook - This file indicates the variables in the finalDataSet and how its values are computed
3. readme - This file gives an overview of the original experiment conducted, how the raw data was collected and also wat the final file contains
4. run_analysis.R - This script contains the steps performed to cleanse the raw data and arrive at the finalDataSet that matches the project requirements.
