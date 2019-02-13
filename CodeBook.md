# Code Book
This will dicuss the variables contained in the data with a focus on the features that were extracted from the original data set into the final tidy_data file. 

## subject
This variable is an integer representing which subject in the experimented generated the data in the sample. The expirement included 30 subjects which are numbered 1-30 and kept anonymous. 

## label
This is the number representing one of the six activities performed by the subjects. The activities are numbered 1-6 and translate to the following:
- 1 - WALKING
- 2 - WALKING_UPSTAIRS
- 3 - WALKING_DOWNSTAIRS
- 4 - SITTING
- 5 - STANDING
- 6 - LAYING
 
 ## activity
 This is the name or description of the activiy being performed during a given sample. The possible values are:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

## features*
<p>The 66 features are named with the following format:</p>
<p>[f|t][Body|Gravity][Acc|Gyro][ |Jerk|Mag|JerkMag]-[mean()|std()]-[X|Y|Z]</p>
<p>The Acc and Gyro represents that the data was calculated from the raw accelerometer (in standard g units) and gyroscope (in radians/sec) data, respectively.</p>
<p>The t represents the time domain - which is what the raw data is in - and the f is the same measurement if the frequency domain and is obtained by applying the Fast Fourier Transform to corresponding data in the time domain.</p> 
<p>The gyroscope only produced a Body signal where as the accelerometer data was broken into the Gravity and Body components. The Body or Gravity in the feature indicates which part of the accelerometer signal was used for the calculation.</p> 
<p>The mean() or std() indicates whether it is an average or standard deviation, respectively, of the measurement referenced.</p> 
<p>The Jerk features are found by taking the appropriate derivatives in the time domain of the specified feature. The Mag (including JerkMag) features were found by taking the Euclidean Norm of the referenced measurement.</p> 
<p>Finally, since the accelerometer and gyroscope signals were broken into the three axial dimensions, the X, Y, and Z represent the axis of the measurement.</p> 
<p>For example:</p>

- tBodyAcc-mean()-X: is the mean of the accelerometer body component in the time domain and X axis. 
- fBodyGyroMag-std()-Z: is the standard deviation of the magnitude (Euclidean Norm) of the gyroscope signal in the frequency domain and Z axis. 
