nor<-rnorm(1000,mean=5, sd= 1)
hist(nor,breaks = 100)
lnor <- vector("list", 1000)
for (x in 1:1000){
  lnor[x]=exp(nor[x])
}

hist(as.integer(lnor), breaks = 200)
