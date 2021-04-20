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

# dashboard page title ----------------------------------------------------

    
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(
        title = "Learning Git"),
      
      

# sidebar -----------------------------------------------------------------


      
      shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
          id = "tabs",
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
          shinydashboard::menuItem("4. Basic Git Branching",
                                   shinydashboard::menuSubItem(
                                     "4.1 Introduction to Branching",
                                     tabName = "intro_branching",
                                     icon = icon("intro_branching")
                                   ),
                                   shinydashboard::menuSubItem(
                                     "4.2 Working on a Branch",
                                     tabName = "branch",
                                     icon = icon("branch")
                                   ),
                                   shinydashboard::menuSubItem(
                                     "4.3 Introduction to Merging",
                                     tabName = "merging",
                                     icon = icon("merging")
                                   ),
                                   shinydashboard::menuSubItem(
                                     "4.4 Merge Conflicts",
                                     tabName = "conflicts",
                                     icon = icon("conflicts")
                                   ),
                                   tabName = "basic_branching",
                                   icon = icon("basic_branching"))
        )
      ),
      

# body --------------------------------------------------------------------


      
      shinydashboard::dashboardBody(
        shinyjs::useShinyjs(),
        #shinyjs::extendShinyjs(text = "shinyjs.toTop = function() {document.body.scrollTop = 0;}"),
        bootstrapPage('',
                      
                      navbarPageWithInputs(
                        title = "",
                        position = "fixed-bottom",
                        input1 = actionButton("previous_button",
                                              label = "previous",
                                              style = 'float:left; padding:6px; font-size:100%'),
                        input2 = actionButton("next_button",
                                               label = "Next: ",
                                               style = 'float:right; padding:6px; font-size:100%')
                      ),
                      
                      tags$style(type = 'text/css', '.navbar { background-color: #f39c12;
                           color: #f39c12; }',
                                 
                                 '.navbar-dropdown { background-color: #f39c12;
                           color: #f39c12; }',
                                 
                      )),

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
          ),
          
          # INTRODUCTION TO BRANCHING
          shinydashboard::tabItem(
            tabName = "intro_branching",
            mod_basic_branching_ui("basic_branching_ui_1")
          ),
          
          # WORKING ON BRANCH
          shinydashboard::tabItem(
            tabName = "branch",
            mod_on_branch_ui("on_branch_ui_1")
          ),
          
          # INTRO TO MERGING
          shinydashboard::tabItem(
            tabName = "merging",
            mod_intro_merging_ui("intro_merging_ui_1")
          ),
          
          # MERGE CONFLICTS
          shinydashboard::tabItem(
            tabName = "conflicts",
            mod_merge_conflicts_ui("merge_conflicts_ui_1")
          )
          
        )),


# skin --------------------------------------------------------------------
      
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
  )
}

