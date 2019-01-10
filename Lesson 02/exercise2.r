iris_data<-iris[,1:2]
head(iris_data)
#install.packages("dbscan")
library(dbscan)
centers<-dbscan(iris_data,eps=.3,minPts = 5)
library(factoextra)
fviz_cluster(centers,data=iris_data,geom = "point",palette="set2",ggtheme=theme_minimal(),ellipse=FALSE)
