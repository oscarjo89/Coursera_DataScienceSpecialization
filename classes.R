# Coursera specialization: Data Science
########################################

# Course #2: R Programming
###########################

# Week 1 ------------------------------------------------------------------
# Week 1: Background, getting started and nuts & bolts
##########################################################


#### R console input and evaluation
x <- 1
print(x)
x
msg <- "Hello world!"

x <- 5 ## nothing printed
x		## auto-printing occurs
print(x)   ## explicit printing

x <- 1:20
x


##### Data types - R objects and attributes
# atomic classes of objects
'''
character
numeric (real numbers)
integer
complex
logical (true/false)
'''

# vectors, contain objects of same class. except a list
vector()
#numbers
#attributes


##### Data types - Vectors and Lists

# Creating vectors
x <- c(0.5, 0.6)		##numeric
x
x <- c(TRUE, FALSE)	##logical
x <- c(T, F)		##logical
x
x <- c("a", "b", "c")	##character
x
x <- 9:29			##integer
x
x <- c(1+0i, 2+4i)	##complex
x

x <- vector("numeric", length = 10)
x

# Mixing objects
y <- c(1.7, "a")	##character
y
y <- c(TRUE, 2)	##numeric
y
y <- c("a", TRUE) ##character
y

# Explicit coercion
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)
as.complex(x)

x <- c("a", "b", "c")	#nonsensical
as.numeric(x)

# Lists, can contain elements of different classes
x <- list(1, "a", TRUE, 1+4i)
x


##### Data types - Matrices

m <- matrix(nrow = 2, ncol = 3)
m

dim(m)
attributes(m)

m <- matrix(1:6, nrow = 2, ncol = 3)
m

m <- 1:10
m

dim(m) <- c(2,5)
m

x <- 1:3
x
y <- 10:12
y
cbind(x,y)
rbind(x,y)


##### Data types - Factors
# categorical data, ordered og unordered

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)

x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x		#may be important for basline level


##### Data types - Missing values
#NA og NaN (mathematical)

is.na()
is.nan()

x <- c(1, 2, NA, 10, 3)
x
is.na(x)
is.nan(x)

x <- c(1, 2, NaN, NA, 4)
x
is.na(x)
is.nan(x)


##### Data types - Data frames
# Used to store tabular data
# row.names
# read.table() or read.csv()
# data.matrix()

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)


##### Data types - The Names Attribute

x <- 1:3
x
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)

# lists can also have names

x <- list(a=1, b=2, c=3)
x

# matrices
m <- matrix(1:4, nrow = 2, ncol=2)
m
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m


##### Data types - Summary
#Data types:
#atomic classes: numeric, logical, character, integer, complex
#vectors, lists
#factors
#missiong values
#data frames
#names


#### Reading tabular data
# Reading data
#read.table()	##tabular data
#read.csv()		##tabular data
#readLines()	##reading lines of a text file
#source()		##for reading in R code files (inverse of dump)
#dget()		##for reading in R code files (inverse of dput)
#load()		##for reading in saved workspaces
#unserialize()	##for reading single R objects in binary form

# Writing data, the analogous functions for writing data to files
#write.table()	##tabular data
#write.csv() ??	##tabular data
#writeLines()	##text file
#dump()		##R code files
#dput()		##R code files
#save()		##saved workspaces
#serialize()	##single R objects in binary form

# Reading data files with read.table
#arguments:
#file
#header
#sep
#colClasses
#nrows
#comment.char
#skip
#stringsAsFactors

data <- read.table("foo.txt")

#### Reading large tables
# read help page for read.table/csv
# specify, so that R doesnt have to figure out on own. saves time!
# know system, and do calculation beforehand

#### Textual data formats
# dget()
# dump()

#dput-ting R Objects
y <- data.frame(a=1, b="a")
y
dput(y)
structure(list(a=1,
               b= structure(1L, .Lable ="a",
                            class="factor")),
          .Names = c("a", "b"), row.names = c(NA, -1L),
          class = "data.frame")
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y

#### Connections: Interfaces to the outside world
#file
#gzfile
#bzfile
#url

#Reading lines of a text file
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)


#### Subsetting - Basics
#[x] 		object of same class
#[[x]]	list or dataframe
#$       elelments by names

#numeric
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]

#logical
x[x > "a"]
u <- x > "a"
u
x[u]

#### Subsetting - Lists
x <- list(foo= 1:4, bar = 0.6)
x

x[1]
x[[1]]

x$bar
x[["bar"]]
x["bar"]

# multiple elemts from list
x <- list(foo= 1:4, bar = 0.6, baz = "hello")
x
x[c(1, 3)]

x <- list(foo= 1:4, bar = 0.6, baz = "hello")
name <- "foo"
x[[name]]		##computed index for 'foo'
x$name		##element 'name' doesnt exist!
x$foo			##element 'foo' does exist!


#### Subsetting - Matrices
x <- matrix(1:6, 2, 3)
x
x[1, 2]
x[2, 1]

x[1, ]
x[, 2]

x[1, 2, drop = FALSE]
x[1, , drop = FALSE]

#### Subsetting - Partial matching (subsetting with names)
x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = FALSE]]

#### Subsetting - Removing missing values
x <- c(1, 2, NA, 4, NA, 5)
x
bad <- is.na(x)
bad
x[!bad]

x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
x
y
good <- complete.cases(x,y)
good
x[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]


#### Vectorized operations
x <- 1:4; y <- 6:9
x
y
x + y
x > 2
x >= 2
y == 8
x * y
x / y

# Vectorized matrix operations
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x
y

x * y			##element-wise multiplication
x / y
x %*% y		##true matrix multiplication 



x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x,y)


# Quiz Week 1 -------------------------------------------------------------
############################
# Quiz - Week 1
#### quiz
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x,y)

x <- 1:4
y <- 2:3
x
y
x + y

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>10] <- 4
x
x[x>10] == 4
x

# In order to answer questions 11-20, I need the provided dataset "hw1_data"

#set working directory to where file is located
setwd("C:/Users/oscar.haavardsholm/Desktop/Coursera Data Science")

#read the data
read.csv("hw1_data.csv")

#11.
hw1_data <- read.csv("hw1_data.csv")
hw1_data
print(hw1_data)

names(hw1_data)

head(hw1_data)

#12
hw1_data[1:2, ]

#13
dim(hw1_data)
nrow(hw1_data)
ncol(hw1_data)

#14
hw1_data[152:153, ]

#15
hw1_data[47, "Ozone"]
hw1_data

#16
hw1_data[, "Ozone"]
hw1_data[ ,1]
is.na(hw1_data[, "Ozone"])
na_in_ozone <- is.na(hw1_data[ ,1])
na_in_ozone
table(na_in_ozone)

#17
good_ozone <- complete.cases(hw1_data[, "Ozone"])
hw1_data[, "Ozone"][good_ozone]
mean(hw1_data[, "Ozone"][good_ozone])

#18
hw1_data
head(hw1_data)
#haha, airquality som er brukt i examples på hjelp siden til funskjonen subset er likt som hw1_data
subset(hw1_data, Ozone>31 & Temp>90, Solar.R)

hw1_data[hw1_data[,"Ozone"]>31 & hw1_data[,"Temp"]>90, "Solar.R"]
complete.cases(hw1_data[hw1_data[,"Ozone"]>31 & hw1_data[,"Temp"]>90, "Solar.R"])
hw1_data[hw1_data[,"Ozone"]>31 & hw1_data[,"Temp"]>90, "Solar.R"][complete.cases(hw1_data[hw1_data[,"Ozone"]>31 & hw1_data[,"Temp"]>90, "Solar.R"])]
mean(hw1_data[hw1_data[,"Ozone"]>31 & hw1_data[,"Temp"]>90, "Solar.R"][complete.cases(hw1_data[hw1_data[,"Ozone"]>31 & hw1_data[,"Temp"]>90, "Solar.R"])])

#19
head(hw1_data)

hw1_data[hw1_data[,"Month"]==6,"Temp"]
mean(hw1_data[hw1_data[,"Month"]== 6,"Temp"])

#20
head(hw1_data)

hw1_data[hw1_data[,"Month"]==5,"Ozone"]
complete.cases(hw1_data[hw1_data[,"Month"]==5,"Ozone"])
Ozone_may <- hw1_data[hw1_data[,"Month"]==5,"Ozone"][complete.cases(hw1_data[hw1_data[,"Month"]==5,"Ozone"])]

max(Ozone_may)



# Swirl - Lesson 1-7 ------------------------------------------------------
####################################################################
#Practical R Exercises in swirl 

#install.packages("swirl")

#load swirl
library(swirl)

#Clear contents before starting swirl
ls()
rm(list=ls())
ls()

#install_from_swirl("R Programming")
swirl()
Oscar

#1?

#play()
#nxt()



# Course #2: R Programming
###########################

# Week 2 ------------------------------------------------------------------
# Week 2: Programming with R
##########################################################

###Control Structures - Intro
# Not for interactive mode, but for programming. 
# Control structures in R allow you to control the flow
# of execution of the program, depending on the runtime
# conditions.

###Control Structures - If-else

x <- 2

if(x < 3) {
	y <- 10
} else {
	y <- 0
}

y

y <- if(x < 3) {
	10
} else {
	0
}



###Control Structures - For loops

for (i in 1:10) {
	print(i)
}

x <- c("a", "b", "c", "d")

for(i in 1:4) {
	print(x[i])
}

for(i in seq_along(x)) {
	print(x[i])
}

for(letter in x) {
	print(letter)
}

for (i in 1:4) print(x[i])


#Nested for loops

x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
	for(j in seq_len(ncol(x))) {
		print(x[i,j])	
	}
}
 

###Control Structures - While loops

count <- 0
while(count < 10) {
	print(count)
	count <- count + 1
}

z <- 5

while(z >= 3 && z <= 10) {
	print(z)
	coin <- rbinom(1, 1, 0.5)

	if(coin ==1) {   ## random walk
		z <- z + 1
	} else {
		z <- z - 1
	}
}

###Control Structures - Repeat, Next, Break



###Your first R function

# see functions.R
# in C:\Users\oscar.haavardsholm\Desktop\Coursera Data Science

###Functions (part 1)

#f <- function(<arguments>) {
	## Do something interesting 
#}

mydata <- rnorm(100)
mydata
sd(mydata)
sd(x = mydata)
sd(x = mydata, na.rm = FALSE)

# Argument matching
args(lm)


###Functions (part 2)

# Defining a function
f <- function(a, b = 1, c = 2, d = NULL) {

}

# Lazy evaluation
f <- function(a, b) {
	a^2
}
f(2)

f <- function(a,b){
	print(a)
	print(b)
}
f(45)

#The "..." argument



###Scoping rules - Symbol binding

search()


###Scoping rules - R scoping rules

#Lexical vs dynamic scoping
#where R looks for things, environments


###Scoping rules - Optimization example
#maximizing a normal likelihood

make.NegLogLik <- function(data, fixed = c(FALSE,FALSE) ) {
        params <- fixed
        function(p) {
            params[!fixed] <- p
            mu <- params[1]
            sigma <- params [2]
            a <- -0.5*length(data)*log(2*pi*sigma^2)
            b <- -0.5*sum((data-mu)^2 / (sigma^2))
            -(a + b)
        }
}


set.seed(1); normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLik(normals)
nLL

ls(environment(nLL))

optim(c(mu = 0, sigma = 1), nLL)$par

#Fixing sigma = 2
nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum

#Fixing mu=1
nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum

#Plotting the Likelihood
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")

nLL <- make.NegLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len = 100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type = "l")



###Coding standards
# 1 text editor
# 2 indent your code (4 or 8)
# 3 limit the with of your code (80 columns)
# Forcing you to think about how you code, not to complicated
# Split into logical functions. Easier for debugging.


###Dates and times

x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))


x <- Sys.time()
x
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x

class(x)

?strptime

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y

x <- as.POSIXlt(x)
x-y

# Keeps track of leap years, leap seconds, daylight savings and time zones
x <- as.Date("2012-03-01") 
y <- as.Date("2012-02-28")
x-y

x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")

x-y

# Swirl - Lesson 8,9 & 14 -------------------------------------------------
####################################################################
#Practical R Exercises in swirl 

#Clear contents before starting swirl
ls()
rm(list=ls())
ls()

#load swirl
library(swirl)

#install_from_swirl("R Programming")
swirl()
Oscar


#play()
#nxt()


# Quiz Week 2 -------------------------------------------------------------
############################
# Quiz - Week 2
####################################################################
#Quiz week 2
cube <- function(x, n){
        x^3
}
cube(3)

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}

z <-10
f(3)

x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}

y


# Week3 -------------------------------------------------------------------
# Week 3: Loop Functions and Debugging
##########################################################

# lapply
?lapply

x <- list(a = 1:5, b = rnorm(10))
x
lapply(x,mean)

x <- 1:4
lapply(x, runif)

x <- 1:4
lapply(x, runif, min=0, max=10)

# Anonymous functions
x <- list( a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x

lapply(x, function(elt) elt[,1])


# sapply
?sapply

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
x
lapply(x, mean)

sapply(x, mean)

# doesnt work on lists
mean(x)


# apply
?apply

x <- matrix(rnorm(200), 20, 10)

# collaps all the rows, keep columns
apply(x, 2, mean)

# collaps all the columns, keep rows
apply(x, 1, sum)

rowSums = apply(x, 1, sum)
rowMeans = apply(x, 1, mean)
colSums = apply(x, 2, sum)
colMeans = apply(x, 2, mean)


x <- matrix(rnorm(200), 20, 10)

apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2*2*10), c(2, 2, 10))
apply(a, c(1, 2), mean)

rowMeans(a, dims = 2)


# mapply
?mapply

list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4,1))

mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd) {
        rnorm(n, mean, sd)
}

noise(5, 1, 2)

noise(1:5, 1:5, 2)

mapply(noise, 1:5, 1:5, 2)


# tapply
?tapply

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f

tapply(x, f, mean)

tapply(x, f, mean, simplify = FALSE)


# split
?split

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f

split(x, f)

lapply(split(x, f), mean)

library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
s

lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
?lapply

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)

str(split(x, list(f1, f2)))

str(split(x, list(f1, f2), drop = TRUE))


# Debuggging Tools - Diagnosing the problem

# message, warning, error, condition


# Debuggging Tools - Basic Tools



# Debuggging Tools - Using the Tools



# Swirl - Lesson 10-11 -------------------------------------------------
####################################################################
#Practical R Exercises in swirl 

#install.packages("swirl")

#load swirl
library(swirl)

#Clear contents before starting swirl
ls()
rm(list=ls())
ls()

#install_from_swirl("R Programming")
swirl()
Oscar

#1?

#play()
#nxt()




# Quiz Week 3 -------------------------------------------------------------
############################
# Quiz - Week 3

library(datasets)
data(iris)
?iris

dim(iris)
head(iris)
summary(iris)
str(iris)

# Q1
tapply(iris$Sepal.Length, iris$Species, mean)

# Q2
apply(iris[, 1:4], 2, mean)
?apply

# Q3
library(datasets)
data(mtcars)
?mtcars

dim(mtcars)
head(mtcars)
summary(mtcars)
str(mtcars)

tapply(mtcars$mpg, mtcars$cyl, mean)

# Q4

tapply(mtcars$hp, mtcars$cyl, mean)


mean_hp_cyl8 <- mean(mtcars$hp[mtcars$cyl==8])
mean_hp_cyl4 <- mean(mtcars$hp[mtcars$cyl==4])

mean_hp_cyl8 - mean_hp_cyl4 

mean_hp_cyl8
mean_hp_cyl4

# Q5
#debug(ls)


# Week 4 -------------------------------------------------------------------
# Week 4: Simulation & Profiling
##########################################################

# The str Function

# basically tell us what is in this object?
str(str)
str(lm)
str(ls)

x <- rnorm(100, 2, 4)
x

summary(x)
str(x)

f <- gl(40, 10)
f
str(f)
summary(f)

library(datasets)
head(airquality)
str(airquality)

m <- matrix(rnorm(100), 10, 10)
m
str(m)
m[, 1]

s <- split(airquality, airquality$Month)
s
str(s)

# Simulation - Generating random numbers

x <- rnorm(10)
x

x <- rnorm(10, 20, 2)
x

summary(x)

# set seed in order to get the same random numbers
set.seed(1)
rnorm(5)
rnorm(5)

set.seed(1)
rnorm(5)

#generating poisson data

rpois(10, 1)
rpois(10, 2)
rpois(10, 20)


ppois(2, 2) ## Cumulative distribution
ppois(4, 2) ## Pr(x <= 4)
ppois(6, 2) ## Pr(x <= 6)


# Simulation - Simulating a linear model

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e

summary(y)
plot(x,y)

x
y

set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e

summary(y)
plot(x,y)


# Generating random numbers from a generalized linear model

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <- rpois(100, exp(log.mu))

summary(y)
plot(x,y)


# Simulation - Random sampling

set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)

sample(1:10) ## permutation

sample(1:10)

sample(1:10, replace = TRUE) ## Sample w/replacement


# R Profiler (part 1)

## Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))

## Elapsed time < user time
hilbert <- function(n) {
        i <- 1:n
        1 / outer(i - 1, i, "+")
}

x <- hilbert(1000)
system.time(svd(x))


# R Profiler (part 2)

#Rprof()
#summaryRprof()
#by.total
#by.self


# Swirl - Lesson 12-13&15 -------------------------------------------------
####################################################################
#Practical R Exercises in swirl 

#install.packages("swirl")

#load swirl
library(swirl)

#Clear contents before starting swirl
ls()
rm(list=ls())
ls()

#install_from_swirl("R Programming")
swirl()
Oscar

#2
#1

#play()
#nxt()

############# ggplot2

library(ggplot2)
str(mpg)
head(mpg)

qplot(displ, hwy, data =mpg)

# color by type
qplot(displ, hwy, data =mpg, color = drv)

# adding a geom
qplot(displ, hwy, data =mpg, geom = c("point", "smooth"))

# histogram
qplot(hwy, data = mpg, fill = drv)

# facets
qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(displ, hwy, data = mpg, facets = drv~., binwidth = 2)

# Quiz Week 4 -------------------------------------------------------------
############################
# Quiz - Week 4








