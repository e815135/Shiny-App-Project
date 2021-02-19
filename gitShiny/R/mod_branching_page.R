#' branching_page UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_branching_page_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboard::box(
        title = "Making a Commit", 
        width = 12,
        tags$div("When a change is made, you can commit this change by running",
                 tags$code("git commit"))),
      shinydashboard::box(
        title = "Make commit on master branch",
        actionButton(inputId = "run1", label = "Run")),
      shinydashboard::box(title = "Diagramme1", 
                          DiagrammeR::grVizOutput(outputId = "diagramme1"), 
                          width = 6),
      shinydashboard::box(title = "Make commit on bugFix branch", 
                          actionButton(inputId = "run2", label = "Run")),
      shinydashboard::box(title = "Diagramme2", 
                          DiagrammeR::grVizOutput(outputId = "diagramme2"), 
                          width = 6)
    )#shinyWidgets::actionBttn
  )
}
    
#' branching_page Server Functions
#'
#' @noRd 
mod_branching_page_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    flowchart1 <- "
                                    digraph boxes_and_circles {
                                    
                                    # a 'graph' statement
                                    graph [overlap = true, fontsize = 10]
                                    
                                    node [shape = circle,
                                    fixedsize = true,
                                    color = grey,
                                    width = 0.3,
                                    fontsize = 10] // sets as circles
                                    C0; C1
                                    
                                    # several 'edge' statements
                                    C0->C1 [arrowsize = 0.5, color = blue]
  }
                                    "
    flowchart2 <- "
                                    digraph boxes_and_circles {
                                    
                                    # a 'graph' statement
                                    graph [overlap = true, fontsize = 10]
                                    
                                    node [shape = circle,
                                    fixedsize = true,
                                    color = grey,
                                    width = 0.3,
                                    fontsize = 10] // sets as circles
                                    C0; C1; C2
                                    
                                    # several 'edge' statements
                                    C0->C1 [arrowsize = 0.5, color = blue]
                                    C0->C2 [arrowsize = 0.5, color = yellow]
                                    }
                                    "
    # val1 <- eventReactive(input$run1,
    #                       flowchart1)
    output$diagramme1 <- DiagrammeR::renderDiagrammeR(DiagrammeR::grViz(flowchart1))
    #output$diagramme1 <- renderPlot(val1())
    # val2 <- eventReactive(input$run2,
    #                       flowchart2)
    output$diagramme2 <- DiagrammeR::renderDiagrammeR(DiagrammeR::grViz(flowchart2))

  })
}
    
## To be copied in the UI
# mod_branching_page_ui("branching_page_ui_1")
    
## To be copied in the server
# mod_branching_page_server("branching_page_ui_1")
