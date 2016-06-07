# this is for data.frame. A data frame is used for storing data tables. It is a list of vectors of equal length. 
# just like list, data.frame can store data of different types, such as numeric, string, or others
# row of a data.frame refer to an observation or instance, while columns are variables such as age, height, weight etc.
# data.frame is like the combination of matrix and list, so it inherits many features from matrix and list

df <- function() {
    sink("ex.data")
    
    n <- c(3, 4, 6);        s <- c('aa', 'bb', 'dd');       b <- c(TRUE, FALSE, TRUE)
    dff <- data.frame(n, s, b);     print("data frame created is");     print(dff)
    
    # you can change row and column names in data.frame using attr() function
    # for row names, you have to use 'row.names()' as the default 'names()' is for column
    attr(dff, 'row.names') <- c("s1", "s2", "s3");  print("after row.names changes");       print(dff)
    attr(dff, 'names') <- c("Num", "Str", "Bool");  print("after col name changes");        print(dff)
    names(dff) <- c("Numb", "Char", "Bool");        print("Using names() to change column names");      print(dff)
    row.names(dff) <- c('r1', 'r2', 'r3');          print("Using row.names() to change row names");     print(dff)
    
    # there are many built in data frame available. I will do my exercise on one of them: mtcars
    print("mtcars is a big data set, to view it, I use head() and tail()");     print(head(mtcars));    print(tail(mtcars))
    
    # To retrieve data in a cell, enter its row and column coordinates in the single square bracket "[row,col]"
    # note: it is different from that of matrix, which use [row][col] to access the member elements
    print("access individual cell using indexing");         print(mtcars[3,5])
    print("access individual cell using labels");           print(mtcars["Mazda RX4", "cyl"])
    
    # for processing data, you need iterator. to find out number of row and column, use nrow() and ncol()
    print("number of rows");    print(nrow(mtcars));    print("number of columns");     print(ncol(mtcars))
    
    # Data Frame Column Vector: We reference a data frame column with the double square bracket "[[]]", just like that in the list
    # The result is no longer a data.frame.  It will be the data type of the original variable component. 
    # you could use either indexing or column name to retrieve the vector
    print("get column vector from a data.frame using indexing or labels");  print(mtcars[[3]]);     print(mtcars[['disp']])
    
    # like in the list, you could also use the $ sign with name without using double square bracket
    print("getting column vector using $ + name ");     print(mtcars$cyl)
    
    # to slicing or subsetting a data.frame, use the single square bracket [] just like to way in list
    # this will preserve the sliced one still as a data.frame
    print("slicing/subsetting using label of a data.frame, the result is still a data.frame");      print(mtcars['disp'])
    print("slicing/subsetting using indexing of a data.frame, the result is still a data.frame");      print(mtcars[5])
    print("slicing/subsetting using a vector, the result is still a data.frame");      print(mtcars[c('drat','disp')])
    
    
    # we could also use a notion from Matrix, to get all the value for a specific row or column using [row,] or [,col]
    # the resulting sliced one is still a data.frame
    print("Using matrix slicing approach mtcars[,'disp']");             print(mtcars[,'disp'])
    print("Using matrix slicing approach mtcars['Lotus Europa',]");     print(mtcars['Lotus Europa',])
    print("we could also use the indexing (including vector indexing) here");       print(mtcars[c(2,5),])
    
    # However, using slicing for a single cell, the result is no longer a data.frame
    print("Using matrix slicing for single cell value, the result is not a data.frame");     print(mtcars['Lotus Europa','disp'])
    
    # Logical Indexing: we can retrieve rows with a logical index vector. In the following vector L, 
    # the member value is TRUE if the car has automatic transmission, and FALSE if otherwise.
    L <- mtcars$am == 0;    print("the logical result of cars with/without auto-transmission");     print(L)
    print("Here is the list of vehicles with automatic transmission.");     print(head(mtcars[L,]))
    print("And here is the gas mileage data for automatic transmission.");  print(head(mtcars[L,]$mpg))
    
    # we could also use which() and with() function to create a index vector to grep all the wanted items out
    idx <- which (mtcars$mpg > 30);     print("which() returns a list of number as index");     print(idx);     print(head(mtcars[idx,]))
    idx <- with(mtcars, mpg > 30);      print("with() returns a list of Bool values for index");      print(idx);     print(mtcars[idx,])
    
    # also we could use subset() function for subsetting
    print("using subset() to subset the data.frame");       print(head(subset(mtcars, mpg > 30)))
    
    # to sort it, you have to use order(), this is like to order the index using index slicing
    rank <- order(mtcars$mpg[mtcars$mpg>30]);      print("Doing ordering by ranking the values");     print(rank)
    mySub <-subset(mtcars, mpg>30);             print('subsetting and sorting');        print(mySub[rank,])
    print("put together");      print(subset(mtcars, mpg>30)[rank,])
    
    sink()
}
