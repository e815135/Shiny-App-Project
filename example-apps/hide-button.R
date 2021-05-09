library(shiny)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),
  actionButton(inputId = "button", label = "Click Me!"),
  plotOutput("plot")
)

server <- function(session, input, output){
  
  observeEvent(input$button, {
    output$plot <- renderPlot({
      set.seed(23)
      hist(rpois(200, 5))
    })
    toggle("button")
  })

}

shinyApp(ui, server)
