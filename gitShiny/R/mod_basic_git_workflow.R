#' basic_git_workflow UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_basic_git_workflow_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}

















    
#' basic_git_workflow Server Functions
#'
#' @noRd 
mod_basic_git_workflow_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_basic_git_workflow_ui("basic_git_workflow_ui_1")
    
## To be copied in the server
# mod_basic_git_workflow_server("basic_git_workflow_ui_1")
