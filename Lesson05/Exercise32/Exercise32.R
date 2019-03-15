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
i<-5
j<-5
left<-brightnesscomparison(matrix[i,j-1],matrix[i,j])
i<-5
j<-5
top<-brightnesscomparison(matrix[i-1,j],matrix[i,j])
