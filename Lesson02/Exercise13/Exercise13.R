iris_data<-iris[,3:5]
install.packages("cluster")
library("cluster")
h.clus<-diana(iris_data, metric="euclidean")
pltree(h.clus, cex = 0.6, main = "Dendrogram of divisive clustering")

clusterCut <- cutree(h.clus, 2)
table(clusterCut, iris_data$Species)

