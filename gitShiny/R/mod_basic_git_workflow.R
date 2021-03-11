#' basic_git_workflow UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 

mod_basic_git_workflow_ui <- function(id){
  ns <- NS(id)

    tagList(
      
      fluidRow(
        shinydashboard::box(plotOutput(ns("plot"))),
        shinydashboard::box(actionButton(ns("do"), "Click Me")))
    )
      
      
  
}

#' basic_git_workflow Server Functions
#'
#' @noRd 
mod_basic_git_workflow_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent(input$do, {
      data(mtcars)
      output$plot <- renderPlot(plot(mpg ~ disp, mtcars))
    })
})
}
    
## To be copied in the UI
# mod_basic_git_workflow_ui("basic_git_workflow_ui_1")
    
## To be copied in the server
# mod_basic_git_workflow_server("basic_git_workflow_ui_1")
