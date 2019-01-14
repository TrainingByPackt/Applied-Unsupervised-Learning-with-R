ws<-read.csv('/Users/alokmalik/Documents/Unsupervised-Learning-with-R/Lesson01/Wholesale customers data.csv')
ws<-ws[3:6]
#calculate optimum number of clusters with silhouette score
fviz_nbclust(ws, kmeans, method = "silhouette",k.max=20)
#calculate optimum number of clusters with wss score
fviz_nbclust(ws, kmeans, method = "wss", k.max=20)
#calculate optimum number of clusters with gap statistic
fviz_nbclust(ws, kmeans, method = "gap_stat",k.max=20)
