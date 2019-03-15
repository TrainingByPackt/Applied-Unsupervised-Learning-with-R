iris_data<-iris[,1:2]
library("factoextra")
fviz_nbclust(iris_data, kmeans, method = "wss", k.max=20)