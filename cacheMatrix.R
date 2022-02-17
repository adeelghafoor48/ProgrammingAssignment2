MakeCacheMatrix <- function(x = matrix()){
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) {inv <<- inverse}
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
cacheSolve <- function(x, ...){
  inv <- x$getinverse()
  if(!is.null(inv)){
    messeage("getting cached data")
    return(inv)
  }  
  data <- x$get()
  inv <- solve(data, ...)
  xset$inverse(inv)
  inv
}