## Put comments here that give an overall description of what your
## functions do
## These 2 functions create a special matrix object that allows us to cache the value of the inverse and retrieve it

## Write a short comment describing this function
## This function creates a special matrix object that returns 4 functions to set and get the value of the matrix
## and set and get the (cached) inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInv <- function(inverse) inv <<- inverse
  getInv <- function() inv
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## Write a short comment describing this function
## This function get the inverse of the matrix, if null (not cached) compute it, put it in the cache and return it
cacheSolve <- function(x, ...) {
  inv <- x$getInv()
  if(!is.null(inv)) {
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat)
  x$setInv(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}
