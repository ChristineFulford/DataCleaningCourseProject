run_Analysis <- function(x) 
{
	library(dplyr)

	## merge the training and test set into one big set

	## start with the files in the **** root directory ****
	setwd("C:/Users/Christine/R Programs/Getting and Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

	## activity_labels.txt is a 6x1 table of characters separated by line feeds
	## it gives a nice name for each of the activities
	activityLabels <- read.table("activity_labels.txt", header=FALSE, sep="")
	## it's only the V2 column that I'm interested in
	activityLabels <- select(activityLabels, V2)
	## change the title from V2 to activity
	activityLabels <- rename(activityLabels, activity=V2)

	## features.txt is a 561x1 table of characters separated by linefeeds
	## I have removed the column number off the front of each entry for readability using sep="".  
	## If I change my mind about this, I can get it back by specifying sep="\n"
	features <- read.table("features.txt", header=FALSE, sep="", as.is=TRUE)
	## I only need the V2 column
	features <- select(features, V2)

	## we only want the mean and stdev values for each variable
	## desiredEntries is an array identifying these columns
	desiredEntries <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)

	## subset features to only include the desired rows
	## note that features now becomes a char array instead of a data frame
	features <- features[desiredEntries, ]

	## now go to the files in the **** test ****  directory
	setwd("C:/Users/Christine/R Programs/Getting and Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test")
	## subject_test.txt is a 2947 x 1 table of integers representing the subjects
	subjects <- read.table("subject_test.txt", header=FALSE, sep="", as.is=TRUE, colClasses="integer")
	## change the title to subjects
	subjects <- rename(subjects, subject=V1)

	## X_test.x is a 2947 x 561 table of numbers with space as separators
	testData <- read.table("X_test.txt", header=FALSE, sep="", as.is=TRUE) 

	## subset testData to include only the mean and stdDev columns
	testData <- testData[, desiredEntries]

	## set the names of the columns to be the features
	## to give us proper column labels
	names(testData) <- features

	## y_test is a 2947x1 table of integers 1 to 6 representing the activities.  The separators are LF
	activities <- read.table("y_test.txt", header=FALSE, sep="", as.is=TRUE, colClasses="integer")
	## convert the integer values into strings from activityLabels
	activities$activity <- activityLabels$activity[activities$V1]
	## subset to include only the textual activity
	activities <- select(activities, activity)
	
	## combine the test subjects, activities and data with cbind
	test <- cbind(subjects, activities, testData)

	## now go to the files in the **** train ****  directory
	setwd("C:/Users/Christine/R Programs/Getting and Cleaning Data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train")

	## subject_test.txt is a 7352 x 1 table of integers representing the subjects
	subjects <- read.table("subject_train.txt", header=FALSE, sep="", as.is=TRUE, colClasses="integer")
	## change the title to subjects
	subjects <- rename(subjects, subject=V1)

	## X_train.txt is a 7352 x 561 table of numbers with space as separators
	trainData <- read.table("X_train.txt", header=FALSE, sep="", as.is=TRUE) 

	## subset trainData to include only the mean and stdDev columns
	trainData <- trainData[, desiredEntries]

	## set the names of the columns to be the features
	## to give us proper column labels
	names(trainData) <- features

	## y_train is a 2947x1 table of integers 1 to 6 representing the activities.  The separators are LF
	activities <- read.table("y_train.txt", header=FALSE, sep="", as.is=TRUE, colClasses="integer")
	## convert the integer values into strings from activityLabels
	activities$activity <- activityLabels$activity[activities$V1]
	## subset to include only the textual activity
	activities <- select(activities, activity)

	## combine the train subjects, activities and data with cbind
	train <- cbind(subjects, activities, trainData)

	## now combine test and train with rbind
	allData <- rbind(test, train)

	## now create the small table by subject and activity
	group <- group_by(allData, subject, activity)

	## get the mean of each variable
	small <- summarise_each(group, funs(mean))

	## now write out the data set
	setwd("C:/Users/Christine/R Programs/Getting and Cleaning Data")
	write.table(small, file="result.txt", quote=FALSE, row.names=FALSE)
}
