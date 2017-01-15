The purpose of this project is to analyse human activity data collected by an experiment. 
On this GitHub repo, I have included a readme.md document and a run_anaysis.R script. A tidydata.txt file has been submitted to the coursera website as part of this project.

The steps taken in the run_analysis.R script are:
  1. read data into R (training and test)
  2. process training data and test data seperately to make both data sets complete 
  (i.e. combine activity data, subject label and activity label and add in column labels for all measure variables)
  3. combine training and test data
  4. use summarise_each function from dplyr package to run the analysis on the complete data set generated from step 3.
  
step1
I have used read.table function to read training data, training activity label and training subject label into R as well as relevant test data sets.

scripts:
tr <- read.table('./train/X_train.txt')
trl <- read.table('./train/y_train.txt')
trs <- read.table('./train/subject_train.txt')
te <- read.table('./test/X_test.txt')
tel <- read.table('./test/y_test.txt')
tes <- read.table('./test/subject_test.txt')  

step2

scripts:
i. Read in feature label and activity label and replace activity code with actual activity names
fl <- read.table('./features.txt', stringsAsFactors = F)
al <- read.table('./activity_labels.txt')
trl <- merge(trl, al, by = 'V1', all = T)
trl <- trl[,2]
  ii. create labels for final data set
names <- c('subject', 'activity', fl$V2)
  iii. tidy up training data set
train <- cbind(trs, trl, tr)
names(train) <- names 

run the same process with test data
scripts:
tel <- merge(tel, al, by = 'V1', all = T)
tel <- tel[,2]
test <- cbind(tes, tel, te)
names(test) <- names

step3
scripts:
dat <- rbind(train, test)

step4
scripts:
i. use grepl function to get just 'mean' and 'standard deviation' variables from all features
dat1 <- dat[,(grepl('mean', names)|grepl('std', names))]
dat1 <- cbind(dat[,c(1:2)], dat1)
ii. use summarise_each and group_by function to get average of each variable for each activity and each subject
dat1$subject <- as.factor(dat1$subject)
dat2 <- dat1                          %>%
        group_by(subject, activity)   %>%
        summarise_each(funs(mean))

ii. output the tidydata file
write.table(dat2, 'tidydata.txt', row.names = FALSE)








