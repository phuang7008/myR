# A list is a data structure that can hold any number of any types of other data structures. http://www.r-bloggers.com/how-to-use-lists-in-r/
# If you have vector, a dataframe, and a character object, you can put all of those into one list object

myList <- function () {
    n=c(2, 3, 5);     s=c("aa", "bb", "cc", "dd", "ee");    b=c(TRUE, FALSE, TRUE, FALSE);    df=data.frame(y=c(1:3), x=c('m', 'm', 'f'));    chars<-("hello"); 
    x = list(n, s, b, 3, df, chars)   # x contains copies of n, s, b
    
    # you can turn any object into a list using as.list()
    aList <- as.list(n);     print("the first element is turn into a list");     print(aList)
    
    # find out how many items on the list, use length()
    print("The length of the list is ");    print(length(x))

    # slicing: We retrieve a list slice with the single square bracket "[]" operator. The following is a slice containing the second member of x, which is a copy of s.
    # it will return a list rather than the data structure that is the component of the list, which is normally not what we would want to do.
    print (x[2]);           print(x[c(2, 5)]);      print("The following returns a list"); print(x[6][1])
    
    # in addition, you cannot turn the sliced items into a list using as.list() because it already is a list
    xList <- as.list(x[2]);         print("You cannot turn it into a list by slicing (it's a list already)");     print(xList)
    
    # Member Reference: In order to reference a list member directly, we have to use the double square bracket "[[ ]]" operator. 
    # The following object x[[2]] is the second member of x. In other words, x[[2]] is a copy of s, but is not a slice containing s or its copy.
    print("extract 6th component using [[]] -> this returns a *string*");       print(x[[6]])
    
    # but you can turn the member reference items into a list using as.list()
    xList2 <- as.list(x[[2]]);       print("We just turned member reference into a list");       print(xList2)
    
    # if you look the str() of the list just created, you will notice that the variables inside list are nameless 
    print("List just created are nameless!");       print(str(x))
    
    # you could name them two ways, name them when you create them or name them using names() function
    xx <- list(Numbers=n, Chars=s, Bools=b, Nums=c(3), Tables=df, Letters=chars);      print("named list xx");     print(xx)
    names(x) <- c("Nums", "Chars", "Boolean", "Numbers", "DataFrame", "Letters");      print("named list x and its str()");      print(str(x))
    
    # in this case, you could extract components using their corresponding names: two ways $ and [[]]
    print("using $ to retrieve 6th component");     print(xx$Letters)
    print("using [[]] to retrieve 6th component");  print(xx[["Letters"]]);
    
    # to add or replace an item to the list, you need to use $ or [[]] operator
    x$newthing <- lm(y~x, data=df);     print("add a linear model to the list");        print(x)
    
    x[["Letters"]] <- "replaced with new item";     print("Replacement");       print(x)
    
    # you could also delete an item by setting it to NULL
    x[["Letters"]]<-NULL;       print("deleting an item");      print(x)
    
    # you could initialize a list with nothing
    xn <- vector('list', 3);        print("Initialize a list with nothing");    print(xn)
    
    # you could also unlist() a list to just a big, long vector
    print("To unlist a list");      print(unlist(x));
    
    
}