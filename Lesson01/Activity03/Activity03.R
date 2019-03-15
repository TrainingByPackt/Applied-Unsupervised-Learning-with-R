ws<-read.csv('wholesale_customers_data.csv')
ws<-ws[5:6]
library(factoextra)
library(cluster)
clus<-pam(ws,4)
fviz_cluster(clus,data=ws)
clus<-kmeans(ws,4)
fviz_cluster(clus,data=ws)
