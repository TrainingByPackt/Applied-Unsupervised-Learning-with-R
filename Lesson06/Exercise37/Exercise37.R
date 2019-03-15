data(mtcars)
head(mtcars)
?mtcars
boxplot(mtcars$wt) 
highest<-mtcars[which(mtcars$wt>5),]
print(highest)
