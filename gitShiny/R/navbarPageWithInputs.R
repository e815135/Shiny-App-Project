#' Navigation Bar with Input Widgets
#' 
#' Copyright 2016 Dean Attali. Licensed under the MIT license.
#' https://github.com/daattali/advanced-shiny/tree/master/navbar-add-text
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