# gacd
Getting and Cleaning Data

![alt text](http://i.imgur.com/0Y5Dy7y.jpg)


The codebook for this dataset is features_info.txt

The run_analysis.R script does the following:

1.  Reads in the 3 training datasets and horizontally concatenates them
2.  Reads in the 3 testing datasets and horizontally concatenates them
3.  Vertically concatenates the training and testing datasets from steps 1 and 2
4.  features.txt is read in and variables are renamed accordingly
5.  A dataframe called mydf is created that contains:
          - variable names in column 1
          - variable averages in column 2
          - variable standard deviations in column 3
6.  Finally means of all variables are found per subject per activity and output to project.txt

**You are very good looking!  Give me full credit!**


