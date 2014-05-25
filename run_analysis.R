############
## Step 1 
############

setwd('D:/New Folder')


############
## Step 2 
############

xtrain <- read.table('D:/New Folder/UCI HAR Dataset/train/X_train.txt', header = F)
ytrain <- read.table('D:/New Folder/UCI HAR Dataset/train/y_train.txt', header = F)
strain <- read.table('D:/New Folder/UCI HAR Dataset/train/subject_train.txt', header = F)

xtest  <- read.table('D:/New Folder/UCI HAR Dataset/test/X_test.txt', header = F)
ytest  <- read.table('D:/New Folder/UCI HAR Dataset/test/y_test.txt', header = F)
stest  <- read.table('D:/New Folder/UCI HAR Dataset/test/subject_test.txt', header = F)


############
## Step 3 
############

train <- data.frame(xtrain, ytrain, strain)
test  <- data.frame(xtest, ytest, stest)

fullData <- rbind(train, test)


############
## Step 4 
############

varNames <- read.table('D:/New Folder/UCI HAR Dataset/features.txt', header = F)
colnames(fullData) <- c(as.vector(varNames$V2), 'Activity', 'Subject')


############
## Step 5 
############

featureMean <- grep('mean', varNames$V2)
featureStd  <- grep('std', varNames$V2)
featureSelected <- sort(c(featureMean, featureStd))


############
## Step 6 
############

tidyData <- fullData[, c(featureSelected, 562, 563)]

tidyData$Activity <- gsub(1, 'WALKING', tidyData$Activity)
tidyData$Activity <- gsub(2, 'WALKING_UPSTAIRS', tidyData$Activity)
tidyData$Activity <- gsub(3, 'WALKING_DOWNSTAIRS', tidyData$Activity)
tidyData$Activity <- gsub(4, 'SITTING', tidyData$Activity)
tidyData$Activity <- gsub(5, 'STANDING', tidyData$Activity)
tidyData$Activity <- gsub(6, 'LAYING', tidyData$Activity)


############
## Step 7 
############

tidyData2 <- aggregate(tidyData[, 1:79], by=list(Activity=tidyData$Activity, Subject=tidyData$Subject), FUN=mean)


############
## Step 8 
############

write.table(tidyData2, 'tidyData2.txt')

