iris_data<-iris[,3:5]
install.packages("cluster")
library(cluster)

h.clus<-hclust(dist(iris_data),method="complete")
plot(h.clus)

clusterCut <- cutree(h.clus, 3)
table(clusterCut, iris_data$Species)

h.clus<-hclust(dist(iris_data),method = "single")
plot(h.clus)

clusterCut <- cutree(h.clus, 3)
table(clusterCut, iris_data$Species)

h.clus<-hclust(dist(iris_data),method = "average")
plot(h.clus)

clusterCut <- cutree(h.clus, 3)
table(clusterCut, iris_data$Species)

h.clus<-hclust(dist(iris_data),method = "centroid")
plot(h.clus)

clusterCut <- cutree(h.clus, 3)
table(clusterCut, iris_data$Species)
