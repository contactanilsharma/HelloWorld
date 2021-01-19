fun_add <- function(x, y){
  x+y
}

fun_above10 <- function(x){
  use <- x > 10
  x[use]
}

fun_above <- function(x,n=4){
  use <- x > n
  x[use]
}

fun_calcMean <- function(x, remove_na=TRUE){
     nc <- ncol(x)
     means <- numeric(nc)
     for (i in 1:nc){
       means[i] <- mean(x[,i], na.rm=remove_na)
     }
     means
   }