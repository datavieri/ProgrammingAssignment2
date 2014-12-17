## Usage
```R
  ## Create the matrix m
  > m <- matrix(rnorm(100), nrow = 10, ncol = 10)
  ## Create the "special" matrix cm
  > cm <- makeCacheMatrix(m)
  ## First call needs to evaluate inverse matrix (no "getting cached data" message)
  > heatmap(cm$get() %*% cacheSolve(cm), Rowv=NA, Colv=NA,  margins=c(5,5))
  ## Second call uses chached inverse matrix
  > heatmap(cm$get() %*% cacheSolve(cm), Rowv=NA, Colv=NA,  margins=c(5,5))
  getting cached data
  >
```

Plotting the product between m and its inverse matrix returns a nice diagonal matrix:

