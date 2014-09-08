#Loading data...
#test data
testXData<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
testYData<-read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subjectsTest<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
#train data
trainXData<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
trainYData<-read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subjectsTrain<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
#Features
features<-read.table(".\\UCI HAR Dataset\\features.txt")
#Labels
activityLabels<-read.table(".\\UCI HAR Dataset\\activity_labels.txt")

finalDataSet<-rbind(testXData,trainXData)

#step2

matches<-grepl("(mean*())|(std*())",features$V2)
colData<-features$V1[matches]
tidyDS<-finalDataSet[,colData]
tidyDS<-cbind(tidyDS,cbind(rbind(subjectsTest,subjectsTrain),rbind(testYData,trainYData)))

#step3
tidyDS[,81]<-as.factor(tidyDS[,81])
levels(tidyDS[,81])<-activityLabels$V2

#step4
tempNames<-c(as.character(features$V2[matches]))
#remove(),replace - with _
tempNames<-gsub("-", "_", tempNames)   
tempNames<-gsub("\\()", "", tempNames)  
names(tidyDS)<-c(tempNames,"Subject","Activity")

#step5
aggData<-aggregate(tidyDS[,1:79], by=list(Subject=tidyDS$Subject,Activity=tidyDS$Activity),FUN=mean,na.rm=TRUE)

#Write table
write.table(aggData,"tidy.txt",col.names=TRUE)

