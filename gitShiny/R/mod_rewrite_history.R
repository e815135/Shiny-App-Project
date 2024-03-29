#' rewrite_history UI Function
#'
#' @description Module for rewriting history page.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_rewrite_history_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      
      shinydashboard::box(width = 12,
                          title = "3.2 Rewriting History",
                          tags$div("In this chapter we will cover how to rewrite
                                   a previous commit.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),
      
# rewrite commit message --------------------------------------------------

      shinydashboard::box(width = 6,
                          title = "Rewriting a Commit Message",
                          tags$div("Occassionally we will make mistakes when 
                                   typing commit messages, whether that be making
                                   typos or forgetting to add a piece of 
                                   information. Luckily we are able to rewrite 
                                   commit messages. In this chapter we will 
                                   rewrite the commit message of the most recent 
                                   commit.",
                                   tags$br(""),
                                   "Running ", 
                                   tags$code("git log"),
                                   "we can see from Chapter 3.2's example
                                   the following two commits:",
                                   tags$br("")),
                          imageOutput(ns("log1"),
                                      width = 600,
                                      height = 175),
                          tags$div("We would like to change the most recent commit message
                                   to 'rewrite commit message'. To do this 
                                   we run the following code:",
                                   tags$br(""),
                                   tags$code("$ git commit --amend -m \"rewrite
                                             commit message\""),
                                   tags$br(),
                                   tags$code("1 file changed, 1 insertion(+), 
                                             1 deletion(-)"),
                                   tags$br(""),
                                   "Now running ",
                                   tags$code("git log"),
                                   " we can see the rewritten commit message:",
                                   tags$br("")),
                          imageOutput(ns("log2"),
                                      width = 600,
                                      height = 175)),


# add a file to previous commit -------------------------------------------

      shinydashboard::box(width = 6,
                          title = "Adding to a Commit",
                          tags$div("Sometimes we may have changes to multiple
                                   files that we would like to commit together
                                   but forget to add a file to this commit. 
                                   In this chapter we will add a new file to 
                                   a previous commit.",
                                   tags$br(""),
                                   "First, for the purposes of an example, we will
                                   create a new file named 'example2.txt':",
                                   tags$br(""),
                                   tags$code("$ touch example2.txt"),
                                   tags$br(""),
                                   "Now say we would like to add this file to 
                                   our previous commit. To do this we run the 
                                   following code:",
                                   tags$br(""),
                                   tags$code("$ git add example2.txt"),
                                   tags$br(),
                                   tags$code("$ git commit --amend --no-edit"),
                                   tags$br(),
                                   tags$code(" 2 files changed, 1 insertion(+), 
                                             1 deletion(-)"),
                                   tags$br(""),
                                   "The first line adds the file to the staging 
                                   area and the second adds this change to the 
                                   previous commit.",
                                   tags$br(),
                                   "The ", 
                                   tags$code("--no-edit"),
                                   "command is used here as we don't want to 
                                   change the commit message."
                                   )),


# tip ---------------------------------------------------------------------

      
      column(width = 6,
             fluidRow(
             shinydashboard::box(title = 'Tip!', width = 12,
                                 background = 'orange',
                                 tags$div("When collaboratively working on a 
                                            project, avoid ammending a commit that
                                            another developer has made. It is 
                                            likely they have based their work on
                                            that commit so this could cause issues 
                                            and it becomes confusing and 
                                            complicated to resolve."
                                 )))),


# exercise and solution ----------------------------------------------------------------

      column(width = 12,
             fluidRow(
               shinydashboard::box(width = 6,
                                   title = "Exercise",
                                   background = "light-blue",
                                   tags$div(
                                     tags$ul(
                                       tags$li(
                                         "Navigate to the repository created in
                                         Chapter 3.2 under the folder 'Chapter3'."
                                       ),
                                       tags$li(
                                         "Rewrite the last commit message, 
                                         checking that the message has changed."
                                       ),
                                       tags$li(
                                         "Create an empty text file named
                                         'exercise2.txt'."
                                       ),
                                       tags$li(
                                         "Add this new file to the previous 
                                         commit."
                                       ))
                                   )),
               shinydashboard::box(width = 6,
                                   title = "Solution",
                                   background = "light-blue",
                                   collapsible = TRUE,
                                   collapsed = TRUE,
                                   tags$div(
                                     tags$code("$ cd GitExercises/Chapter3"),
                                     tags$br(),
                                     tags$code("$ git commit --amend -m 
                                               \"new message\""),
                                     tags$br(),
                                     tags$code("$ git log"),
                                     tags$br(),
                                     tags$code("$ touch exercise2.txt"),
                                     tags$br(),
                                     tags$code("$ git commit --amend --no-edit")
                                   ))
             )),
# Adds whitespace as bottom so can see all of page with navbar
headerPanel(""),
    )
 
  )
}
    
#' rewrite_history Server Functions
#'
#' @noRd 
mod_rewrite_history_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    output$log1 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/rewriting_history/git_log.png"),
        contentType = "image/png",
        width = 600,
        height = 150
      )
    }, deleteFile = FALSE)
    
    output$log2 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/rewriting_history/git_log2.png"),
        contentType = "image/png",
        width = 600,
        height = 150
      )
    }, deleteFile = FALSE)
    
  })
}
