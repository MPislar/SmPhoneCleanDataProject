Code Book: Human Activity Recognition Using Smartphone Datase
========================================================
This study summarizes smartphone activity recognition data into a dataset which achieves the following objectives:

    1. Provides descriptive activity labels (i.e. Running, Walking etc) instead of numeric activity idenitifiers.
    2. Identifies only those variables which are themselves are a mean or standard deviation of a specific measurement.
    3. Formats these variable names so that they conform with the preferred naming method as defined by Google R Style Guide (https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)
    4. Creates a summarized dataset which, for each combination of a subject and activity, calculates the mean of each of the identified variables. 
    
This code book describes the source data, transformation methodology, and detailed information about the final variables selected for inclusion in the summarized data set.

Study Design
--------------------------------------------------------
The data collected for this project was solely sourced from the Human Activity Recognition Using Smartphones Data Set published by the UCI Machine Learning Repository. Detailed information about this data set can be found at the following locations:

    Data Set Information: 
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
    Data Set Location: 
    http://archive.ics.uci.edu/ml/machine-learning-databases/00240/
    Data Set Feature Information:
    features_info.txt (included in the Data Set Information)

The transformation of this dataset is done by running the run_Analytics.R source file (see the README.md file for more information). The output is a dataset with 180 rows (one each for combination of the 30 subjects and the 6 activities) and 81 columns consisting of the subject, activity, and the mean of 79 selected measurements. As part of this script, the activity variable is populated with descriptive labels and the variable names are transitioned into the preferred style.

Code Book - Variable Description and Units
--------------------------------------------------------

    Name                                 Units / Applicable Values                                              
     
    [1] "subject"                              1 - 30 : Factoral identifier for each subject
 
    [2] "activity"                             Factor variable with the following levels:
                                                LAYING             
                                                SITTING            
                                                STANDING
                                                WALKING            
                                                WALKING_DOWNSTAIRS 
                                                WALKING_UPSTAIRS 
 
    * Note: the remaining 79 variables represent the mean of the measurement variables. All of the variables are numeric and normalized with values ranging from -1 to 1. 
    In regards to the naming methodology, the following guidelines apply:
        - time domain signal measurements are prefixed with 'time.'
        - frequency domain signal measurements are prefixed with 'freq.'
        - after these prefixes, the variable names correspond to the source data variable names with the following adjustments:
        - capital letters were preceded with a period and altered to lower case
        - parenthesis signs were removed
        - hyphens were replaced with periods 
 
    [3] "time.body.acc.mean.x"                     See note above
    [4] "time.body.acc.mean.y"                     See note above
    [5] "time.body.acc.mean.z"                     See note above
    [6] "time.body.acc.std.x"                      See note above
    [7] "time.body.acc.std.y"                      See note above
    [8] "time.body.acc.std.z"                      See note above
    [9] "time.gravity.acc.mean.x"                  See note above
    [10] "time.gravity.acc.mean.y"                  See note above
    [11] "time.gravity.acc.mean.z"                  See note above
    [12] "time.gravity.acc.std.x"                   See note above
    [13] "time.gravity.acc.std.y"                   See note above
    [14] "time.gravity.acc.std.z"                   See note above
    [15] "time.body.acc.jerk.mean.x"                See note above
    [16] "time.body.acc.jerk.mean.y"                See note above
    [17] "time.body.acc.jerk.mean.z"                See note above
    [18] "time.body.acc.jerk.std.x"                 See note above
    [19] "time.body.acc.jerk.std.y"                 See note above
    [20] "time.body.acc.jerk.std.z"                 See note above
    [21] "time.body.gyro.mean.x"                    See note above
    [22] "time.body.gyro.mean.y"                    See note above
    [23] "time.body.gyro.mean.z"                    See note above
    [24] "time.body.gyro.std.x"                     See note above
    [25] "time.body.gyro.std.y"                     See note above
    [26] "time.body.gyro.std.z"                     See note above
    [27] "time.body.gyro.jerk.mean.x"               See note above
    [28] "time.body.gyro.jerk.mean.y"               See note above
    [29] "time.body.gyro.jerk.mean.z"               See note above
    [30] "time.body.gyro.jerk.std.x"                See note above
    [31] "time.body.gyro.jerk.std.y"                See note above
    [32] "time.body.gyro.jerk.std.z"                See note above
    [33] "time.body.acc.mag.mean"                   See note above
    [34] "time.body.acc.mag.std"                    See note above
    [35] "time.gravity.acc.mag.mean"                See note above
    [36] "time.gravity.acc.mag.std"                 See note above
    [37] "time.body.acc.jerk.mag.mean"              See note above
    [38] "time.body.acc.jerk.mag.std"               See note above
    [39] "time.body.gyro.mag.mean"                  See note above
    [40] "time.body.gyro.mag.std"                   See note above
    [41] "time.body.gyro.jerk.mag.mean"             See note above
    [42] "time.body.gyro.jerk.mag.std"              See note above
    [43] "freq.body.acc.mean.x"                     See note above
    [44] "freq.body.acc.mean.y"                     See note above
    [45] "freq.body.acc.mean.z"                     See note above
    [46] "freq.body.acc.std.x"                      See note above
    [47] "freq.body.acc.std.y"                      See note above
    [48] "freq.body.acc.std.z"                      See note above
    [49] "freq.body.acc.mean.freq.x"                See note above
    [50] "freq.body.acc.mean.freq.y"                See note above
    [51] "freq.body.acc.mean.freq.z"                See note above
    [52] "freq.body.acc.jerk.mean.x"                See note above
    [53] "freq.body.acc.jerk.mean.y"                See note above
    [54] "freq.body.acc.jerk.mean.z"                See note above
    [55] "freq.body.acc.jerk.std.x"                 See note above
    [56] "freq.body.acc.jerk.std.y"                 See note above
    [57] "freq.body.acc.jerk.std.z"                 See note above
    [58] "freq.body.acc.jerk.mean.freq.x"           See note above
    [59] "freq.body.acc.jerk.mean.freq.y"           See note above
    [60] "freq.body.acc.jerk.mean.freq.z"           See note above
    [61] "freq.body.gyro.mean.x"                    See note above
    [62] "freq.body.gyro.mean.y"                    See note above
    [63] "freq.body.gyro.mean.z"                    See note above
    [64] "freq.body.gyro.std.x"                     See note above
    [65] "freq.body.gyro.std.y"                     See note above
    [66] "freq.body.gyro.std.z"                     See note above
    [67] "freq.body.gyro.mean.freq.x"               See note above
    [68] "freq.body.gyro.mean.freq.y"               See note above
    [69] "freq.body.gyro.mean.freq.z"               See note above
    [70] "freq.body.acc.mag.mean"                   See note above
    [71] "freq.body.acc.mag.std"                    See note above
    [72] "freq.body.acc.mag.mean.freq"              See note above
    [73] "freq.body.body.acc.jerk.mag.mean"         See note above
    [74] "freq.body.body.acc.jerk.mag.std"          See note above
    [75] "freq.body.body.acc.jerk.mag.mean.freq"    See note above
    [76] "freq.body.body.gyro.mag.mean"             See note above
    [77] "freq.body.body.gyro.mag.std"              See note above
    [78] "freq.body.body.gyro.mag.mean.freq"        See note above
    [79] "freq.body.body.gyro.jerk.mag.mean"        See note above
    [80] "freq.body.body.gyro.jerk.mag.std"         See note above
    [81] "freq.body.body.gyro.jerk.mag.mean.freq"   See note above
