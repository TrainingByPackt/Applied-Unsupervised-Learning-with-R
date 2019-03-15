iris_data<-iris[,1:2]
library("factoextra")
fviz_nbclust(iris_data, kmeans, method = "gap_stat",k.max=20)