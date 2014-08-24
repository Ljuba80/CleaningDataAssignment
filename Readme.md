Getting and Cleaning data - course project
===========

Aim of this project is to apply knowledge on data preparation
on real practical problem. I am writing this down and drinking brandy, 
so sorry for (unintentional) errors

### Load data

First part of the script loads all neccessary data from files.
finalDataSet is created using rbind function (although its far from being final).
This dataset contains merged data from X_ files

### Extracting mean and std

This step is done by using grepl with regex. Note that all main(), std(), main...()
stuff is detected resulting in 79 variables total. Those variables are selected from
initial dataset and two more variables are added. Note that in this step are appropriate
subject and activity variables are merged (prior to adding to tidyDS)
####1. subjectTest and subjectTrain are merged (by row)
####2. testYdata and trainydata are merged (by row)
####3. Data frames obtained by 1 and 2 are marged together (by column)
####4. Result dataset is merged with tidyDS

### naming activities in tidyDS with descriptive names
In this step data obtained from activity_labels.txt is used directly
in conjuction with levels function


### Data labeling
in this step using regex,"()" are removed from data obtained from features.txt and assigned
to tidyDS. Note that Subject and Activiy are added at the end.
 

###Creating new tidy data set

For this purpose, agregate function is used. This function "splits" dataset according to variables desired
and performs function (in our case mean)