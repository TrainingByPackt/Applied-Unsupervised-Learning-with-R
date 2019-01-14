bc<-read.csv('/Users/alokmalik/Downloads/r_book/breast_cancer.csv',header = FALSE)
head(bc)
kbc<-bc[,2:10]
head(kbc)
library(klaR)
k.centers<-kmodes(kbc,2,iter.max = 100)
k.centers
