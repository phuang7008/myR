# this file is used to see how to read and write data in and out to output file

fileInOut <- function () {
    sink("ex.data");        # as the input file contains large amount of data usually, we just write everything onto a file
    
    # R provides many datasets in various packages. To view the dataset, type in data()
    print("To view all the datasets in R, type 'q' to quit");           aData<-data();     print(aData)
    
    # to load a specific dataset, also use data("dat")
    print("To load 'infert' dataset");      s1<-data(infert);           print(infert);      
    
    # To access data from a particular package, use the package argument: > data ( package = 'rpart‘ )
    print("Load data rpart from particular package");       data(package = 'rpart');
    
    # If a package has been attached by library, its datasets are automatically included in the search
    data ( Puromycin, package = 'datasets' )
    
    # there are several read related functions that could be used to read in dataset from a file
    # read.table() will read table in and store the results in a data frame, it treats the variables as numeric or as factors
    # by default, header is TRUE. So you only need it if there is no header information
    print("Read airquality.txt file");    x1 <- read.table("airquality.txt", header=TRUE);     print(x1)
    print('check to see if they are numeric or factor');        print(x1[['Ozone']]);     print(x1[['Day']])
    
    # you can use read.table to read any files in as long as you specify the 'sep' parameter, '\t' for tab seperated etc. or try read.delim()
    print("Read csv file using read.table()");      x2<-read.table("airquality.csv", header=T, sep=',');    print(x2);
    
    # or you could use read.csv() function to read the csv file into a data.frame
    print("Read airquality.csv file");    x2 <- read.csv("airquality.csv", header=TRUE);     print(x2)
    
    # to access the data stored in the variables, you need to use $ notation or using with() function
    print("output mean value of 'Wind' only");      print(mean(x2$Wind));      print("or use with()");     print(with(x2, mean(Wind)))
    
    # of course, you could assign a local variable to x2' Wind variable. To get the entire col of a data.frame, use x2[,col]
    wind <- x2[,3];     print("assign the local wind variable");        print(mean(wind));      
    print("you need to remove it when you are done with it");           rm(wind);
    
    # a third option is to use attach() function. It will attach all the variables in a data.frame to become local
    print("Using attach() method");     attach(x1);     print("now to see if it is in local");      print(ls());
    
    # however, the attach() method might create problems, especially when you use it often, as it will create variable conflict
    # so use it carefully. And remove them when you are done with those variables
    detach(x1);     print("detach the variables, now check if they are still local");       print(ls());
    
    # as the file path in R is hard to code for different systems, such as windows or linux. The best way is to use file.choose()
    print("using file.choose() function for file selection");       x3<-read.table(file.choose())
    
    sink();
}