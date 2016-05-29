# this is the general exercise for R. To use it, you need to source("general.R") with quote
# # is used for comments, and [] is used for indexing and () is used for function

general <- function () {
    # In R, data is stored as a vector
    a <- c(1,2,3,4,5);
    c(8, 9, 7, 6) -> d;
    assign('f', c(2,4,6,8,11,13,15));
    
    print (a);  print (d);  print(f)
    a[1] <- 18;     print (a)
    print (paste("indexing ", a[3]))
    
    # negative indices give everything except these indices.
    print ("Negative indexing: "); print (a[-2])
    
    # you can take more than one value at a time by using another vector of index numbers => this is called splicing
    g <- f[c(2,4)]; print ("Using vector indexing "); print(g)
    
    # if the value is missing, you could use NA for not available; or use NaN for not a number as a place holder
    f[3] <- NA;     print (f)
    
    # as NA, NaN is not really a value, but Markers, you can't use x == NA for logical testing
    # To test for the presence of missing values, use is.na (x) or is.nan(x)
    # is.na(x) is TRUE both for NA and NaN values.To differentiate these, is.nan(x) is only TRUE for NaNs 
    
    e <- numeric();     print (paste("value of e is ", e));
    e[3] <- 17;         print ("the new value of e is ");   print(e);
    
    # splicing
    b <- seq(1:10);     print (b);      print (b[1:5]);     print (b[4:5]);
    
    # if you want to save the output to a external file, use sink( )
    sink("sinkOutput.txt")      # divert all subsequent output from console to
    
    # to view the general information of your data, use str(), summary(), class(), mode(), length(), attribute() or fix( for editing )
    print("structure of a ");    print (str(a));     print("Class of a ");   print (class(a)); 
    print("mode() and length() of a ");     print (mode(a));    print (length(a));      # mode() and length() are also called “intrinsic attributes” of an object
    print("attributes() of a ");        print (attributes(a));  # get other non-intrinsic properties of an object, such as attribute()
    print("summary of a ");             print (summary(a));
    print("Meta data structure ");      print (ls.str());       # ls.str( ) to view all variables (meta data structure)
    
    # to restore it to the console once again
    sink();
    
    # to find out the arguments used for a function,
    print ("arguments for seq() is ");          print(args(seq))
    
    # The entities that R creates and manipulates are known as objects. These may be variables, 
    # arrays of numbers. To view the object list use > objects( ) or > ls ( )
    print (objects())
    print (ls())
    
    # to remove individual object use > rm (x, y, z, ink, junk, temp, foo, bar)
    rm (a, b)
    print ("After remove  the objects, check it again ");       print(ls())
    
    # rep() is used for replicating an object in various complicated ways:
    s1 <- rep(d, times=3);          print(s1);          # puts three copies of 'd' end-to-end in s1
    s2 <- rep(d, each=3);           print(s2);          # repeats each element three times
    
}