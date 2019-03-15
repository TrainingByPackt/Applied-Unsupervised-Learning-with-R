filename<-'heightsweights.csv'
raw<-read.csv(filename, stringsAsFactors=FALSE)
names(raw)<-c('index','height','weight')
plot(raw$height,raw$weight)
centroid<-c(mean(raw$height),mean(raw$weight))
example_distance<-raw[1,c('height','weight')]-centroid
cov_mat<-cov(raw[,c('height','weight')])
inv_cov_mat<-solve(cov_mat)
mahalanobis_dist<-t(matrix(as.numeric(example_distance)))%*% matrix(inv_cov_mat,nrow=2) %*% matrix(as.numeric(example_distance))
all_distances<-NULL
k<-1
while(k<=nrow(raw)){
  the_distance<-raw[k,c('height','weight')]-centroid
  mahalanobis_dist<-t(matrix(as.numeric(the_distance)))%*% matrix(inv_cov_mat,nrow=2) %*% matrix(as.numeric(the_distance))
  all_distances<-c(all_distances,mahalanobis_dist)
  k<-k+1
}
plot(raw$height,raw$weight)
points(raw$height[which(all_distances>quantile(all_distances,.9))],raw$weight[which(all_distances>quantile(all_distances,.9))],col='red',pch=19)

#Exercise 42
all_distances<-NULL
k<-1
while(k<=nrow(raw)){
the_distance<-raw[k,c('height','weight')]-centroid
mahalanobis_dist<-t(matrix(as.numeric(the_distance)))%*% matrix(inv_cov_mat,nrow=2) %*% matrix(as.numeric(the_distance))
all_distances<-c(all_distances,mahalanobis_dist)
k<-k+1
}
plot(raw$height,raw$weight)
points(raw$height[which(all_distances>quantile(all_distances,.9))],raw$weight[which(all_distances>quantile(all_distances,.9))],col='red',pch=19)

