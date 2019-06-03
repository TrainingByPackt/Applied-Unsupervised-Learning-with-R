stdev<-sd(raw$error)
high_outliers<-which(raw$error>(mean(raw$error)+2*sd(raw$error)))
low_outliers<-which(raw$error<(mean(raw$error)-2*sd(raw$error)))
raw[high_outliers,]
raw[low_outliers,]
plot(raw$period,raw$visitors,type='o')
points(raw$period[high_outliers],raw$visitors[high_outliers],pch=19,col='red')
points(raw$period[low_outliers],raw$visitors[low_outliers],pch=19,col='blue')
