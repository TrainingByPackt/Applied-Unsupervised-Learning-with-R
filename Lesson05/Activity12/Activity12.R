install.packages('imager')
library('imager')
filepath<-'alamo_marked.jpg'
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

watermarked_signature<-get_signature(matrix)
watermarked_signature
comparison<-mean(abs(watermarked_signature-building_signature))
comparison
