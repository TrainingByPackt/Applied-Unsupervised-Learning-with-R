install.packages('psych')
install.packages('GPArotation')
install.packages('qgraph')

library(psych)
library(GPArotation)
library(qgraph)

data(big5)
print(head(big5))
print(nrow(big5))
print(ncol(big5))
print(range(big5))
