#setwd("E:/KATKA/COURSERA/3-CleaningData/DATA/project")

###############################################################################
## TASK 1: Load and merge training and test sets

# id of tested people
subject_test<- read.delim("UCI HAR Dataset/test/subject_test.txt",
                             header = FALSE,  dec = ".", sep = "", quote = "" )
subject_train<- read.delim("UCI HAR Dataset/train/subject_train.txt",
                           header = FALSE,  dec = ".", sep = "", quote = "" )
subject<- rbind(subject_test,subject_train)
rm(subject_test,subject_train)

# variables
X_test<- read.delim("UCI HAR Dataset/test/X_test.txt",
                             header = FALSE,  dec = ".", sep = "", quote = "" )
X_train<- read.delim("UCI HAR Dataset/train/X_train.txt",
                    header = FALSE,  dec = ".", sep = "", quote = "" )
X<- rbind(X_test,X_train)
rm(X_test,X_train)

# id of activities
y_test<- read.delim("UCI HAR Dataset/test/y_test.txt",
                    header = FALSE,  dec = ".", sep = "", quote = "" )
y_train<- read.delim("UCI HAR Dataset/train/y_train.txt",
                    header = FALSE,  dec = ".", sep = "", quote = "" )
y<- rbind(y_train,y_test)
rm(y_train,y_test)

###############################################################################
## TASK 4: Assign variable name to columns in dataframe X

# load features names
features<- read.delim("UCI HAR Dataset/features.txt",
                    header = FALSE,  dec = ".", sep = "", quote = "",
                    colClasses = c("integer", "character"))

# check dimensions, assig features names to variables in dataframe X
if dim(features)[1]==dim(X)[2]{
        colnames(X) <- features[,2]
} else{
        stop ("no. of features does not correspond to no. of columns in dataframe X")
}

###############################################################################
## TASK 2: Select columns representing mean and standard deviation into XSel 

toMatch <- c("mean", "Mean", "std", "Std")
ind<-  lapply(features, function(n) grep(paste(toMatch,collapse="|"), features[n,2]))
XSel <- X[,ind$V1] 

###############################################################################
## TASK 3: Add subjects ID; label activities in dataset with descriptive names 

# add subjects ID to the final dataframe
XSel <- cbind(XSel, subject)
names(XSel)[names(XSel) == "V1"] = "subjectID"

# add activity to the final dataframe
activity_labels<- read.delim("UCI HAR Dataset/activity_labels.txt",
                             header = FALSE,  dec = ".", sep = "", quote = "",
                             colClasses = c("integer", "character"))

fy<- factor(y[,1], labels = activity_labels[,2]) # create factor,assign labels to factor
XSel <- cbind(XSel, fy)
names(XSel)[names(XSel) == "fy"] = "activity"

###############################################################################
## TASK 5: Create tidy data set with average of each variable 
# for each activity and each subject.

out<- aggregate(. ~ activity + subjectID, data = XSel, mean)
write.table(out, "project_data.txt") # header = TRUE


