iris_data<-iris[,1:2]

library("cluster")
km<-pam(iris_data,3)
library("factoextra")

fviz_cluster(km, data = iris_data,palette = "jco",ggtheme = theme_minimal())
