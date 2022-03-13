#' Create a full sudoku grid
#' @title creationMatrice
#' @description this function create a 9 by 9  matrix in wich numbers appears once by columns, by row and by 3x3 boxes
#' @return a 9 by 9 matrix (a full sudoku grid)
#' @author Chloe Mason
#' @examples
#' creationMatrice()
#' @export

creationMatrice<-function(){
  m<-matrix(nrow=9,ncol=9)
  m[1,]<-sample(1:9)

  #initialize three first square starting on the left side corner
  i<- 2
  while (i <4){
    m[i,1]<-m[i-1,7]
    m[i,2]<-m[i-1,8]
    m[i,3]<-m[i-1,9]
    m[i,4]<-m[i-1,1]
    m[i,5]<-m[i-1,2]
    m[i,6]<-m[i-1,3]
    m[i,7]<-m[i-1,4]
    m[i,8]<-m[i-1,5]
    m[i,9]<-m[i-1,6]
    i<-i+1
  }

  #fill matrix
  z <- 1
  j<-1
  while(z<4){
    i<-4
    while (i<10) {
      m[i,j]<-m[i-3,j+2]
      m[i,j+1]<-m[i-3,j]
      m[i,j+2]<-m[i-3,j+1]
      i<-i+1
    }

    j<-j+3
    z<-z+1

  }
  return(m)

}
