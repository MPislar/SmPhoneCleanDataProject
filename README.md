README.md - Human Activity Recognition Using Smartphone Datase
========================================================

This document accompanies the run_Analysis.R source file which is used to extract data from 'Human Activity Recognition Using Smartphones' dataset at the UCI Machine Learning Repository. Detailed information on this dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


Requirements before running the run_Analysis.R source file
----------------------------------------------------------

1. Identify and set your working directory on your computer.
2. Clear your r working environment (not required but helpful)
3. Read the rest of this document.

Objectives of the run_Analysis.R script
----------------------------------------------------------
This script will perform the following actions:

1. Download and unzip the data files from the UCI repository.
2. Read in the following eight data tables:
    - 'features.txt': List of all features.
    - 'activity_labels.txt': Links the class labels with their activity name.
    - 'train/X_train.txt': Training set.
    - 'train/y_train.txt': Training labels.
    - 'test/X_test.txt': Test set.
    - 'test/y_test.txt': Test labels.
    - 'test/subject_test.txt: Subjects of the test set
    - 'train/subject_train.txt: Subjects of the training set
3. Merges the test and training sets including the labels and subjects into one data set.
4. Reduces the data set to only those variables that measure a mean or standard deviation of a key measurement.
5. Replaces the numeric activity label with a descriptive label.
6. Modifies the variable names to preferred standard as stated in the Google R style guide (https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)
7. Creates a consolidate dataset measuring the mean of each variable for each subject and activity combination. This dataset has 180 rows - one each for the 30 subjects * 6 activity levels.
8. Writes this dataset to an output file and 81 columns which consist of the subject, activity, and 79 measurement variables.

Output file
-----------------------------------------------------------
- MeanValusBySubjAct.csv - will be stored in the current working directory


Notes
-----------------------------------------------------------
- Features are normalized and bounded within [-1, 1] (as per the README.txt file accompanying the original dataset - this README file is provided as part of the download process)
- In regards to step #4 above, those variables which include the 'meanFreq' are included.






