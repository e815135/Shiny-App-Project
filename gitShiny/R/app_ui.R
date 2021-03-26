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
          # 2. Basic Git Workflow
          shinydashboard::menuItem("2. Basic Git Workflow",
                                   tabName = "workflow",
                                   icon = icon("workflow")
                                   ),
          # 3. Git Commands
          shinydashboard::menuItem("3. Basic Git Commands", 
                                   shinydashboard::menuSubItem(
                                     "3.1 Tracking Changes", 
                                     tabName = "commit", 
                                     icon = icon("commit")),
                                   shinydashboard::menuSubItem(
                                     "3.2 Rewriting History", 
                                     tabName = "rewrite", 
                                     icon = icon("rewrite")),
                                   shinydashboard::menuSubItem(
                                     "3.3 Removing Untracked Files",
                                     tabName = "untracked",
                                     icon = icon("untracked")
                                   ),
                                   shinydashboard::menuSubItem(
                                     "3.4 Reverting Changes",
                                     tabName = "revert",
                                     icon = icon("revert")
                                   ),
                                   tabName = "commands", 
                                   icon = icon("commands")),
          # 4. Branching
          shinydashboard::menuItem("4. Branching",
                                   tabName = "INSERT",
                                   icon = icon("INSERT")),
          # 5. Merging
          shinydashboard::menuItem("5. Merging",
                                   tabName = "merging",
                                   icon = icon("merging"))
        )
      ),
      
      ############## body
      
      shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          
          # INTRODUCTION PAGE
          shinydashboard::tabItem(
            tabName = "introduction", 
            mod_introduction_page_ui("introduction_page_ui_1")),
          
          # SET UP PAGE
          shinydashboard::tabItem(
            tabName = "setup",
            mod_set_up_page_ui("set_up_page_ui_1")),
          
          # WORKING WITH FILES
          shinydashboard::tabItem(
            tabName = "workingwithfiles",
            mod_working_with_files_page_ui("working_with_files_page_ui_1")),
          
          # BASIC GIT WORKFLOW
          shinydashboard::tabItem(
            tabName = "workflow",
            mod_basic_git_workflow_ui("basic_git_workflow_ui_1")
          ),
          
          # TRACKING CHANGES
          shinydashboard::tabItem(
            tabName = "commit",
            mod_tracking_changes_ui("tracking_changes_ui_1")
          ),
          
          # REWRITING HISTORY
          shinydashboard::tabItem(
            tabName = "rewrite",
            mod_rewrite_history_ui("rewrite_history_ui_1")
          ),
          
          # REMOVING UNTRACKED FILES
          shinydashboard::tabItem(
            tabName = "untracked",
            mod_untrack_file_ui("untrack_file_ui_1")
          ),
          
          # REVERTING CHANGES
          shinydashboard::tabItem(
            tabName = "revert",
            mod_revert_changes_ui("revert_changes_ui_1")
          )
          
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

