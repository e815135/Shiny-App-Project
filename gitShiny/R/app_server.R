#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  
  # Basic git workflow server 
  mod_basic_git_workflow_server("basic_git_workflow_ui_1")
  # Tracking changes server
  mod_tracking_changes_server("tracking_changes_ui_1")
}
