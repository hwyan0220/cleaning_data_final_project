rm(list = ls())
library(dplyr)


# process training dataset
# load training data, training activity label and training subject
tr <- read.table('./train/X_train.txt')
trl <- read.table('./train/y_train.txt')
trs <- read.table('./train/subject_train.txt')

# load feature label
fl <- read.table('./features.txt', stringsAsFactors = F)
# load activity label
al <- read.table('./activity_labels.txt', stringsAsFactors = F)
colnames(al) <- c('activity', 'activity_desc')
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
# testing data
test <- cbind(tes, tel, te)
names(test) <- names

# clean up workspace
rm(list = c('fl', 'te', 'tel', 'tes', 'tr', 'trs', 'trl'))

# QUESTION NUMBER 1 - combine train and test into one data set
dat <- rbind(train, test)

# QUESTION NUMBER 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
dat1 <- dat[,(grepl('mean', names)|grepl('std', names))]
dat1 <- cbind(dat[,c(1:2)], dat1)

# QUESTION NUMBER 3 - Uses Descriptive activity names to name the activities in the data set
dat1 <- merge(dat1, al, by = 'activity', all.x = TRUE)

# QUESTION NUMBER 4 - Appropriately labels the data set with descriptive variable names. 
# this is done

# QUESTION NUMBER 5 - create tidy data set with the average of each variable for each activity and each subject
dat1 <- dat1[,c(2:82)]
dat2 <- dat1                          %>%
        group_by(subject, activity_desc)   %>%
        summarise_each(funs(mean))

write.table(dat2, 'tidydata.txt', row.names = FALSE)

