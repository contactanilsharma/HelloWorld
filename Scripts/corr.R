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
#' @param th is an integer vector threshold for complete cases 
#'
#' @return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold 
#'           requirement, then the function should return a numeric vector of length 0.
#' @author Anil K Sharma
#' @export
#'
#' @examples
#'
corr_func <- function(directory, th = 0) {
  directory <- paste(getwd(), "/", directory, sep = "")
  
  message("Directory:", directory)
  message("th:", th)
  
  corr_data <- subset(clean_data,clean_data$nobs > th)
  corrsNum <- numeric(0)
  #print(nrow(corr_data))
  
  for (i in 1:nrow(corr_data)) {
    filename <-
      paste(directory,
            "/",
            stringr::str_pad(corr_data$id[i], 3, side = c("left"), pad = "0"),
            ".csv",
            sep = "")
    
    #print(paste("ID:",corr_data$id[i]))
    #print(paste("File Name:", filename))
    
    filedata <- read.csv(filename, header = TRUE)

    retval <-
      subset(filedata,
             !is.na(filedata$sulfate) &
               !is.na(filedata$nitrate))

    #message("Complete Data Rows:", nrow(retval))

    corrsNum <- c(corrsNum, cor(retval$sulfate, retval$nitrate, use = "pairwise.complete.obs"))

  }
  #print(corrsNum)
  return (corrsNum)
}
Init()

cr <- corr_func("specdata", 1000)                
n <- length(cr)                
# cr <- corr_func("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

# cr <- corr_func("specdata", 129)                
# cr <- sort(cr)                
# n <- length(cr)    
# RNGversion("3.5.1")
# set.seed(197)                
# out <- c(n, round(cr[sample(n, 5)], 4))
# print(out)

# cr <- corr_func("specdata")                
# cr <- sort(cr)   
# RNGversion("3.5.1")
# set.seed(868)                
# out <- round(cr[sample(length(cr), 5)], 4)
# print(out)

#source("corr.R")
#source("complete.R")
x 
# ## Case - 1
# cr <- corr_func("specdata", 150)
# print(cr)
# head(cr)
# summary(cr)

## Case - 2
# cr <- corr_func("specdata", 400)
# print(cr)
# head(cr)
# summary(cr)

# ## Case - 3
# cr <- corr_func("specdata", 5000)
# print(cr)
# summary(cr)
# length(cr)
# 
# ## Case - 4
# cr <- corr_func("specdata")
# print(cr)
# summary(cr)
# length(cr)