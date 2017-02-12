pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
        # Save old directory
        old_dir <- getwd()
        # Setting directory
        #setwd(file.path("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata", directory))
        setwd(file.path("C:/Users/Oscar/Desktop/Coursera_DataScienceSpecialization", directory))
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
