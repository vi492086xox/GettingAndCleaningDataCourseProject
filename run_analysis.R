library(dplyr)

#get features

features <- read.table("features.txt",col.names=c("col number","feature"))

#get column names and numbers associated with features containing
#either mean or std

col_numbers <- grep("(mean\\(\\)|std\\(\\))",features$feature)
col_names <- features[col_numbers,]$feature


#get test and training data, labels, and subjects
test_tbl <- read.table("X_test.txt")
test_labels <- read.table("y_test.txt",col.names="label")
test_subjects <- read.table("subject_test.txt",col.names="subject")
train_tbl <- read.table("X_train.txt")
train_labels <- read.table("y_train.txt",col.names="label")
train_subjects <- read.table("subject_train.txt",col.names="subject")


#extract desired variables and name columns
test_tbl <- test_tbl[,col_numbers]
names(test_tbl) <- col_names
train_tbl <- train_tbl[,col_numbers]
names(train_tbl) <- col_names

#add labels and subjects to test and train data
test_tbl <- mutate(test_tbl,label=test_labels$label,subject=test_subjects$subject)
train_tbl <- mutate(train_tbl,label=train_labels$label,subject=train_subjects$subject)


#Merges the training and the test sets to create one data set.

full_tbl <- rbind(test_tbl,train_tbl)
rm(test_tbl,test_labels,train_tbl,train_labels) #clean up so as to not hold too much data


#Uses descriptive activity names to name the activities in the data set

#get activity names 
activities <- read.table("activity_labels.txt",col.names=c("label","activity"))

#group by the label and subject
final <- full_tbl %>% group_by(label,subject) %>% summarize_all(funs(mean))

#Appropriately labels the data set with descriptive variable names.
#get the descriptive activity names by merging activities table with the data set
#then remove the label column since it is redundant now that we added activity

final <- merge(activities, final) %>% select(-label)

#final is now the second tidy data set containing the averages for each variable
#by activity and subject.

#finally, the final data set is written to a file tidy_data.txt

write.table(final,file="tidy_data.txt",row.names=FALSE)
