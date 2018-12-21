iris_data<-iris[,1:2]

library("factoextra")
#k.max variable is the max number of clusters upto which this function will calculate silhouette score
#you may also change the clustering method to change silhouette socre in the second argument in function
fviz_nbclust(iris_data, kmeans, method = "silhouette",k.max=20)