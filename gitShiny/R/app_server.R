#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  
  # BUG NEEDS FIXING
  #mod_branching_page_server("branching_page_ui_1")
  # callModule(module = mod_basic_git_workflow_server, 
  #            id = "basic_git_workflow_ui_1")
  mod_basic_git_workflow_server("basic_git_workflow_ui_1")
}
