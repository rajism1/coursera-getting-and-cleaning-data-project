# coursera-getting-and-cleaning-data-project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.\
data has been collected from the accelerometers from the Samsung Galaxy S smartphone.

tidydata.txt   contains the data set.\
CodeBook.md  is the code book, which describes the contents of the data set.\
run_analysis.R  is the R script that was used to create the data set.


The R script, run_analysis.R, does the following:

Download the dataset if it does not already exist in the working directory\
Loads both the training and test datasets, also Load the activity and feature.\
keep only those columns which reflect a mean or standard deviation\
Loads the activity and subject data for each dataset, and merges those columns with the dataset\
Merges the two datasets\
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.\

