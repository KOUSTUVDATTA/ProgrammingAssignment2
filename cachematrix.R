# Create a matrix object to cache its inverse
makeCacheMatrix <- function( m = matrix() ) {
n <- NULL  
# function to set the matrix
set <- function( matrix ) {
m <<- matrix
n <<- NULL
}
# function to the get the matrix
get <- function() {
# Return the matrix
m
}
# function to set the inverse of the matrix
setInverse <- function(inverse) {
n<<- inverse
}  
# function to get the inverse of the matrix
getInverse <- function() {
# return the inverse
n
}
# Return a list of the methods
list(set = set, get = get,
setInverse = setInverse,
getInverse = getInverse)
}
# The following function calculates the inverse of the special "matrix" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInverse function.
cacheSolve <- function(m, ...) {
# Return a matrix which is inverse of 'm'
m <- m$getInverse()  
# return the inverse if its already there
if( !is.null(m) ) {
message("getting cached data")
return(m)
}
# get the matrix 
data <- m$get()
# calculate the inverse using solve function
m <- solve(data) %*% data
# Set the inverse 
m$setInverse(m)
# Return 
m
}
