x_norm<-rnorm(100,mean = 100,sd = 5)
y_unif<-runif(100,min = 75, max = 125)

plot(ecdf(x_norm))

plot(ecdf(y_unif),add=TRUE)

ks.test(x_norm,y_unif)
x_norm2<-rnorm(100,mean = 100,sd = 5)
plot(ecdf(x_norm))
plot(ecdf(x_norm2),add = TRUE)

ks.test(x_norm,x_norm2)
