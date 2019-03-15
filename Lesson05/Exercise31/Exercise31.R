install.packages('imager')
library('imager')
filepath<-'alamo.jpg'
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

print(matrix)
