# this is the string exercise for R

myString <- function () {
    
    # character and string: A character object is used to represent string values in R. 
    # We convert objects into character values with the as.character() function:
    x = as.character(3.14);      # cast number to string
    print (x);
    
    # concatenate two strings
    fname <- "Jhon";     lname = "Smith";
    name1 <- paste(fname, lname);                           # paste(…, sep="", collapse=NULL)
    print (paste0("String concatenation: ",  name1));       # paste0() didn't add extra space in, while paste() does
    
    # However, it is often more convenient to create a readable string with the sprintf function, which has a C language syntax.
    str1 <- sprintf("%s has %d dollars!", "Sam", 100);
    print (cat("Using sprintf for interpolation (printed by cat()): ", str1));     
    print (message("Using message for pring combination: ", str1));
    
    # to use paste to combine number and char
    numChar <- paste(c("X", "Y"), 1:10, sep='');    print (numChar)
    
    # To extract a substring, we apply the substr function. substr(x, start=n1, stop=n2)
    mySubStr <- substr("Mary has a little lamb.", start=3, stop=12);
    print (paste("substr() function: ", mySubStr));
    
    # to replace the first occurrence of the word "little" by another word "big" in the string, we apply the sub function.
    myRepStr = sub('little', 'big', "Mary has a little lamb.");
    print (paste("For word replacement ", myRepStr));
    
    # toupper/tolower(x)
    print (paste("To Upper case: ", toupper(myRepStr)));
    print (paste("To all lower case: ", tolower(myRepStr)));
    
    # to split a string use strsplit() which is opposite of paste()
    pgString <- "The quick brown fox jumps over the lazy dog";
    words <- strsplit(pgString, " ");           # split based on the space
    print (words);                              # the 'words' is a list that has only a single element. and this element is a vector
    
    # there are duplicated word 'the' in the variable 'words', use unique to remove one and first, convert them all to lower case
    print (unique(tolower(words[[1]])));        # to extract an element from a list ('words'), you have to use double square brackets
    
    # more on strsplit()
    x = "Do you wish you were Mr. Jones!";
    print (strsplit(x, ". "));              # here the . is a wild char. so it will split at any char followed by a space
    print (strsplit(x, ". ", fix=TRUE));    # we use the fix=TRUE to turn off the wild char to indicate that '. ' has to be matched exactly
    
    # using strsplit() to form a array of list and then to matrix
    dates <- c("1999-05-23", "2001-12-30", "2004-12-17");
    temp <- strsplit(dates, '-');
    print (temp);
    class(temp); 
    print (unlist(temp));
    mtx <- matrix(unlist(temp), ncol=3, byrow=TRUE);
    print (mtx);
    
    # to a data.frame
    df <- as.data.frame(mtx);
    print (df);
    colnames(df) <- c('Year', 'Month', 'Day');
    print (df);
    
    # regex,
    # here we will use 'stringr' package for the exercise. To install the package, use > install.packages("stringr")
    library(stringr);
    files <- list.files();
    print (head(files));
    gDat <- read.delim("gapminderDataFiveYear.txt");
    str(gDat);
    
    # use grep() to identify filenames including the string 'in'. If we set the argument value = TRUE, grep() returns the matches, 
    # while value = FALSE returns their indices. The invert argument let’s you get everything BUT the pattern you specify. 
    # grepl() is a similar function but returns a logical vector. 
    res <- grep("in", files, value=TRUE);
    print (res);
    
    resInd <- grep("in", files, value=FALSE)
    print (resInd)
    
    resLogic <- grepl("in", files)
    print (resLogic)
    
    # String functions related to regular expression
    
}