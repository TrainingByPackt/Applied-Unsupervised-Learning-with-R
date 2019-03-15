library(factoextra)
data(multishapes)
ms<-multishapes[,1:2]
plot(ms)
km.res<-kmeans(ms,4)
fviz_cluster(km.res, ms,ellipse = FALSE)
db.res<-dbscan(ms,eps = .15)
fviz_cluster(db.res, ms,ellipse = FALSE,geom = 'point')
