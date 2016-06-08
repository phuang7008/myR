# this is the math related file

myMath <- function() {
    
    a <- seq(1,10);    a[3] <- 12;  print (a);          # use seq() to create a number vector
    
    # Math. Internally calculations are done as double precision real numbers
    print("culculate mean, median, variance, sd, max and sum")
    print (mean(a));        print (median(a));          print (var(a));     # variance
    print (sd(a));          print (max(a));             print (sum(a));
    
    print (a == 5);     a[6] <- 12;     print (which(a==12))    # which indexes has value of 12
    
    b <- (3:12);        b <- b * 2;     b[5] <- 0;  b[8]<-2;    print (b);     # use colon : to create a number vector
    d <- b - a;         print("d values are ");    print (d);      print(d>=0);            print(sum(d>=0));
    e <- rbind(a,b,d);    print("rbind the vectors together to form a matrix");     print(e)
    n <- cbind(e, c(NA, NA, NA));       print("cbind() some NAs into the matrix for illustration");     print(n)
    
    a[13] <- 15;        print(a);       # elongation
    
    # apply(), sapply(), lapply(), tapply() functions. We will discuss them one by one. (http://www.r-bloggers.com/how-to-use-lists-in-r/)
    
    # apply() works on a matrix (not vectors or lists) and produce the same type of output such as vector or matrix. 
    # prototype: apply(x, MARGIN, func, ...) where "x", is whatever dataset or columns of a dataset you want to do something to.
    # "MARGIN" is how you want to apply function.  The choices are either over the rows (MARGIN=1) or the columns (MARGIN=2)
    # any parameters after the function are function's parameters
    ap1 <- apply(e, 1, sum, na.rm=TRUE);        print("apply() the sum function column-wide on a matrix and produce a vector");      print(ap1)
    
    # if you need to handle the NA values in your own defined function, the following is not going to work 
    ap2 <- apply(e, 2, function(x) { x > 0; na.rm=TRUE});       print("Check which one is larger than 0, produce a vector");      print(ap2)
    # you need to handle the NA a different way: THE RIGHT WAY
    ap2 <- apply(e, 2, function(x) { x[!is.na(x)] > 0} );       print("remove NA values and produce a matrix");      print(ap2)
    
    ap3 <- apply(e, 2, function(x) { x > 0 });       print("Check which one is larger than 0, produce a matrix");      print(ap3)
    
    # create a matrix of data using rnorm() function which is used to create a normal distribution data
    m <- matrix(cbind(rnorm(30,0), rnorm(30,2), rnorm(30,5)), nrow=30, ncol=3);         print("creating a dataset using rnorm()");   print(m)
    print("check to see if the mean values make sense after rnorm() creation");         print(apply(m, 2, mean))
    print("check the number of negative values in each column by subsetting");          print(apply(m, 2, function(x) length(x[x<0])))
    print("How to know what is passed to a function as x, is it a matrix?");            print(apply(m, 2, function(x) is.matrix(x)))
    print("or is it a vector? Here you don't have to define a function");   print(apply(m, 2, function(x) is.vector(x)));   print(apply(m, 2, is.vector))
    
    # sapply() works on a vector or list (not matrix) and produce a vector or a matrix; its prototype is sapply(data, function, ..., simplify=TRUE)
    print("using sapply() to a vector to produce a vector");        print(sapply(d, function(x) x^2))
    print("Passing simplify=FALSE to sapply will also give you a list:");       print(sapply(d, function(x) x^2, simplify=FALSE))
    
    # lapply() works on a vector or list and produce a list; its prototype is lapply(data, function)
    print("using lapply() to a vector to produce a list");          print(lapply(d, function(x) x^2))
    print("And you can use unlist with lapply to get a vector.");   print(unlist(lapply(d, function(x) x^2)))
    
    # However the behviour is not as clean when things have names, so best to use sapply or lapply as makes sense for your data and what you want to receive back. 
    # If you want a list returned, use lapply. If you want a vector, use sapply. So you can use lapply() to create a list for you
    # This is because the key about lapply() is that it returns a list of the same length as whatever you input.
    print("try to create a list containing 2 matrices");        lm <- lapply(1:2, function(x) matrix(rnorm(2, 6, 1), nrow=2, ncol=3));      print(lm)
    
    print("Use lapply() or sapply() on this newly created list to get the sum of each column of each matrix:");     print(lapply(lm, colSums))
    sm <- sapply(lm, colSums);      print("using sapply() to produce a matrix");    print(sm);      print(class(sm))
    
    # for tapply(), we need to group the data into different subsets or using indexing to subset the data, the apply the func to each group
    # the first argument is an atomic object, which usually should be a vector. and the group should be of the same length
    print("check the length of the data e");        print(apply(e, 1, length));     print(n[a])
    tgroup <- c('a', 'a', 'a', 'b', 'b', 'a', 'b', 'b', 'b', 'a','b', 'b', 'a');      print("create a vector of factor");     print(tgroup)
    ta <- tapply(n[a], tgroup, mean, na.rm=TRUE);      print("after tapply(), here is the grouping results");      print(ta)
    
    # To group data by more than one category, one could use list() function in the INDEX parameter of tapply(x, INDEX, func, ..., simplify=TRUE)
    print("Group mtcars by # of Cylinders and type of Transmission and find means");       
    print(tapply(mtcars$mpg, list(mtcars$cyl, mtcars$am), mean));
    print("OR you could use the : (along with with() function, so one could simplify writing");    print(with(mtcars, tapply(mpg, list(cyl,am), mean)))
    
    # the by() function is just like tapply(), but most people think by() is just a wrapper function for tapply()
    # for example, if you'd like to run the same model over and over again, but with different subsets of data (eg, genes in microarray data)
    bd <- do.call('rbind', as.list(by(mtcars, list(cyl=mtcars$cyl), function(x) { y <-subset(x, select=-cyl); apply(y, 2, mean)})))
    print ("using by() function ");     print(bd)
}