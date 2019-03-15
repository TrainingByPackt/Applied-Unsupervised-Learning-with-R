ws<-read.csv('wholesale_customers_data.csv')
ws<-ws[5:6]
fviz_nbclust(ws, kmeans, method = "silhouette",k.max=20)

fviz_nbclust(ws, kmeans, method = "wss", k.max=20)

fviz_nbclust(ws, kmeans, method = "gap_stat",k.max=20)
