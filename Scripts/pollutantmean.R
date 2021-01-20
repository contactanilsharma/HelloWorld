print(R.version.string)

#
# |------------------------------------------------------------------------------------------|
# | I N I T I A L I Z A T I O N |
# |------------------------------------------------------------------------------------------|
Init <- function(workDirStr = "C:/Users/anilkush/OneDrive - Capgemini/Documents/R/Projects/HelloWorld/data/") {
  setwd(workDirStr)
}

#' Programming Assignment 1: Air Pollution
#'
#' @param directory is a charactor vector of lenght 1 indicating the location of the location of the CSV file
#' @param pollutant is a charactor vecotr of lenght 1 indicating the name of the pollutant for which we will
#'        calculate the mean - either "sulfate" or "nitrate".
#' @param id is an integer vector indicating the monitor ID numbers to be used
#'
#' @return the mean of the pollutant across all monitors list in the ID vector (ignoring NA Values)
#'         NOTE: Do not round the result
#' @author Anil K Sharma
#' @export
#'
#' @examples
#'
pollutant_mean <- function(directory, pollutant, ids = 1:332) {
  directory <- paste(getwd(), "/", directory, sep = "")
  
  #message("Directory:", directory)
  #message("Pollutant:", pollutant)
  #message("IDs:", ids)
  
  pollutant_store <- vector()
  
  for (id in ids) {
    #message("ID:", id)
    
    filename <-
      paste(directory,
            "/",
            stringr::str_pad(id, 3, side = c("left"), pad = "0"),
            ".csv",
            sep = "")
    
    #message("File Name:", filename)
    
    filedata <- read.csv(filename, header = TRUE)
    
    #message("File Data:", filedata)
    #message("class:", class(filedata))
    if (pollutant == "sulfate") {
      #message("In IF Condition:", pollutant, filedata$sulfate)
      retval <- subset(filedata,!is.na(filedata$sulfate))
      #message("In IF Condition:", pollutant, retval$sulfate)
      #message("Mean:", pollutant, " ", mean(retval$sulfate))
      pollutant_store <- append(pollutant_store, retval$sulfate)
    }
    else{
      #message("In ELSE Condition:", pollutant, filedata$nitrate)
      retval <- subset(filedata,!is.na(filedata$nitrate))
      #message("In ELSE Condition:", pollutant, retval$nitrate)
      #message("Mean:", pollutant, " ", mean(retval$nitrate))
      pollutant_store <- append(pollutant_store, retval$nitrate)
    }
  }
  #message("Overall pollutant_store data: ",pollutant," : ",pollutant_store)
  message("Overall Mean:", pollutant, " ", mean(pollutant_store))
}
Init()
# pollutant_mean("specdata", "sulfate",34)
 pollutant_mean("specdata", "nitrate")
# pollutant_mean("specdata", "sulfate", 1:10)
# pollutant_mean("specdata", "nitrate", 70:72)
# pollutant_mean("specdata", "nitrate", 23)
# rm(list=ls())