# gacd
Getting and Cleaning Data

![alt text](http://i.imgur.com/0Y5Dy7y.jpg)


For more info on the dataset see CodeBook.md

The run_analysis.R script does the following:

1.  Reads in the 3 training datasets and horizontally concatenates them
2.  Reads in the 3 testing datasets and horizontally concatenates them
3.  Vertically concatenates the training and testing datasets from steps 1 and 2
4.  features.txt is read in and variables are renamed accordingly
5.  Variables not related user, activity, or to means or standard deviations are dropped
6.  Finally means of all variables are found per subject per activity and output to project.txt



