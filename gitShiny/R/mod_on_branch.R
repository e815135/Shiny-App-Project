#' on_branch UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_on_branch_ui <- function(id){
  ns <- NS(id)
  tagList(
 
    fluidRow(
      shinydashboard::box(width = 12,
                          title = "Working on a Branch",
                          tags$div("In this chapter we will look at the basics
                                   of branching on our local device.")),

# creating and switching branches -----------------------------------------
      
      shinydashboard::box(width = 6,
                          title = "Basic Branching Commands",
                          tags$div("Git's default branch is the ",
                                   tags$code("master"),
                                   " branch. We can see this when working in the
                                   command line:",
                                   tags$br(""),
                                   imageOutput(ns("master"),
                                               width = 175,
                                               height = 25),
                                   tags$br(""),
                                   "To create a branch called 'example_branch',
                                   I run the following:",
                                   tags$br(""),
                                   tags$code("$ git branch example_branch"),
                                   tags$br(""),
                                   "In order to switch from the master to this
                                   new branch I run the following:",
                                   tags$br(""),
                                   tags$code("$ git checkout example_branch"),
                                   tags$br(),
                                   tags$code("Switched to branch 'example_branch'"),
                                   tags$br(""),
                                   "As a shorthand, I can create a new branch
                                   and switch to is using the ",
                                   tags$code("-b"), 
                                   "option:",
                                   tags$br(""),
                                   tags$code("$ git checkout -b example_branch"),
                                   tags$br(""),
                                   "Next I can list all available branches. The
                                   asterisk tells us that me that I am currently
                                   working on example_branch:",
                                   tags$br(""),
                                   tags$code("git branch -a"),
                                   tags$br(),
                                   tags$code("* example_branch",
                                             tags$br(),
                                             "  master"),
                                   tags$br(""),
                                   "I can also rename branches. To rename the 
                                   branch I am currently on I can run:",
                                   tags$br(""),
                                   tags$code("$ git branch -m new_name"),
                                   tags$br(""),
                                   "I can also rename a specified branch:",
                                   tags$br(""),
                                   tags$code("$ git branch -m old_name new_name"),
                                   tags$br(""),
                                   "Lastly, to delete a branch I can run:",
                                   tags$br(""),
                                   tags$code("$ git branch -d example_branch"),
                                   tags$br(""),
                                   tags$i("Note: take caution when deleting 
                                          branches as others' work may be lost."))),



# practical example -------------------------------------------------------


      shinydashboard::box(width = 6,
                          title = "Practical Example",
                          tags$div("For this example I have an empty 
                                   repository and I am currently working on the ",
                                   tags$code("master"),
                                   "branch.",
                                   tags$br(),
                                   "First I will create an empty text file, 
                                   open it and make the following change:",
                                   tags$br(""),
                                   tags$code("$ touch example.txt"),
                                   tags$br(""),
                                   imageOutput(ns("change1"),
                                               width = 300,
                                               height = 100),
                                   tags$br(""),
                                   "I then save and commit this change.",
                                   tags$br(""),
                                   "Next I will create and switch 
                                   to a new branch:",
                                   tags$br(""),
                                   tags$code("$ git checkout -b example_branch"),
                                   tags$br(""),
                                   "Now opening the text file I can see that
                                   the previous addition is still there, as this
                                   change corresponds to a commit that is common
                                   in both branches.",
                                   tags$br(),
                                   "Working on this new branch, I can add 
                                   another line to the file as follows, save 
                                   it and commit the change:",
                                   tags$br(""),
                                   imageOutput(ns("change2"),
                                               width = 400,
                                               height = 150),
                                   tags$br(""),
                                   "We can check this change has only been 
                                   committed on the new branch and not on the",
                                   tags$code("master"),
                                   "branch.",
                                   tags$br(),
                                   "Switching back to the",
                                   tags$code("master"),
                                   "branch and opening the file we can see that
                                   the change made on 'example_branch' is not 
                                   present:",
                                   tags$br(""),
                                   tags$code("$ git checkout master"),
                                   tags$br(""),
                                   imageOutput(ns("change1_again"),
                                               width = 300,
                                               height = 100),
                                   tags$br(""),
                                   "To describe this we can say that 
                                   \"'example_branch' is ahead of 'master' by one
                                   commit\"."
                                   )),


# workflow ----------------------------------------------------------------

      shinydashboard::box(width = 12,
                          title = "Creating and Switching Between Branches",
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
                                    tags$div(
                                      tags$ul(
                                        tags$li("Navigate to the GitExercises
                                                folder created in the previous 
                                                chapter. Create a new folder 
                                                named 'Chapter4' and navigate
                                                into it."),
                                        tags$li("Create an empty text file named
                                                'exercise1.txt'. Make a change
                                                to the file and commit this change."),
                                        tags$li("Create and move to a new branch
                                                called 'new_branch'."),
                                        tags$li("Make a change to the text file 
                                                on a new line and commit this
                                                change."),
                                        tags$li("Switch back to the master 
                                                branch. Using the command ",
                                                tags$code("$ cat exercise1.txt"),
                                                "to print the contents of the 
                                                file, check that the change made
                                                on 'new_branch' is not present.")
                                      )
                                    )),
                shinydashboard::box(title = 'Solution', width = 6,
                                    background = 'light-blue',
                                    collapsible = TRUE,
                                    collapsed = TRUE,
                                    tags$div(tags$code("$ cd GitExercises"),
                                             tags$br(),
                                             tags$code("$ mkdir Chapter4"),
                                             tags$br(),
                                             tags$code("$ cd Chapter4"),
                                             tags$br(),
                                             tags$code("$ touch exercise1.txt"),
                                             tags$br(),
                                             "After first change is made to file:",
                                             tags$br(),
                                             tags$code("$ git add exercise1.txt"),
                                             tags$br(),
                                             tags$code("$ git commit 
                                                       exercise1.txt -m 
                                                       \"commit message here\""),
                                             tags$br(),
                                             tags$code("$ git checkout -b 
                                                       new_branch"),
                                             tags$br(),
                                             "After second change is made:",
                                             tags$br(),
                                             tags$code("$ git add exercise1.txt"),
                                             tags$br(),
                                             tags$code("$ git commit 
                                                       exercise1.txt -m 
                                                       \"commit message here\""),
                                             tags$br(),
                                             tags$code("$ git checkout master"),
                                             tags$br(),
                                             tags$code("$ cat exercise1.txt")
                                             )))
      ),


# tip ---------------------------------------------------------------------

      column(width = 6,
             shinydashboard::box(title = 'Tip!', width = 12,
                                 background = 'orange',
                                 tags$div(tags$ul(tags$li(
                                   "When working on a project is it best 
                                   practice to always work on a branch 
                                   that is not the",
                                   tags$code("master"),
                                   "branch."),
                                   tags$li(
                                     "Running the following will show a graphical
                                     representation of the branches:",
                                     tags$code("$ git log --graph 
                                               --pretty=oneline --abbrev-commit")
                                     )))))
    )
    
    
    
  )
}
    
#' on_branch Server Functions
#'
#' @noRd 
mod_on_branch_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    

# static images -----------------------------------------------------------

    output$master <- renderImage({
      list(
        src = file.path(
          "R/images/work_on_branch/master_branch.png"),
        contentType = "image/png",
        width = 175,
        height = 25
      )
    }, deleteFile = FALSE)
    
    output$change1 <- renderImage({
      list(
        src = file.path(
          "R/images/work_on_branch/change1.png"),
        contentType = "image/png",
        width = 300,
        height = 100
      )
    }, deleteFile = FALSE)
    
    output$change2 <- renderImage({
      list(
        src = file.path(
          "R/images/work_on_branch/change2.png"),
        contentType = "image/png",
        width = 400,
        height = 150
      )
    }, deleteFile = FALSE)
    
    output$change1_again <- renderImage({
      list(
        src = file.path(
          "R/images/work_on_branch/change1_again.png"),
        contentType = "image/png",
        width = 300,
        height = 100
      )
    }, deleteFile = FALSE)


# workflow ----------------------------------------------------------------
 
    # set counter
    counter <- reactiveValues(countervalue = 0)
    
    # Initial image to be shown
    output$workflow <- renderImage({
      list(
        src = file.path(
          "R/images/work_on_branch/workflow1.png"),
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
              "R/images/work_on_branch/workflow2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/work_on_branch/workflow3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/work_on_branch/workflow4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 4) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/work_on_branch/workflow5.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 5) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/work_on_branch/workflow6.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue > 5) {
        counter$countervalue <- 5
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
              "R/images/work_on_branch/workflow2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 2) {
        output$workflow <- renderImage({
          list(
            src = file.path(
              "R/images/work_on_branch/workflow3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter$countervalue == 3) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/work_on_branch/workflow4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 4) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/work_on_branch/workflow5.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue == 5) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/work_on_branch/workflow6.png"),
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
              "R/images/work_on_branch/workflow1.png"),
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
# mod_on_branch_ui("on_branch_ui_1")
    
## To be copied in the server
# mod_on_branch_server("on_branch_ui_1")
