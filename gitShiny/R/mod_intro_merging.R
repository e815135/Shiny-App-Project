#' intro_merging UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_intro_merging_ui <- function(id){
  ns <- NS(id)
  tagList(
 
    fluidRow(
      shinydashboard::box(title = "Introduction to Merging",
                          width = 12),
      shinydashboard::box(title = "Merging Two Branches",
                          width = 12),
      shinydashboard::box(title = "Summary",
                          width = 12,
                          imageOutput(ns("workflow"),
                                      width = 600,
                                      height = 400),
                          actionButton(ns("previous_button"), "Previous"),
                          actionButton(ns("next_button"), "Next")),
      # Exercise and solution
      column( width = 6,
              fluidRow(
                shinydashboard::box(title = 'Exercise', width = 6,
                                    background = 'light-blue'),
                shinydashboard::box(title = 'Solution', width = 6,
                                    background = 'light-blue',
                                    collapsible = TRUE,
                                    collapsed = TRUE))
      ),
      # TIPS
      column(width = 6,
             shinydashboard::box(title = 'Tips!', width = 12,
                                 background = 'orange'))
    )
  )
}
    
#' intro_merging Server Functions
#'
#' @noRd 
mod_intro_merging_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    # set counter
    counter <- reactiveValues(countervalue = 0)
    
    # Initial image to be shown
    output$workflow <- renderImage({
      list(
        src = file.path(
          "R/images/intro_merging/workflow1.png"),
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
              "R/images/intro_merging/workflow2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/intro_merging/workflow3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 4) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow5.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 5) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow6.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 6) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow7.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 7) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow8.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 8) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow9.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue > 8) {
        counter$countervalue <- 8
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
              "R/images/intro_merging/workflow2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/intro_merging/workflow3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 4) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow5.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 5) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow6.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 6) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow7.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 7) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow8.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 8) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/intro_merging/workflow9.png"),
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
              "R/images/intro_merging/workflow1.png"),
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
# mod_intro_merging_ui("intro_merging_ui_1")
    
## To be copied in the server
# mod_intro_merging_server("intro_merging_ui_1")
