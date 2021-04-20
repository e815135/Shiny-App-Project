#' untrack_file UI Function
#'
#' @description Module for untracking files page.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_untrack_file_ui <- function(id){
  ns <- NS(id)
  tagList(
    
    fluidRow(
      shinydashboard::box(width = 12,
                          title = "3.3 Removing Untracked Files",
                          tags$div("This chapter will cover how to delete 
                                   untracked files.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),

# untracked files ---------------------------------------------------------

      
      
      shinydashboard::box(width = 6,
                          title = "Untracked Files",
                          tags$div("We can use the command ",
                                   tags$code("git clean"),
                                   "to remove untracked files. This command 
                                   performs a hard file system deletion.
                                   Let's look at an example:",
                                   tags$br(""),
                                   "First we will create an empty file and check
                                   that this file is untracked:",
                                   tags$br(""),
                                   tags$code("$ touch example3.txt"),
                                   tags$br(),
                                   tags$code("$ git status"),
                                   tags$br(""),
                                   tags$code("git clean"),
                                   " requires a force option to initiate any file
                                   deletion. This acts as a safety mechanism.
                                    Before performing the deletion we can use 
                                   the option", 
                                   tags$code("-n"),
                                   "to check which files would be removed, aka
                                   a dry run:",
                                   tags$br(""),
                                   tags$code("$ git clean -n"),
                                   tags$br(),
                                   tags$code("Would remove example3.txt"),
                                   tags$br(""),
                                   "In order to execute the deletion, we use the 
                                   force option", 
                                   tags$code("-f"),
                                   ":",
                                   tags$br(""),
                                   tags$code("$ git clean -f"),
                                   tags$br(),
                                   tags$code("Removing example3.txt"),
                                   tags$br(""),
                                   "Now we can see that the file has been deleted
                                   from our file system:",
                                   tags$br(""),
                                   tags$code("$ ls"),
                                   tags$br(),
                                   tags$code("example.txt  example2.txt"))),

# untracked directories ---------------------------------------------------



      shinydashboard::box(width = 6,
                          title = "Untracked Directories",
                          tags$div(tags$code("git clean"),
                                   " can also be used to remove untracked 
                                   directories:",
                                   tags$br(""),
                                   "First we will create a new directory with an empty
                                   text file within it. Returning to the original
                                   working directory we can run ",
                                   tags$code("git status"),
                                   "to see
                                   that this new directory is untracked:",
                                   tags$br(""),
                                   tags$code("$ mkdir example_dir"),
                                   tags$br(),
                                   tags$code("$ cd example_dir"),
                                   tags$br(),
                                   tags$code("$ touch example4.txt"),
                                   tags$br(),
                                   tags$code("$ cd ../"),
                                   tags$br(),
                                   tags$code("$ git status"),
                                   tags$br(""),
                                   "we can perform a dry run using the option",
                                   tags$code("-dn"),
                                   ":",
                                   tags$br(""),
                                   tags$code("$ git clean -dn"),
                                   tags$br(),
                                   tags$code("Would remove example_dir/"),
                                   tags$br(""),
                                   "To execute the deletion we use the force option
                                   as before and the option",
                                   tags$code("-d"),
                                   "to specify untracked directories:",
                                   tags$br(""),
                                   tags$code("$ git clean -f -d"),
                                   tags$br(),
                                   tags$code("Removing example_dir/"),
                                   tags$br(""),
                                   "Finally we can see that the directory has been
                                   deleted along with the file within it:",
                                   tags$br(""),
                                   tags$code("$ ls"),
                                   tags$br(),
                                   tags$code("example.txt  example2.txt"))),

# exercise and solution ---------------------------------------------------

      
      column( width = 6,
              fluidRow(
                shinydashboard::box(title = 'Exercise', width = 6,
                                    background = 'light-blue',
                                    tags$div("Navigate to the directory 
                                             'Chapter3' and create an empty
                                             text file named 'exercise3.txt', 
                                             then remove any untracked files.",
                                             tags$br())),
                shinydashboard::box(title = 'Solution', width = 6,
                                    background = 'light-blue',
                                    collapsible = TRUE,
                                    collapsed = TRUE,
                                    tags$div(tags$code("$ cd GitExercises/Chapter2"), 
                                             tags$br(),
                                             tags$code("$ touch exercise3.txt"),
                                             tags$br(),
                                             tags$code("$ git clean -n"), 
                                             tags$br(),
                                             tags$code("$ git clean -f"),
                                             tags$br(),
                                             tags$code("$ ls"))))
      ),
     

# tips --------------------------------------------------------------------


      column(width = 6,
             shinydashboard::box(title = 'Tip!', width = 12,
                                 background = 'orange',
                                 tags$div("It is recommended to always perform
                                          a dry run before executing any file 
                                          deletion."
                                 )))

    )
    
    
    
 
  )
}
    