Getting and Cleaning Data Course Project
================

------------------------------------------------------------------------

Introduction
------------

The purpose of this project is to prepare a tidy dataset from data collected from the accelerometers from the Samsung Galaxy S smartphone for later analysis. Here is the link for the data : <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

This repo contains following files : \* run\_analysis.R - R script for data transformations into tidydataset \* CodeBook.md - Describes the variables, the data,and any transformations performed to clean up the data \* tidydataset.txt - tidy dataset after transformations

### Download the zip file and unzip the data :

``` r
# download file 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "UCI HAR Dataset"
if (!file.exists(fileName)) {
  download.file(url, "./getdata-projectfiles-UCI HAR Dataset.zip")
  unzip("./getdata-projectfiles-UCI HAR Dataset.zip")
}
```

### Read training and test data :

``` r
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
activity <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)

X_test_data <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE)
X_train_data <- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE)

Y_test_data <- read.table("UCI HAR Dataset/test/Y_test.txt", stringsAsFactors=FALSE)
Y_train_data <- read.table("UCI HAR Dataset/train/Y_train.txt", stringsAsFactors=FALSE)

subject_test_data <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors=FALSE)
subject_train_data <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors=FALSE)
```

------------------------------------------------------------------------

### Merges the training and the test sets to create one data set.

Lets look at the dimensions before merging :

dimension for feature vector variables data,

``` r
dim(X_test_data)
```

    ## [1] 2947  561

``` r
dim(X_train_data)
```

    ## [1] 7352  561

dimension for activity data,

``` r
dim(Y_test_data)
```

    ## [1] 2947    1

``` r
dim(Y_train_data)
```

    ## [1] 7352    1

dimension for subject data,

``` r
dim(subject_test_data)
```

    ## [1] 2947    1

``` r
dim(subject_train_data)
```

    ## [1] 7352    1

merge the training and test dataset (features, activity and subject) using rbind,

``` r
X_data <- rbind(X_test_data, X_train_data)
Y_data <- rbind(Y_test_data, Y_train_data)
subject_data <- rbind(subject_test_data, subject_train_data)
```

Now add the column names to the merge dataset

``` r
names(X_data) <- features$V2
names(Y_data) <- 'activity'
names(subject_data) <- 'subject'
```

combine all three dataset in one dataset using cbind :

``` r
X_Y_data_combine <- cbind(X_data, Y_data)
combine_data <- cbind(X_Y_data_combine, subject_data)
```

dimension for the combined dataset

``` r
dim(combine_data)
```

    ## [1] 10299   563

------------------------------------------------------------------------

### Extracts only the measurements on the mean and standard deviation for each measurement.

For analysis purpose we need only mean and standard deviation for each variables so in this step we have subset the combine\_data based on keyword mean | standard deviation.

``` r
meanstdFeaturesNames <- features[grepl(".*mean|.*std", features$V2),]
subsetColumnNames <- c(meanstdFeaturesNames$V2, 'activity','subject')
subsetdata <- subset(combine_data, select=subsetColumnNames)
```

------------------------------------------------------------------------

### Uses descriptive activity names to name the activities in the data set

update the numeric activity number using descriptive activity names from activity data read (from activity\_labels.txt) :

``` r
subsetdata$activity <- as.character(factor(subsetdata$activity, levels = activity$V1, labels = activity$V2))
```

### Appropriately labels the data set with descriptive variable names.

``` r
colnames(subsetdata) <- gsub("^t", "time", colnames(subsetdata))
colnames(subsetdata) <- gsub("^f", "frequency", colnames(subsetdata))
colnames(subsetdata) <- gsub("BodyBody", "Body", colnames(subsetdata))
colnames(subsetdata) <- gsub("Mag", "Magnitude", colnames(subsetdata))
colnames(subsetdata) <- gsub("Acc", "Acceleration", colnames(subsetdata))
colnames(subsetdata) <- gsub("Gyro", "Gyroscope", colnames(subsetdata))
colnames(subsetdata) <- gsub("Freq", "Frequency", colnames(subsetdata))
colnames(subsetdata) <- gsub("std", "StandardDeviation", colnames(subsetdata))
```

After updating the column names in dataset look at the column names :

``` r
colnames(subsetdata)
```

    ##  [1] "timeBodyAcceleration-mean()-X"                             
    ##  [2] "timeBodyAcceleration-mean()-Y"                             
    ##  [3] "timeBodyAcceleration-mean()-Z"                             
    ##  [4] "timeBodyAcceleration-StandardDeviation()-X"                
    ##  [5] "timeBodyAcceleration-StandardDeviation()-Y"                
    ##  [6] "timeBodyAcceleration-StandardDeviation()-Z"                
    ##  [7] "timeGravityAcceleration-mean()-X"                          
    ##  [8] "timeGravityAcceleration-mean()-Y"                          
    ##  [9] "timeGravityAcceleration-mean()-Z"                          
    ## [10] "timeGravityAcceleration-StandardDeviation()-X"             
    ## [11] "timeGravityAcceleration-StandardDeviation()-Y"             
    ## [12] "timeGravityAcceleration-StandardDeviation()-Z"             
    ## [13] "timeBodyAccelerationJerk-mean()-X"                         
    ## [14] "timeBodyAccelerationJerk-mean()-Y"                         
    ## [15] "timeBodyAccelerationJerk-mean()-Z"                         
    ## [16] "timeBodyAccelerationJerk-StandardDeviation()-X"            
    ## [17] "timeBodyAccelerationJerk-StandardDeviation()-Y"            
    ## [18] "timeBodyAccelerationJerk-StandardDeviation()-Z"            
    ## [19] "timeBodyGyroscope-mean()-X"                                
    ## [20] "timeBodyGyroscope-mean()-Y"                                
    ## [21] "timeBodyGyroscope-mean()-Z"                                
    ## [22] "timeBodyGyroscope-StandardDeviation()-X"                   
    ## [23] "timeBodyGyroscope-StandardDeviation()-Y"                   
    ## [24] "timeBodyGyroscope-StandardDeviation()-Z"                   
    ## [25] "timeBodyGyroscopeJerk-mean()-X"                            
    ## [26] "timeBodyGyroscopeJerk-mean()-Y"                            
    ## [27] "timeBodyGyroscopeJerk-mean()-Z"                            
    ## [28] "timeBodyGyroscopeJerk-StandardDeviation()-X"               
    ## [29] "timeBodyGyroscopeJerk-StandardDeviation()-Y"               
    ## [30] "timeBodyGyroscopeJerk-StandardDeviation()-Z"               
    ## [31] "timeBodyAccelerationMagnitude-mean()"                      
    ## [32] "timeBodyAccelerationMagnitude-StandardDeviation()"         
    ## [33] "timeGravityAccelerationMagnitude-mean()"                   
    ## [34] "timeGravityAccelerationMagnitude-StandardDeviation()"      
    ## [35] "timeBodyAccelerationJerkMagnitude-mean()"                  
    ## [36] "timeBodyAccelerationJerkMagnitude-StandardDeviation()"     
    ## [37] "timeBodyGyroscopeMagnitude-mean()"                         
    ## [38] "timeBodyGyroscopeMagnitude-StandardDeviation()"            
    ## [39] "timeBodyGyroscopeJerkMagnitude-mean()"                     
    ## [40] "timeBodyGyroscopeJerkMagnitude-StandardDeviation()"        
    ## [41] "frequencyBodyAcceleration-mean()-X"                        
    ## [42] "frequencyBodyAcceleration-mean()-Y"                        
    ## [43] "frequencyBodyAcceleration-mean()-Z"                        
    ## [44] "frequencyBodyAcceleration-StandardDeviation()-X"           
    ## [45] "frequencyBodyAcceleration-StandardDeviation()-Y"           
    ## [46] "frequencyBodyAcceleration-StandardDeviation()-Z"           
    ## [47] "frequencyBodyAcceleration-meanFrequency()-X"               
    ## [48] "frequencyBodyAcceleration-meanFrequency()-Y"               
    ## [49] "frequencyBodyAcceleration-meanFrequency()-Z"               
    ## [50] "frequencyBodyAccelerationJerk-mean()-X"                    
    ## [51] "frequencyBodyAccelerationJerk-mean()-Y"                    
    ## [52] "frequencyBodyAccelerationJerk-mean()-Z"                    
    ## [53] "frequencyBodyAccelerationJerk-StandardDeviation()-X"       
    ## [54] "frequencyBodyAccelerationJerk-StandardDeviation()-Y"       
    ## [55] "frequencyBodyAccelerationJerk-StandardDeviation()-Z"       
    ## [56] "frequencyBodyAccelerationJerk-meanFrequency()-X"           
    ## [57] "frequencyBodyAccelerationJerk-meanFrequency()-Y"           
    ## [58] "frequencyBodyAccelerationJerk-meanFrequency()-Z"           
    ## [59] "frequencyBodyGyroscope-mean()-X"                           
    ## [60] "frequencyBodyGyroscope-mean()-Y"                           
    ## [61] "frequencyBodyGyroscope-mean()-Z"                           
    ## [62] "frequencyBodyGyroscope-StandardDeviation()-X"              
    ## [63] "frequencyBodyGyroscope-StandardDeviation()-Y"              
    ## [64] "frequencyBodyGyroscope-StandardDeviation()-Z"              
    ## [65] "frequencyBodyGyroscope-meanFrequency()-X"                  
    ## [66] "frequencyBodyGyroscope-meanFrequency()-Y"                  
    ## [67] "frequencyBodyGyroscope-meanFrequency()-Z"                  
    ## [68] "frequencyBodyAccelerationMagnitude-mean()"                 
    ## [69] "frequencyBodyAccelerationMagnitude-StandardDeviation()"    
    ## [70] "frequencyBodyAccelerationMagnitude-meanFrequency()"        
    ## [71] "frequencyBodyAccelerationJerkMagnitude-mean()"             
    ## [72] "frequencyBodyAccelerationJerkMagnitude-StandardDeviation()"
    ## [73] "frequencyBodyAccelerationJerkMagnitude-meanFrequency()"    
    ## [74] "frequencyBodyGyroscopeMagnitude-mean()"                    
    ## [75] "frequencyBodyGyroscopeMagnitude-StandardDeviation()"       
    ## [76] "frequencyBodyGyroscopeMagnitude-meanFrequency()"           
    ## [77] "frequencyBodyGyroscopeJerkMagnitude-mean()"                
    ## [78] "frequencyBodyGyroscopeJerkMagnitude-StandardDeviation()"   
    ## [79] "frequencyBodyGyroscopeJerkMagnitude-meanFrequency()"       
    ## [80] "activity"                                                  
    ## [81] "subject"

------------------------------------------------------------------------

### From above dataset, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Avergage each variable in the dataet created in the above step by subject and activity and then order the datset by subject. Then write the data from dataframe to txt file using write.table.

``` r
tidyDataset <- aggregate(. ~subject+activity, subsetdata, mean)
tidyDataset <- tidyDataset[order(tidyDataset$subject),]

write.table(tidyDataset,"tidydataset.txt",sep="\t",row.names=FALSE)
```

Dimension of tidydatset :

``` r
dim(tidyDataset)
```

    ## [1] 180  81
