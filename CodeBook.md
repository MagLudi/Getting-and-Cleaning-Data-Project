Overview:
The script run_analysis.r preforms the following steps provided in the course project:
    1: Merges the training and the test sets to create one data set.
    2: Extracts only the measurements on the mean and standard deviation for each measurement. 
    3: Uses descriptive activity names to name the activities in the data set
    4: Appropriately labels the data set with descriptive variable names. 
    5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Step 1 is completed by using rbind() to combind the X data sets, Y data sets, and subject data sets into their own files.
Step 2 reformats the combined X data set so that it contains only the mean and standard deviation before assigning the correct names provided by features.txt
In step 3, the combined Y data set is updated using the appropriate ID and activity names provided by activity_labes.txt.
The function cbind is used in Step to combine all three data files into one after all the collumns with vage names have been fixed.
In the last step ddply is used to generate a new, cleaner data set before uploading a file called averages.txt into the working directory.

Variable names:
  -xTrain: contains data from X_train.txt
  -yTrain: contains data from y_train.txt
  -subjectTrain: contains data from subject_train.txt
  -xTest: contains data from X_test.txt
  -yTest: contains data from y_test.txt
  -subjectTest: contains data from subject_test.txt
  -dataX: merge of xTrain and xTest
  -dataY: merge of yTrain and yTest
  -subjectData: merge of subjectTrain and subjectTest
  -meanStdIndices: a numeric vector used to extract the desired data in dataX
  -allData: contains the merged data of dataX, dataY, and subjectData after processing and formatting
  -features/activity: contains the names for dataX/dataY which is provided by features.txt/activity_labes.txt
  -averages: the tidied up data set with the average of each variable for each activity and each subject