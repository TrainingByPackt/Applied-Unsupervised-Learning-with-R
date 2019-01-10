iris_data<-iris[,3:5]
library(cluster)
d.clus<-diana(iris_data, metric='euclidean')
pltree(d.clus, cex = 0.6, main = "Dendrogram of divisive clustering")
clusterCut <- cutree(h.clus, 2)
table(clusterCut, iris_data$Species)