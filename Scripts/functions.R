fun_add <- function(x, y) {
  x + y
}

fun_above10 <- function(x) {
  use <- x > 10
  x[use]
}

fun_above <- function(x, n = 4) {
  use <- x > n
  x[use]
}

fun_calcMean <- function(x, remove_na = TRUE) {
  nc <- ncol(x)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(x[, i], na.rm = remove_na)
  }
  means
}


fun_test <- function(x, y) {
  x ^ 2
}

y <- 10

f <- function(x) {
  y <- 2
  y ^ 2 + g(x)
}

g <- function(x) {
  x * y
}

f(3)

cube <- function(x, n) {
  x^3
}
cube(3)

x <- 1:10
if(x > 5) {
  x <- 0
}

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)