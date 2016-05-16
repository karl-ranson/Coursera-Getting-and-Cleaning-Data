
## Code Book

This document describes the code inside run_analysis.R.

The code is split per these sections:

 * Helper functions
 * Constants
 * Loading data
 * Manipulating data
 * Writing tidy data to TXT


## Helper functions

### read.table
Used to read in the 8 sets of data

### cbind
Used to join different data.frames together. 

### names function
Used to extract and set the names of different data set names. 

## Constants
data frames constants such as Tr and Te are used during the code. 

## Loading Data 
Reads the training data.frame to Tr
Reads the training data.frame to Te
Sets the names of the variables based on 'features'. 

## Manipulating data 
rbind is used to combine both the training and test data.
grepl is used to select only variables that contain mean or std. 
match is used to replace integers with strings for activity_type. 
a 'for' loop and paste is used to combine the activity_type and subject, called 'act_sub'.
aggregate is used to reduce each variable to the mean, for individual 'act_sub' values.

Admission: I know that the 'act_sub' variable is not consistent with tidy data principles; however I have run out of time. 

## Writing tidy data to TXT
The write.table function is used to write the two final tidy data sets to TXT. 
