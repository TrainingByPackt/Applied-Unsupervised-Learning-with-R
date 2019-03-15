iris_data<-iris[,1:2]
#use it only the first time if library is not installed already
install.packages("dbscan")
library(dbscan)

clus<-dbscan(iris_data,eps=.3,minPts = 5)
#use it only the first time if library is not installed already
install.packages("factoextra") 
library(factoextra)
fviz_cluster(clus,data=iris_data,geom = "point",palette="set2",ggtheme=theme_minimal(),ellipse=FALSE)
