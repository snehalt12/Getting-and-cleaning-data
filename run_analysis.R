
# download file 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "UCI HAR Dataset"
if (!file.exists(fileName)) {
  download.file(url, "./getdata-projectfiles-UCI HAR Dataset.zip")
  unzip("./getdata-projectfiles-UCI HAR Dataset.zip")
}

# read data
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
activity <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

X_test_data <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE)
X_train_data <- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE)

Y_test_data <- read.table("UCI HAR Dataset/test/Y_test.txt", stringsAsFactors=FALSE)
Y_train_data <- read.table("UCI HAR Dataset/train/Y_train.txt", stringsAsFactors=FALSE)

subject_test_data <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors=FALSE)
subject_train_data <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors=FALSE)

# Merges the training and the test sets to create one data set.

X_data <- rbind(X_test_data, X_train_data)
Y_data <- rbind(Y_test_data, Y_train_data)
subject_data <- rbind(subject_test_data, subject_train_data)

names(X_data) <- features$V2
names(Y_data) <- 'activity'
names(subject_data) <- 'subject'

X_Y_data_combine <- cbind(X_data, Y_data)
combine_data <- cbind(X_Y_data_combine, subject_data)

# Extracts only the measurements on the mean and standard deviation for each measurement.

meanstdFeaturesNames <- features[grepl(".*mean|.*std", features$V2),]
subsetColumnNames <- c(meanstdFeaturesNames$V2, 'activity','subject')
subsetdata <- subset(combine_data, select=subsetColumnNames)

# Uses descriptive activity names to name the activities in the data set

subsetdata$activity <- as.character(factor(subsetdata$activity, levels = activity$V1, labels = activity$V2))

# Appropriately labels the data set with descriptive variable names.

colnames(subsetdata) <- gsub("^t", "time", colnames(subsetdata))
colnames(subsetdata) <- gsub("^f", "frequency", colnames(subsetdata))
colnames(subsetdata) <- gsub("BodyBody", "Body", colnames(subsetdata))
colnames(subsetdata) <- gsub("Mag", "Magnitude", colnames(subsetdata))
colnames(subsetdata) <- gsub("Acc", "Acceleration", colnames(subsetdata))
colnames(subsetdata) <- gsub("Gyro", "Gyroscope", colnames(subsetdata))
colnames(subsetdata) <- gsub("Freq", "Frequency", colnames(subsetdata))
colnames(subsetdata) <- gsub("std", "StandardDeviation", colnames(subsetdata))

# From above dataset, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.

tidyDataset <- aggregate(. ~subject+activity, subsetdata, mean)
tidyDataset <- tidyDataset[order(tidyDataset$subject),]

write.table(tidyDataset,"tidydataset.txt",sep="\t",row.names=FALSE)


