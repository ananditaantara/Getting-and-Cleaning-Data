getwd()
#read training tables

x_train<- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train<- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read test tables

 x_test<- read.table("./UCI HAR Dataset/test/X_test.txt")
 y_test<- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read features table

features<- read.table("./UCI HAR Dataset/features.txt")

#read activity_labels table

 activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#providing column namescolnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
      
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
      
colnames(activity_labels) <- c('activityId','activityType')

#merging all data sets in one:

mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)

#extracting only on the mean and standard deviation for data
#reading the column
colNames <- colnames(setAllInOne)

#creating a vector fr defining id. mean and standard deviation

mean_and_std <- (grepl("activityId" , colNames) | 
+                  grepl("subjectId" , colNames) | 
+                  grepl("mean.." , colNames) | 
+                  grepl("std.." , colNames) 
+                  )


#making a subset from setAllInOne

 setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

#naming the activities in the dataset
setWithActivityNames <- merge(setForMeanAndStd, activity_labels,
+  by='activityId',all.x=TRUE)

#making another tidy Set

secondTidySet<-aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secondTidySet <-secondTidySet[order(secondTidySet$subjectId, secondTidySet$activityId),]

#writing the tidy set
write.table(secondTidySet, "secondTidySet.txt", row.name=FALSE)