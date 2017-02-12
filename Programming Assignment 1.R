##########################################
#Programming assignment 1



##########################################
#Part 1 - pollutantmean

rm(list=ls())
dir()
getwd()
list.files()

#old_dir
#setwd("\\\\vis-srv/brukere$/Oscar.Haavardsholm/My Documents")
#setwd("C:/Users/oscar.haavardsholm/My Documents")

#new dir
#setwd("C:/Users/oscar.haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata")
#setwd("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata")


pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
        # Save old directory
        old_dir <- getwd()
        # Setting directory
        setwd(file.path("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata", directory))
        # List files in directory
        files_full <- list.files()
        
        # Create dataframe (with data frame properties)
        dat <- data.frame()
        
        # Loop through the specified files and row bind them into the dataframe
        for (i in id) {
                dat <- rbind(dat, read.csv(files_full[i]))
        }
        
        # Set  back working directory
        setwd(old_dir)
                
        # Take the mean of the pollutant collum for all rows in dataframe (which is all the relevant files combined in one df. Omit/ignore NAs)
        mean(dat[, pollutant], na.rm = TRUE)

}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
getwd()


##########################################
#Part 2 - complete cases


x <- c(1, 3, NA, 5)
sum(complete.cases(x))
?data.frame

dat <- data.frame()


complete <- function(directory, id = 1:332) {
        # Save old directory
        old_dir <- getwd()
        # Setting directory
        setwd(file.path("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata", directory))
        # List files in directory
        files_full <- list.files()
        
        # Create dataframe (with data frame properties)
        dat <- data.frame()
        
        # Loop through the specified files, count complete cases and rowbind the file name and nomber of complete observations
        for (i in id) {
                dat <- rbind(dat, cbind(i, sum(complete.cases(read.csv(files_full[i])))))
        }
        
        # Give dataframe heading names
        names(dat) <- c("id", "nobs")
        
        # Set  back working directory
        setwd(old_dir)
        
        # Return data frame
        dat
}

complete <- function(directory, id = 1:332) {
        # Save old directory
        old_dir <- getwd()
        # Setting directory
        setwd(file.path("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata", directory))
        # List files in directory
        files_full <- list.files()
        
        # Create dataframe (with data frame properties)
        dat <- data.frame()
        
        # Loop through the specified files, count complete cases and rowbind the file name and nomber of complete observations
        for (i in id) {
                moni_i <- read.csv(files_full[i])
                nobs <- sum(complete.cases(moni_i))
                tmp <- data.frame(i, nobs)
                dat <- rbind(dat, tmp)
        }
        
        # Give dataframe heading names
        colnames(dat) <- c("id", "nobs")
        
        # Set  back working directory
        setwd(old_dir)
        
        # Return data frame
        dat
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

##########################################
#Part 3 - correlation sulfate and nitrate, threshold

rm(list=ls())
?cor
getwd()


corr <- function(directory, threshold = 0) {
        # Save old directory
        old_dir <- getwd()
        # Setting directory
        setwd(file.path("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata", directory))
        # List files in directory
        files_full <- list.files()
        
        # Create vector
        dat <- vector(mode = "numeric", length = 0)
        
        # Loop through all files
        for (i in 1:length(files_full)) {
                # read in file
                moni_i <- read.csv(files_full[i], header = TRUE)
                # omit NAs
                complete_moni_i <- moni_i[complete.cases(moni_i),]
                # count number of observations
                nobs <- nrow(complete_moni_i)
                
                # if nobs above threshold
                if (nobs > threshold) {
                        # correlate sulfate and nitrate and combine results in vector using concatinate
                        dat <- c(dat, cor(complete_moni_i$sulfate, complete_moni_i$nitrate))
                }
                
                
        }
        
        # Set  back working directory
        setwd(old_dir)
        
        return(dat)
        
}



cr <- corr("specdata", 150)
head(cr)      

summary(cr)

cr <- corr("specdata", 400)
head(cr)

summary(cr)

cr <- corr("specdata", 5000)
summary(cr)

length(cr)

cr <- corr("specdata")
summary(cr)

length(cr)
