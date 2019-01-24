Codebook for Getting and Cleaning Data Course project
================

This codebook is for tidydataset.txt dataset.

------------------------------------------------------------------------

Variables
---------

This tidydataset contains following variables : \* subject \* activity \* 79 variables of the feature vector.

### subject :

subject variable contains the numeric identifier of the subject who carried ot the experiemnet. Its range is from 1 to 30.

### activity :

activity variable is of type character, contains one of the value from below list.

-   WALKING
-   WALKING\_UPSTAIRS
-   WALKING\_DOWNSTAIRS
-   SITTING
-   STANDING
-   LAYING

### Feature vector variables :

All the 79 variables in the fetaure vector are of numeric type and are normalized and bounded withing \[-1, 1\].

#### Time domain variables :

-   Average and Standard Deviation of time body acceleration for 3-axial signals in the X, Y and Z directions.

    -   timeBodyAcceleration-mean()-X
    -   timeBodyAcceleration-mean()-Y
    -   timeBodyAcceleration-mean()-Z

    -   timeBodyAcceleration-StandardDeviation()-X
    -   timeBodyAcceleration-StandardDeviation()-Y
    -   timeBodyAcceleration-StandardDeviation()-Z

-   Average and Standard Deviation of time gravity acceleration for 3-axial signals in the X, Y and Z directions.

    -   timeGravityAcceleration-mean()-X
    -   timeGravityAcceleration-mean()-Y
    -   timeGravityAcceleration-mean()-Z

    -   timeGravityAcceleration-StandardDeviation()-X
    -   timeGravityAcceleration-StandardDeviation()-Y
    -   timeGravityAcceleration-StandardDeviation()-Z

-   Average and Standard Deviation of time body acceleration to obtain jerk signals for 3-axial signals in the X, Y and Z directions.

    -   timeBodyAccelerationJerk-mean()-X
    -   timeBodyAccelerationJerk-mean()-Y
    -   timeBodyAccelerationJerk-mean()-Z

    -   timeBodyAccelerationJerk-StandardDeviation()-X
    -   timeBodyAccelerationJerk-StandardDeviation()-Y
    -   timeBodyAccelerationJerk-StandardDeviation()-Z

-   Average and Standard Deviation of time body gyroscope for 3-axial signals in the X, Y and Z directions.

    -   timeBodyGyroscope-mean()-X
    -   timeBodyGyroscope-mean()-Y
    -   timeBodyGyroscope-mean()-Z

    -   timeBodyGyroscope-StandardDeviation()-X
    -   timeBodyGyroscope-StandardDeviation()-Y
    -   timeBodyGyroscope-StandardDeviation()-Z

-   Average and Standard Deviation of time body gyroscope to obtain jerk signals for 3-axial signals in the X, Y and Z directions.

    -   timeBodyGyroscopeJerk-mean()-X
    -   timeBodyGyroscopeJerk-mean()-Y
    -   timeBodyGyroscopeJerk-mean()-Z

    -   timeBodyGyroscopeJerk-StandardDeviation()-X
    -   timeBodyGyroscopeJerk-StandardDeviation()-Y
    -   timeBodyGyroscopeJerk-StandardDeviation()-Z

-   Average and Standard Deviation of time body acceleration magnitude for 3-axial signals in the X, Y and Z directions.

    -   timeBodyAccelerationMagnitude-mean()

    -   timeBodyAccelerationMagnitude-StandardDeviation()

-   Average and Standard Deviation of time gravity acceleration magnitude for 3-axial signals in the X, Y and Z directions.

    -   timeGravityAccelerationMagnitude-mean()

    -   timeGravityAccelerationMagnitude-StandardDeviation()

-   Average and Standard Deviation of time body acceleration magnitude to obtain jerk signals for 3-axial signals in the X, Y and Z directions.

    -   timeBodyAccelerationJerkMagnitude-mean()

    -   timeBodyAccelerationJerkMagnitude-StandardDeviation()

-   Average and Standard Deviation of time body gyroscopic acceleration magnitude for 3-axial signals in the X, Y and Z directions.

    -   timeBodyGyroscopeMagnitude-mean()

    -   timeBodyGyroscopeMagnitude-StandardDeviation()

-   Average and Standard Deviation of time body gyroscopic acceleration magnitude to obtain jerk signals for 3-axial signals in the X, Y and Z directions.

    -   timeBodyGyroscopeJerkMagnitude-mean()

    -   timeBodyGyroscopeJerkMagnitude-StandardDeviation()

##### Frequency domain variables :

-   Average,Standard Deviation and weighted average of the frequency components(meanFrequency) of frequency body acceleration for 3-axial signals in the X, Y and Z directions.

    -   frequencyBodyAcceleration-mean()-X
    -   frequencyBodyAcceleration-mean()-Y
    -   frequencyBodyAcceleration-mean()-Z

    -   frequencyBodyAcceleration-StandardDeviation()-X
    -   frequencyBodyAcceleration-StandardDeviation()-Y
    -   frequencyBodyAcceleration-StandardDeviation()-Z

    -   frequencyBodyAcceleration-meanFrequency()-X
    -   frequencyBodyAcceleration-meanFrequency()-Y
    -   frequencyBodyAcceleration-meanFrequency()-Z

-   Average,Standard Deviation and weighted average of the frequency components(meanFrequency) of frequency body acceleration to obtain jerk signals for 3-axial signals in the X, Y and Z directions.

    -   frequencyBodyAccelerationJerk-mean()-X
    -   frequencyBodyAccelerationJerk-mean()-Y
    -   frequencyBodyAccelerationJerk-mean()-Z

    -   frequencyBodyAccelerationJerk-StandardDeviation()-X
    -   frequencyBodyAccelerationJerk-StandardDeviation()-Y
    -   frequencyBodyAccelerationJerk-StandardDeviation()-Z

    -   frequencyBodyAccelerationJerk-meanFrequency()-X
    -   frequencyBodyAccelerationJerk-meanFrequency()-Y
    -   frequencyBodyAccelerationJerk-meanFrequency()-Z

-   Average,Standard Deviation and weighted average of the frequency components(meanFrequency) of frequency body gyroscopic acceleration for 3-axial signals in the X, Y and Z directions.

    -   frequencyBodyGyroscope-mean()-X
    -   frequencyBodyGyroscope-mean()-Y
    -   frequencyBodyGyroscope-mean()-Z

    -   frequencyBodyGyroscope-StandardDeviation()-X
    -   frequencyBodyGyroscope-StandardDeviation()-Y
    -   frequencyBodyGyroscope-StandardDeviation()-Z

    -   frequencyBodyGyroscope-meanFrequency()-X
    -   frequencyBodyGyroscope-meanFrequency()-Y
    -   frequencyBodyGyroscope-meanFrequency()-Z

-   Average,Standard Deviation and weighted average of the frequency components(meanFrequency) of frequency body acceleration magnitude for 3-axial signals in the X, Y and Z directions.

    -   frequencyBodyAccelerationMagnitude-mean()

    -   frequencyBodyAccelerationMagnitude-StandardDeviation()

    -   frequencyBodyAccelerationMagnitude-meanFrequency()

-   Average,Standard Deviation and weighted average of the frequency components(meanFrequency) of frequency body acceleration magnitude to obtain jerk signals for 3-axial signals in the X, Y and Z directions.

    -   frequencyBodyAccelerationJerkMagnitude-mean()

    -   frequencyBodyAccelerationJerkMagnitude-StandardDeviation()

    -   frequencyBodyAccelerationJerkMagnitude-meanFrequency()

-   Average,Standard Deviation and weighted average of the frequency components(meanFrequency) of frequency body gyroscopic acceleration magnitude for 3-axial signals in the X, Y and Z directions.

    -   frequencyBodyGyroscopeMagnitude-mean()

    -   frequencyBodyGyroscopeMagnitude-StandardDeviation()

    -   frequencyBodyGyroscopeMagnitude-meanFrequency()

-   Average,Standard Deviation and weighted average of the frequency components(meanFrequency) of frequency body gyroscopic acceleration magnitude to obtain jerk signals for 3-axial signals in the X, Y and Z directions.

    -   frequencyBodyGyroscopeJerkMagnitude-mean()

    -   frequencyBodyGyroscopeJerkMagnitude-StandardDeviation()

    -   frequencyBodyGyroscopeJerkMagnitude-meanFrequency()

------------------------------------------------------------------------

Data
----

The data used to create tidydataset was taken from this site :

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Also full description is available at this site:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

------------------------------------------------------------------------

Transformations
---------------

The following transformation were done on the data to make it tidy dataset:

-   The training and the test datasets were merged to create one data set.

-   Extracted only the measurements on the mean and standard deviation for each measurement.

-   Used descriptive activity names to name the activities in the data set.
    -   WALKING,
    -   WALKING\_UPSTAIRS
    -   WALKING\_DOWNSTAIRS
    -   SITTING
    -   STANDING
    -   LAYING
-   Used descriptive column names.
    -   t - time
    -   f- frequency
    -   Mag - Magnitude
    -   Acc - Acceleration
    -   Gyro - Gyroscope
    -   Freq - Frequency
    -   std - StandardDeviation
    -   BodyBody - Body
-   Created tidy dataset by taking the average of each variable for each activity and each subject and write the dataset to tidydataset.txt

------------------------------------------------------------------------
