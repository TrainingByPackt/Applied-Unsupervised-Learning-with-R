iris_data<-iris

iris_data$t_color='red'
iris_data$t_color[which(iris_data$Species=='setosa')]<-'green'
iris_data$t_color[which(iris_data$Species=='virginica')]<-'blue'

k1<-c(7,3)
k2<-c(5,3)

plot(iris_data$Sepal.Length,iris_data$Sepal.Width,col=iris_data$t_color)

points(k1[1],k1[2],pch=4)
points(k2[1],k2[2],pch=5)

number_of_steps<-6

n<-1

while(n<number_of_steps)
{
  iris_data$distance_to_clust1 <- sqrt((iris_data$Sepal.Length-k1[1])^2+(iris_data$Sepal.Width-k1[2])^2)
  iris_data$distance_to_clust2 <- sqrt((iris_data$Sepal.Length-k2[1])^2+(iris_data$Sepal.Width-k2[2])^2)
  iris_data$clust_1 <- 1*(iris_data$distance_to_clust1<=iris_data$distance_to_clust2)
  iris_data$clust_2 <- 1*(iris_data$distance_to_clust1>iris_data$distance_to_clust2) 
  k1[1]<-mean(iris_data$Sepal.Length[which(iris_data$clust_1==1)])
  k1[2]<-mean(iris_data$Sepal.Width[which(iris_data$clust_1==1)])
  k2[1]<-mean(iris_data$Sepal.Length[which(iris_data$clust_2==1)])
  k2[2]<-mean(iris_data$Sepal.Width[which(iris_data$clust_2==1)])
  n=n+1
}

iris_data$color='red'
iris_data$color[which(iris_data$clust_2==1)]<-'blue'

plot(iris_data$Sepal.Length,iris_data$Sepal.Width,col=iris_data$color)
points(k1[1],k1[2],pch=4)
points(k2[1],k2[2],pch=5)
