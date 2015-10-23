## These functions set up and cache the inverse of a
## user-specified matrix


## Bring in user-specified matrix and set up placeholder 
## in outer environment to hold the inverse object

    makeCacheMatrix <- function(x = matrix()) {
            v <- NULL
            set <- function(y) {
                    x <<- y
                    v <<- NULL
            }
            get <- function() x
            setinverse <- function(solve) v <<- solve
            getinverse <- function() v
            list(set = set, get = get,
                 setinverse = setinverse,
                 getinverse = getinverse)
    }


## check for cached inverse of user-defined matrix
## and return the cached inverse if available
## otherwise calculate and cache inverse using the
## structure established in the makeCacheMatrix function

    cacheSolve <- function(x, ...) {
            v <- x$getinverse()
            if(!is.null(v)) {
                    message("getting cached data")
                    return(v)
            }
            data <- x$get()
            v <- solve(data, ...)
            x$setinverse(v)
            v
    }


##To test in R
##source the code above
##issue ls() to be sure you have both functions available
##create a matrix object using the makeCacheMatrix function
##for example mymatrix <- makeCacheMatrix(matrix(c(1,2,3,4),2,2))
##check your matrix with the command mymatrix$get()
##create and cache the inverse  cacheSolve(mymatrix)
##test to see cached inverse by issuing again cacheSolve(mymatrix)