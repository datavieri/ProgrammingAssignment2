## Provide a caching mechanism for matrix inversion
## by means of a constructor function (makeCacheMatrix) 
## and a wrapper function (cacheSolve) 

## makeCacheMatrix 
## a constructor function that takes in input a matrix
## and returns a "special matrix", which actually a list of functions to
## - Set the value of the input matrix 
##   (please note that when the value of x changes the cache is nulled)
## - Get the value of the input matrix
## - Set the value of the inverse matrix (calling solve function)
## - Get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        ## Nulls cache when matrix is changed
        s <<- NULL
    }
    get <- function() x
    setSolve <- function(solve) s <<- solve
    getSolve <- function() s
    list(set = set, 
         get = get,
         setSolve = setSolve,
         getSolve = getSolve)
}


## cacheSolve takes in input a "special matrix" x, constructed using the 
## makeCacheMatrix method, and returns the inverse matrix, using the cached
## value if available, or calling solve and setting the cache otherwise 

cacheSolve <- function(x, ...) {
    ## Check x cache for inverse matrix
    s <- x$getSolve()
    if(!is.null(s)) {
        ## Return cached value
        message("getting cached data")
        return(s)
    }
    m <- x$get()
    s <- solve(m)
    ## Set cache
    x$setSolve(s)
    s
}
