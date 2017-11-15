# Getting and Cleaning Data - Course Project
 
 This is the course project for the Getting and Cleaning Data Coursera course.
 The R script, `run_analysis.R`, does the following:
 
 1.Check the working directory(as I had downloaded the data earlier i did not put a code to download it) 
 2. Load the activity and feature info
 3. Loads both the training and test datasets, keeping only those columns which
    reflect a mean or standard deviation
 4. Loads the activity and subject data for each dataset, and merges those
    columns with the dataset
 5. Merges the two datasets
 6. Converts the `activity` and `subject` columns into factors
 7. Creates a tidy dataset that consists of the average (mean) value of each
    variable for each subject and activity pair.
 
 The end result is shown in the file `secondTidySet.txt`.