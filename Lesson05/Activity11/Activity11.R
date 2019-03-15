install.packages('imager')
library('imager')
filepath<-'borges.jpg'
im <- imager::load.image(file =filepath) 
im<-imager::rm.alpha(im)
im<-imager::grayscale(im)
im<-imager::imsplit(im,axis = "x", nb = 10)   
matrix <- matrix(nrow = 10, ncol = 10)
for (i in 1:10) {
  is <- imager::imsplit(im = im[[i]], axis = "y", nb = 10)
  for (j in 1:10) {
    matrix[j,i] <- mean(is[[j]])
  }
}
borges_signature<-get_signature(matrix)
borges_signature

filepath<-'borges.jpg'
im <- imager::load.image(file =filepath) 
im<-imager::rm.alpha(im)
im<-imager::grayscale(im)
im<-imager::imsplit(im,axis = "x", nb = 9)

matrix <- matrix(nrow = 9, ncol = 9)
for (i in 1:9) {
  is <- imager::imsplit(im = im[[i]], axis = "y", nb = 9)
  for (j in 1:9) {
    matrix[j,i] <- mean(is[[j]])
  }
}
borges_signature_ninebynine<-get_signature(matrix)
borges_signature_ninebynine
