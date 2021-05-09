library(shiny)

# Module describing the ui
counterButton <- function(id, label = "Counter") {
  # This ensures that the id's are unique when called in the 
  # main ui
  ns <- NS(id)
  tagList(
    actionButton(ns("button"), label = label),
    verbatimTextOutput(ns("out"))
  )
}

# Module describing the server
counterServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # Usual server structure
      count <- reactiveVal(0)
      observeEvent(input$button, {
        count(count() + 1)
      })
      output$out <- renderText({
        count()
      })
      count
    }
  )
}

# Main ui and server

ui <- fluidPage(
  counterButton("counter1", "Counter #1")
)

server <- function(input, output, session) {
  counterServer("counter1")
}

shinyApp(ui, server)