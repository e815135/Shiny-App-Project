#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    
    ################# dashboard page title
    
    
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(
        title = "Learning Git"),
      
      
      ############## sidebar
      
      shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
          # Introduction
          shinydashboard::menuItem("Introduction", 
                                   tabName = "introduction", 
                                   icon = icon("introduction")),
          # 1. Getting Started
          shinydashboard::menuItem("1. Getting Started", 
                                   shinydashboard::menuSubItem(
                                     "1.1 Set Up", tabName = "setup", 
                                     icon = icon("setup")),
                                   shinydashboard::menuSubItem(
                                     "1.2 Working with Files", 
                                     tabName = "workingwithfiles", 
                                     icon = icon("workingwithfiles")),
                                   tabName = "gettingstarted", 
                                   icon = icon("gettingstarted")),
          # 2. Branching
          shinydashboard::menuItem("2. Branching", 
                                   tabName = "branching", 
                                   icon = icon("branching"))
        )
      ),
      
      ############## body
      
      shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          
          # INTRODUCTION PAGE
          shinydashboard::tabItem(
            tabName = "introduction", 
            mod_introduction_page_ui("introduction_page_ui_1")),
          
          # GETTING STARTED PAGE
          shinydashboard::tabItem(
            tabName = "setup",
            mod_getting_started_page_ui("getting_started_page_ui_1")),
          
          # WORKING WITH FILES
          shinydashboard::tabItem(
            tabName = "workingwithfiles",
            mod_working_with_files_page_ui("working_with_files_page_ui_1")),
          
          # BRANCHING PAGE
          shinydashboard::tabItem(
            tabName = "branching",
            mod_branching_page_ui("branching_page_ui_1"))
               
                             
          )),
      ############## skin
      
      skin = "yellow"
      )
  
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'gitShiny'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

