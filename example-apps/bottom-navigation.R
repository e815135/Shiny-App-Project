library("shiny")
library("shinydashboard")
library("shinyjs")

# example -----------------------------------------------------------------

# This function allows input elements to be added to a navigation bar
# Copyright 2016 Dean Attali. Licensed under the MIT license.
# code from https://github.com/daattali/advanced-shiny/tree/master/navbar-add-text
navbarPageWithInputs <- function(..., inputs) {
  navbar <- navbarPage(...)
  form <- tags$form(class = "navbar-form", inputs)
  navbar[[3]][[1]]$children[[1]] <- htmltools::tagAppendChild(
    navbar[[3]][[1]]$children[[1]], form)
  navbar
}


ui <- dashboardPage(
  dashboardHeader(),
  # sidebar
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem(text = "Page 1",
        tabName = "page1"),
      menuItem(text = "Page 2",
               tabName = "page2"),
      menuItem(text = "Page 3",
               tabName = "page3")
    )
  ),
  
  dashboardBody(
    # use shinyjs to hide next button at the end
    useShinyjs(),
    tabItems(
      tabItem(tabName = "page1",
              plotOutput("plot1")),
      tabItem(tabName = "page2",
              plotOutput("plot2")),
      tabItem(tabName = "page3",
              plotOutput("plot3"))
    ),
    # Add bottom navigation bar with next button
    navbarPageWithInputs(
      "Test app",
      position = "fixed-bottom",
      inputs = actionButton("next_button",
                            label = "Next: Page 2")
    )
    )
 )


server <- function(input, output, session) {
  
  observeEvent(input$next_button, {
    # when next button is clicked, switches page
    newtab <- switch(input$sidebar,
                     "page1" = "page2",
                     "page2" = "page3")
    updateTabItems(session, "sidebar", newtab)
    
  })
  
  # updates label of the action button when clicked
  label_options <- c(
    "page1" = "Page 2",
    "page2" = "Page 3",
    "page3" = ""
  )
  
  observeEvent(input$sidebar, {
    text <- label_options[[input$sidebar]]
    updateActionButton(session, "next_button", label = paste("Next: ", text))
    
  })
  
  # Hides next button at the end
  observe({
    toggle(id = "next_button",
           condition = input$sidebar != "page3")
  })

  
  # Code to render plots in pages
  output$plot1 <- renderPlot({
    plot(mpg~disp, mtcars)
  })
  output$plot2 <- renderPlot({
    hist(rnorm(100))
  })
  output$plot3 <- renderPlot({
    hist(rpois(100, 5))
  })
}

shinyApp(ui, server)
