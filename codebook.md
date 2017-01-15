This codebook file explains the variables used in the run_analysis saved on this repo and also a link to the codebook file that explains all variables used in the data set.

variables are explained as below:

tr: raw training data read into R from source file
trl: training activity label for each observation in the main training data file. e.g. walk, stand, etc
trs: raw experiment subject label id for each observation in the main training data file
te: raw testing data read into R from source file
tel: testing activity label for each observation in the main training data file. e.g. walk, stand, etc
tes: raw experiment subject label id for each observation in the main testing data file
fl: raw feature label for both training file and testing file. These features are human activity metrics collected by using measurable device
al: acitivty mapping file. provides the descriptive label for each activity
names: column names vector for final dataset
train: final training dataset
test: final testing dataset
dat: combined dataset of both training and testing data
dat1: combined dataset with selected variables (columns) showing only mean and standard deviation related variables
dat2: final dataset summarised the average of each variable for each activity and each subject
