The purpose of this project is to analyse human activity data collected by an experiment. 
On this GitHub repo, I have included a readme.md document and a run_anaysis.R script. A tidydata.txt file has been submitted to the coursera website as part of this project.

The steps taken in the run_analysis.R script are:
  1. read data into R (training and test)
  2. process training data and test data seperately to make both data sets complete 
  (i.e. combine activity data, subject label and activity label and add in column labels for all measure variables)
  3. combine training and test data
  4. use summarise_each function from dplyr package to run the analysis on the complete data set generated from step 3.
  
  1. read data into R (training and test)
  I have used read.table function to read training data, training activity label and training subject label into R as well as relevant test data sets.
scripts:
tr <- read.table('./train/X_train.txt')
trl <- read.table('./train/y_train.txt')
trs <- read.table('./train/subject_train.txt')
te <- read.table('./test/X_test.txt')
tel <- read.table('./test/y_test.txt')
tes <- read.table('./test/subject_test.txt')  

  2. process training data and test data seperately to make both data sets complete 
  i. read in feature label and activity label and replace activity code with actual activity names
scripts:
fl <- read.table('./features.txt', stringsAsFactors = F)
al <- read.table('./activity_labels.txt')
trl <- merge(trl, al, by = 'V1', all = T)
trl <- trl[,2]
  ii. create labels for final data set
names <- c('subject', 'activity', fl$V2)
  iii. tidy up training data set
train <- cbind(trs, trl, tr)
names(train) <- names 










