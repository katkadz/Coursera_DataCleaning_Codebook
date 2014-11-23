==================================================================
###Coursera: Getting and Cleaning data, Project Assignement  

Katarina Dzubakova

https://github.com/katkadz

==================================================================

###Data origin:

The data used for the assignement were collected within the project:
Human Activity Recognition Using Smartphones Dataset,Version 1.0

by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws  

Citation request: 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

==================================================================

###Data description, data processing:

Full description of the experiment and data set description is available:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'codebook.txt' for more details. 

Using the data set, the following processing was performed:
- merging of test and train datasets containing 561-feature vector with time and frequency domain variables (data source: 'X_train.txt'/'X_test.txt' ), the merged matrix contains altogether 10299 records
- assigning the descriptive variables names (data source: 'features.txt')  
- selection of the variables representing mean and standard deviation
- assigning to each record the corresponding subject (data source: 'subject_train.txt'/'subject_test.txt') 
- assigning to each record the corresponding activity (data source: 'y_train.txt'/'y_test.txt') 
- assigning descriptive activity names (data source: 'activity_labels.txt')
- data summarisation: tidy dataset contains average of each variable for each activity and each subject

**For each record it is provided:**

- Its activity label. 
- An identifier of the subject who carried out the experiment.
- A 88-feature vector with time and frequency domain variables corresponding to mean value for each activity and each subject. 

**Notes:** 

- Each record vector is a row on the text file.
- Records are normalized and bounded within [-1,1].

==================================================================

###The dataset includes the following files:

- 'README.txt'
- 'codebook.txt': contains the description of the data variables
- 'run_analysis.R': contains the code used for data cleaning 
- 'project_data.txt': contains the tidy data (for exact content desctiption read below)

==================================================================

###To load the data in R please use following commands:

data <- read.table("project_data.txt", header = TRUE, check.names=FALSE)

View(data)


