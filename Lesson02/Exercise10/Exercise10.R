bc_data<-read.csv('breast_cancer.csv',header = FALSE)
k_bc_data<-bc_data[,2:10]
head(k_bc_data)
install.packages("klaR")
library(klaR)

k.centers<-kmodes(k_bc_data,2,iter.max = 100)
k.centers
