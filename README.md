Data-Cleaning
=============

The data processing contains eight major steps, which are described below.

## Step 1

Set working dierectory

## Step 2

Train data and test data were loaded separately, along with the activity lable and subject id.

## Step 3

Different components wre combined together to form train data and test data. Finally, train data and test data were merged together.

## Step 4

Variable names were changed according to the **features.txt** file.

## Step 5

Any variable name containing **mean** or **std** were detected and labeled for further analysis.

## Step 6

Only mean and standard deviation of each feature were extracted from full data. Also, activity names were changed to character description according to file **activity_labels.txt**.

## Step 7

With this sub data, mean for each activity and subject of each feature was calculated.

## Step 8

Output the final data set in **.txt** format.
