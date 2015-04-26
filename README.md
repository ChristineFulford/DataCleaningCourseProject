This is the codebook for the data file results.txt.
This is part of the project for the Coursera course "Getting and Cleaning Data".

This data is extracted from the data files here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original data was downloaded and unzipped.  All subsequent data processing instructions to convert this data into the result set, results.txt, is in
run_Analysis.R.

Background:
This data was collected from accelerometers worn by 30 subjects subjects as they engaged in 6 activities - walking, walking upstairs, walking downstairs, sitting, standing, lying down.  3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50 Hz.  Experiments were video-recorded to label the data manually.

Code book:

The data:
subject - the subject that the measuresments were taken from (one of 30)
activity - the acvitity the subject was engaged in (one of 6)
The remaining 66 columns are selected readings from the accelerometer.  Each is averaged.

Note: 
The instructions were to extract "only the measurements on the mean and standard deviation for each measurement".  Accordingly I included only columns that ended with mean() or std().  There are also columns with mean embedded in the name, like "angle(tBodyGyroJerkMean,gravityMean)".  These are not included but can be with an easy adjustment to the desiredEntries array in run_Analysis.R.

