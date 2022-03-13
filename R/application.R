#' A function to launch the app
#' @title application
#' @description Launch a graphic interface
#' @return a graphic interface
#' @author Chloe Mason
#' @export


# Define UI for application

myApp<-function(){
  library(shiny)

  ui <- fluidPage(

    # Application title
    titlePanel("Sudoku"),
    # Sidebar
      sidebarLayout(
        sidebarPanel(

          #button to click to print the sudoku grid with empty boxes to play
          actionButton("go","Cliquer pour afficher une grille"),
          #buttons to choose the difficulty of the grid (how many boxes to hide)
          radioButtons("Difficulte", "Choisir la difficulte de la grille", choices =c("facile","moyen","difficile")),
          #button to click to print the solution
          actionButton("solution","Cliquer pour afficher la solution")

        ),

        mainPanel(
          tableOutput("Grille"),
          verbatimTextOutput("Solvable"),
          tableOutput("GrilleCorrigee")
        )
      )
  )

  # Define server logic required to draw a histogram
  server <- function(input, output) {
    m<-creationMatrice()


    #print a grid
    grilleSudoku<-observeEvent(input$go, {
      matrice_finale <- creationNiveau(m, input$Difficulte)
      output$Grille<-renderTable(matrice_finale)
      })

    #print solution
    solutionSudoku<-observeEvent(input$solution,{
      output$Solvable<-renderPrint(trouveSolution(m))
      output$GrilleCorrigee<-renderTable(m)
      })
  }
shinyApp(ui = ui, server = server)
}


