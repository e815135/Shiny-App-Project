#' basic_branching UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_basic_branching_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    fluidRow(
      shinydashboard::box(width = 12,
                          title = "Introduction to Branching",
                          tags$div("When working on a project, we may want to 
                                   work on different features without affecting
                                   the main part of the project.",
                                   tags$br(),
                                   "Branching allows us to develop multiple 
                                   aspects of our project isolated from the main
                                   branch. This is particularly useful when 
                                   working collaboratively on a project.",
                                   tags$br(),
                                   "The default branch is the ",
                                   tags$code("master"),
                                   "branch. It is best practice to work on 
                                   a different branch from this.")),
      shinydashboard::box(width = 12,
                          title = "Example of Branching in Practice",
                          imageOutput(ns("workflow"),
                                      width = 600,
                                      height = 400),
                          actionButton(ns("previous_button"), "Previous"),
                          actionButton(ns("next_button"), "Next"))
    )
 
  )
}
    
#' basic_branching Server Functions
#'
#' @noRd 
mod_basic_branching_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    # set counter
    counter <- reactiveValues(countervalue = 0)
    
    # Initial image to be shown
    output$workflow <- renderImage({
      list(
        src = file.path(
          "R/images/basic_branching/branch_example1.png"),
        contentType = "image/png",
        width = 600,
        height = 400
      )
    }, deleteFile = FALSE)
    
    # When Next button is pressed:
    
    observeEvent(input$next_button, {
      # If Next button pressed, increment by 1
      counter$countervalue <- counter$countervalue + 1
      
      # Depending on countervalue, render the appropiate image
      if (counter$countervalue == 1){
        
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/basic_branching/branch_example2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/basic_branching/branch_example3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_branching/branch_example4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue > 3) {
        counter$countervalue <- 3
      }    
      
    })
    
    # When Previous button is pressed:
    
    
    observeEvent(input$previous_button, {
      # If Previous button pressed, increment by -1
      counter$countervalue <- counter$countervalue - 1
      
      # Depending on countervalue, render the appropiate image
      if (counter$countervalue == 1){
        
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/basic_branching/branch_example2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/basic_branching/branch_example3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_branching/branch_example4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue <= 0){
        counter$countervalue <- 0
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/basic_branching/branch_example1.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      }
      
    }) 
 
  })
}
