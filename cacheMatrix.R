## Put comments here that give an overall description of what your
## functions do
##Our aim in this experiment is to write a pair of functions, namely,
##"makeCacheMatrix" and "cacheSolve" that cache the inverse of a matrix
##Write a short comment describing this function
##makeCacheMatrix is a function which creates a special "matrix" object that can
##cache its inverse for the input (which is an invertible square matrix)
## Write a short comment describing this function

setwd('C://Users//adeel/Documents/Coursera-R')
##
## I simply set the input x as a matrix
## and then set the solved value "s" as a null
## then I changed every reference to "mean" to "solve"
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
## Same here, changed "mean" to "solve" and "m" to "s"
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}