complete <- function(directory, id = 1:332) {
  # Save old directory
  old_dir <- getwd()
  # Setting directory
  #setwd(file.path("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata", directory))
  setwd(file.path("C:/Users/Oscar/Desktop/Coursera_DataScienceSpecialization", directory))
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
