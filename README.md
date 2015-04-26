This is part of the project for the Coursera course "Getting and Cleaning Data".

The original data was downloaded and unzipped.  All subsequent data processing instructions to convert this data into the result set, results.txt, is in
run_Analysis.R.  More information on the data is in codebook.txt.

In a nutshell, here's what run_Analysis does
More extensive comments are in the code
1.  Load each of the files, tidy and subset them as required (applying readable column labels, activity values and subsetting to eliminate unnecessary fields)
2.  Combine all three test-related data sets into one
3.  Combine all three training-related data sets into one
4.  Merge the test and training data sets into one
5.  Create the smaller data set by grouping and summarizing

Note: 
The instructions were to extract "only the measurements on the mean and standard deviation for each measurement".  Accordingly I included only columns that ended with mean() or std().  There are also columns with mean embedded in the name, like "angle(tBodyGyroJerkMean,gravityMean)".  These are not included but can be with an easy adjustment to the desiredEntries array in run_Analysis.R.



