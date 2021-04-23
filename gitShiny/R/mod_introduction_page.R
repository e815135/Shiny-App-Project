#' introduction UI Function
#'
#' @description Module for the 'Introduction' page of app ui.
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
                          tags$div("Within Data Science and Software Development,
                                   it is best practice to use Version Control.",
                                   tags$br(""),
                                   "This app provides an ", 
                                   tags$b("interactive step-by-step guide"),
                                   " to the basics of using Git for 
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
                                    " It is a better and easier solution than 
                                   other version control systems, e.g. 
                                   Subversion and SourceSafe,", 
                                   tags$br(), 
                                   " and can be used through a 
                                   command line or a GUI 
                                   (Graphical User Interface)."
                          ))
    )
  )
}

