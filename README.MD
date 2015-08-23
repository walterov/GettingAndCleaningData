---
title: "Getting And Cleaning Data Course Project"
author: "Walter Oliver"
date: "Sunday, August 23, 2015"
output: html_document
---

Introduction
------------
This repository contains my run_analysis.R, FinalDataSet.txt, and CodeBook.MD files for the course project.

The original raw data
------------------

It can be found here:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The features for the test and train data sets are the same:
561 features (unlabeled) can be found in the x_test.txt. 
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

Instructions for the run_analysis.R script and the tidy dataset
-------------------------------------
Prerequisites for the script:

1. Download the zip file with the raw data set mentioned aboved
2. Extract the files and store them in a directory called "~/Data Science/Class Assigments/UCI HAR Dataset"

The script will:

1. Merge the test data into a single data frame
2. Merge the train data into a single data frame
3. Adds needed sequential id columns
4. Adds descriptive labels for the columns
5. Merge the test and train data frames into a single data frame
6. Extracts the "mean" and "std" related variables
7. Generates the independent tidy data set with the average of each variable for each activity and each subject
8. This data set is written to a file named FinalDataSet.txt also found in this repo

The Code Book
-------------------
The CodeBook.MD file included in this repo describes the changes performed to the original raw data and the submitted data set with its variables.



