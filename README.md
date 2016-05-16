# Coursera-Getting-and-Cleaning-Data


## Synopsis

This Readme, Codebook and 'run_analysis.R' Code meets the requirements of the 'Getting and Cleaning Data' course project. 


## Raw Data

The input zip file was downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

It is interpreted that the assignment scope is focused on the 'X_test' and 'X_train' data sets. This submission excludes the 9 files under the "\test\InertialSignals" folder and the 9 files under the "\train\InertialSignals" folder.


## Code Description

describes how run_analysis.R script works.

 * First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and move folder UCI HAR Dataset to 'data' folder in the working directory. Make sure the folder "data" and the run_analysis.R script are both in the current working directory.
 * Second, use source("run_analysis.R") command in RStudio.
 * Third, you will find two output files are generated in the data file:
UCIHARDatasetTidy-MeansStd.txt (10.7 Mb): it contains a data frame called cleanedData with dimensions 10299x90.
UCIHARDatasetTidy-Summary.txt (286 Kb): it contains a data frame called result with dimensions 180x87.
