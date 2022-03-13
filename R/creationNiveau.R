#' Add together two numbers
#' @title creationNiveau
#' @param m a 9 by 9 matrix (sudoku grid)
#' @param difficulte a string refering to the difficulty, the values should be : "facile", "moyen" or "difficile"
#' @return The sudoku grid with empty boxes (number equals to 0)
#' @author Chloe Mason
#' @examples
#' m<-creationMatrice()
#' creationNiveau(m, "facile")
#' @export



creationNiveau<-function(m , difficulte){
  for (x in 1:9){
    print(difficulte)
    if (difficulte=="facile"){
      random_int<-sample(x=1:3,size=1) #random int = how many numbers to delete in a line
      y <- sample.int(9,random_int)
      m[x,y]<-0
      print(m)
      return(m)

    }
    if (difficulte =="moyen"){
      random_int<-sample(x=4:6,size=1) #random int = how many numbers to delete in a line
      y <- sample.int(9,random_int)
      m[x,y]<-0
      return(m)
    }
    if (difficulte =="difficile"){
      random_int<-sample(x=7:9,size=1) #random int = how many numbers to delete in a line
      y <- sample.int(9,random_int)
      m[x,y]<-0
      return(m)
    }
  }
}
