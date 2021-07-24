#' tracking_changes UI Function
#'
#' @description Module for tracking changes page.
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

# Chapter introduction -----------------------------------------------------

      shinydashboard::box(width = 12,
                          title = "3.1 Tracking Changes",
                          tags$div("In this chapter we will cover the 
                                   fundamental Git commands used to track 
                                   the changes we make to files.",
                                   tags$br(""),
                                   "Unlike a usual save of a file, Git records
                                   the changes made to a file using
                                   commits. ",
                                   tags$br(),
                                   "Where a usual save stores a new 
                                   version of a file, a Git commit stores the 
                                   specific changes made to the file.",
                                   tags$br(),
                                   "These commits then form the file's Git history.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),

# Make git repo -----------------------------------------------------------

      shinydashboard::box(width = 12,
                          title = "Creating a Local Git Repository",
                          tags$div("Firstly we need to create a Git repository on
                                   our local machine. This is where Git tracks 
                                   and records all the changes made in a 
                                   project.",
                                   tags$br(),"To do this, we create a directory 
                                   (see chapter 1.2) and create our repository 
                                   within that using the command ",
                                   tags$code("git init"), 
                                   " which creates an empty repository:",
                                   tags$br(""),
                                   tags$code("$ pwd"),
                                   tags$br(),
                                   tags$code("/c/Users/name"),
                                   tags$br(),
                                   tags$code("$ cd Documents"),
                                   tags$br(),
                                   tags$code("$ mkdir Example"),
                                   tags$br(),
                                   tags$code("$ cd Example"),
                                   tags$br(""),
                                   tags$code("$ git init"),
                                   tags$br(),
                                   tags$code(
                                     "Initialized empty Git repository in 
                                     C:/Users/name/Documents/Example/.git/"))),

# Tracking a file ---------------------------------------------------------


      shinydashboard::box(width = 12,
                          title = "Tracking a File",
                          tags$div("Now that we have a repository we can begin to add
                                    and make changes to a file. First we are 
                                   going to create an empty text file:",
                                   tags$br(""),
                                   tags$code("$ touch example.txt"),
                                   tags$br(""),
                                   "The command ", tags$code("git status"),
                                   "allows us to see the current state of our 
                                   working directory, staging area and whether",
                                   tags$br(),
                                    "or not files are being tracked by Git. 
                                   Running this command shows us that the file
                                    'example.txt' is not being tracked by Git:",
                                   tags$br("")),
                          imageOutput(ns("status_1"), width = 600,
                                      height = 150),
                          tags$div(tags$br(""), 
                                   "In order for Git to track this file we first
                                   need to add it to the staging area. We do this 
                                   by running the command ", 
                                   tags$br(),
                                   tags$code("git add"),
                                   " followed by the file name:",
                                   tags$br(""),
                                   tags$code("$ git add example.txt"),
                                   tags$br(""),
                                   "Running ",
                                   tags$code("git status"),
                                   " again we can see that now the file is in
                                    the staging area:",
                                   tags$br("")),
                          imageOutput(ns("status_2"), width = 600,
                                      height = 150),
                          tags$div(tags$br(""),
                                   "Next we commit this change to the git 
                                   repository using the command ",
                                   tags$code("git commit"), 
                                   " followed by the name",
                                   tags$br(),
                                   "of the file and a 
                                   commit message:",
                                   tags$br(""),
                                   tags$code("$ git commit example.txt
                                              -m \"demonstrate git commit\""),
                                   tags$br(),
                                   tags$code("1 file changed, 0 insertions(+),
                                              0 deletions(-)"),
                                   tags$br(),
                                   tags$code("create note XXXXXX example.txt"),
                                   tags$br(""),
                                   tags$i("Note: this may print other output 
                                   which you can silence by following the on 
                                   screen instructions that Git Bash provides."
                                          ),
                                   tags$br(""),
                                   "Git commits represent a change(s) that has
                                   been made to a file, including creating or 
                                   removing a file.",
                                   tags$br(""),
                                   "Finally we can run ",
                                   tags$code("git status"),
                                   " again to see that there is nothing to 
                                   commit and the working tree is clean (more on
                                    this later):",
                                   tags$br("")),
                          imageOutput(ns("status_3"), width = 600,
                                      height = 50)
                          ),


# worflow 1 ---------------------------------------------------------------

      shinydashboard::box(width = 12,
                          title = "Workflow for Tracking a File:",
                          imageOutput(ns("image1")),
                          actionButton(ns("previous_button1"), "Previous"),
                          actionButton(ns("next_button1"), "Next")),

# Committing a change -----------------------------------------------------

      shinydashboard::box(width = 12,
                          title = "Committing a Change",
                          tags$div("Since committing the text file, we have made
                                    a change to the file and saved this change.
                                    We can see that a change",
                                   tags$br(),
                                   "has been made 
                                   by running ",
                                   tags$code("git status"),
                                   ":",
                                   tags$br("")),
                          imageOutput(ns("status_4"), width = 600,
                                      height = 125),
                          tags$div(tags$br(""), 
                                   "Again, to commit this change to the 
                                   repository we first add it to the staging 
                                   area:",
                                   tags$br(""),
                                   tags$code("git add example.txt"),
                                   tags$br(""),
                                   "Running ",
                                   tags$code("git status"),
                                   " again we can see that now the change is in
                                   the staging area:",
                                   tags$br("")),
                          imageOutput(ns("status_5"), width = 600,
                                      height = 100),
                          tags$div(tags$br(""),
                                   "Next we commit this change to the git 
                                   repository:",
                                   tags$br(""),
                                   tags$code("$ git commit example.txt
                                              -m \"demonstrate committing a 
                                             change to a file\""),
                                   tags$br(),
                                   tags$code("1 file changed, 1 insertions(+)"),
                                   tags$br(""),
                                   "Finally we can run ",
                                   tags$code("git status"),
                                   " again to see that there is nothing to 
                                   commit and the working tree is clean:",
                                   tags$br("")),
                          imageOutput(ns("status_6"), width = 600,
                                      height = 50),
                          tags$div(
                            tags$br(""),
                            "We can see the previous commits we have made by 
                             running ",
                            tags$code("git log"), ":",
                            tags$br("")),
                            imageOutput(ns("log"), width = 600,
                                        height = 175),
                          tags$div(
                            tags$br(""),
                            "This tells us that we have made two commits and it
                             displays the respective commit messages we gave
                             previously."
                          )),

# workflow 2 ---------------------------------------------------------------

      shinydashboard::box(width = 12,
                          title = "Workflow for Commit a Change",
                          imageOutput(ns("image2")),
                          actionButton(ns("previous_button2"), "Previous"),
                          actionButton(ns("next_button2"), "Next")),

# Vim text editor ---------------------------------------------------------


      shinydashboard::box(width = 12,
                          title = "Using the Vim Text Editor",
                          tags$div("Previously, when committing a change we 
                                   assigned to the commit a commit message 
                                   using the following code:",
                                   tags$br(""),
                                   tags$code("$ git commit example.txt -m 
                                             \"demonstrate git commit\""),
                                   tags$br(""),
                                   "A commit message briefly describes the 
                                   change we are committing. It is designed to 
                                   allow us to clearly identify",
                                   tags$br(), 
                                   "which stage of 
                                   our work corresponds to each commit, which 
                                   is helpful for later development.",
                                   tags$br(""),
                                   tags$b("You MUST assign a commit message to 
                                          every commit you make."),
                                   tags$br(""),
                                   "The ",
                                   tags$code("-m"),
                                   " notation used above makes it easy to write 
                                   a message, especially if the message is 
                                   small.",
                                   tags$br(),
                                   "However, one method for 
                                   leaving a commit message is to use the Vim 
                                   text editor. This allows us to type longer 
                                   commit messages.",
                                   tags$br(""),
                                   "When setting up Git Bash in Chapter 1.1,
                                    Vim was selected as the default text editor.
                                    This time if we run ",
                                   tags$br(""),
                                   tags$code("$ git commit example.txt"),
                                   tags$br(""),
                                   "Vim will open:",
                                   tags$br("")
                                   ),
                          imageOutput(ns("vim"), width = 600,
                                      height = 300),
                          tags$div(tags$br(""),
                                   "To leave a message, first w press the ",
                                   tags$code("I"),
                                   "key on our keyboard. Then we type our commit 
                                   message.",
                                   tags$br(),
                                   "Once this is typed we press the ",
                                   tags$code("esc"),
                                   "key on our keyboard and then type ",
                                   tags$code(":wq"),
                                   " and press the ",
                                   tags$code("Enter"),
                                   "key on",
                                   tags$br(),
                                   "our keyboard, which will save the
                                   message and exit the text editor.",
                                   tags$br(""),
                                   tags$i("Note: there are other text editors 
                                          which can be used.")
                          )),

# Commit messages best practice and why staging area? -------------------------------------------

      shinydashboard::box(width = 6,
                          tags$div(tags$h4("Commit Messages: Best Practices"),
                                   "It is important, especially when working 
                                   collaboratively on a project, that each 
                                   member of the team follows the same 
                                   conventions.",
                                   tags$br(""),
                                   "The most common and recommended convention 
                                   is to write the message in the imperative, 
                                   e.g. \"Fix bug in example.R file\", 
                                   rather than \"Fixed bug in example.R file\".
                                   We also avoid using full stops at the end of 
                                   commit messages.",
                                   tags$br(""),
                                   "Commit messages should be clear and 
                                   meaningful and don't assume prior knowledge
                                    of the situation.",
                                   tags$br(""),
                                   tags$h4("Why a Staging Area?"),
                                   "We can group related changes to multiple files
                                    within the staging area under one commit
                                   with one commit message. This makes our
                                   commits more organised and easier to follow.",
                                   tags$br(""),
                                   "For example, we may have changes made to
                                   two files names 'example1.txt' and
                                   'example2.txt' which are in the staging area.
                                   We can commit these under one commit using
                                   the following code:",
                                   tags$br(""),
                                   tags$code("$ git commit example1.txt
                                             example2.txt -m \"insert
                                             relevant commit message\"")
                                   )),


# Tips --------------------------------------------------------------------


      shinydashboard::box(width = 6,
                          title = "Tips!",
                          background = "orange",
                          tags$div(
                            tags$ul(
                              tags$li(
                                "The more commits made, the longer the git log
                                will become. To exit the log, type ",
                                tags$code("q"), 
                                "and press the ",
                                tags$code("Enter"),
                                "key on your keyboard."
                              ),
                              tags$li(
                                "When using the command line, we can use the up
                                and down arrows on our keyboard to retrieve previous
                                lines of code to run, saving time typing."
                              ),
                              tags$li(
                                "If we create a file and make a change to it,
                                we can commit both these changes under one commit - 
                                it is not neccessary to track the file first."
                              )
                              )
                              )),

# Exercise and solution ---------------------------------------------------


      column(width = 12,
             fluidRow(
               shinydashboard::box(width = 6,
                                   title = "Exercise",
                                   background = "light-blue",
                                   tags$div(
                                     tags$ul(
                                       tags$li(
                                         "Navigate to the folder 'GitExercises'
                                          created in Chapter 1.2 and make a new
                                         directory named 'Chapter3', then 
                                         navigate to this directory."
                                       ),
                                       tags$li(
                                         "Create an empty git repository and an
                                         empty text file named 'exercise1.txt'."
                                       ),
                                       tags$li(
                                         "Commit this file to the repository."
                                       ),
                                       tags$li(
                                         "Using file explorer (or equivalant), 
                                         open the text file you have created,
                                         add some text and save."
                                       ),
                                       tags$li(
                                         "Commit this change."
                                       )
                                     )
                                   )),
               shinydashboard::box(width = 6,
                                   title = "Solution",
                                   background = "light-blue",
                                   collapsible = TRUE,
                                   collapsed = TRUE,
                                   tags$div(
                                     tags$code("$ cd Documents/GitExercises"),
                                     tags$br(),
                                     tags$code("$ mkdir Chapter3"),
                                     tags$br(),
                                     tags$code("$ cd Chapter3"),
                                     tags$br(),
                                     tags$code("$ git init"),
                                     tags$br(),
                                     tags$code("$ touch exercise1.txt"),
                                     tags$br(),
                                     tags$code("$ git add exercise1.txt"),
                                     tags$br(),
                                     tags$code("$ git commit exercise1.txt
                                                -m \"track file\""),
                                     tags$br(),
                                     "After change has been made to the file:",
                                     tags$br(),
                                     tags$code("$ git add exercise1.txt"),
                                     tags$br(),
                                     tags$code("$ git commit exercise1.txt
                                                -m \"add text to file\"")
                                   ))
             )
             ),
# Adds whitespace as bottom so can see all of page with navbar
headerPanel(""),
      
    )
 
  )
}
    
#' tracking_changes Server Functions
#'
#' @noRd 
mod_tracking_changes_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    

# static images: ----------------------------------------------------------

    output$status_1 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/git_status_1.png"),
        contentType = "image/png",
        width = 600,
        height = 150
      )
    }, deleteFile = FALSE)
    
    output$status_2 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/git_status_2.png"),
        contentType = "image/png",
        width = 600,
        height = 150
      )
    }, deleteFile = FALSE)
    
    output$status_3 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/git_status_3.png"),
        contentType = "image/png",
        width = 600,
        height = 50
      )
    }, deleteFile = FALSE)
    
    output$status_4 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/git_status_4.png"),
        contentType = "image/png",
        width = 600,
        height = 125
      )
    }, deleteFile = FALSE)
    
    output$status_5 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/git_status_5.png"),
        contentType = "image/png",
        width = 600,
        height = 100
      )
    }, deleteFile = FALSE)
    
    output$status_6 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/git_status_6.png"),
        contentType = "image/png",
        width = 600,
        height = 50
      )
    }, deleteFile = FALSE)
    
    output$log <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/git_log.png"),
        contentType = "image/png",
        width = 600,
        height = 175
      )
    }, deleteFile = FALSE)
    
    output$vim <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/vim.png"),
        contentType = "image/png",
        width = 600,
        height = 300
      )
    }, deleteFile = FALSE)
    
    

# tracking file workflow: -------------------------------------------------

    # set counter
    counter1 <- reactiveValues(countervalue = 0)
    
    # Initial image to be shown
    output$image1 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/commit_image_1.png"),
        contentType = "image/png",
        width = 600,
        height = 400
      )
    }, deleteFile = FALSE)
    
    # Disable next button at the end of workflow
    
    observe({
      shinyjs::toggleState("next_button1",
                           condition = counter1$countervalue < 3)
    })
    
    # When Next button is pressed:
    
    observeEvent(input$next_button1, {
      # If Next button pressed, increment by 1
      counter1$countervalue <- counter1$countervalue + 1
      
      # Depending on countervalue, render the appropiate image
      if (counter1$countervalue == 1){
        
        output$image1 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter1$countervalue == 2) {
        output$image1 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter1$countervalue == 3) {
        output$image1 <- renderImage({
          
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      }     
      
    })
    
    # Disable previous button at the start of workflow
    
    observe({
      shinyjs::toggleState("previous_button1",
                           condition = counter1$countervalue > 0)
    })
    
    # When Previous button is pressed:
    
    
    observeEvent(input$previous_button1, {
      # If Previous button pressed, increment by -1
      counter1$countervalue <- counter1$countervalue - 1
      
      # Depending on countervalue, render the appropiate image
      if (counter1$countervalue == 1){
        
        output$image1 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_2.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter1$countervalue == 2) {
        output$image1 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_3.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter1$countervalue == 3) {
        output$image1 <- renderImage({
          
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_4.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter1$countervalue <= 0){

        output$image1 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_1.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      }
      
    })
    

# commiting change to file workflow: --------------------------------------
 
    # set counter
    counter2 <- reactiveValues(countervalue = 0)
    
    # Initial image to be shown
    output$image2 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/tracking_changes/commit_image_5.png"),
        contentType = "image/png",
        width = 600,
        height = 400
      )
    }, deleteFile = FALSE)
    
    # Disable next button at the end of workflow
    
    observe({
      shinyjs::toggleState("next_button2",
                           condition = counter2$countervalue < 3)
    })
    
    # When Next button is pressed:
    
    observeEvent(input$next_button2, {
      # If Next button pressed, increment by 1
      counter2$countervalue <- counter2$countervalue + 1
      
      # Depending on countervalue, render the appropiate image
      if (counter2$countervalue == 1){
        
        output$image2 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_6.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter2$countervalue == 2) {
        output$image2 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_7.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter2$countervalue == 3) {
        output$image2 <- renderImage({
          
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_8.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      }    
      
    })
    
    # Disable previous button at the start of workflow
    
    observe({
      shinyjs::toggleState("previous_button2",
                           condition = counter2$countervalue > 0)
    })
    
    # When Previous button is pressed:
    
    
    observeEvent(input$previous_button2, {
      # If Previous button pressed, increment by -1
      counter2$countervalue <- counter2$countervalue - 1
      
      # Depending on countervalue, render the appropiate image
      if (counter2$countervalue == 1){
        
        output$image2 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_6.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter2$countervalue == 2) {
        output$image2 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_7.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      } else if (counter2$countervalue == 3) {
        output$image2 <- renderImage({
          
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_8.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
        
      } else if (counter2$countervalue <= 0){
        output$image2 <- renderImage({
          list(
            src = file.path(
              "gitShiny/R/images/tracking_changes/commit_image_5.png"),
            contentType = "image/png",
            width = 600,
            height = 400
          )
        }, deleteFile = FALSE)
      }
      
    })
    
    
    
  })
}
