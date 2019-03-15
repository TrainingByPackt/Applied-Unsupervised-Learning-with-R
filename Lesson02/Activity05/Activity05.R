install.packages("klaR")
library(klaR)
ms<-read.csv('mushrooms.csv')
dim(ms)
summary.data.frame(ms)
ms_k<-ms[,2:23]


kmodes_ms<-kmodes(ms_k,2)

result<-table(ms$class, kmodes_ms$cluster)
result

