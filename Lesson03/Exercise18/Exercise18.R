x<- c(1,2,3,4,5)
y<-c(0,0,0,0,0)
plot(x,y)
install.packages("kdensity")
library('kdensity')
dist <- kdensity(x, bw=.35)
plot(dist)


dist <- kdensity(x, bw=.5)
plot(dist)
