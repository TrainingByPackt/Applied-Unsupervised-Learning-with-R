normal_results<-c(100,95,106,92,109,190,210,201,198)
new_results<-c(98,35,270,140,200)
bandwidth<-25
our_estimate<-density(normal_results, bw=bandwidth)
plot(our_estimate)
new_density_1<-density(normal_results,bw=25,n=1,from=new_results[1],to=new_results[1])$y
new_density_2<-density(normal_results,bw=25,n=1,from=new_results[2],to=new_results[2])$y
new_density_3<-density(normal_results,bw=25,n=1,from=new_results[3],to=new_results[3])$y
new_density_4<-density(normal_results,bw=25,n=1,from=new_results[4],to=new_results[4])$y
new_density_5<-density(normal_results,bw=25,n=1,from=new_results[5],to=new_results[5])$y

print(new_density_1)
print(new_density_2)
print(new_density_3)
print(new_density_4)
print(new_density_4)

plot(our_estimate)
points(new_results[1],new_density_1,col='red',pch=19)
points(new_results[2],new_density_2,col='red',pch=19)
points(new_results[3],new_density_3,col='red',pch=19)
points(new_results[4],new_density_4,col='red',pch=19)
points(new_results[5],new_density_5,col='red',pch=19)
