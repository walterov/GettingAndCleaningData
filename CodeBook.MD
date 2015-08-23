---
title: "CodeBook for dataset -Getting And Cleaning Data Course Project"
author: "Walter Oliver"
date: "Sunday, August 23, 2015"
output: html_document
---
Data source
-----------
The dataset included in this repo was created per the assigments instructions and derived from the "Human Activity Recognition Using Smartphones Data Set" available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variables 
-----------------
The description for the feature selection (varaibles used) is provided by the "README" and "features.txt" files in the original data set. Please read those files to learn about the feature selection for this data set. 

The features in my data set are based on the instructions for the project, it asks to extract "only the measurements on the mean and standard deviation for each measurement." Hence, I extracted all the variables that included the "mean" and "std" string patterns as part of their names. These are a total of 79 variables with names such as "tBodyAcc-mean()-X", "tBodyAccMag-std()", "fBodyGyro-std()-Y", "fBodyBodyGyroMag-meanFreq()", and so for. The instructions further ask to create a data set "with the average of each variable for each activity and each subject". So, in the submitted data set, each row corresponds to the Activity name, Subject id, and the average for each of the extracted variables for its corresponding activity and subject id, for example, the output of "head(finalData[,1:5],40)", would correspond to all the activities for the Subjects 1 and 2 and the corresponding average value for each of the first 3 (out of 79) variables, here is the output:
```{r}
             Activity Subject tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
1              LAYING       1         0.2215982      -0.040513953        -0.1132036
2             SITTING       1         0.2612376      -0.001308288        -0.1045442
3            STANDING       1         0.2789176      -0.016137590        -0.1106018
4             WALKING       1         0.2773308      -0.017383819        -0.1111481
5  WALKING_DOWNSTAIRS       1         0.2891883      -0.009918505        -0.1075662
6    WALKING_UPSTAIRS       1         0.2554617      -0.023953149        -0.0973020
7              LAYING       2         0.2813734      -0.018158740        -0.1072456
8             SITTING       2         0.2770874      -0.015687994        -0.1092183
9            STANDING       2         0.2779115      -0.018420827        -0.1059085
10            WALKING       2         0.2764266      -0.018594920        -0.1055004
11 WALKING_DOWNSTAIRS       2         0.2776153      -0.022661416        -0.1168129
12   WALKING_UPSTAIRS       2         0.2471648      -0.021412113        -0.1525139
```

