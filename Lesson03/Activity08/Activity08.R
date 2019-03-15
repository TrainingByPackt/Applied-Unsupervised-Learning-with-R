df<-iris
df1<-subset(df,Species=='setosa')
library(kdensity)

dist <- kdensity(df1$Sepal.Length)
plot(dist)

dist <- kdensity(df1$Sepal.Width)
plot(dist)
