wine<-read.csv('wine.csv')
plot(wine$flavanoid,wine$phenol)
plot(wine$flavanoid,wine$phenol)
abline(a=1.1954,b=.54171,col='red',lwd=5)

#Exercise 26
range(wine$alcohol)
range(wine$magnesium)
var(wine$magnesium)
cov(wine$alcohol,wine$magnesium)
cov(wine$magnesium,wine$alcohol)
var(wine$magnesium)
cov(wine$magnesium,wine$magnesium)

#Exercise 27
wine_attributes<-wine[,2:14]
wine_cov<-cov(wine_attributes)
wine_eigen<-eigen(wine_cov)
print(wine_eigen$vectors)
print(wine_eigen$values)
print(wine_eigen$vectors[,1])

#Exercise 28
neigen<-1
transformed<-t(t(as.matrix(wine_eigen$vectors[,1:neigen])) %*% t(as.matrix(wine_attributes)))

print(head(transformed))
restored<- t(as.matrix(wine_eigen$vectors[,1:neigen]) %*% t(as.matrix(transformed)))
print(mean(abs(wine_attributes[,13]-restored[,13])))
plot(wine_eigen$values,type='o')

