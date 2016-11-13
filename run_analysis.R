rm(list = ls())
setwd('C:/Users/M041066/Downloads/Cleaning Data/Project')


# process training dataset
# load training data, training activity label and training subject
tr <- read.table('./train/X_train.txt')
trl <- read.table('./train/y_train.txt')
trs <- read.table('./train/subject_train.txt')
# load feature label
fl <- read.table('./features.txt', stringsAsFactors = F)
# load activity label
al <- read.table('./activity_labels.txt')
# clean activity label for training data
trl <- merge(trl, al, by = 'V1', all = T)
trl <- trl[,2]
# create label vector for dataset
names <- c('subject', 'activity', fl$V2)
# training data
train <- cbind(trs, trl, tr)
names(train) <- names


# process testing dataset
# load test data, test activity label and test subject
te <- read.table('./test/X_test.txt')
tel <- read.table('./test/y_test.txt')
tes <- read.table('./test/subject_test.txt')
# clean activity label for testing data
tel <- merge(tel, al, by = 'V1', all = T)
tel <- tel[,2]
# testing data
test <- cbind(tes, tel, te)
names(test) <- names

# clean up workspace
rm(list = c('al', 'fl', 'te', 'tel', 'tes', 'tr', 'trs', 'trl'))

# QUESTION NUMBER 1 - combine train and test into one data set
dat <- rbind(train, test)

# QUESTION NUMBER 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
# check number of columns to extract
sum(grepl('mean', names))
sum(grepl('std', names))
dat1 <- dat[,(grepl('mean', names)|grepl('std', names))]
dat1 <- cbind(dat[,c(1:2)], dat1)

# QUESTION NUMBER 3 - Uses Descriptive activity names to name the activities in the data set
# this is done

# QUESTION NUMBER 4 - Appropriately labels the data set with descriptive variable names. 
# this is done

# QUESTION NUMBER 5 - create tidy data set with the average of each variable for each activity and each subject

write.table(dat1, 'tidydata.txt')




