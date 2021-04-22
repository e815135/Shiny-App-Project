#' Navigation Bar with Input Widgets
#'
#' @param ... Arguments in shiny::navbarPage
#' @param input1 first input widget
#' @param input2 second input widget
#'
#' @return A navigation bar with input widgets within it
#' @import shiny

navbarPageWithInputs <- function(..., input1, input2) {
  navbar <- navbarPage(...)
  
  form <- tags$form(class = "navbar-form", input1)
  navbar[[3]][[1]]$children[[1]] <- htmltools::tagAppendChild(
    navbar[[3]][[1]]$children[[1]], form)
  
  form <- tags$form(class = "navbar-form", input2)
  navbar[[3]][[1]]$children[[1]] <- htmltools::tagAppendChild(
    navbar[[3]][[1]]$children[[1]], form)

  navbar
}