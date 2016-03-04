## Assignment2 Coursera R Programming
## Matrix inversion is usually a costly computation 
## and there may be some benefit to caching the inverse 
## of a matrix rather than compute it repeatedly 

## assignment is to write a pair of functions that cache the inverse of a matrix.

#this function:
#sets the value of a matrix then gets the value of the matrix
#sets the value of the inverse matrix then gets the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set=set, get=get, 
             setinverse=setinverse, 
             getinvinverse=getinverse)
}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
      inv <- x$getinverse()
      if(!is.null(inv)) {
            message("getting cached data.")
            return(inv)
       }
       data <- x$get()
       inv <- solve(data, ...)
       x$setinverse(inv)
       inv
}
