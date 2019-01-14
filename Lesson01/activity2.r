ws<-read.csv('/Users/alokmalik/Documents/Unsupervised-Learning-with-R/Lesson01/Wholesale customers data.csv')
ws<-ws[5:6]
library(factoextra)
#change the value on n from 2 to 6 in below line
clus<-kmeans(ws,n)
fviz_cluster(clus,data=ws)