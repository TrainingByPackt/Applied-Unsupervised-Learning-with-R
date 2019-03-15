signature<-NULL
for (i in 1:nrow(matrix)){
  for (j in 1:ncol(matrix)){
    signature<-c(signature,neighborcomparison(matrix,i,j))
  }
}
get_signature<-function(matrix){
  signature<-NULL
  for (i in 1:nrow(matrix)){
    for (j in 1:ncol(matrix)){
      signature<-c(signature,neighborcomparison(matrix,i,j))
    }
  }
  return(signature)
}
building_signature<-get_signature(matrix)
building_signature
