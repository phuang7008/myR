# this is the math related file

myMath <- function() {
    
    a <- seq(1,10);    a[3] <- 12;  print (a);          # use seq() to create a number vector
    
    # Math. Internally calculations are done as double precision real numbers
    print (mean(a));        print (median(a));          print (var(a));     # variance
    print (sd(a));          print (max(a));             print (sum(a));
    
    print (a == 5);     a[6] <- 12;     print (which(a==12))    # which indexes has value of 12
    
    b <- (3:12);     b <- b * 2;     b[5] <- 0;  b[8]<-2;    print (b);     # use colon : to create a number vector
    d <- b - a;         print (d);      print(d>=0);            print(sum(d>=0));
    
    a[13] <- 15;        print(a);       # elongation
}