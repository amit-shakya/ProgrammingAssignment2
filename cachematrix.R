## makeCacheMatrix creates and also returns a list of functions

## used by cacheSolve to get inverted matrix in cache

makeCacheMatrix <- function(x = matrix()) {


## stores cached value 
cache <- NULL
set <- function(y) {
  x <<- y
  cache <<- NULL
}
get <- function () x
setMatrix <- function(inverse) cache <<- inverse
getInverse <- function() cache
list(set = set, get = get,
     setMatrix = setMatrix,
     getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  cache <- x$getInverse()
  if (!is.null(cache)) {
    message("receiving cached data")
    return(cache)
  }
  matrix <- x$get()
  cache <- solve(matrix, ...)
  x$setInverse(cache)
  cache
}

