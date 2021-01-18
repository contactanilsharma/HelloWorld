n <- floor(rnorm(10000, 500, 100))
t <- table(n)
barplot(table(floor(rnorm(10000, 500, 100))), xlab="Numbers", ylab="Frequencies")
barplot(t)
