Getting-and-Cleaning-Data
=========================

HOW THE SCRIPT WORKS:
---------------------
1. Load activity type data of both train and test sets, and merge into one object.
2. Load subject type data of both train and test sets, and merge into one object.
3. Load all the features data of both train and test sets, and merge into one object.
4. Load feature names from features.txt. Set them to the data set created above.
5. Create a smaller data set which contain only mean and std columns.
6. Convert activity type into proper factor using the data in activity_labels.txt
7. Compute the average of each field for each type of activity and subject combinations. Create the tidy data set "res" using this data.
8. Output the tidy data set.
