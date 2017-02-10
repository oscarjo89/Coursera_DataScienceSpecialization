# Coursera specialization: Data Science
########################################

# Course #3: Getting and Cleaning Data
#######################################

# Week 1 ------------------------------------------------------------------
# Week 1: Finding data and reading different file types
##########################################################

getwd()
# setwd()
# relative setwd("./data") to the file named data in wd, setwd("../") up one level from current wd
# absolute setwd("/Users/jtleek/data/")
# Important difference in Windows \ instead of /
# \\vis-srv\brukere$\Oscar.Haavardsholm\Desktop\Coursera_Data_Science

setwd("R:/1.2 Pågående prosjekter/Nye Veier Ringvirkninger AgB HVe/Oscar/Data fra COWI/RTM_sor_2/Basis2022sor_LOSdata") ## fellesområdet

setwd("//vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science")

# Checking for and creating directories
if (!file.exists("data")) {
        dir.create("data")
}

## Getting data from the internet

#download.file()
fileUrl <- "https://data.baltimorecity.gov/api/views7dz54-2aru/rows.csv?accessType=DOWNLOAD"
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv")

# sometimes need to put in argument , method = "curl"

list.files("./data")

dataDownloaded <- date()
dataDownloaded

## Reading local flat files
# read.table()
cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
head(cameraData)

cameraData <- read.csv("./data/cameras.csv")
head(cameraData)

# quote - you can tell R wheather there are any quoted values quote="" means no quotes

## Reading excel files
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.xlsx")
dataDownloaded <- date()

install.packages("xlsx")
library(xlsx)

cameraData <- read.xlsx("./data/cameras.xlsx", sheetIndex=1, header=TRUE)
head(cameraData)












# Week 2 ------------------------------------------------------------------
# Week 2: Introduction to the most common data storage systems and 
#         the appropriate tools to extract data from web or from databases like MySQL
##########################################################

# Week 3 ------------------------------------------------------------------
# Week 3: Organizing, merging and managing the data
##########################################################

# Week 4 ------------------------------------------------------------------
# Week 4: Text and date manipulation in R
##########################################################