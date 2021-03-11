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
      shinydashboard::box(title = "Working with Files", width = 12,
                          tags$div("It is important to understand how to 
                                   navigate through files in your system. 
                                   This chapter covers creating and navigating
                                   through files, as well as giving you the 
                                   chance to become familar with the 
                                   command line.",
                                   tags$br(""),
                                   "For this chapter you will need to launch the 
                                   Git Bash application (see chapter 1.1).")),
      shinydashboard::box(title = "What is a Working Directory?", width = 6,
                          tags$div("A ", tags$b("working directory"),
                                   " is a location where you would 
                                   like to work in.",
                                   tags$br(), 
                                   "Let's look at an example:",
                                   tags$br(""),
                                   "Firstly, to see my current working directory
                                    I run the command ",
                                   tags$code("pwd"), 
                                   ", in Git Bash, which prints the following:",
                                   tags$br(""),
                                   tags$code("$ pwd"), tags$br(),
                                   tags$code("/c/Users/name"),
                                   tags$br(""),
                                   "This file path tells me that I am currently
                                    working in the folder 'name'.",
                                   tags$br(""),
                                   "Now I would like to change my working 
                                   directory to the folder 'Documents'. 
                                   To do this, I use the command ",
                                   tags$code("cd"), 
                                   " followed by the file path to the folder. 
                                   In this case the full file path to the folder 
                                   is 'Users/name/Documents' but as I am already 
                                   working in 'Users/name' I only need to 
                                   give it 'Documents':",
                                   tags$br(""),
                                   tags$code("$ cd Documents"),
                                   tags$br(""),
                                   "Setting a working directory does not return 
                                   any output to the screen. To see my new 
                                   current working directory I need to run 
                                   the command ",
                                   tags$code("pwd"), 
                                   " again:",
                                   tags$br(""),
                                   tags$code("$ pwd"), tags$br(),
                                   tags$code("/c/Users/name/Documents"),
                                   tags$br(""),
                                   "I have successfully entered the folder 
                                   'Documents' but now I would like to come
                                   out of the folder and work again in the 
                                   'name' folder. In order to do this I use 
                                   the notation ",
                                   tags$code("../")," to move up the current 
                                   file path by one step. If I wanted to move 
                                   up two folders I would use ", 
                                   tags$code("../../"),
                                   " and so on.",
                                   tags$br(""),
                                   tags$code("$ cd ../"),
                                   tags$br(""),
                                   "Finally I can check that I am back 
                                   where I started:",
                                   tags$br(""),
                                   tags$code("$ pwd"),
                                   tags$br(), tags$code("/c/Users/name"),
                                   tags$br())),
      shinydashboard::box(title = 'Creating a Directory', width = 6,
                          tags$div('As well as navigating through directories, 
                                   we can create and remove them using the 
                                   command line. We usually create, delete 
                                   and move between files using an IDE 
                                   (Integrated Development Environment), e.g. 
                                   File Explorer. The principle is the same.',
                                   tags$br(""), "Let's see an example:", 
                                   tags$br(""),
                                   "After changing my working directory, I am 
                                   currently working in the 'Documents' folder. 
                                   I would like to create a directory within 
                                   'Documents' named 'example_dir'. To do this 
                                   I use the command ",
                                   tags$code("mkdir"), ":",
                                   tags$br(""), 
                                   tags$code("$ mkdir example_dir"),
                                   tags$br(""), 
                                   "I would now like to work in this 
                                   directory:", 
                                   tags$br(""), 
                                   tags$code("$ cd example_dir"),
                                   tags$br(""),
                                   "Next I would like to create a text file 
                                   named 'example.txt'. I can use the command ", 
                                   tags$code("touch"), 
                                   " to create an empty file:", 
                                   tags$br(""),
                                   tags$code("$ touch example.txt"), 
                                   tags$br(""),
                                   "In order to list the files present within 
                                   my current working directory I use the 
                                   command ",
                                   tags$code("ls"), 
                                   " which prints the list to the screen:",
                                   tags$br(""), 
                                   tags$code("$ ls"), 
                                   tags$br(),
                                   tags$code("example.txt"), 
                                   tags$br(""),
                                   "As expected, I can see that the text file is 
                                   in my working directory.", 
                                   tags$br(""),
                                   "As well as creating a file, I can also 
                                   remove it. To do this I use the command ", 
                                   tags$code("rm"),
                                   ":",
                                   tags$br(""), 
                                   tags$code("$ rm example.txt"),
                                   tags$br(""), "Similarly, I can remove 
                                   directories. Since I am working within 
                                   'example_dir', I need to navigate out of 
                                   the directory in order to remove it:", 
                                   tags$br(""), 
                                   tags$code("$ cd ../"),
                                   tags$br(""), "To remove the directory I run 
                                   the following:", 
                                   tags$br(""), 
                                   tags$code("$ rm -r example_dir"),
                                   tags$br(""))),
      column( width = 6,
              fluidRow(
      shinydashboard::box(title = 'Exercise', width = 6,
                          background = 'light-blue',
                          tags$div("Navigate to your 'Documents' folder.",
                                   tags$br(),
                                   "Create a new directory called 'my_dir' that 
                                   contains an empty text file named 'hello.txt'
                                   , making sure that the file exists.",
                                   tags$br())),
      shinydashboard::box(title = 'Solution', width = 6,
                          background = 'light-blue',
                          collapsible = TRUE,
                          collapsed = TRUE,
                          tags$div(tags$code("$ cd Documents"), tags$br(),
                                   tags$code("$ mkdir my_dir"), tags$br(),
                                   tags$code("$ cd my_dir"), tags$br(),
                                   tags$code("$ touch hello.txt"), tags$br(),
                                   tags$code("$ ls"), tags$br(),
                                   tags$code("hello.txt"))))
      ),
      column(width = 6,
      shinydashboard::box(title = 'Tips!', width = 12,
                          background = 'orange',
                          tags$div("Tab completion is useful when working 
                                   in the command line. For example, when 
                                   changing your working directory:",
                                   tags$br(), 
                                   tags$ul(
                                     tags$li(
                                       "as you start to type the directory name 
                                       you can hit the Tab key and it will 
                                       autocomplete the name"), 
                                     tags$li(
                                       "if you are not sure of which directories 
                                       you have available, you can double hit
                                       the Tab key and a list of possible 
                                       options will be printed to the screen"))
                                           )))
      
  ))
}
