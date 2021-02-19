#' getting_started_page UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_getting_started_page_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      shinydashboard::box(title = "setting up git bash to work in and explain 
                          using git bash and terminology")
    )
  )
}
    
#' getting_started_page Server Functions
#'
#' @noRd 
mod_getting_started_page_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_getting_started_page_ui("getting_started_page_ui_1")
    
## To be copied in the server
# mod_getting_started_page_server("getting_started_page_ui_1")
