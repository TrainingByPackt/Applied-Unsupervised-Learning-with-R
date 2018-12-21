iris_data<-iris[,1:2]
library("factoextra")

#this line of code is same as last line in previous exercise except for method
fviz_nbclust(iris_data, kmeans, method = "wss", k.max=20)