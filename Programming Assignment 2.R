##########################################
#Programming assignment 2 - Lexical Scoping


# The second programming assignment will require you to write an R function is able to cache potentially time-consuming computations. 
# For example, taking the mean of a numeric vector is typically a fast operation. 
# However, for a very long vector, it may take too long to compute the mean, especially if it has to be computed repeatedly (e.g. in a loop). 
# If the contents of a vector are not changing, it may make sense to cache the value of the mean so that when we need it again, 
# it can be looked up in the cache rather than recomputed. 
# In this Programming Assignment will take advantage of the scoping rules of the R language and how they can be manipulated to preserve state inside of an R object.


# Example: Caching the Mean of a Vector
makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

# Assignment: Caching the Inverse of a Matrix

m <- matrix(c(4, 3, 3, 2), 2, 2)
m
#take the inverse of a square invertible matrix
solve(m)
?solve


# Write following functions

# 1: makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# 2: cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.


setwd("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science")

source("ProgrammingAssignment2/cachematrix.R")
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()

my_matrix$getInverse()

cacheSolve(my_matrix)

cacheSolve(my_matrix)

my_matrix$getInverse()

my_matrix$set(matrix(c(2, 2, 1, 4), 2, 2))

my_matrix$get()

my_matrix$getInverse()

cacheSolve(my_matrix)

cacheSolve(my_matrix)

my_matrix$getInverse()

