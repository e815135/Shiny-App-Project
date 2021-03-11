#' tracking_changes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tracking_changes_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboard::box(width = 12,
                          title = "Tracking Changes",
                          tags$div("In this chapter we will cover the 
                                   fundamental Git commands used to track 
                                   the changes we make to files.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),
      shinydashboard::box(width = 12,
                          title = "Creating a Local Git Repository"),
      shinydashboard::box(width = 6,
                          title = "Committing Changes"),
      shinydashboard::box(width = 6,
                          imageOutput(ns("image")),
                          actionButton(ns("previous_button"), "Previous"),
                          actionButton(ns("next_button"), "Next")),
      shinydashboard::box(width = 6,
                          title = "Using the Vim Text Editor"),
      shinydashboard::box(width = 6,
                          title = "Commit Messages: Best Practices"),
      shinydashboard::box(width = 6,
                          title = "Why is there a Staging Area?"),
      shinydashboard::box(width = 6,
                          title = "Tips!",
                          background = "orange"),
      column(width = 12,
             fluidRow(
               shinydashboard::box(width = 6,
                                   title = "Exercise",
                                   background = "light-blue"),
               shinydashboard::box(width = 6,
                                   title = "Solution",
                                   background = "light-blue",
                                   collapsible = TRUE,
                                   collapsed = TRUE)
             )
             )
      
    )
 
  )
}
    
#' tracking_changes Server Functions
#'
#' @noRd 
mod_tracking_changes_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    # set counter
    counter <- reactiveValues(countervalue = 0)
    
    # Initial image to be shown
    output$image <- renderImage({
      list(
        src = file.path(
          "R/images/tracking_changes/commit_image_1.png"),
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
        
        output$image <- renderImage({
          list(
            src = file.path(
              "R/images/tracking_changes/commit_image_2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$image <- renderImage({
          list(
            src = file.path(
              "R/images/tracking_changes/commit_image_3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/tracking_changes/commit_image_4.png"),
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
        
        output$image <- renderImage({
          list(
            src = file.path(
              "R/images/tracking_changes/commit_image_2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$image <- renderImage({
          list(
            src = file.path(
              "R/images/tracking_changes/commit_image_3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/tracking_changes/commit_image_4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue <= 0){
        counter$countervalue <- 0
        output$image <- renderImage({
          list(
            src = file.path(
              "R/images/tracking_changes/commit_image_1.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      }
      
    })
    
    
    
  })
}
    
## To be copied in the UI
# mod_tracking_changes_ui("tracking_changes_ui_1")
    
## To be copied in the server
# mod_tracking_changes_server("tracking_changes_ui_1")
