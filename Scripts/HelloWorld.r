n <- floor(rnorm(10000, 500, 100))
t <- table(n)
barplot(t)
savehistory("~/R/Projects/HelloWorld/Scripts/HelloWorld.r")
