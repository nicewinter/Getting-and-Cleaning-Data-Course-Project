run_analysis <- function() {
    
    ## Data set summary: the whole experiment got 2947 records, corresponding to 2947 observation windows. Each window is 2.56s with 128 samples. Each sample contains measurements of 1) total acceleration (body + gravity), 2) body acceleration (body only) and 3) gyro (i.e. angular velocity).
    ##
    ## features.txt: 561 statistical measures including mean and std. deviation (i.e. so-called 561 features)
    ##
    ## The test set:
    ## subject_test.txt: 2947x1, contains subject ids for 2947 windows
    ## y_test.txt: 2947x1, contains activity labels for 2947 windows
    ## body_acc_[xyz].test.txt: 2947x128, contains Triaxial body acc row data for 2947 windows, each with 128 samples
    ## total_acc_[xyz].test.txt: 2947x128, contains Triaxial total acc row data for 2947 windows, each with 128 samples
    ## body_gyro_[xyz].test.txt: 2947x128, contains Triaxial angular velocity row data for 2947 windows, each with 128 samples
    ## X_test.txt: 2947x561, contains pre-processed data of 561 features (i.e. statistical measures, e.g. mean, std. deviation, etc.) over 128 samples for each of 2947 observation windows
    ##
    ## The train set:
    ## It is equivalent to the test set, the only difference is that it has 7352 records instead of 2947 records
    ##
    
    
    ##0. read all files into the data frames
    measures<-read.table("./UCI HAR Dataset/features.txt", sep="")
    activity_lables<-read.table("./UCI HAR Dataset/activity_labels.txt", sep="")
    
    activity_test<-read.table("./UCI HAR Dataset/test/y_test.txt", sep="")
    subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")
    ##body_acc_x_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", sep="")
    ##body_acc_y_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", sep="")
    ##body_acc_z_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", sep="")
    ##body_gyro_x_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", sep="")
    ##body_gyro_y_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", sep="")
    ##body_gyro_z_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", sep="")
    ##total_acc_x_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", sep="")
    ##total_acc_y_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", sep="")
    ##total_acc_z_test<-read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", sep="")
    feature561_test<-read.table("./UCI HAR Dataset/test/X_test.txt", sep="")
    
    activity_train<-read.table("./UCI HAR Dataset/train/y_train.txt", sep="")
    subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", sep="")
    ##body_acc_x_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", sep="")
    ##body_acc_y_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", sep="")
    ##body_acc_z_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", sep="")
    ##body_gyro_x_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", sep="")
    ##body_gyro_y_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", sep="")
    ##body_gyro_z_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", sep="")
    ##total_acc_x_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", sep="")
    ##total_acc_y_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", sep="")
    ## total_acc_z_train<-read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", sep="")
    feature561_train<-read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
    
    
    ##1. Merges the training and the test sets to create one data set.
    ##col binding to merge training/test groups' subject id, activity number, and feature561 data.frames to form 1 single data frame
    test_merge<-cbind(subject_test,activity_test,feature561_test)
    train_merge<-cbind(subject_train,activity_train,feature561_train)
    
    ##row binding to merge both training and test groups' combined table into one single data frame 10299x563
    mergeTwo<-rbind(test_merge,train_merge)
    
    ##2. Extracts only the measurements on the mean and standard deviation for each measurement.
    ##assign user-friendly names to statistical measures
    names(measures)<-c("measureNo","measureItem")
    ##convert from factor type to char type for variable/column named "measureItem", 561 items in total
    measures$measureItem<-as.character(measures$measureItem)
    ##get indices of only eitehr mean or std. deviation measures
    extract<-grep("[Mm]ean|[Ss]td",measures$measureItem)
    ##the clomuns to extract, offset extract by 2 since we also added "subject" and "activity" variables
    cols<-c(1,2,extract+2)
    ##get the required sub set
    mergeTwoExtracted<-mergeTwo[,cols]
    
    ##3.Uses descriptive activity names to name the activities in the data set
    ##replace activity number with literal activity name, thanks to mappings in activity_labels.txt file
    names(mergeTwoExtracted)<-c("subject","activity")
    names(activity_lables)<-c("activityNum","activityName")
    activityName<-activity_lables$activityName
    factorActivity<-as.factor(mergeTwoExtracted$activity)
    mergeTwoExtracted$activity<-activityName[factorActivity]
    
    ##4.Appropriately labels the data set with descriptive variable names.
    ##rename columnns/variables with literal names thanks to extractNames, 86 out of 561 found
    extractNames<-grep("[Mm]ean|[Ss]td",measures$measureItem,value=TRUE)
    names(mergeTwoExtracted)<-c("subject","activity", extractNames)
    ##remove '-' symbol and metacharacters like "()" or "." from the variable names
    names(mergeTwoExtracted)<-gsub("-|\\()|\\.","",names(mergeTwoExtracted))
    ##remove duplicate 'Body' symbol from the variable names
    names(mergeTwoExtracted)<-gsub("BodyBody","Body",names(mergeTwoExtracted))
    
    ##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    ## that will be 180 (30 subjects x 6 activities) categories for 86 mean/std measures (i.e. column/variable or so-called feature in the raw data set).
    
    ##Get the average on each column/variable to get a tidy data set, stored at new data frame called result
    result <- mergeTwoExtracted %>% group_by(subject, activity) %>% summarise_each(funs(mean))
    
    ## return the result
    write.table(result, file="./tidyData.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
    
}