ta<-iris[,1:2]

library(cluster)
km.res<-kmeans(iris_data,3)

dis<-daisy(iris_data)
sc<-silhouette(km.res$cluster, dis)
plot(sc,col=1:8,border=NA)