# Test ?? bruke RStudio p?? gamle macen min..

# Fortsett p?? Coursera kurset Data Science Specialization
# Programming in R

# Week 4

# Programming assignment 3
# Download ProgAssignment3-data.zip file

# Find and read data

getwd()
setwd("/Users/oscarhaavardsholm/Desktop/Coursera Data Science/rprog-data-ProgAssignment3-data")
dir()

hospital_data <- read.csv("hospital-data.csv")
outcome_of_care_measures <- read.csv("outcome-of-care-measures.csv")


dim(outcome_of_care_measures)
class(outcome_of_care_measures)
head(outcome_of_care_measures)
str(outcome_of_care_measures)

dim(hospital_data)
class(hospital_data)
head(hospital_data)
str(hospital_data)


# 1 Plot the 30-day mortality rates for heart attack
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

ncol(outcome)
names(outcome)

plot(outcome[ ,"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"])

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])
plot(outcome[, 11])


# 2 Finding the best hospital in a state
source("best2.R")
best("TX", "heart attack")
best("TX", "heart failure") ## feil
best("MD", "heart attack")
best("MD", "pneumonia") ## feil
best("BB", "heart attack")
best("NY", "hert attack")


# 3 Ranking hospitals by outcome in a state










