#' merge_conflicts UI Function
#'
#' @description Module for merge conflicts page.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_merge_conflicts_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    fluidRow(
      

# merge conflicts ---------------------------------------------------------

      
      shinydashboard::box(width = 12,
                          title = "4.4 Merge Conflicts",
                          tags$div("A merge conflict takes place when something
                                   has been changed in both of the branches' 
                                   histories.",
                                   tags$br(),
                                   "Git is unable to auto-combine them so asks 
                                   the user to manually solve the conflict 
                                   before making the merge commit.",
                                   tags$br(""),
                                   "In this chapter we will look at how to 
                                   resolve a simple merge conflict.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),


# resolving a conflict ----------------------------------------------------

      shinydashboard::box(width = 12,
                          title = "Resolving a Conflict",
                          tags$div("Let's look at an example:",
                                   tags$br(""),
                                   "On a branch called",
                                   tags$code("development"),
                                   "we have a text file with the following 
                                   change committed:",
                                   tags$br(""),
                                   imageOutput(ns("change1"),
                                               width = 250,
                                               height = 75),
                                   tags$br(""),
                                   "At the same time as this branch was created
                                   , a new branch called ",
                                   tags$code("another_branch"),
                                   "was made and a different change was committed:",
                                   tags$br(""),
                                   imageOutput(ns("change2"),
                                               width = 250,
                                               height = 75),
                                   tags$br(""),
                                   "Just like in Chapter 4.3, we can merge",
                                   tags$code("another_branch"),
                                   "onto the ",
                                   tags$code("development"),
                                   "branch by running",
                                   tags$code("git merge"),
                                   ".",
                                   tags$br(),
                                   "However, this time we have a merge conflict
                                   as Git does not know which version of the 
                                   line in the text file we would like to keep:",
                                   tags$br(""),
                                   imageOutput(ns("conflict"),
                                               width = 400,
                                               height = 75),
                                   tags$br(""),
                                   "Running",
                                   tags$code("git status"),
                                   "we can see the merge conflict in more detail:",
                                   tags$br(""),
                                   imageOutput(ns("git_status"),
                                               width = 500,
                                               height = 150),
                                   tags$br(""),
                                   "Opening the file we can see that the 
                                   notation",
                                   tags$br(),
                                   "<<<<<<< HEAD",
                                   tags$br(),
                                   "=======",
                                   tags$br(),
                                   ">>>>>>> another_branch",
                                   tags$br(),
                                   "has been added. This tells us where in the
                                   file the conflict has taken place:",
                                   tags$br(""),
                                   imageOutput(ns("conflict_file"),
                                               width = 300,
                                               height = 125),
                                   tags$br(""),
                                   "We now manually correct this. For example,
                                   if we want to keep the second line, we 
                                   manually update and save the file like so:",
                                   tags$br(""),
                                   imageOutput(ns("resolve_file"),
                                               width = 250,
                                               height = 75),
                                   tags$br(""),
                                   "Next, in the command line we add and commit
                                   this change. Note that this change has been
                                   made to the file on both branches.",
                                   tags$br(""),
                                   tags$code("$ git add example2.txt"),
                                   tags$br(),
                                   tags$code("$ git commit --no-edit"),
                                   tags$br(""),
                                   "When running",
                                   tags$code("git commit"),
                                   "here, we are committing everything in the 
                                   staging area and leaving the default merge 
                                   commit message.",
                                   tags$br(""),
                                   "Now that the merge conflict has been resolved,
                                   we can perform a fast-forward merge like
                                   in Chapter 4.3:",
                                   tags$br(""),
                                   tags$code("$ git checkout example_branch"),
                                   tags$br(),
                                   tags$code("$ git merge master"),
                                   tags$br(""),
                                   "We can see a visualisation of this merge within 
                                   Git Bash:",
                                   tags$br(""),
                                   imageOutput(ns("graph"),
                                               width = 500,
                                               height = 150)
                                   )),

# exercise and solution ---------------------------------------------------

      column( width = 6,
              fluidRow(
                shinydashboard::box(title = 'Exercise', width = 6,
                                    background = 'light-blue',
                                    tags$div(
                                      tags$ul(
                                        tags$li("Navigate to the file path
                                                'GitExercises/Chapter4' and 
                                                switch to the master branch if 
                                                not already on it."),
                                        tags$li("Create an empty text file 
                                                called 'exercise2.txt' and allow 
                                                Git to track this file."),
                                        tags$li("Create and switch to a new branch called 
                                                'development'."),
                                        tags$li("On the first line of the file,
                                                add some text and save and 
                                                commit this change."),
                                        tags$li("Switch back to the ",
                                                tags$code("master"),
                                                "branch."),
                                        tags$li("Create and switch to a new 
                                                branch called 'next_branch'."),
                                        tags$li("On this branch, open exercise2.txt
                                                and edit the first line of the 
                                                file. Again, save and commit this
                                                change."),
                                        tags$li("Merge next_branch onto the 
                                                development branch, solving any merge
                                                conflicts."),
                                        tags$li(tags$i("Extra:"),
                                                "predict what would happen if 
                                                'next_branch' had been created 
                                                from the 'development' branch 
                                                instead of the",
                                                tags$code("master"),
                                                "branch.")
                                      )
                                    )),
                
                
                shinydashboard::box(title = 'Solution', width = 6,
                                    background = 'light-blue',
                                    collapsible = TRUE,
                                    collapsed = TRUE,
                                    tags$div(
                                      tags$code("$ cd GitExercises/Chapter4"),
                                      tags$br(),
                                      tags$code("$ git checkout master"),
                                      tags$br(),
                                      tags$code("$ touch exercise2.txt"),
                                      tags$br(),
                                      tags$code("$ git add exercise2.txt"),
                                      tags$br(),
                                      tags$code("$ git commit exercise2.txt
                                                -m \"commit message\""),
                                      tags$br(),
                                      tags$code("$ git checkout -b development"),
                                      tags$br(),
                                      "After first change:",
                                      tags$br(),
                                      tags$code("$ git add exercise2.txt"),
                                      tags$br(),
                                      tags$code("$ git commit exercise2.txt
                                                -m \"commit message\""),
                                      tags$br(),
                                      tags$code("$ git checkout master"),
                                      tags$br(),
                                      tags$code("$ git checkout -b next_branch"),
                                      tags$br(),
                                      "After second change:",
                                      tags$br(),
                                      tags$code("$ git add exercise2.txt"),
                                      tags$br(),
                                      tags$code("$ git commit exercise2.txt
                                                -m \"commit message\""),
                                      tags$br(),
                                      "Attempt merge:",
                                      tags$br(),
                                      tags$code("$ git checkout development"),
                                      tags$br(),
                                      tags$code("$ git merge next_branch"),
                                      tags$br(),
                                      "Resolve merge conflict - edit file",
                                      tags$br(),
                                      tags$code("$ git add exercise2.txt"),
                                      tags$br(),
                                      tags$code("$ git commit --no-edit"),
                                      tags$br(),
                                      "Fast-forward merge:",
                                      tags$br(),
                                      tags$code("$ git checkout next_branch"),
                                      tags$br(),
                                      tags$code("$ git merge development"),
                                      tags$br(""),
                                      tags$i("Extra:"),
                                      "next_branch would have been one commit
                                      ahead of the development branch, so when
                                      merging no merge conflicts would occur as 
                                      Git would know that the first change had 
                                      been rewritten by the second."
                                    )))
      ),
      
      
# tips --------------------------------------------------------------------
      
      
      column(width = 6,
             shinydashboard::box(title = 'Tips!', width = 12,
                                 background = 'orange',
                                 tags$div(
                                   tags$ul(
                                     tags$li("Merge conflicts can also occur
                                             when there are changes in the 
                                             staging area."),
                                     tags$li("If you wish to abort a merge, 
                                             run the command",
                                             tags$code("git merge --abort"),
                                             ".")
                                   )
                                 ))),
# Adds whitespace as bottom so can see all of page with navbar
headerPanel(""),

    )
 
  )
}
    
#' merge_conflicts Server Functions
#'
#' @noRd 
mod_merge_conflicts_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
    # static images -----------------------------------------------------------
    
    output$change1 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/merge_conflicts/change1.png"),
        contentType = "image/png",
        width = 250,
        height = 75
      )
    }, deleteFile = FALSE)
    
    output$change2 <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/merge_conflicts/change2.png"),
        contentType = "image/png",
        width = 250,
        height = 75
      )
    }, deleteFile = FALSE)
    
    output$conflict <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/merge_conflicts/conflict.png"),
        contentType = "image/png",
        width = 400,
        height = 75
      )
    }, deleteFile = FALSE)
    
    output$git_status <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/merge_conflicts/git_status.png"),
        contentType = "image/png",
        width = 500,
        height = 150
      )
    }, deleteFile = FALSE)
    
    output$conflict_file <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/merge_conflicts/conflict_file.png"),
        contentType = "image/png",
        width = 300,
        height = 125
      )
    }, deleteFile = FALSE)
    
    output$resolve_file <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/merge_conflicts/change2.png"),
        contentType = "image/png",
        width = 250,
        height = 75
      )
    }, deleteFile = FALSE)
    
    output$graph <- renderImage({
      list(
        src = file.path(
          "gitShiny/R/images/merge_conflicts/graph.png"),
        contentType = "image/png",
        width = 500,
        height = 150
      )
    }, deleteFile = FALSE)
    
    
  })
}
    