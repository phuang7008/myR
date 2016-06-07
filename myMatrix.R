# this is for matrix (or array). A matrix is a collection of data elements arranged in a two-dimensional rectangular layout. 
# all elements of a matrix must be the same type

myMatrix <- function() {
    m <- matrix(c(2,4,3,65,1,7,88, 9), nrow=2, ncol=4);    print("construction of a matrix m");      print(m)
    
    # by default, matrix() fill the column first. You could change this my setting byrow=TRUE
    m2 <- matrix(c(2,4,3,65,1,7,88, 9), nrow=2, ncol=4, byrow=T);   print("fill row first m2");        print(m2)
    
    # We construct the transpose of a matrix by interchanging its columns and rows with the function t() .
    mt <- t(m);     print("Transpose of my first matrix m => mt");        print(mt)
    
    # Combining Matrices: The columns of two matrices having the same number of rows can be combined into a larger matrix. 
    m3 <- matrix(c(3,8,16,34), nrow=4, ncol=1);     print("a new matrix m3");      print(m3)
    m4 <- cbind(mt, m3);        print("column combine cbind() two matrices with the same # of rows m4");   print(m4)
    
    # Similarly, we can combine the rows of two matrices if they have the same number of columns with the rbind() function.
    m5 <- matrix(c(45,03,05,77), nrow=1, ncol=4);   print("a new row matrix m5");      print(m5)
    m6 <- rbind(m, m5);     print("row combined with rbind() two matrices with the same # of columns m6"); print(m6)
    
    # However, you need to be very careful when using rbind() or cbind(), as sometimes, 
    # the information will be lost when they combine together (such as conbime dates)
    d1 <- as.Date(1:3, origin='2007-01-01');    print("create a Date vector");  print(d1)
    d2 <- as.Date(21:23, origin='2007-01-01');  print("Create another Date");   print(d2)
    print("cbind() two Date vectors");    d3 <- cbind(x=d1, y=d2);      print("The Date information will be lost");     print(d3)
    
    # Deconstruction: We can deconstruct a matrix by applying the c() function, which combines all column vectors into one.
    x1 <- c(m6);        print("change the matrix m6 into a vector x1");     print(x1)
    
    # to specify a specific element of a matrix, use [row,col] for indexing, this is the same as data.frame
    print("Matrix indexing using [][]");       print(m4[2][2]);     print(m6[3][1])
    print("Matrix indexing using [,]");        print(m4[2][2]);     print(m6[3][1])
    
    # to extract all element of a row, use [n,], to extract all elements of a column, use [,n]
    print("extract entire row");    print(m4[2,]);      print(m6[1,])
    print("extract entire column"); print(m4[,2]);      print(m6[,1])
    
    # or use a vector index for multiple rows or columns
    print("Multiple rows");         print(m4[c(1,3),]);     print(m6[c(1,2),])
    print("Multiple column");       print(m4[, c(2,3)]);    print(m6[, c(1,2)]);
    
    # If we assign names to the rows and columns of the matrix, than we can access the elements by names.
    dimnames(m) <- list(c("row1", 'row2'), c('col1', 'col2', 'col3', 'col4'));   print("named matrix");  print(m);
    print("access matrix elements");    print(m['row1',]);   print(m[, 'col2'])
    

    
}