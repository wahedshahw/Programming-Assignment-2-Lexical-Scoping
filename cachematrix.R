## These two functions cache and compute the inverse of a matrix

## This function creates a environment to store a matrix and cache its inverse

makeCacheMatrix <- function(x = matrix()) {

  env<- new.env()  
  
  env$matrix <- x 
  env$inverse <- NULL
  
  env$set <- function(y) {
  env$matrix <<- y
  env$inverse <<- NULL
    
  }
  
  env$get <- function() {
   env$matrix 
  }
 
 
 setInverse <- function(inverse) {
   env$inverse <<- inverse
 }

env$getInverse <- function() {
  env$inverse
}

 env

}

## This function computes the inverse of the matrix, using the cache if available

cacheSolve <- function(x, ...) {
  
  inv <- x$getInverse()
  
  
  if (!is.null(inv)) {
    return(inv)
  }
  
data <- x$get()
inv <- solve(data)
x$setInverse(inv)

inv
       
}
