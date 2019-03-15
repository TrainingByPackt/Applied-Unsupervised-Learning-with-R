iris_data<-iris[,1:2]
library(cluster)
km.res<-kmeans(iris_data,3)
pair_dis<-daisy(iris_data)
sc<-silhouette(km.res$cluster, pair_dis)
plot(sc,col=1:8,border=NA)