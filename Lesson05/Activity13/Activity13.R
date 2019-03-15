factor<-read.csv('factor.csv')
library(psych)
ratings<-factor[,2:11]
ratings_cor<-cor(ratings)
parallel <- fa.parallel(ratings_cor, fm = 'minres', fa = 'fa')
factor_analysis<-fa(ratings_cor, nfactors=1)
print(factor_analysis)
