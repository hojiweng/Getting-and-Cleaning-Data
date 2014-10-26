#  Check if the data set exist
if (!file.exists("./UCI HAR Dataset")) {
  print("Unable to find 'UCI HAR Dataset'")
  stop()
}

#read feature
features<-read.table("./UCI HAR Dataset/features.txt", sep=" ", head=FALSE)
names(features)<-c("fcode", "feature")

#read activity
activity<-read.table("./UCI HAR Dataset/activity_labels.txt", sep=" ", head=FALSE)
names(activity)<-c("acode", "activity")

#clean activity
activity$activity<-tolower(activity$activity)
activity$activity<-as.factor(activity$activity)


#read train set
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", comment.char = c(""), colClasses=c("numeric"))

#read test set
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", comment.char = c(""), colClasses=c("numeric"))

#read subject train
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", comment.char = c(""), colClasses=c("factor"), col.names = c("subject"))
subjecttrain$subject <- relevel(subjecttrain$subject, 1)

#read subject test
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt", comment.char = c(""), colClasses=c("factor"), col.names = c("subject"))
subjecttest$subject <- relevel(subjecttest$subject, 1)

#read train labels
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", comment.char = c(""), colClasses=c("integer"), col.names = c("activity_id"))

#read test labels
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt", sep=" ", head=FALSE, col.names=c("acode"))
xtest<-read.table("./UCI HAR Dataset/test/x_test.txt", head=FALSE, col.names=features$feature)

#read subject
subject<-read.table("./UCI HAR Dataset/test/subject_test.txt", sep=" ", head=FALSE, col.names=c("subject"))

#merge, remove braces with low case
listmean<-features[grep("mean\\(|std\\(", features$feature),]
listmean$feature<-gsub("\\(\\)", "", listmean$feature)
listmean$feature<-tolower(listmean$feature)
print(nrow(listmean))
final<-xtest[,listmean$fcode]
names(final)<-listmean$feature
final<-cbind(subject, ytest, final)

print("Test Dataset Processed")


#read subject, activity for train dataset
subject<-read.table("./UCI HAR Dataset/train/subject_train.txt", sep=" ", head=FALSE, col.names=c("subject"))
ytest<-read.table("./UCI HAR Dataset/train/y_train.txt", sep=" ", head=FALSE, col.names=c("acode"))
xtest<-read.table("./UCI HAR Dataset/train/x_train.txt", head=FALSE, col.names=features$feature)
final2<-xtest[,listmean$fcode]
names(final2)<-listmean$feature
final2<-cbind(subject, ytest, final2)

#merge
final<-rbind(final, final2)
final<-merge(activity, final,  by="acode" )
final<-final[-1]
print(table(final$subject, final$activity))
print("Train Dataset Processed")


#process
finalwidth<-length(final)
analysis<-aggregate(final[,3:finalwidth], by=list(final$activity, final$subject), FUN=mean)

#cleanup
names(analysis)[1:2]<-c("activity", "subject")
print(analysis[1:15,1:5])
write.table(analysis, file="Tidydata.txt", row.name=FALSE)
