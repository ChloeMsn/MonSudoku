#include <Rcpp.h>
#include <iostream>
#define N 9

using namespace std ;
using namespace Rcpp;


// [[Rcpp::export]]
//check whether num is present in column or not
bool isPresentInCol(int col, int num, NumericMatrix grid) {

  for (int row = 0; row < N; row++)
    if (grid(row,col) == num)
      return true;

    return false;
}



// [[Rcpp::export]]
//check whether num is present in row or not
bool isPresentInRow(int row, int num, NumericMatrix grid) {

  for (int col = 0; col < N; col++)
    if (grid(row,col) == num)
      return true;
    return false;
}




// [[Rcpp::export]]
// check whether num is present in a 3x3 box or not
bool isPresentInBox(int boxStartRow, int boxStartCol, int num, NumericMatrix grid) {

  for (int row = 0; row < 3; row++)
    for (int col = 0; col < 3; col++)
      if (grid(row+boxStartRow,col+boxStartCol) == num)
        return true;
      return false;
}






// [[Rcpp::export]]
// get empty location and update row and column
bool findEmptyPlace(int &row, int &col, NumericMatrix grid) {
  for (row = 0; row < N; row++)
    for (col = 0; col < N; col++)
      if (grid(row,col) == 0) //marked with 0 is empty
        return true;
      return false;
}



// [[Rcpp::export]]
bool isValidPlace(int row, int col, int num,  NumericMatrix grid) {
  //when item not found in col, row and current 3x3 box
  return !isPresentInRow(row, num, grid) && !isPresentInCol(col, num,grid) && !isPresentInBox(row - row%3 , col - col%3, num, grid);
}




// [[Rcpp::export]]
bool solveSudoku(NumericMatrix grid) {
  int row, col;
  if (!findEmptyPlace(row, col,grid))
    return true;     //when all places are filled
  for (int num = 1; num <= 9; num++) {
    //valid numbers are 1 - 9
    if (isValidPlace(row, col, num,grid)) {
      //check validation, if yes, put the number in the grid
      grid(row,col) = num;
      if (solveSudoku(grid))
        //recursively go for other rooms in the grid
        return true;
      // the core of backtracking
      grid(row,col) = 0;
      //turn to unassigned space when conditions are not satisfied
    }
  }
  return false;
}





