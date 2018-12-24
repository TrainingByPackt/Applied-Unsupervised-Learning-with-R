#### libs
library(dplyr)
library(rstudioapi)
library(imager)

#### there i try read arguments from comand line
args = commandArgs(trailingOnly=TRUE)

#### there i found script folder paht to set it as work directory
current_path <- rstudioapi::getActiveDocumentContext()$path
setwd(dirname(current_path))

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).\n", call.=FALSE)
}

#### create empty final matrix
matrix <- matrix(nrow = 10, ncol = 10)

#### load - convert to grayscale - divide image to 10 columns
im <- imager::load.image(file ='cityhall_watermark.jpg') %>% #imager::load.image(file = args[1]) %>% 
  imager::rm.alpha() %>% 
  imager::grayscale() %>% 
  imager::imsplit(axis = "x", nb = 10) 

#### divide every column to 10 rows - calculate average brightness - write ti matrix 
for (i in 1:10) {
  is <- imager::imsplit(im = im[[i]], axis = "y", nb = 10)
  for (j in 1:10) {
    matrix[j,i] <- mean(is[[j]])
    #save.image(im = is[[j]], file = paste0("/home/bradfordtuckfield/Documents/packt/image_", j, "_",i, ".jpg"))
  }
}

#### print matrix
print(matrix)

#check whether brighter or less bright than neighbors.

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

fingerprint<-NULL

for (i in 1:nrow(matrix)){

for (j in 1:ncol(matrix)){

fingerprint<-c(fingerprint,neighborcomparison(matrix,i,j))

}

}




####pca on this pic

im <- imager::load.image(file ='/home/bradfordtuckfield/Documents/packt/building.png')



im<-imager::rm.alpha(im) 
im<-imager::grayscale(im)

graypca<- prcomp(im, center = FALSE)

library(jpeg)

for (i in seq.int(1, round(ncol(im) - 10), length.out = round(ncol(im)/1.5))) {
  #pca.img <- 
  compressed.img <- t(graypca$x[,1:i] %*% t(graypca$rotation[,1:i]))
  #sapply(graypca, function(j) {
    #compressed.img <- graypca$x[,1:i] %*% t(graypca$rotation[,1:i])
  #}, simplify = 'array')
  #writeJPEG(pca.img, paste('/home/bradfordtuckfield/Documents/packt/compressed/gray_compressed_', round(i,0), '_components.jpg', sep = ''))
  writeJPEG(compressed.img, paste('/home/bradfordtuckfield/Documents/packt/compressed/gray_compressed_', round(i,0), '_components.jpg', sep = ''))
}





###########factor analysis

#factor analysis code
library(psych)
library(qgraph)

#teacher<-read.csv('/home/bradfordtuckfield/Documents/packt/turkiye-student-evaluation_generic.csv',stringsAsFactors=FALSE)

data(big5)

#teacherqs<-teacher[,6:ncol(teacher)]

bigcor<-cor(big5)

solution <- fa(r = bigcor, nfactors = 5, rotate = "oblimin", fm = "pa") 


solution <- fa(r = bigcor, nfactors = 3, rotate = "varimax", fm = "minres") 


parallel <- fa.parallel(big5, fm = 'minres', fa = 'fa')

print(parallel)
