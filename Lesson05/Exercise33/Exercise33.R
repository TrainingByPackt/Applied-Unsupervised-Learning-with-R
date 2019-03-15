i<-5
j<-5
left<-brightnesscomparison(matrix[i,j-1],matrix[i,j])

i<-5
j<-5
top<-brightnesscomparison(matrix[i-1,j],matrix[i,j])

i<-5
j<-5
top_left<-brightnesscomparison(matrix[i-1,j-1], matrix[i,j])
bottom_left<-brightnesscomparison(matrix[i+1,j-1],matrix[i,j])
top_right<-brightnesscomparison(matrix[i-1,j+1],matrix[i,j])
right<-brightnesscomparison(matrix[i,j+1],matrix[i,j])
bottom_right<-brightnesscomparison(matrix[i+1,j+1],matrix[i,j])
bottom<-brightnesscomparison(matrix[i+1,j],matrix[i,j])

comparison<-NULL

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
