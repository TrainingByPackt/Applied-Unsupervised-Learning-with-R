iris_data<-iris

iris_data$t_color='red'
iris_data$t_color[which(iris_data$Species=='setosa')]<-'green'
iris_data$t_color[which(iris_data$Species=='virginica')]<-'blue'

k1<-c(7,3)
k2<-c(5,3)
k3<-c(6,2.5)

plot(iris_data$Sepal.Length,iris_data$Sepal.Width,col=iris_data$t_color)
points(k1[1],k1[2],pch=4)
points(k2[1],k2[2],pch=5)
points(k3[1],k3[2],pch=6)

number_of_steps<-10
n<-1

while(n<number_of_steps){
  iris_data$distance_to_clust1 <- sqrt((iris_data$Sepal.Length-k1[1])^2+(iris_data$Sepal.Width-k1[2])^2)
  iris_data$distance_to_clust2 <- sqrt((iris_data$Sepal.Length-k2[1])^2+(iris_data$Sepal.Width-k2[2])^2)
  iris_data$distance_to_clust3 <- sqrt((iris_data$Sepal.Length-k3[1])^2+(iris_data$Sepal.Width-k3[2])^2)
  iris_data$clust_1 <- 1*(iris_data$distance_to_clust1<=iris_data$distance_to_clust2 & iris_data$distance_to_clust1<=iris_data$distance_to_clust3)
  iris_data$clust_2 <- 1*(iris_data$distance_to_clust1>iris_data$distance_to_clust2 & iris_data$distance_to_clust3>iris_data$distance_to_clust2)
  iris_data$clust_3 <- 1*(iris_data$distance_to_clust3<iris_data$distance_to_clust1 & iris_data$distance_to_clust3<iris_data$distance_to_clust2)
  k1[1]<-mean(iris_data$Sepal.Length[which(iris_data$clust_1==1)])
  k1[2]<-mean(iris_data$Sepal.Width[which(iris_data$clust_1==1)])
  k2[1]<-mean(iris_data$Sepal.Length[which(iris_data$clust_2==1)])
  k2[2]<-mean(iris_data$Sepal.Width[which(iris_data$clust_2==1)])
  k3[1]<-mean(iris_data$Sepal.Length[which(iris_data$clust_3==1)])
  k3[2]<-mean(iris_data$Sepal.Width[which(iris_data$clust_3==1)])
  n=n+1
}

iris_data$color='red'
iris_data$color[which(iris_data$clust_2==1)]<-'blue'
iris_data$color[which(iris_data$clust_3==1)]<-'green'

plot(iris_data$Sepal.Length,iris_data$Sepal.Width,col=iris_data$color)
points(k1[1],k1[2],pch=4)
points(k2[1],k2[2],pch=5)

