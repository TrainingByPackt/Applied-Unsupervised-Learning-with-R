data(cars)
plot(cars)

centroid<-c(mean(cars$speed),mean(cars$dist))
cov_mat<-cov(cars)
inv_cov_mat<-solve(cov_mat)
all_distances<-NULL
k<-1
while(k<=nrow(cars)){
  the_distance<-cars[k,]-centroid
  mahalanobis_dist<-t(matrix(as.numeric(the_distance)))%*% matrix(inv_cov_mat,nrow=2) %*% matrix(as.numeric(the_distance))
  all_distances<-c(all_distances,mahalanobis_dist)
  k<-k+1
}
plot(cars)
points(cars$speed[which(all_distances>quantile(all_distances,.9))], cars$dist[which(all_distances>quantile(all_distances,.9))],col='red',pch=19)
