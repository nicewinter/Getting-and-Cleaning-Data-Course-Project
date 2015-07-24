            DATA DICTIONARY - Smart Phone Sensor Data


subject:     An identifier of the subject who carried out the experiment 

            1-30

activity:    Activity name

            1 WALKING

            2 WALKING_UPSTAIRS

            3 WALKING_DOWNSTAIRS

            4 SITTING

            5 STANDING

            6 LAYING


Following are all 88 variables in the tidy data set. 

Besides subject and activity, all remaining 86 variables (i.e. columns) are extracted (either mean or standard devidation) measures/features. 

Each value is an average of a specific measure/feature per subject per activity over all 10299 observation windows (each window is 2.56s).

Those 86 measures/features are composed of a combination of any of following dimensions:

1. Two sensors: accelerometer and gyroscope, giving Total Acceleration (separated in Body Acceleration and Gravity Acceleration, denoted by BodyAcc and GravityAcc) and Angular Velocity respectively

2. 3-axial dimensions: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions

3. Time domain and Frequency domain: prefix 't' to denote time, prefix 'f' to denote frequency'

Based on dimensions in 1,2 and 3 above, we got signals like tBodyAcc-XYZ and tGravityAcc-XYZ

4. The Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) are obtained from the time domain derivation of body linear acceleration and angular velocity

5. Magnitude of a signal: tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag

6. A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag

7. Statistical measures: 
            mean(): Mean value
            std(): Standard deviation


For example, "tBodyAccmeanX" denotes a time domain X-axis direction Body Acceleration Mean.

For example, "fBodyAccMagstd" denotes a frequency domain Body Acceleration Magnitude Standard Deviation.


The complete list of variables is shown below:


[1] "subject"                              "activity"                             "tBodyAccmeanX"                       
[4] "tBodyAccmeanY"                        "tBodyAccmeanZ"                        "tBodyAccstdX"                        
[7] "tBodyAccstdY"                         "tBodyAccstdZ"                         "tGravityAccmeanX"                    
[10] "tGravityAccmeanY"                     "tGravityAccmeanZ"                     "tGravityAccstdX"                     
[13] "tGravityAccstdY"                      "tGravityAccstdZ"                      "tBodyAccJerkmeanX"                   
[16] "tBodyAccJerkmeanY"                    "tBodyAccJerkmeanZ"                    "tBodyAccJerkstdX"                    
[19] "tBodyAccJerkstdY"                     "tBodyAccJerkstdZ"                     "tBodyGyromeanX"                      
[22] "tBodyGyromeanY"                       "tBodyGyromeanZ"                       "tBodyGyrostdX"                       
[25] "tBodyGyrostdY"                        "tBodyGyrostdZ"                        "tBodyGyroJerkmeanX"                  
[28] "tBodyGyroJerkmeanY"                   "tBodyGyroJerkmeanZ"                   "tBodyGyroJerkstdX"                   
[31] "tBodyGyroJerkstdY"                    "tBodyGyroJerkstdZ"                    "tBodyAccMagmean"                     
[34] "tBodyAccMagstd"                       "tGravityAccMagmean"                   "tGravityAccMagstd"                   
[37] "tBodyAccJerkMagmean"                  "tBodyAccJerkMagstd"                   "tBodyGyroMagmean"                    
[40] "tBodyGyroMagstd"                      "tBodyGyroJerkMagmean"                 "tBodyGyroJerkMagstd"                 
[43] "fBodyAccmeanX"                        "fBodyAccmeanY"                        "fBodyAccmeanZ"                       
[46] "fBodyAccstdX"                         "fBodyAccstdY"                         "fBodyAccstdZ"                        
[49] "fBodyAccmeanFreqX"                    "fBodyAccmeanFreqY"                    "fBodyAccmeanFreqZ"                   
[52] "fBodyAccJerkmeanX"                    "fBodyAccJerkmeanY"                    "fBodyAccJerkmeanZ"                   
[55] "fBodyAccJerkstdX"                     "fBodyAccJerkstdY"                     "fBodyAccJerkstdZ"                    
[58] "fBodyAccJerkmeanFreqX"                "fBodyAccJerkmeanFreqY"                "fBodyAccJerkmeanFreqZ"               
[61] "fBodyGyromeanX"                       "fBodyGyromeanY"                       "fBodyGyromeanZ"                      
[64] "fBodyGyrostdX"                        "fBodyGyrostdY"                        "fBodyGyrostdZ"                       
[67] "fBodyGyromeanFreqX"                   "fBodyGyromeanFreqY"                   "fBodyGyromeanFreqZ"                  
[70] "fBodyAccMagmean"                      "fBodyAccMagstd"                       "fBodyAccMagmeanFreq"                 
[73] "fBodyAccJerkMagmean"                  "fBodyAccJerkMagstd"                   "fBodyAccJerkMagmeanFreq"             
[76] "fBodyGyroMagmean"                     "fBodyGyroMagstd"                      "fBodyGyroMagmeanFreq"                
[79] "fBodyGyroJerkMagmean"                 "fBodyGyroJerkMagstd"                  "fBodyGyroJerkMagmeanFreq"            
[82] "angle(tBodyAccMean,gravity)"          "angle(tBodyAccJerkMean),gravityMean)" "angle(tBodyGyroMean,gravityMean)"    
[85] "angle(tBodyGyroJerkMean,gravityMean)" "angle(X,gravityMean)"                 "angle(Y,gravityMean)"                
[88] "angle(Z,gravityMean)"  

