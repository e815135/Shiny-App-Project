#' on_branch UI Function
#'
#' @description Module for working on a branch page.
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
                          title = "4.2 Working on a Branch",
                          tags$div("In this chapter we will look at the basics
                                   of branching on our local device.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),

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
                                   we run the following:",
                                   tags$br(""),
                                   tags$code("$ git branch example_branch"),
                                   tags$br(""),
                                   "In order to switch from",
                                   tags$code("master"),
                                   "to this new branch we run the following:",
                                   tags$br(""),
                                   tags$code("$ git checkout example_branch"),
                                   tags$br(),
                                   tags$code("Switched to branch 'example_branch'"),
                                   tags$br(""),
                                   "As a shorthand, we can create a new branch
                                   and switch to is using the ",
                                   tags$code("-b"), 
                                   "option:",
                                   tags$br(""),
                                   tags$code("$ git checkout -b example_branch"),
                                   tags$br(""),
                                   "Next we can list all available branches. The
                                   asterisk tells us that us that we are currently
                                   working on",
                                   tags$code("example_branch"),
                                   ":",
                                   tags$br(""),
                                   tags$code("git branch -a"),
                                   tags$br(),
                                   tags$code("* example_branch"),
                                   tags$br(),
                                   "  ",
                                   tags$code("master"),
                                   tags$br(""),
                                   "We can also rename branches. To rename the 
                                   branch we are currently on we can run:",
                                   tags$br(""),
                                   tags$code("$ git branch -m new_name"),
                                   tags$br(""),
                                   "We can also rename a specified branch:",
                                   tags$br(""),
                                   tags$code("$ git branch -m old_name new_name"),
                                   tags$br(""),
                                   "Lastly, to delete a branch we run:",
                                   tags$br(""),
                                   tags$code("$ git branch -d example_branch"),
                                   tags$br(""),
                                   tags$i("Note: take caution when deleting 
                                          branches as others' work may be lost."))),



# practical example -------------------------------------------------------


      shinydashboard::box(width = 6,
                          title = "Practical Example",
                          tags$div("This example demonstrates that any changes 
                                   committed to one branch are independent from
                                   others.",
                                   tags$br(""),
                                   "For this example we have an empty 
                                   repository and we are currently working on the ",
                                   tags$code("master"),
                                   "branch.",
                                   tags$br(),
                                   "First we will create an empty text file and 
                                   commit this file on the",
                                   tags$code("master"),
                                   "branch:",
                                   tags$br(""),
                                   tags$code("$ touch example.txt"),
                                   tags$br(),
                                   tags$code("$ git add example.txt"),
                                   tags$br(),
                                   tags$code("$ git commit example.txt -m \"
                                             track empty text file\""),
                                   tags$br(""),
                                   "Next we will create and switch 
                                   to a new branch:",
                                   tags$br(""),
                                   tags$code("$ git checkout -b example_branch"),
                                   tags$br(""),
                                   "We can see that on this branch we still have
                                   the empty text file. This is because the commit
                                   representing the creation of this file
                                   is common to both branches.",
                                   tags$br(""),
                                   tags$code("$ ls"),
                                   tags$br(),
                                   tags$code("example.txt"),
                                   tags$br(""),
                                   "Working on this new branch, we can add 
                                   a line to the file as follows, save 
                                   it and commit the change:",
                                   tags$br(""),
                                   imageOutput(ns("change"),
                                               width = 300,
                                               height = 125),
                                   tags$br(),
                                   tags$code("$ git add example.txt"),
                                   tags$br(),
                                   tags$code("$ git commit example.txt -m \"
                                             add change to file for example\""),
                                   tags$br(""),
                                   "We can check this change has only been 
                                   committed on the new branch and not on the",
                                   tags$code("master"),
                                   "branch. Switching back to the",
                                   tags$code("master"),
                                   "branch and opening the file we can see that
                                   the change made on",
                                   tags$code("example_branch"),
                                   "is not present:",
                                   tags$br(""),
                                   tags$code("$ git checkout master"),
                                   tags$br(""),
                                   imageOutput(ns("original"),
                                               width = 300,
                                               height = 125),
                                   tags$br(""),
                                   "To describe this we can say:",
                                   tags$br(),
                                   tags$b("\"",
                                   tags$code("example_branch"),
                                   "is ahead of",
                                   tags$code("master"),
                                   "by 1 commit\".")
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
                                                'exercise1.txt'. Allow Git to 
                                                track this file."),
                                        tags$li("Create and move to a new branch
                                                called 'new_branch'."),
                                        tags$li("Make a change to the text file 
                                                commit this change."),
                                        tags$li("Switch back to the",
                                                tags$code("master"),
                                                "branch. Using the command ",
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
                                             tags$code("$ git add exercise1.txt"),
                                             tags$br(),
                                             tags$code("$ git commit 
                                                       exercise1.txt -m 
                                                       \"commit message here\""),
                                             tags$br(),
                                             tags$code("$ git checkout -b 
                                                       new_branch"),
                                             tags$br(),
                                             "After change is made:",
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
                                 tags$div("Running the following will show a 
                                          graphical representation of the commits 
                                          on the current branch:",
                                          tags$br(),
                                          tags$code("$ git log --graph 
                                               --pretty=oneline --abbrev-commit")
                                          ))),
# Adds whitespace as bottom so can see all of page with navbar
headerPanel(""),
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
    
    output$change <- renderImage({
      list(
        src = file.path(
          "R/images/work_on_branch/change.png"),
        contentType = "image/png",
        width = 300,
        height = 125
      )
    }, deleteFile = FALSE)
    
    output$original <- renderImage({
      list(
        src = file.path(
          "R/images/work_on_branch/original.png"),
        contentType = "image/png",
        width = 300,
        height = 125
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
    
    # Disable next button at the end of workflow
    
    observe({
      shinyjs::toggleState("next_button",
                           condition = counter$countervalue < 6)
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
        
      } else if (counter$countervalue == 6) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/work_on_branch/workflow7.png"),
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
        
      } else if (counter$countervalue == 6) {
        output$workflow <- renderImage({
          
          list(
            src = file.path(
              "R/images/work_on_branch/workflow7.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter$countervalue <= 0){
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
