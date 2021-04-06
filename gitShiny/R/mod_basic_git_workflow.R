#' basic_git_workflow UI Function
#'
#' @description Module for basic workflow page.
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
        shinydashboard::box(width = 12,
                            title = "Basic Git Workflow",
                            tags$div(
                              "Below describes the stages of a basic Git 
                              workflow used for version control.")),
        shinydashboard::box(width = 7,
                            imageOutput(ns("image"))),
        shinydashboard::box(width = 12, 
                            actionButton(ns("previous_button"), "Previous"),
                            actionButton(ns("next_button"), "Next"))
      )

    )

}

#' basic_git_workflow Server Functions
#'
#' @noRd 
mod_basic_git_workflow_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    # set counter
    counter <- reactiveValues(countervalue = 0)
    
    # Initial image to be shown
    output$image <- renderImage({
      list(
        src = file.path(
          "R/images/basic_git_workflow/workflow_image_1.png"),
        contentType = "image/png",
        width = 700,
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
            "R/images/basic_git_workflow/workflow_image_2.png"),
          contentType = "image/png",
          width = 700,
          height = 400
        )
      }, deleteFile = FALSE)
      
      } else if (counter$countervalue == 2) {
        output$image <- renderImage({
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_3.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_4.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 4) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_5.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 5) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_6.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 6) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_7.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 7) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_8.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 8) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_9.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 9) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_10.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
        # cap after 9 clicks
      } else if (counter$countervalue > 9) {
        counter$countervalue <- 9
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
            "R/images/basic_git_workflow/workflow_image_2.png"),
          contentType = "image/png",
          width = 700,
          height = 400
        )
      }, deleteFile = FALSE)
      
      } else if (counter$countervalue == 2) {
        output$image <- renderImage({
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_3.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_4.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 4) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_5.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 5) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_6.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 6) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_7.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 7) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_8.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 8) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_9.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue >= 9) {
        
        output$image <- renderImage({
          
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_10.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
        
        # set lower bound for clicks
      } else if (counter$countervalue <= 0){
        counter$countervalue <- 0
        output$image <- renderImage({
          list(
            src = file.path(
              "R/images/basic_git_workflow/workflow_image_1.png"),
            contentType = "image/png",
            width = 700,
            height = 400
          )
        }, deleteFile = FALSE)
      }
      
    })
    
})
}
