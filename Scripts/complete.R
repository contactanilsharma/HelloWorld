print(R.version.string)

#
# |------------------------------------------------------------------------------------------|
# | I N I T I A L I Z A T I O N |
# |------------------------------------------------------------------------------------------|
Init <- function(workDirStr = "C:/Users/anilkush/OneDrive - Capgemini/Documents/R/Projects/HelloWorld/data/") {
  setwd(workDirStr)
}

#' Programming Assignment 1: Air Pollution - Part-2
#'
#' @param directory is a charactor vector of lenght 1 indicating the location of the location of the CSV file
#' @param id is an integer vector indicating the monitor ID numbers to be used
#'
#' @return a data frame where the first column is the
#'         name of the file and the second column is the number of complete cases.
#' @author Anil K Sharma
#' @export
#'
#' @examples
#'
complete_func <- function(directory, ids = 1:332) {
  directory <- paste(getwd(),"/", directory, sep = "")
  
  #message("Directory:", directory)
  #message("IDs:", ids)
  
  complete_frame <- c(id = numeric(), nobs = numeric())
  
  for (i in ids) {
    message("ID:", i)
    
    filename <-
      paste(directory,
            "/",
            stringr::str_pad(i, 3, side = c("left"), pad = "0"),
            ".csv",
            sep = "")
    
    #message("File Name:", filename)
    
    filedata <- read.csv(filename, header = TRUE)
    retval <-
      subset(filedata,
             !is.na(filedata$sulfate) &
               !is.na(filedata$nitrate))
    
    #message("Complete Data Rows:", nrow(retval))
    
    complete_frame <-
      rbind(complete_frame, data.frame(id = i, nobs = nrow(retval)))
    
  }
  return (complete_frame)
}
Init()

RNGversion("3.5.1")  
set.seed(42)
clean_data <- complete("specdata", 332:1)
use <- sample(332, 10)
print(clean_data[use, "nobs"])

# clean_data <- complete("specdata", 54)
# print(clean_data$nobs)

#complete_func("specdata")
#complete_func("specdata", c(2, 4, 8, 10, 12))
#complete_func("specdata", 30:25)
#complete_func("specdata", 3)
#rm(list=ls())