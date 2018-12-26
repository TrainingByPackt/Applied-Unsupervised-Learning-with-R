#This is the R code for Applied Unsupervised Learning with R, lesson 6

#load the dataset for US Arrests
data(USArrests)
head(USArrests)

#create a boxplot for rape arrests
boxplot(USArrests$Rape)

#find the highest values (in this case, the outliers)
highest<-USArrests[which(USArrests$Rape>40),]
print(highest)

#load the rivers dataset
data(rivers)
head(rivers)
boxplot(rivers)

#perform a logarithm transformation and look at the resulting boxplot
log_rivers<-log(rivers)
boxplot(log_rivers)

#find the interquartile range of the rivers data
iqr<-unname(quantile(rivers,.75)-quantile(rivers,.25))

#find the upper and lower limits for non-outlier data
upper_limit<-unname(quantile(rivers,.75)+1.5*iqr)
lower_limit<-unname(quantile(rivers,.25)-1.5*iqr)

#classify outliers as points outside our defined upper and lower limits
rivers[which(rivers>upper_limit | rivers<lower_limit)]

#define different limits based on preference
upper_limit<-unname(quantile(rivers,.75)+3*iqr)
lower_limit<-unname(quantile(rivers,.25)-3*iqr)

#load rivers data
data(rivers)

#get the standard deviation of rivers data
st_dev<-sd(rivers)

#define upper and lower limits based on standard deviation
upper_limit<-mean(rivers)+2*st_dev
lower_limit<-mean(rivers)-2*st_dev

#classify outliers based on upper and lower limits
upper_outliers<-rivers[which(rivers>upper_limit)]
lower_outliers<-rivers[which(rivers<lower_limit)]

#rename columns of height-weight data
names(raw)<-c('index','height','weight')

#plot the height-weight data and observe the patterns
plot(raw$height,raw$weight)

#calculate the centroid of the data
centroid<-c(mean(raw$height),mean(raw$weight))

#example of the distance between a given point and the centroid
example_distance<-raw[1,c('height','weight')]-centroid

#get the covariance matrix of the data, and that matrix's inverse
cov_mat<-cov(raw[,c('height','weight')])
inv_cov_mat<-solve(cov_mat)

#get the mahalanobis distance between our point and the centroid of the dataset:
mahalanobis_dist<-t(matrix(as.numeric(example_distance)))%*% matrix(inv_cov_mat,nrow=2) %*% matrix(as.numeric(example_distance))

#run a loop that calculates a mahalanobis distance for every point
all_distances<-NULL

k<-1
while(k<=nrow(raw)){
the_distance<-raw[k,c('height','weight')]-centroid
mahalanobis_dist<-t(matrix(as.numeric(the_distance)))%*% matrix(inv_cov_mat,nrow=2) %*% matrix(as.numeric(the_distance))
all_distances<-c(all_distances,mahalanobis_dist)
k<-k+1
}

#plot all observations that have particularly high mahalanobis distances
plot(raw$height,raw$weight)
points(raw$height[which(all_distances>quantile(all_distances,.9))],raw$weight[which(all_distances>quantile(all_distances,.9))],col='red',pch=19)

#seasonality modeling

#clean the raw seasonality data
names(raw)<-c('month','sales')
raw<-raw[1:108,]
raw$period<-1:nrow(raw)

#find the time trend in the data
timetrend<-lm(sales~period+I(log(period)),data=raw)

#obtain fitted values for the time trend
raw$timetrend<-predict(timetrend,raw)

#de-trend the data and plot the result
raw$withouttimetrend<-raw$sales-raw$timetrend
plot(raw$withouttimetrend,type='o')

#create a matrix of monthly data, and get the mean value for each month
seasonsmatrix = t(matrix(data = raw$withouttimetrend, nrow = 12))
seasons = colMeans(seasonsmatrix, na.rm = T)

#create a 9-year repetition of the monthly averages
raw$seasons<-c(rep(seasons,9))

#obtain de-trended, de-cycled data and plot it
raw$error<-raw$sales-raw$timetrend-raw$seasons
plot(raw$error,type='o')

#plot all elements of seasonality modeling together
par(mfrow=c(3,1))
plot(raw$timetrend,type='o')
plot(raw$seasons,type='o')
plot(raw$error,type='o')

#get the standard deviation of the de-trended, de-cycled data
stdev<-sd(raw$error)

#find which data points are more than 2 standard deviations away from the mean of the data
high_outliers<-which(raw$error>(mean(raw$error)+2*sd(raw$error)))
low_outliers<-which(raw$error<(mean(raw$error)-2*sd(raw$error)))

#Examine the observations that we have classified as outliers.

raw[high_outliers,]
raw[low_outliers,]

#plot the points that we have classified as outliers
plot(raw$period,raw$sales,type='o')
points(raw$period[high_outliers],raw$sales[high_outliers],pch=19,col='red')
points(raw$period[low_outliers],raw$sales[low_outliers],pch=19,col='blue')

