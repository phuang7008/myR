# factors are often used in dealing with Categorical data (variables). # One of the most important uses of factors is in statistical modeling; 
# since categorical variables enter into statistical models differently than continuous variables, 
# storing data as factors insures that the modeling functions will treat such data correctly.
factors <- function () {
    sink("factorResults.txt");
    mons <- c("March","April","January","November","January", "September","October","September","November","August", "January","November",
              "November", "February","May","August", "July","December","August","August","September","November", "February","April")
    fmons <- factor(mons);          print (fmons);          print(table(fmons));

# Factors in R are stored as a vector of integer values with a corresponding set of character values to use when the factor is displayed. 
# The factor function is used to create a factor. The only required argument to factor is a vector of values which will be returned as a vector of factor values. 
# Both numeric and character variables can be made into factors, but a factor's levels will always be character values. 
# You can see the possible levels for a factor through the levels command.
    print ("The levels (which are sorted alphabetally by default) of the factor are ");         print (levels(fmons));
    
# Factors represent a very efficient way to store character values, because each unique character value is stored only once, and the data itself is stored as a vector of integers. 
# Because of this, read.table will automatically convert character variables to factors unless the as.is= argument is specified.

# While it may be necessary to convert a numeric variable to a factor for a particular application, it is often very useful to convert the factor 
# back to its original numeric values, since even simple arithmetic operations will fail when using factors. 
# Since the as.numeric() function will simply return the internal integer values of the factor, the conversion must be done using the levels attribute of the factor.
    print ("To view the integer values (which is used for calculation internally) of the factors use the following ");     print (unclass(fmons));      
    print ("OR use the following approach as.integer() ");       print(as.integer(fmons))
    print ("OR use the following approach as.numeric() ");       print(as.numeric(fmons))

# To change the order in which the levels will be displayed from their default sorted order (alphabet order by default), 
# the 'levels' argument can be given a vector of all the possible values of the variable in the order you desire.
    fmons2 <- factor(mons, levels=c('January', 'February', 'March', 'April', 'May', 'July', 'August', 'September', 'October', 'November', 'December'));
    print ("New month info with new level order is here ");             print (fmons2)

# To convert the default factor fmons to roman numerals, we use the assignment form of the levels function:
    print("Change the wording of levels ");     levels(fmons) <- c('I', 'II', "III", 'IV', 'V', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII');     print (fmons)
    
# If the ordering should also be used when performing comparisons, use the optional ordered=TRUE argument. 
# In this case, the factor is known as an ordered factor.
    fmon3 <- factor(mons, order = TRUE);        print ("After ordering, the output will have < signs ");        print(fmon3)
    print("When ordering is true, you can do the comparisons ");    print (mons[1] < mons[5]);
    
# here is a numeric variable (including some missing values) with its corresponding factor
    nums <- c(1,1,2,4, NA,5,6,8, NA,8,5,4,1, NA);       fnums <- factor(nums, levels=c(1,2,4,5,6,8, NA));       print ("numeric factor: ");     print (fnums)

# the missing values will not show up and it interfere with the calculation; To exclude certain levels from appearing in a factor, 
# the exclude= argument can be passed to factor. By default, the missing value (NA) is excluded from factor levels; 
# to create a factor that inludes missing values from a numeric variable, use exclude=NULL.
    fnumsEx <- factor(nums, exclude=c(1, NA));      print ("Using exclude option in creating factor");      print (fnumsEx)
    
    # to allow missing values
    fnums <- factor(nums, exclude=NULL);    print ("To include NA missing values ");        print(fnums);   print(is.na(nums))

# Indexing the return value from the levels function is the most reliable way to convert numeric factors to their original numeric values.
    print("To calulating the mean value of the nums ");         print(levels(fnumsEx)[fnumsEx]);        
    print ("Need to remove all the missing value 'NA' for mean calculation");       print (mean(as.numeric(levels(fnumsEx)[fnumsEx]), na.rm=TRUE))
 
# Care must be taken when combining variables which are factors, because the c() function will interpret the factors as integers. To combine factors, 
# they should first be converted back to their original values (through the levels function), then catenated and converted to a new factor:
    s1 <- factor(sample(letters, size=10, replace=TRUE));       print ("create a letter factor s1 ");       print (s1)
    s2 <- factor(sample(letters, size=10, replace=TRUE));       print ("create a letter factor s2 ");       print (s2)
    s12 <- factor(c(levels(s1)[s1], levels(s2)[s2]));           print ("combine two factors ");             print (s12)
    
# The cut() function is used to convert a numeric variable into a factor through binning. 
# The breaks= argument (the 2nd parameter) to cut is used to describe how ranges of numbers will be converted to factor values. 
# If a number is provided through the breaks= argument, the resulting factor will be created by dividing the range of the variable 
# into that number of equal length intervals; if a vector of values is provided, the values in the vector are used to determine the breakpoint. 
# Note that if a vector of values is provided, the number of levels of the resultant factor will be one less than the number of values in the vector.
    fwomen <- cut (women$weight, 3);        print ("Create three equally-spaced levels for women's weight ");      print (fwomen);     print(table(fwomen))

    # The labels= argument to cut allows you to specify the levels of the factors:
    fwomen <- cut(women$weight, 3, labels=c('small', 'medium', 'large'));        print("Add labels ");      print(fwomen);      print(table(fwomen))
    
    # the most useful binning is to date/time objects. use the seq function to create a vector of dates representing each day of the year:
    everyday <- seq(from=as.Date('2015-01-01'), to=as.Date('2015-12-31'), by='day');        #print(everyday);   # out put everything. too much!
    
    # To create a factor based on the month of the year in which each date falls, we can extract the month name (full or abbreviated) using format:
    cmonth <- format(everyday, '%b');     print("binning everyday based on month which is the b ");       print(cmonth)
    month <- factor(cmonth, levels=unique(cmonth), order=TRUE);     print("the new factor for everyday is ");       print(table(month))
    
    # Sometimes more flexibility can be acheived by using the cut() function, which understands time units of months, days, weeks and years through the breaks= argument. 
    weeks <- cut(everyday, breaks='week');      print("Break by weeks ");       print(head(weeks))
    
    # Multiples of units can also be specified through the breaks= argument. For example, create a factor based on the quarter of the year an observation is in, we could use cut as follows:
    # qtrs <- cut(everyday, "3 months", labels=paste("Q", 1:4, sep=''));      print ("Quarter view head and table");      print(head(qtrs));     print(table(qtrs))
    
    # here we are going to use a vector as a parameter to break the numeric data into categories.
    nums <- 1:25;      print(nums);        cnums <- cut(nums, c(0, 5, 15, 20));     print(cnums);       # '(' not include, while '[' means include
    
    three.labels <- c('one to five', 'six to fifteen', 'siixteen to twenty');   cnums <- cut(nums, c(0, 5, 15, 20), labels=three.labels);     print(cnums);
    
    two.labels <- c('small-half', 'large-half');        cnums <- cut(nums, 2, labels=two.labels);     print(cnums);
    
    # we could put all of them into a data.frame
    y <- data.frame (
        number=nums,
        three.labels=cut(nums, 3, labels=three.labels),
        two.labels=cut(nums, 2, labels=two.labels)
    )
    fourth.labels <- c('Q1', 'Q2', 'Q3', 'Q4');
    y$fourth.labels <- cut(nums, c(0, 5, 15, 20, 25), labels=fourth.labels);
    print(y)
    
    
    
    sink();     # return to the screen output
}