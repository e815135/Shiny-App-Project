#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  

# navigation server -------------------------------------------------------

  
  observeEvent(input$next_button, {
    
    newtab <- switch(input$tabs,
                     "introduction" = "setup",
                     "setup" = "workingwithfiles",
                     "workingwithfiles" = "workflow",
                     "workflow" = "commit",
                     "commit" = "rewrite",
                     "rewrite" = "untracked",
                     "untracked" = "revert",
                     "revert" = "intro_branching",
                     "intro_branching" = "branch",
                     "branch" = "merging",
                     "merging" = "conflicts"
                     )
    shinydashboard::updateTabItems(session, "tabs", newtab)
  })
  
  observeEvent(input$previous_button, {
    
    newtab <- switch(input$tabs,
                     "introduction" = "",
                     "setup" = "introduction",
                     "workingwithfiles" = "setup",
                     "workflow" = "workingwithfiles",
                     "commit" = "workflow",
                     "rewrite" = "commit",
                     "untracked" = "rewrite",
                     "revert" = "untracked",
                     "intro_branching" = "revert",
                     "branch" = "intro_branching",
                     "merging" = "branch",
                     "conflicts" = "merging"
                     )
    shinydashboard::updateTabItems(session, "tabs", newtab)
  })
  
  observe({
    shinyjs::toggle("previous_button", condition = input$tabs != "introduction")
    shinyjs::toggle("next_button", condition = input$tabs != "conflicts")
  })
  
  label_options_previous <- c(
    "introduction" = "",
    "setup" = "Introduction",
    "workingwithfiles" = "1.1 Set Up",
    "workflow" = "1.2 Working with Files",
    "commit" = "2. Basic Git Workflow",
    "rewrite" = "3.1 Tracking Changes",
    "untracked" = "3.2 Rewriting History",
    "revert" = "3.3 Removing Untracked Files",
    "intro_branching" = "3.4 Reverting Changes",
    "branch" = "4.1 Introduction to Branching",
    "merging" = "4.2 Working on a Branch",
    "conflicts" = "4.3 Introduction to Merging"
  )
  
  label_options_next <- c(
    "introduction" = "1.1 Set Up",
    "setup" = "1.2 Working with Files",
    "workingwithfiles" = "2. Basic Git Workflow",
    "workflow" = "3.1 Tracking Changes",
    "commit" = "3.2 Rewriting History",
    "rewrite" = "3.3 Removing Untracked Files",
    "untracked" = "3.4 Reverting Changes",
    "revert" = "4.1 Introduction to Branching",
    "intro_branching" = "4.2 Working on a Branch",
    "branch" = "4.3 Introduction to Merging",
    "merging" = "4.4 Merge Conflicts",
    "conflicts" = ""
  )

  observeEvent(input$tabs, {
    text1 <- label_options_next[[input$tabs]]
    updateActionButton(session, "next_button", label = paste("Next: ", text1))
    text2 <- label_options_previous[[input$tabs]]
    updateActionButton(session, "previous_button", label = paste("Previous: ", text2))
    #js$toTop()
    shinyjs::runjs("window.scrollTo(0, 0)")

  })

  
  

# module server functions -------------------------------------------------
  
  # Set up page server 
  mod_set_up_page_server("set_up_page_ui_1")
  # Basic git workflow server 
  mod_basic_git_workflow_server("basic_git_workflow_ui_1")
  # Tracking changes server
  mod_tracking_changes_server("tracking_changes_ui_1")
  # Rewriting history server
  mod_rewrite_history_server("rewrite_history_ui_1")
  # Revert changes server
  mod_revert_changes_server("revert_changes_ui_1")
  # Introduction to branching
  mod_basic_branching_server("basic_branching_ui_1")
  # Working on a branch server
  mod_on_branch_server("on_branch_ui_1")
  # Introduction to merging
  mod_intro_merging_server("intro_merging_ui_1")
  # Merge conflicts
  mod_merge_conflicts_server("merge_conflicts_ui_1")
}
