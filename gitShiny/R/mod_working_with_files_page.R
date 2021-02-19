#' working_with_files_page UI Function
#'
#' @description A shiny Module.
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
                                   navigate through files in your system.",
                                   tags$br(),
                                   "This chapter covers creating and navigating
                                   working directories, as well as giving you 
                                   the chance to become familar with the 
                                   command line.")),
      shinydashboard::box(title = "Creating a Working Directory", width = 6,
                          tags$div("A ", tags$b("working directory"),
                                   " is a location where you would 
                                   like to work in.",
                                   tags$br(), "Let's look at an example:",
                                   tags$br(""), 
                                   "I would like to set my working directory as 
                                   the folder 'name'. To do this, I use the 
                                   command ",
                                   tags$code("cd"), 
                                   " followed by the file path to the folder. 
                                   In this case my file path is Users/name:",
                                   tags$br(""),
                                   tags$code("$ cd Users/name"),
                                   tags$br(""),
                                   "This does not return any output to the 
                                   screen. To see my current working directory 
                                   I run the command ",
                                   tags$code("pwd"), 
                                   " which gives the file path:",
                                   tags$br(""),
                                   tags$code("$ pwd"), tags$br(),
                                   tags$code("/c/Users/name")
                          ))
                          )
  )
}
    
#' working_with_files_page Server Functions
#'
#' @noRd 
mod_working_with_files_page_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_working_with_files_page_ui("working_with_files_page_ui_1")
    
## To be copied in the server
# mod_working_with_files_page_server("working_with_files_page_ui_1")
