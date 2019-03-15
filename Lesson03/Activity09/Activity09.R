df<-iris
df=df[df$Species=='setosa',]
sdev<-sd(df$Sepal.Length)
mn<-mean(df$Sepal.Length)

xnorm<-rnorm(100,mean=mn,sd=sdev)
plot(ecdf(xnorm),col='blue')
plot(ecdf(df$Sepal.Length),add=TRUE,pch = 4,col='red')

ks.test(xnorm,df$Sepal.Length)

sdev<-sd(df$Sepal.Width)
mn<-mean(df$Sepal.Width)
xnorm<-rnorm(100,mean=mn,sd=sdev)
plot(ecdf(xnorm),col='blue')
plot(ecdf(df$Sepal.Width),add=TRUE,pch = 4,col='red')

ks.test(xnorm,df$Sepal.Length)
