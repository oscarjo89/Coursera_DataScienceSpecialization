# The art of Data Science - A guide for anyone who works with data
# By Roger D. Peng and Elizabeth Matsui

# In this script I will briefly present the main take aways from the book and apply them
# to a couple of hypothetical data analysis projects based on some of the data sets that come 
# with R in order to apply the knowledge from the book and to get practice with using R.
#  - Oscar, mon 9th jan 2017

## OBS, check out Google analytics and Bayesian statistics for further study

# Contents (of book)
# 1. Data analysis as art
# 2. Epicircles of analysis
# 3. Stating and refining the question
# 4. Exploratory data analysis
# 5. Using models to explore your data
# 6. Inference: A primer
# 7. Formal modeling
# 8. Inference vs Prediction
# 9. Interpreting your results
# 10. Communication

# EPICIRCLES OF ANALYSIS
# (1) Develop expectations
# (2) Collect data
# (3) Match expectations with data

# [1] Stating the question
# [2] Exploratory data analysis
# [3] Model building
# [4] Interpret
# [5] Communication

################################################################################################
#                   1 Set expectations       2 Collect information     3 Revise expectations    
################################################################################################
# 1. Question       Question of interest     Litterature search/       Sharpen question
#                   to audience              experts

# 2. EDA            Data are appropriate     Make exploratory          Refine question or
#                   for question             plots of data             collect more data

# 3. Formal model   Primary model            Fit secondary models,     Revise formal model to
#                   answers question         sensitivity analysis      include more predictors

# 4. Interpretation Interpretation of        Interpret totality of     Revise EDA and/or provide
#                   analysis provides a      analysis with focus on    specific & interpretable
#                   specific & meaningful    effect sizes and          answer
#                   answer to question       uncertainty

# 5. Communication  Process and results of   Seek feedback             Revise analysis or 
#                   analysis are understood                            approach to presentation
#                   complete & meaningful
#                   to audience
################################################################################################

###### 1. Question
# 1.1 Question of interest to audience
# 1.2 Litterature search/experts
# 1.3 Sharpen question
##### 2. EDA
# 2.1 Data are appropriate for question
# 2.2 Make exploratory plots of data
# 2.3 Refine question or collect more data
##### 3. Formal model
# 3.1 Primary model answers question
# 3.2 Fit secondary models, sensitivity analysis
# 3.3 Revise formal model to include more predictors
##### 4. Interpretation
# 4.1 Interpretation of analysis provides a specific & meaningful answer to question
# 4.2 Interpret totality of analysis with focus on effect sizes and uncertainty
# 4.3 Revise EDA and/or provide specific & interpretable answer
##### 5. Communication
# 5.1 Process and results of analysis are understood complete & meaningful to audience
# 5.2 Seek feedback
# 5.3 Revise analysis or approach to presentation


# STATING AND REFINING QUESTION
# - Types of questions
# 1. Descriptive
# 2. Exploratory
# 3. Inferential
# 4. Predictive
# 5. Causal
# 6. Mechanistic

# - Characteristics of a GOOD question
# 1. Of interest
# 2. Not already answered
# 3. Plausable framework
# 4. Answerable
# 5. Specific

# EXPLORATORY DATA ANALYSIS

# (1) Determine if there are any problems with your dataset
# (2) Determine whether the question you are asking can be answered by the data you have 
# (3) To develope a sketch of the answere to your question

# Checklist
# 1. Formulate your question
# 2. Read in your data
# 3. Check the packaging
# 4. Look at the top and bottom
# 5. Check your "n"s
# 6. Validate with at least one external data source
# 7. Make a plot
# 8. Try the easy solution first
# 9. Follow up 
#    - right data?
#    - need other data?
#    - right question?

# USING MODELS TO EXPLORE YOUR DATA
# Distribution
# Linear relationships

# INFERENCE
# Population
# Sampling
# Model for population

# FORMAL MODELING@
# Primary model
# Secondary models

# 1. outcome
# 2. key predictor
# 3. potential cofounders

# INFERENCE VS PREDICTION

# INTERPRETATION
# 1. Directionaity
# 2. Magnitude
# 3. Uncertainty

# COMMUNICATION
# 1. Audience
# 2. Content
# 3. Style
# 4. Attitude

# The R Datasets package ---------------------------------------------------------------

# Overview of datasets that come with R
# Use list and description to find datasets to preform data analysis on
library(help = "datasets")

# Or go to Packages > datasets

?data

# Potentially interesting datasets:
data("CO2")
CO2

data("ChickWeight")
ChickWeight

data("EuStockMarkets")
EuStockMarkets

data("HairEyeColor")
HairEyeColor

# Project 1 - Chicken weight and diet ---------------------------------------------------------------

rm(list = ls()) # remove all objects in workspace

?ChickWeight
data("ChickWeight")
ChickWeight
# The ChickWeight data frame has 578 rows and 4 columns from an experiment on the 
# effect of diet on early growth of chicks.

# I'll use this dataset as the basis for a hypotheical data analysis project

###### 1. Question
# 1.1 Question of interest to audience
# 1.2 Litterature search/experts
# 1.3 Sharpen question

# 1.1 How can we maximize profits? - asks hypothetical chicken farmers.
# 1.2 Lets assume I do some reaserch on chicken farming and discover that increasing chick weight
#     is a promising way of increasing profits. And I find the ChickWeight dataset. 
#     I also find prices for different diets (I'll have to construct hypothetical prices for this project).
chickenDietPrices <- data.frame(diet = c(1,2,3,4), price = c(4, 5, 6, 4.5))
chickenDietPrices
# 1.3 I sharpen the question to - "What diet leads to the fastest weight increase in chickens per dollar?"
#     The question is inferential since the experiment is done on a sample of chickens. 
#     Also it might be causal, because it is an experiment - which studies effect of diet on chicken weight.
#     The question is of interest, it is not already answered, it has a plausible framework, is answerable given the data and specific.

##### 2. EDA
# 2.1 Data are appropriate for question
# 2.1 I go to the ChickWeight dataset and chickenDietPrices, and expect I will find the answer here.
?ChickWeight
ChickWeight
chickenDietPrices
summary(ChickWeight$Diet)

# Create one dataset containing all relevant info
ChickWeight1 <- data.frame(ChickWeight, DietPrice = c(rep(4, 220), rep(5, 120), rep(6, 120), rep(4.5, 118)))
ChickWeight1

nrow(ChickWeight1)
ncol(ChickWeight1)
str(ChickWeight1)
summary(ChickWeight1)

head(ChickWeight1)
tail(ChickWeight1)

summary(ChickWeight1$Chick)
# There seems to be 50 chicks. Each measured 12 times, first up to 21st day of their life. Not all chicks have 12 obs, I assume some died earlier.  
# In result from summary() function, irst line chick is identifier, second line is number of observations. 

?ChickWeight
# Info on Chicken Weight dataset
#Format
#An object of class c("nfnGroupedData", "nfGroupedData", "groupedData", "data.frame") containing the following columns:
  #weight
    #a numeric vector giving the body weight of the chick (gm).
  #Time
    #a numeric vector giving the number of days since birth when the measurement was made.
  #Chick
    #an ordered factor with levels 18 < ... < 48 giving a unique identifier for the chick. The ordering of the levels groups chicks on the same diet together and orders them according to their final weight (lightest to heaviest) within diet.
  #Diet
    #a factor with levels 1, ..., 4 indicating which experimental diet the chick received.
  #Details
    #The body weights of the chicks were measured at birth and every second day thereafter until day 20. They were also measured on day 21. There were four groups on chicks on different protein diets.

# Lets assume I have checked with an external source (I have no internet here in Cuba!) and found that weight of chickens are around what it says in the dataset, in grams the first 21 days of their life.
# Link to wikipedia page on chickens.

# 2.2 Make exploratory plots of data
# Make a plot:
?plot
plot(ChickWeight1$Time, ChickWeight1$weight, main = "Chick weight over time", xlab = "Days", ylab = "Grams")
# As expected weight of chicks increase with days. The variance increases with time.

# I would like to see the same plot but differentiating between diet types, preferably with trendline for each diet type. An 
# I use filter function in the dplyr package to create subsets of dataset for each diet type. Then plot them each individually.
ChickWeight1_diet1 <- filter(ChickWeight1, Diet == 1)
ChickWeight1_diet2 <- filter(ChickWeight1, Diet == 2)
ChickWeight1_diet3 <- filter(ChickWeight1, Diet == 3)
ChickWeight1_diet4 <- filter(ChickWeight1, Diet == 4)
plot(ChickWeight1_diet1$Time, ChickWeight1_diet1$weight, main = "Chick weight over time", sub = "Diet 1", xlab = "Days", ylab = "Grams")
plot(ChickWeight1_diet2$Time, ChickWeight1_diet2$weight, main = "Chick weight over time", sub = "Diet 2", xlab = "Days", ylab = "Grams")
plot(ChickWeight1_diet3$Time, ChickWeight1_diet3$weight, main = "Chick weight over time", sub = "Diet 3", xlab = "Days", ylab = "Grams")
plot(ChickWeight1_diet4$Time, ChickWeight1_diet4$weight, main = "Chick weight over time", sub = "Diet 4", xlab = "Days", ylab = "Grams")
# Based on just looking at the plots, diet 3 seems most promising.

# Figured out I can use abline and lm to get trendline of all observations, and for each diet! :)
plot(ChickWeight1$Time, ChickWeight1$weight, main = "Chick weight over time", xlab = "Days", ylab = "Grams")
?abline
abline(lm(ChickWeight1$weight ~ ChickWeight1$Time), col = "red")

abline(lm(ChickWeight1_diet1$weight ~ ChickWeight1_diet1$Time), col = "blue")
abline(lm(ChickWeight1_diet2$weight ~ ChickWeight1_diet2$Time), col = "green")
abline(lm(ChickWeight1_diet3$weight ~ ChickWeight1_diet3$Time), col = "orange")
abline(lm(ChickWeight1_diet4$weight ~ ChickWeight1_diet4$Time), col = "yellow")
# The trendlines/least squared fitted lines reveal that that diet 3 is the diet that gives the highest weight increase for chickens in this experiment.

?boxplot
boxplot(ChickWeight1$weight ~ ChickWeight1$Diet)
# Boxplot also shows that diet 3 is the highest mea weight. Note, it also has the most varience.

# I have made some plots and tried the easy solution first. It seems to indicate that diet 3 is the way to go.
# I would like to do morw research on the experiment and the chickens used, and investigate weather or not these can be interprited as representative for the chickens that the farmers I am working for are interested in.

# 2.3 Refine question or collect more data


# EXPLORATORY DATA ANALYSIS

# (1) Determine if there are any problems with your dataset
# (2) Determine whether the question you are asking can be answered by the data you have 
# (3) To develope a sketch of the answere to your question

# Checklist
# 1. Formulate your question
# 2. Read in your data
# 3. Check the packaging
# 4. Look at the top and bottom
# 5. Check your "n"s
# 6. Validate with at least one external data source
# 7. Make a plot
# 8. Try the easy solution first
# 9. Follow up 
#    - right data?
#    - need other data?
#    - right question?



##### 3. Formal model
# 3.1 Primary model answers question
# 3.2 Fit secondary models, sensitivity analysis
# 3.3 Revise formal model to include more predictors

# First make a simple regression model with weight is dependent and time as independent variable, since it will probably explain most of the weight increase
?lm
model1 = lm(ChickWeight1$weight ~ ChickWeight1$Time)
model1 = lm(weight ~ Time, data = ChickWeight1)

summary(model1)

# Create a model with diet 2-4 as dummy variables.
model2 = lm(weight ~ Time + Diet, data = ChickWeight1)
summary(model2)

weightIncreasePerDollarDiet2 = 16.1661/5
weightIncreasePerDollarDiet3 = 36.4994/6
weightIncreasePerDollarDiet4 = 30.2335/4.5

weightIncreasePerDollarDiet2
weightIncreasePerDollarDiet3
weightIncreasePerDollarDiet4

# Because the primary question was which diet creates the larges increase in chick weight per dollar.
# Diet 3 gave the highest weight increase, but it was also the most expensive.
# When we factor in price, diet 3 is the reccomended diet for our farmers.

##### 4. Interpretation
# 4.1 Interpretation of analysis provides a specific & meaningful answer to question
# 4.2 Interpret totality of analysis with focus on effect sizes and uncertainty
# 4.3 Revise EDA and/or provide specific & interpretable answer

##### 5. Communication
# 5.1 Process and results of analysis are understood complete & meaningful to audience
# 5.2 Seek feedback
# 5.3 Revise analysis or approach to presentation
