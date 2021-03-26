#' revert_changes UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_revert_changes_ui <- function(id){
  ns <- NS(id)
  tagList(
    

# intro -------------------------------------------------------------------
    
    fluidRow(
      shinydashboard::box(width = 12,
                          title = "Reverting Changes",
                          tags$div("The purpose of using Git for verion control
                                   is to track the history of changes made to
                                   files, and so naturally this means we have
                                   the ability to 'undo' our changes. There are 
                                   a number of different types of ways to 'undo'
                                   changes. In this chapter we will use ",
                                   tags$code("git revert"),
                                   "to revert back to the most recent commit in
                                   our commit history.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),

# how it works workflow ---------------------------------------------------
      
      shinydashboard::box(width = 12,
                         title = "How it Works",
                         tags$div(tags$code("git revert"),
                                  "figures out how to revert the changes made 
                                  in a given commit and creates a new commit 
                                  with the inverse content. This prevents any 
                                  commit history being lost."),
                         imageOutput(ns("workflow")),
                         actionButton(ns("previous_button"), "Previous"),
                         actionButton(ns("next_button"), "Next")),

# reverting back to previous commit ---------------------------------------

      shinydashboard::box(width = 12,
                          title = "Reverting back to Previous Commit",
                          tags$div("Let's look at an example of reverting back
                                   to our most recent commit:",
                                   tags$br(""),
                                   "First I will create an empty text file and 
                                   commit the file to the git repository:",
                                   tags$br(""),
                                   tags$code("$ touch example5.txt"),
                                   tags$br(),
                                   tags$code("$ git add example5.txt"),
                                   tags$br(),
                                   tags$code("$ git commit example5.txt -m
                                             \"track file example5.txt\""),
                                   tags$br(""),
                                   "Next I want to make some changes to the file.",
                                   tags$br(),
                                   "First I open the file and make the following
                                   change:",
                                   tags$br(""),
                                   imageOutput(ns("change1"),
                                               width = 450,
                                               height = 100),
                                   "I save this change and then in Git Bash I 
                                   commit this change:",
                                   tags$br(""),
                                   tags$code("$ git add example5.txt"),
                                   tags$br(),
                                   tags$code("$ git commit example5.txt -m \"
                                             add first change to the file 
                                             example5.txt\""),
                                   tags$br(""),
                                   "Similarly I make and commit a second change
                                   to the file:",
                                   tags$br(""),
                                   imageOutput(ns("change2"),
                                               width = 450,
                                               height = 100),
                                   tags$code("$ git add example5.txt"),
                                   tags$br(),
                                   tags$code("$ git commit example5.txt -m \"
                                             add second change to file 
                                             example5.txt\""),
                                   tags$br(""),
                                   "Now I would like to revert back to the first
                                   change I made to the file. To do this I run 
                                   the following:",
                                   tags$br(""),
                                   tags$code("$ git revert HEAD --no-edit"),
                                   tags$br(""),
                                   "Here, ", 
                                   tags$code("HEAD"),
                                   "refers to the most recent commit and ",
                                   tags$code("--no-edit"),
                                   "keeps the new default commit message.",
                                   tags$br(""),
                                   tags$i("Note: running the command without 
                                          this option prompts the user to give 
                                          a commit message."),
                                   tags$br(""),
                                   "I can now see that a new commit has been 
                                   made which is the inverse of the previous 
                                   commit:",
                                   tags$br(""),
                                   imageOutput(ns("log"),
                                               height = 300),
                                   tags$br(""),
                                   "Finally, opening the text file I can see
                                   that the previous change has been reverted:",
                                   tags$br(""),
                                   imageOutput(ns("reverted"),
                                               width = 450,
                                               height = 100))),
# Exercise and solution ---------------------------------------------------


        column(width = 12,
               fluidRow(
                 shinydashboard::box(width = 6,
                                     title = "Exercise",
                                     background = "light-blue",
                                     tags$div(
                                       tags$ul(
                                         tags$li(
                                           "Navigate to the folder 'Chapter3'
                                           and create an empty text file named
                                           'exercise4.txt'. Track this file."
                                         ),
                                         tags$li(
                                           "Open this file, make a change and 
                                           save it. Commit this change."
                                         ),
                                         tags$li(
                                           "Revert back to the previous commit."
                                         ),
                                         tags$li(
                                           "Open the file to check that it is 
                                           empty again."
                                         )))),
                 shinydashboard::box(width = 6,
                                     title = "Solution",
                                     background = "light-blue",
                                     collapsible = TRUE,
                                     collapsed = TRUE,
                                     tags$div(
                                       tags$code("$ cd GitExercises/Chapter3"),
                                       tags$br(),
                                       tags$code("$ touch exercise5.txt"),
                                       tags$br(),
                                       tags$code("$ git add exercise5.txt"),
                                       tags$br(),
                                       tags$code("$ git commit exercise5.txt -m
                                                 \"track file\""),
                                       tags$br(),
                                       "Make a change to the file, then:",
                                       tags$br(),
                                       tags$code("$ git add exercise5.txt"),
                                       tags$br(),
                                       tags$code("$ git commit exercise5.txt -m
                                                 \"make change to file\""),
                                       tags$br(),
                                       tags$code("$ git revert HEAD --no-edit")
                                       ))))
    )
    
 
  )
}
    
#' revert_changes Server Functions
#'
#' @noRd 
mod_revert_changes_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 

# workflow ----------------------------------------------------------------

    # tracking file workflow: -------------------------------------------------
    
    # set counter
    counter <- reactiveValues(countervalue = 0)
    
    # Initial image to be shown
    output$workflow <- renderImage({
      list(
        src = file.path(
          "R/images/revert_changes/revert_1.png"),
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
              "R/images/revert_changes/revert_2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/revert_changes/revert_3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/revert_changes/revert_4.png"),
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
              "R/images/revert_changes/revert_2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/revert_changes/revert_3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/revert_changes/revert_4.png"),
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
              "R/images/revert_changes/revert_1.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      }
      
    })    
    

# static images -----------------------------------------------------------

    output$change1 <- renderImage({
      list(
        src = file.path(
          "R/images/revert_changes/first_change.png"),
        contentType = "image/png",
        width = 450,
        height = 100
      )
    }, deleteFile = FALSE)
    
    output$change2 <- renderImage({
      list(
        src = file.path(
          "R/images/revert_changes/second_change.png"),
        contentType = "image/png",
        width = 450,
        height = 100
      )
    }, deleteFile = FALSE)
    
    output$log <- renderImage({
      list(
        src = file.path(
          "R/images/revert_changes/git_log_revert.png"),
        contentType = "image/png",
        width = 600,
        height = 300
      )
    }, deleteFile = FALSE)
    
    output$reverted <- renderImage({
      list(
        src = file.path(
          "R/images/revert_changes/reverted.png"),
        contentType = "image/png",
        width = 450,
        height = 100
      )
    }, deleteFile = FALSE)
    
    
  })
}
    