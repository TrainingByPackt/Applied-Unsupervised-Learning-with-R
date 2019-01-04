#this is a file containing code for Applied Unsupervised Learning with R
#this file contains code for Lesson 5


#we will start with hashing methods

#specify a string that we want to hash
string_to_hash<-"print('I love you')"

#total number of possible hashes
total_possible_hashes<-10000

#string-to-numeric conversion
numeric<-utf8ToInt(string_to_hash)
print(numeric)

#calculate the hash
hash<-sum((numeric+123)^2) %% total_possible_hashes

#compile all of the code into a function
get_hash<-function(string_to_hash, total_possible_hashes){
numeric<-utf8ToInt(string_to_hash)
hash<-sum((numeric+123)^2) %% total_possible_hashes
return(hash)
}

#create different inputs so we can compare hashes
script_1<-"print('I love you')"
script_2<-"print('I lose you')"
script_3<-"print('I hate you')"
script_4<-"print('I love lamp')"

#compare hashes of different inputs
print(get_hash(script_1,10000))
print(get_hash(script_2,10000))
print(get_hash(script_3,10000))
print(get_hash(script_4,10000))

#calculate an MD5 hash of our script
install.packages('digest')
library(digest)
print(digest(string_to_hash,algo='md5'))


#section on analytic signatures

#read in the image whose signature you want
#note: make sure that your images are saved to R's working directory


#in this case, we will use the philly city hall image
filepath<-'philly_city_hall.jpg'
#note: if you set filepath<-'borges.jpg', you can get a signature of the borges image
#note: if you set filepath<-'philly_city_hall_altered.jpg', you can get a signature of the altered City Hall image

im <- imager::load.image(file =filepath) 

#convert to grayscale and split into sections
im<-imager::rm.alpha(im)
im<-imager::grayscale(im)
im<-imager::imsplit(im,axis = "x", nb = 10)   

#create a matrix of brightness values
matrix <- matrix(nrow = 10, ncol = 10)

#fill the matrix with brightness values
for (i in 1:10) {
  is <- imager::imsplit(im = im[[i]], axis = "y", nb = 10)
  for (j in 1:10) {
    matrix[j,i] <- mean(is[[j]])
  }
}
print(matrix)

#create a function for brightness comparison
brightnesscomparison<-function(x,y){
compared<-0
if(abs(x/y-1)>0.1){

if(x>y){
compared<-1
}

if(x<y){
compared<-(-1)
}

}

return(compared)
}

#compare a section's brightness with the section on its left
i<-5
j<-5
left<-brightnesscomparison(matrix[i,j-1],matrix[i,j])

#compare a section with the section above it
i<-5
j<-5
top<-brightnesscomparison(matrix[i-1,j],matrix[i,j])

#create a function that compares a section with all of its neighbors
neighborcomparison<-function(mat,i,j){
comparison<-NULL

top_left<-0
if(i>1 & j>1){
top_left<-brightnesscomparison(mat[i-1,j-1],mat[i,j])
}

left<-0
if(j>1){
left<-brightnesscomparison(mat[i,j-1],mat[i,j])
}

bottom_left<-0
if(j>1 & i<nrow(mat)){
bottom_left<-brightnesscomparison(mat[i+1,j-1],mat[i,j])
}

top_right<-0
if(i>1 & j<nrow(mat)){
top_right<-brightnesscomparison(mat[i-1,j+1],mat[i,j])
}

right<-0
if(j<ncol(mat)){
right<-brightnesscomparison(mat[i,j+1],mat[i,j])
}

bottom_right<-0
if(i<nrow(mat) & j<ncol(mat)){
bottom_right<-brightnesscomparison(mat[i+1,j+1],mat[i,j])
}

top<-0
if(i>1){
top<-brightnesscomparison(mat[i-1,j],mat[i,j])
}

bottom<-0
if(i<nrow(mat)){
bottom<-brightnesscomparison(mat[i+1,j],mat[i,j])
}

comparison<-c(top_left,left,bottom_left,bottom,bottom_right,right,top_right,top)

return(comparison)
}

#initialize a NULL signature variable
signature<-NULL

#compile a signature by comparing each section to its neighbors
for (i in 1:nrow(matrix)){

for (j in 1:ncol(matrix)){

signature<-c(signature,neighborcomparison(matrix,i,j))

}

}

#save this signature to a variable called "building_signature"
building_signature<-signature

#note: you can run all of the preceding code with any image file
#if you use the borges.jpg file and save it as the "im" variable, you can get a different signature for the Borges image
#you can save the Borges signature to a variable called "borges_signature"
#next, we will compare the signature of the building image with the signature of the Borges image

comparison<-mean(abs(borges_signature-building_signature))
print(comparison)

#we can also compare the signature of the altered building image with the signature of the original building image
comparison<-mean(abs(watermarked_signature-building_signature))
print(comparison)


#the final section of this code covers factor analysis
#first, we will install and load some useful packages:

install.packages('psych')
install.packages('GPArotation')
install.packages('qgraph')

library(psych)
library(GPArotation)
library(qgraph)

#load the "big5" data and check its dimensions and range
data(big5)

print(nrow(big5))
print(ncol(big5))

print(range(big5))

#create a correlation matrix
big_cor <- cor(big5)

#perform the factor analysis
solution <- fa(r = big_cor, nfactors = 5, rotate = "oblimin", fm = "pa") 

#print the solution and the weights
print(solution)
print(solution$weights)

#change some arguments in the factor analysis command
solution <- fa(r = bigcor, nfactors = 3, rotate = "varimax", fm = "minres") 

#explore how many factors we should use
parallel <- fa.parallel(big5, fm = 'minres', fa = 'fa')

