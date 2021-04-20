#' intro_merging UI Function
#'
#' @description Module for introduction to merging page.
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

# intro to merging --------------------------------------------------------
      
      shinydashboard::box(title = "4.3 Introduction to Merging",
                          width = 12,
                          tags$div("Let's say we have reached a milestone in a 
                                   project where we would like to draw together 
                                   developers' work and deploy something into 
                                   production.",
                                   tags$br(),
                                   "Git Branching has been used so pieces of 
                                   work sit on separate branches.",
                                   tags$br(),
                                   "We use Git to merge the relevant branches
                                   so all of the work sits on one branch. To do 
                                   this we use the command",
                                   tags$code("git merge"),
                                   ".",
                                   tags$br(""),
                                   "In this chapter we will look at merging two
                                   branches.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).",
                                   tags$br(""),
                                   "How does ",
                                   tags$code("git merge"),
                                   "work?",
                                   tags$br(""),
                                   tags$code("git merge"),
                                   "takes two commit points, usually the tips of
                                   the branches, and finds a common commit. Git
                                   then combines the subsequent commits on each
                                   branch into one history. This creates a new 
                                   merge commit which 
                                   combines all of the changes.
                                   Git is clever and determines how the 
                                   merging is done.")),


# merging two branches ----------------------------------------------------


      shinydashboard::box(title = "Merging Two Branches",
                          width = 12,
                          tags$div("Usually we would like to merge two 
                                   branches.",
                                   tags$br(""),
                                   "At the end of the practical example in 
                                   Chapter 4.2, the branch",
                                   tags$code("example_branch"),
                                   "was ahead of the ",
                                   tags$code("master"),
                                   "branch by one commit.",
                                   tags$br(),
                                   "Now we would like to merge",
                                   tags$code("example_branch"),
                                   "into the ",
                                   tags$code("master"),
                                   "branch. To do this, we first make sure we 
                                   are working on the",
                                   tags$code("master"),
                                   "branch:",
                                   tags$br(""),
                                   tags$code("$ git checkout master"),
                                   tags$br(""),
                                   "Then we use ",
                                   tags$code("git merge"),
                                   ", specifying the branch we would like to 
                                   merge into ",
                                   tags$code("master"),
                                   ":",
                                   tags$br(""),
                                   tags$code("$ git merge example_branch"),
                                   tags$br(""),
                                   "Using the ",
                                   tags$code("cat"),
                                   "command we can see that the merge has taken
                                   place:",
                                   tags$br(""),
                                   imageOutput(ns("merged"),
                                               width = 300,
                                               height = 75),
                                   tags$br(""),
                                   "Finally, ",
                                   tags$code("example_branch"),
                                   "is still pointing its last commit and not
                                   the merge commit. To ensure it points to the
                                   merge commit we run:",
                                   tags$br(""),
                                   tags$code("$ git checkout example_branch"),
                                   tags$br(),
                                   tags$code("$ git merge master"),
                                   tags$br(""),
                                   "This is known as a",
                                   tags$b("fast-forward merge.")
                                   )),

# summmary workflow -------------------------------------------------------


      shinydashboard::box(title = "Summary",
                          width = 12,
                          imageOutput(ns("workflow"),
                                      width = 600,
                                      height = 400),
                          actionButton(ns("previous_button"), "Previous"),
                          actionButton(ns("next_button"), "Next")),
     

# exercise and solution ---------------------------------------------------


      column( width = 6,
              fluidRow(
                shinydashboard::box(title = 'Exercise', width = 6,
                                    background = 'light-blue',
                                    tags$div("Following the exercise in 
                                             Chapter 4.2, navigate to the file
                                             path 'GitExercises/Chapter4' and
                                             merge ", 
                                             tags$code("new_branch"),
                                             "onto the ",
                                             tags$code("master"),
                                             "branch.")),
                shinydashboard::box(title = 'Solution', width = 6,
                                    background = 'light-blue',
                                    collapsible = TRUE,
                                    collapsed = TRUE,
                                    tags$div(
                                      tags$code("$ cd GitExercises/Chapter4"),
                                      tags$br(),
                                      tags$code("$ git checkout master"),
                                      tags$br(),
                                      tags$code("$ git merge new_branch"),
                                      tags$br(),
                                      tags$code("$ git checkout new_branch"),
                                      tags$br(),
                                      tags$code("$ git merge master")
                                             )))
      ),
     

# tips --------------------------------------------------------------------


      column(width = 6,
             shinydashboard::box(title = 'Tips!', width = 12,
                                 background = 'orange',
                                 tags$div("In Chapter 3.4 we referred to 
                                          something called the",
                                          tags$code("HEAD"),
                                          ". This is used as a pointer to point
                                          to a specific commit on a specific 
                                          branch. To help a merge execute 
                                          smoothly, we make sure the",
                                          tags$code("HEAD"),
                                          "is pointed at the branch which is 
                                          receiving the merge, in our case this
                                          was the ",
                                          tags$code("master"),
                                          "branch. To do this, we ran",
                                          tags$code("git checkout master"),
                                          "."
                                          )))
    )
  )
}
    
#' intro_merging Server Functions
#'
#' @noRd 
mod_intro_merging_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    

# static images -----------------------------------------------------------

    output$merged <- renderImage({
      list(
        src = file.path(
          "R/images/intro_merging/merged.png"),
        contentType = "image/png",
        width = 300,
        height = 75
      )
    }, deleteFile = FALSE)    
    

# summary workflow --------------------------------------------------------
    
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
    
    # Disable next button at the end of workflow
    
    observe({
      shinyjs::toggleState("next_button",
                           condition = counter$countervalue < 8)
    })
    
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
        
      }     
      
    })
    
    # Disable previous button at the start of workflow
    
    observe({
      shinyjs::toggleState("previous_button",
                           condition = counter$countervalue > 0)
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

