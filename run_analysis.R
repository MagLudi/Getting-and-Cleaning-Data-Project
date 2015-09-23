#Step 1: Merges the training and the test sets to create one data set.

xTrain <- read.table("./data/train/X_train.txt")
yTrain <- read.table("./data/train/y_train.txt")
subjectTrain <- read.table("./data/train/subject_train.txt")

xTest <- read.table("./data/test/X_test.txt")
yTest <- read.table("./data/test/y_test.txt")
subjectTest <- read.table("./data/test/subject_test.txt")

##combining the X data sets
dataX <- rbind(xTrain, xTest)
##combining the Y data sets
dataY <- rbind(yTrain, yTest)
##combining the subject data sets
subjectData <- rbind(subjectTrain, subjectTest)

#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./data/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])

##getting the subsets and making sure the column names are correct for dataX
dataX <- dataX[, meanStdIndices]
names(dataX) <- features[meanStdIndices, 2]

#Step 3: Uses descriptive activity names to name the activities in the data set.
activity <- read.table("./data/activity_labels.txt")

##updating so that the values have the correct activity names and making sure the column names are correct for dataY
dataY[, 1] <- activity[dataY[, 1], 2]
names(dataY) <- "activity"

#Step 4: Appropriately labels the data set with descriptive variable names.
names(subjectData) <- "subject"
allData <- cbind(dataX, dataY, subjectData)

#Step 5: From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.
library(plyr)

averages <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages, "averages.txt", row.name=FALSE)
