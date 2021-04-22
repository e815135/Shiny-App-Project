#' working_with_files_page UI Function
#'
#' @description Module for the 'Working With Files' page of app ui.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_working_with_files_page_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboard::box(title = "1.2 Working with Files", width = 12,
                          tags$div("It is important to understand how to 
                                   navigate through files in your system. 
                                   This chapter covers creating and navigating
                                   through files, as well as giving you the 
                                   chance to become familar with the 
                                   command line.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),
      # What is a directory
      shinydashboard::box(title = "What is a Working Directory?", width = 6,
                          tags$div("A ", tags$b("working directory"),
                                   " is a location where we would 
                                   like to work in.",
                                   tags$br(), 
                                   "Let's look at an example:",
                                   tags$br(""),
                                   "Firstly, to see our current working directory
                                    we run the command ",
                                   tags$code("pwd"), 
                                   ", in Git Bash, which prints the following:",
                                   tags$br(""),
                                   tags$code("$ pwd"), tags$br(),
                                   tags$code("/c/Users/name"),
                                   tags$br(""),
                                   tags$i("Note: to run a command, type the 
                                          command into the command line and 
                                          press the"),
                                   tags$code("Enter"),
                                   tags$i("key."),
                                   tags$br(""),
                                   "This file path tells us that we are currently
                                    working in the folder 'name'.",
                                   tags$br(""),
                                   "Now we would like to change our working 
                                   directory to the folder 'Documents'. 
                                   To do this, we use the command ",
                                   tags$code("cd"), 
                                   " followed by the file path to the folder. 
                                   In this case the full file path to the folder 
                                   is 'Users/name/Documents' but as we are already 
                                   working in 'Users/name' we only need to 
                                   give it 'Documents':",
                                   tags$br(""),
                                   tags$code("$ cd Documents"),
                                   tags$br(""),
                                   "Setting a working directory does not return 
                                   any output to the screen. To see our new 
                                   current working directory we need to run 
                                   the command ",
                                   tags$code("pwd"), 
                                   " again:",
                                   tags$br(""),
                                   tags$code("$ pwd"), tags$br(),
                                   tags$code("/c/Users/name/Documents"),
                                   tags$br(""),
                                   "We have successfully entered the folder 
                                   'Documents' but now we would like to come
                                   out of the folder and work again in the 
                                   'name' folder. In order to do this we use 
                                   the notation ",
                                   tags$code("../")," to move up the current 
                                   file path by one step. If we wanted to move 
                                   up two folders we would use ", 
                                   tags$code("../../"),
                                   " and so on.",
                                   tags$br(""),
                                   tags$code("$ cd ../"),
                                   tags$br(""),
                                   "Finally we can check that we are back 
                                   where we started:",
                                   tags$br(""),
                                   tags$code("$ pwd"),
                                   tags$br(), tags$code("/c/Users/name"),
                                   tags$br())),
      # creating a directory
      shinydashboard::box(title = 'Creating a Directory', width = 6,
                          tags$div('As well as navigating through directories, 
                                   we can create and remove them using the 
                                   command line. We usually create, delete 
                                   and move between files using an IDE 
                                   (Integrated Development Environment), e.g. 
                                   File Explorer. The principle is the same.',
                                   tags$br(""), "Let's see an example:", 
                                   tags$br(""),
                                   "After changing our working directory, we are 
                                   currently working in the 'Documents' folder. 
                                   We would like to create a directory within 
                                   'Documents' named 'example_dir'. To do this 
                                   we use the command ",
                                   tags$code("mkdir"), ":",
                                   tags$br(""), 
                                   tags$code("$ mkdir example_dir"),
                                   tags$br(""), 
                                   "We would now like to work in this 
                                   directory:", 
                                   tags$br(""), 
                                   tags$code("$ cd example_dir"),
                                   tags$br(""),
                                   "Next we would like to create a text file 
                                   named 'example.txt'. We can use the command ", 
                                   tags$code("touch"), 
                                   " to create an empty file:", 
                                   tags$br(""),
                                   tags$code("$ touch example.txt"), 
                                   tags$br(""),
                                   "In order to list the files present within 
                                   our current working directory we use the 
                                   command ",
                                   tags$code("ls"), 
                                   " which prints the list to the screen:",
                                   tags$br(""), 
                                   tags$code("$ ls"), 
                                   tags$br(),
                                   tags$code("example.txt"), 
                                   tags$br(""),
                                   "As expected, we can see that the text file is 
                                   in our working directory.", 
                                   tags$br(""),
                                   "As well as creating a file, we can also 
                                   remove it. To do this we use the command ", 
                                   tags$code("rm"),
                                   ":",
                                   tags$br(""), 
                                   tags$code("$ rm example.txt"),
                                   tags$br(""), "Similarly, we can remove 
                                   directories. Since we are working within 
                                   'example_dir', we need to navigate out of 
                                   the directory in order to remove it:", 
                                   tags$br(""), 
                                   tags$code("$ cd ../"),
                                   tags$br(""), "To remove the directory we run 
                                   the following:", 
                                   tags$br(""), 
                                   tags$code("$ rm -r example_dir"),
                                   tags$br(""))),
      # Exercise and solution
      column( width = 6,
              fluidRow(
      shinydashboard::box(title = 'Exercise', width = 6,
                          background = 'light-blue',
                          tags$div(
                            tags$ul(
                              tags$li(
                                "Navigate to the 'Documents' folder."
                              ),
                              tags$li(
                                "Create a new directory called 'GitExercises'."
                              ),
                              tags$li(
                                "Create a new directory within this called 
                                   'Chapter1' that contains an empty text file 
                                named 'hello.txt', making sure that the file
                                exists."
                              )
                            ))),
      shinydashboard::box(title = 'Solution', width = 6,
                          background = 'light-blue',
                          collapsible = TRUE,
                          collapsed = TRUE,
                          tags$div(tags$code("$ cd Documents"), tags$br(),
                                   tags$code("$ mkdir GitExercises"), tags$br(),
                                   tags$code("$ cd GitExercises"), tags$br(),
                                   tags$code("$ mkdir Chapter1"), tags$br(),
                                   tags$code("$ cd Chapter1"), tags$br(),
                                   tags$code("$ touch hello.txt"), tags$br(),
                                   tags$code("$ ls"), tags$br(),
                                   tags$code("hello.txt"))))
      ),
      # TIPS
      column(width = 6,
      shinydashboard::box(title = 'Tips!', width = 12,
                          background = 'orange',
                          tags$div("Tab completion is useful when working 
                                   in the command line. For example, when 
                                   changing our working directory:",
                                   tags$br(), 
                                   tags$ul(
                                     tags$li(
                                       "as we start to type the directory name 
                                       we can hit the",
                                       tags$code("Tab"),
                                       " key and it will autocomplete the name"), 
                                     tags$li(
                                       "if we are not sure of which directories 
                                       we have available, we can double hit
                                       the",
                                       tags$code("Tab"),
                                       "key and a list of possible options 
                                       will be printed to the screen"))
                                           ))),
      # Adds whitespace as bottom so can see all of page with navbar
      headerPanel(""),
      
  ))
}
