# JHU_GCD_Prog
Johns Hopkins University - Getting and Cleaning Data - Programming Assignment

This is my result for the programming assignment of the "Getting and Cleaning Data" course at coursera.
So what does the R-script do?

- The script uses the "data.table" library, since we were tought this library is more efficient with bigger data sets.
- The I try to create some varianbles in the environment frame, in order to memorize some data sets I read from the file system, e.g. the header names, the activity lables, the subject list
- I took the easy route and looked up the header names for the mean and sd columns in the x-tables. Therefore I store these in a constant, for later use
- There are functions to load in the different header and lable files
- The gcd.load.set is able to ready a single set from the file system, by getting the root directory for thr data and then the set name (e.g. test or train). Some details
--  fread() is being used to read the different tables. All is relative to the directory of the distinct set
--  After readying each table, I assign the header names. Since I collected e.g. the measurement header names at the start, I can easily assign them to the x_table
-- The y_table needs some special treatment, since I want to use the activity names, rather than the simple numbers. That's why I use merge.
-- I use cbind() collate all tables in the sequence I want them.
- gcd.load.merged will cycle through the set names (only "test" && "train"), use gcd.load.set for each one of them, and combine them vertically
- gcd.tidy_data.create will take a complete data set, and will compute the means of all variables, grouped along the subject and it's distinct activities.
- At the bottom of the script, I call the gcd.tidy_data.create function, which is being passed the result of gcd.load.merged, which will have loaded all data, created a combined set.



