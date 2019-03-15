x<-1:round(2*pi*100+100)/100
y<-rep(0,round(2*pi*100)+100)
y[1:314]<-sin(x[1:314])
y[415:728]<-sin(x[315:628])
y[100]<-0
plot(x,y,type='o')
difference_y<-y[2:length(y)]-y[1:(length(y)-1)]
boxplot(difference_y)
