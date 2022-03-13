#' A function to find if a solution for a sudoku grid
#' @title trouveSolution
#' @description
#' Given a matrix, find if a solution exists
#' @param m a 9 by 9 matrix
#' @return a string explaining if a solution exists
#' @examples
#' m<-creationMatrice()
#' trouveSolution(m)
#' @export


trouveSolution<-function(m){
  library("Rcpp")
  sourceCpp("~/Desktop/projetR/MonSudoku/NewPackage/src/test.cpp")
  if (solveSudoku(m)==TRUE){
    return("solution existante")
  }
  else{
    return("pas de solution")
  }
  print("ello")
}
