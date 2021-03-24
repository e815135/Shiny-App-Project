#' set_up_page UI Function
#'
#' @description Module for the 'Set Up' page of app ui.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_set_up_page_ui <- function(id){
  ns <- NS(id)
  
  tagList(
    fluidRow(
      shinydashboard::box(title = "Set Up", width = 12,
                          tags$div("This chapter covers the installation of
                                   Git Bash and explains some key terminology
                                   used throughout the materials."
                                   )),
      # Installing git bash
      shinydashboard::box(title = "Installing Git Bash", width = 12,
                          tags$div("Git Bash is a popular application designed 
                                   for the use of Git from the command line. 
                                   We will use this throughout the subsequent 
                                   chapters.")),
      # Downloading git bash
      shinydashboard::box(title = "Downloading Git Bash", width = 6,
                          tags$div("To download Git Bash click on the 
                                   following link: ",
                                   tags$a(href="https://git-scm.com/downloads", 
                                          "https://git-scm.com/downloads"),
                                   tags$br(""),
                                   "Click on Windows (if you are using a mac
                                   the next steps may be different but just 
                                   follow the on-screen instructions).",
                                   tags$br(""),
                                   "The download should happen immediately, 
                                   but if not press 'click here to download 
                                   manually' (see image)."
                                   )),
      # Image 
      shinydashboard::box(width = 6,
                          imageOutput(ns("download"))),
      
      # Begin git bash set up
      shinydashboard::box(width = 6, title = "Begin Git Bash Set Up",
                          tags$div("Go to your start menu and open Git Setup by
                                   searching the name.",
                                   tags$br(""),
                                   "A window will appear with terms and 
                                   conditions; press Next.",
                                   tags$br(""),
                                   "Next it will ask to select the destination
                                   location. Give this the file path 
                                   'C:\\Users\\name'. For example, if your name 
                                   is Elizabeth Brown, the file path would be 
                                   'C:\\Users\\ebrown'. Then press Next.")),
      # Image 
      shinydashboard::box(width = 6, 
                          imageOutput(ns("location"))),
      # Default settings
      shinydashboard::box(width = 6, title = "Default Settings",
                          tags$div("There will be a series of prompts. Leave the 
                                   default selections and continue to 
                                   press Next.",
                                   tags$br(),
                                   "(see images to the right)")),
      # Image 
      shinydashboard::box(width = 6, 
                          imageOutput(ns("default1"))),
      
      shinydashboard::box(width = 6,
                          tags$div("Leave the default selections and continue 
                                   to press Next. Then finally press Install.",
                                   tags$br(),
                                   "(see images to the right)")
                          ),
      # Image
      shinydashboard::box(width = 6, 
                          imageOutput(ns("default2"))),
      # Launch git bash
      shinydashboard::box(width = 6, title = "Launching Git Bash",
                          tags$div("Once installed, there will be a prompt to 
                                   finish the setup. You can launch Git Bash 
                                   through this and view the release notes. 
                                   Neither option is needed. Click Finish.",
                                   tags$br(""),
                                   "Now you have Git Bash successfully 
                                   installed! Finally, to open Git Bash, 
                                   search for the application in the start menu.
                                   The third image to the right shows the 
                                   application once opened."
                                   )),
      # Image 
      shinydashboard::box(width = 6, 
                          imageOutput(ns("opening"))),
      # Key terminology - add to this as app develops
      shinydashboard::box(width = 12, title = "Key Terminology",
                          tags$div("The following terminology will be used 
                                   throughout the materials:",
                          tags$br(""),
                          tags$b("run a command"),
                          ": type the given command in the command line and 
                          press the Enter key in order to run it."
                          ))
    )
  )
}

#' set up page Server Functions
#'
#' @noRd 
mod_set_up_page_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    # static images: ----------------------------------------------------------
    
    output$download <- renderImage({
      list(
        src = file.path(
          "R/images/getting_started/set_up/download_git_bash.png"),
        contentType = "image/png",
        width = 600,
        height = 400
      )
    }, deleteFile = FALSE)
    
    output$location <- renderImage({
      list(
        src = file.path(
          "R/images/getting_started/set_up/setting_location.png"),
        contentType = "image/png",
        width = 600,
        height = 400
      )
    }, deleteFile = FALSE)
    
    output$default1 <- renderImage({
      list(
        src = file.path(
          "R/images/getting_started/set_up/default_settings.png"),
        contentType = "image/png",
        width = 600,
        height = 400
      )
    }, deleteFile = FALSE)
    
    output$default2 <- renderImage({
      list(
        src = file.path(
          "R/images/getting_started/set_up/default_settings2.png"),
        contentType = "image/png",
        width = 600,
        height = 400
      )
    }, deleteFile = FALSE)
    
    output$opening <- renderImage({
      list(
        src = file.path(
          "R/images/getting_started/set_up/opening.png"),
        contentType = "image/png",
        width = 600,
        height = 400
      )
    }, deleteFile = FALSE)
    
  }
)
}