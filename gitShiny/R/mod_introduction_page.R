#' introduction UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_introduction_page_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboard::box(title = "Introduction", width = 12,
                          tags$div("Never heard of Git of before?", tags$br(),
                                   "Heard of it but haven’t got the foggiest?", 
                                   tags$br(),
                                   "Just need a refresher?", tags$br(""),
                                   "This app provides an", 
                                   tags$b("interactive step-by-step guide"),
                                   "to the basics of using Git for 
                                   Version Control.")),
      # What is version control?
      shinydashboard::box(title = "What is Version Control?", width = 12,
                          tags$div("Simply put:", tags$br(""),
                                   tags$b(tags$em("Version control is a system 
                                                  that records changes to a file 
                                                  or set of files over time so 
                                                  that you can recall specific 
                                                  versions later.")),
                                   tags$br(), 
                                   tags$em("- Scott Chacon and Ben Straub"),
                                   tags$br(""),
                                   "Version control is very useful when 
                                   collaborating on code and allows you to work 
                                   on new features in an isolated 
                                   environment.")),
      # What is git?
      shinydashboard::box(title = "What is Git?", width = 12,
                          tags$div(tags$b("Git is a version control system."), 
                                    "It is a better and easier solution than 
                                   other version control systems, e.g. 
                                   Subversion and SourceSafe,", 
                                   tags$br(), 
                                   " and can be used through a 
                                   command line/terminal or a GUI 
                                   (Graphical User Interface). "
                          ))
    )
  )
}
    
#' introduction Server Functions
#'
#' @noRd 
mod_introduction_page_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_introduction_page_ui("introduction_page_ui_1")
    
## To be copied in the server
# mod_introduction_page_server("introduction_page_ui_1")
