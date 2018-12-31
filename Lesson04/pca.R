#this file contains code for Lesson 4 of Applied Unsupervised Learning with R, for the section on principal component analysis

#first, follow the instructions in the text to download and clean the wine dataset
#the source of this dataset is http://archive.ics.uci.edu/ml/datasets/Wine

#after setting the correct working directory, read in the data:
wine<-read.csv('wine.csv')


#a brief review of linear algebra

#create a matrix
matrix1<-matrix(c(1,2,3,4,5,6),nrow=2)

#access a particular element of a matrix
matrix1[1,2]

#look at the range of different variables to get a sense of dispersion:
range(wine$alcohol)
range(wine$magnesium)

#calculate variance of particular variables

var(wine$alcohol)

var(wine$magnesium)

#calculate covariance of two variables together

cov(wine$alcohol,wine$magnesium)

#verify that the covariance of a variable with itself is equal to its variance:
cov(wine$magnesium,wine$magnesium)
var(wine$magnesium)



#performing PCA

#first, restrict our analysis to only the columns of the data that contain measurements of chemical attributes
wine_attributes<-wine[,2:14]

#calculate the covariance matrix of the data
wine_cov<-cov(wine_attributes)

#find the eigenvectors and eigenvalues of the covariance matrix
wine_eigen<-eigen(wine_cov)

#examine the eigenvectors of the covariance matrix - these are the principal components
print(wine_eigen$vectors)

#examine the eigenvalues corresponding to these eigenvectors - these measure the relative importance of each eigenvector
print(wine_eigen$values)

#examine the first principal component
print(wine_eigen$vectors[,1])



#performing dimension reduction using the results of PCA

#first, specify the number of eigenvectors we will use, and transform the data so that it has this number of dimensions
neigen<-1
transformed<-t(t(as.matrix(wine_eigen$vectors[,1:neigen])) %*% t(as.matrix(wine_attributes)))

#examine our transformed data
print(head(transformed))

#attempt to restore our original data using the reduced data
restored<- t(as.matrix(wine_eigen$vectors[,1:neigen]) %*% t(as.matrix(transformed)))

#test whether our restoration has been successful by comparing the final column after restoration with the original data
print(mean(abs(wine_attributes[,13]-restored[,13])))

#create a scree plot that shows the eigenvalues, indicating the relative importance of each eigenvector
plot(wine_eigen$values,type='o')
