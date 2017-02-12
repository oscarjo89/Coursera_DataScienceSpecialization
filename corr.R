corr <- function(directory, threshold = 0) {
  # Save old directory
  old_dir <- getwd()
  # Setting directory
  #setwd(file.path("\\\\vis-srv/brukere$/Oscar.Haavardsholm/Desktop/Coursera_Data_Science/rprog-data-specdata", directory))
  setwd(file.path("C:/Users/Oscar/Desktop/Coursera_DataScienceSpecialization", directory))
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
