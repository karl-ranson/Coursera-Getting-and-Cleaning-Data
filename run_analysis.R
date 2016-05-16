# run_analysis.R

# 

# fileUrl <- "https://d396qusza40orc.cloudfront.net/
# getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


# Load variable names
activity_labels <- read.table("./data/UCIHARDataset/activity_labels.txt")[,2]
features <- read.table("./data/UCIHARDataset/features.txt")[,2]

# Create combined Test data set, called 'Te'
Te <- read.table("./data/UCIHARDataset/test/y_test.txt",header=FALSE, 
                 col.names="activity_type",sep=" ")
Te$subject <- as.matrix(read.table("./data/UCIHARDataset/test/subject_test.txt",
                  header=FALSE, col.names="subject"))
X_test <- read.table("./data/UCIHARDataset/test/X_test.txt")
names(X_test) <- features
Te <- cbind(Te,X_test)
Te <- cbind(data_type=matrix(rep("test", nrow(Te)),nrow(Te),1), Te)

# Create combined Training data set, called 'Tr'
Tr <- read.table("./data/UCIHARDataset/train/y_train.txt",header=FALSE, 
                 col.names="activity_type",sep=" ")
Tr$subject <- as.matrix(read.table("./data/UCIHARDataset/train/subject_train.txt",
                              header=FALSE, col.names="subject"))
X_train <- read.table("./data/UCIHARDataset/train/X_train.txt")
names(X_train) <- features
Tr <- cbind(Tr,X_train)
Tr <- cbind(data_type=matrix(rep("train", nrow(Tr)),nrow(Tr),1), Tr)


# Combine 2 tables
rownames(Tr)<- c(nrow(Te)+1:nrow(Tr))
rownames(Tr$subject)<- c(nrow(Te)+1:nrow(Tr))
# attributes(Te$subject) <- NULL
# attributes(Tr$subject) <- NULL
T <- rbind(Te,Tr)

# Part 2: Extract only columns that measures mean & std
Tnames <- names(T)
Tn<- Tnames[grepl("mean|std|dev",Tnames,ignore.case = TRUE)]
# T2 <- cbind(T[,1:3],T[Tn]) #include the 3 original columns at the start 
T2 <- data.frame(T[,1:3],T[Tn]) #include the 3 original columns at the start 

# Part 3: Descriptive activity names
activity_replace <- data.frame(activity_no=c(1:6),activity_labels) #Create a matrix to compare
T2$activity_type <- activity_replace$activity_labels[match(T2$activity_type,activity_replace$activity_no)]

# Part 4: Descriptive Variables - already done throughout code above

# Export to CSV
fileexp <- "./data/UCIHARDatasetTidy-MeansStd.csv"
write.csv(T2,fileexp)

# Part 5: Summarising each variable down to a mean by activity and subject

for (i in 1:length(T2$activity_type)) {
      T2$act_sub[i] <- paste(toString(T2$activity_type[i]),toString(T2$subject[i]))
}     
library('dplyr')
# ft <- T2[,4:90]
# ft <- T2
activity_labels <- read.table("./data/UCIHARDataset/activity_labels.txt")[,2]
features <- read.table("./data/UCIHARDataset/features.txt")[,2]

# Create combined Test data set, called 'Te'
Te <- read.table("./data/UCIHARDataset/test/y_test.txt",header=FALSE, 
                 col.names="activity_type",sep=" ")
Te$subject <- as.matrix(read.table("./data/UCIHARDataset/test/subject_test.txt",
                                   header=FALSE, col.names="subject"))
X_test <- read.table("./data/UCIHARDataset/test/X_test.txt")
names(X_test) <- features
Te <- cbind(Te,X_test)
Te <- cbind(data_type=matrix(rep("test", nrow(Te)),nrow(Te),1), Te)

# Create combined Training data set, called 'Tr'
Tr <- read.table("./data/UCIHARDataset/train/y_train.txt",header=FALSE, 
                 col.names="activity_type",sep=" ")
Tr$subject <- as.matrix(read.table("./data/UCIHARDataset/train/subject_train.txt",
                                   header=FALSE, col.names="subject"))
X_train <- read.table("./data/UCIHARDataset/train/X_train.txt")
names(X_train) <- features
Tr <- cbind(Tr,X_train)
Tr <- cbind(data_type=matrix(rep("train", nrow(Tr)),nrow(Tr),1), Tr)


# Combine 2 tables
rownames(Tr)<- c(nrow(Te)+1:nrow(Tr))
rownames(Tr$subject)<- c(nrow(Te)+1:nrow(Tr))
# attributes(Te$subject) <- NULL
# attributes(Tr$subject) <- NULL
T <- rbind(Te,Tr)

# Part 2: Extract only columns that measures mean & std
Tnames <- names(T)
Tn<- Tnames[grepl("mean|std|dev",Tnames,ignore.case = TRUE)]
# T2 <- cbind(T[,1:3],T[Tn]) #include the 3 original columns at the start 
T2 <- data.frame(T[,1:3],T[Tn]) #include the 3 original columns at the start 

# Part 3: Descriptive activity names
activity_replace <- data.frame(activity_no=c(1:6),activity_labels) #Create a matrix to compare
T2$activity_type <- activity_replace$activity_labels[match(T2$activity_type,activity_replace$activity_no)]

# Part 4: Descriptive Variables - already done throughout code above

# Export to TXT
fileexp <- "./data/UCIHARDatasetTidy-MeansStd.txt"
write.table(T2,fileexp)

# Part 5: Summarising each variable down to a mean by activity and subject

for (i in 1:length(T2$activity_type)) {
      T2$act_sub[i] <- paste(toString(T2$activity_type[i]),toString(T2$subject[i]))
}     # Creates a variable that is a combination of activity_type and subject   
library('dplyr')
ft <- T2[,4:90]
T5 <- aggregate(.~act_sub, data=ft, mean)

# Export to TXT
fileexp <- "./data/UCIHARDatasetTidy-Summary.txt"
write.table(T5,fileexp)
