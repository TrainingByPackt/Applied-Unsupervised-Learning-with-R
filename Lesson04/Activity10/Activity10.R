library(MASS)
data(Boston)
Boston<-Boston[,-12]
Boston_original<-Boston

Boston$highcrim<-1*(Boston$indus>median(Boston$crim))
Boston$lowcrim<-1*(Boston$indus<=median(Boston$crim))

Boston$highzn<-1*(Boston$zn>median(Boston$zn))
Boston$lowzn<-1*(Boston$zn<=median(Boston$zn))

Boston$highindus<-1*(Boston$indus>median(Boston$indus))
Boston$lowindus<-1*(Boston$indus<=median(Boston$indus))

Boston$highchas<-(Boston$chas)
Boston$lowchas<-(1-Boston$chas)

Boston$highnox<-1*(Boston$nox>median(Boston$nox))
Boston$lownox<-1*(Boston$nox<=median(Boston$nox))

Boston$highrm<-1*(Boston$rm>median(Boston$rm))
Boston$lowrm<-1*(Boston$rm<=median(Boston$rm))

Boston$highage<-1*(Boston$age>median(Boston$age))
Boston$lowage<-1*(Boston$age<=median(Boston$age))

Boston$highdis<-1*(Boston$dis>median(Boston$dis))
Boston$lowdis<-1*(Boston$dis<=median(Boston$dis))

Boston$highrad<-1*(Boston$rad>median(Boston$rad))
Boston$lowrad<-1*(Boston$rad<=median(Boston$rad))

Boston$hightax<-1*(Boston$tax>median(Boston$tax))
Boston$lowtax<-1*(Boston$tax<=median(Boston$tax))

Boston$highptratio<-1*(Boston$ptratio>median(Boston$ptratio))
Boston$lowptratio<-1*(Boston$ptratio<=median(Boston$ptratio))

Boston$highlstat<-1*(Boston$lstat>median(Boston$lstat))
Boston$lowlstat<-1*(Boston$lstat<=median(Boston$lstat))

Boston$highmedv<-1*(Boston$medv>median(Boston$medv))
Boston$lowmedv<-1*(Boston$medv<=median(Boston$medv))

Bostondummy<-Boston[,14:ncol(Boston)]
Boston<-Boston_original

Boston_cov<-cov(Boston)
Boston_eigen<-eigen(Boston_cov)
print(Boston_eigen$vectors)

print(Boston_eigen$values)

plot(Boston_eigen$values,type='o')

neigen<-10
transformed<-t(t(as.matrix(Boston_eigen$vectors[,1:neigen])) %*% t(as.matrix(Boston)))

restored<- t(as.matrix(Boston_eigen$vectors[,1:neigen]) %*% t(as.matrix(transformed)))

print(head(restored-Boston))

support_thresh<-0.2
firstpass<-unname(which(colMeans(Bostondummy,na.rm=TRUE)>support_thresh))

secondcand<-t(combn(firstpass,2))
secondpass<-NULL
k<-1
while(k<=nrow(secondcand)){
  support<-mean(Bostondummy[,secondcand[k,1]]*Bostondummy[,secondcand[k,2]],na.rm=TRUE)
  if(support>support_thresh){
    secondpass<-rbind(secondpass,secondcand[k,])
  }
  k<-k+1
}


thirdpass<-NULL
k<-1
while(k<=nrow(secondpass)){
  j<-1
  while(j<=length(firstpass)){
    n<-1
    product<-1
    while(n<=ncol(secondpass)){
      product<-product*Bostondummy[,secondpass[k,n]]
      n<-n+1
    }
    if(!(firstpass[j] %in% secondpass[k,])){
      product<-product*Bostondummy[,firstpass[j]]
      support<-mean(product,na.rm=TRUE)
      if(support>support_thresh){
        thirdpass<-rbind(thirdpass,c(secondpass[k,],firstpass[j]))
      }
    }
    j<-j+1
  }
  k<-k+1
}


thirdpass_conf<-NULL
k<-1
while(k<=nrow(thirdpass)){
  
  support<-mean(Bostondummy[,thirdpass[k,1]]*Bostondummy[,thirdpass[k,2]]*Bostondummy[,thirdpass[k,3]],na.rm=TRUE)
  
  confidence<-mean(Bostondummy[,thirdpass[k,1]]*Bostondummy[,thirdpass[k,2]]*Bostondummy[,thirdpass[k,3]],na.rm=TRUE)/mean(Bostondummy[,thirdpass[k,1]]*Bostondummy[,thirdpass[k,2]],na.rm=TRUE)
  
  lift<-confidence/mean(Bostondummy[,thirdpass[k,3]],na.rm=TRUE)
  
  thirdpass_conf<-rbind(thirdpass_conf,unname(c(thirdpass[k,],support,confidence,lift)))
  k<-k+1
}
print(head(thirdpass_conf))
