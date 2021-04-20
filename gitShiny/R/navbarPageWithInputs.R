#' navbarPageWithInputs
#'
#' This function allows for an action button to be placed within a navigation bar.
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