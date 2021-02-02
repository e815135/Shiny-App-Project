
# Setting up Shiny

#install.packages("shiny")
#install.packages("shinydashboard")
#install.packages("shinyWidgets")
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(DiagrammeR)

flowchart1 <- grViz("
    digraph boxes_and_circles {
    
      # a 'graph' statement
      graph [overlap = true, fontsize = 10]
    
      node [shape = circle,
            fixedsize = true,
            color = grey,
            width = 0.3,
            fontsize = 10] // sets as circles
      C0; C1
    
      # several 'edge' statements
      C0->C1 [arrowsize = 0.5, color = blue]
    }
    ")
flowchart2 <- grViz("
    digraph boxes_and_circles {
    
      # a 'graph' statement
      graph [overlap = true, fontsize = 10]
    
      node [shape = circle,
            fixedsize = true,
            color = grey,
            width = 0.3,
            fontsize = 10] // sets as circles
      C0; C1; C2
    
      # several 'edge' statements
      C0->C1 [arrowsize = 0.5, color = blue] C0->C2 [arrowsize = 0.5, color = yellow]
    }
    ")

#################################
######### app ###################
#################################

ui <- dashboardPage(
  
  ############## header
  
  dashboardHeader(title = "Learning Git"),
  
  
  ############## sidebar
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Introduction", tabName = "introduction", icon = icon("introduction")),
      menuItem("1. Getting Started", 
               menuSubItem("1.1 Set Up", tabName = "setup", icon = icon("setup")),
               menuSubItem("1.2 Working with Files", tabName = "workingwithfiles", icon = icon("workingwithfiles")),
               tabName = "gettingstarted", icon = icon("gettingstarted")),
      menuItem("2. Branching", tabName = "branching", icon = icon("branching"))
    )
  ),
  
  ############## body

  dashboardBody(
    tabItems(
      # INTRODUCTION PAGE
      tabItem(tabName = "introduction",
              fluidRow(
                box(title = "Introduction", width = 12,
                    tags$div("Never heard of Git of before?", tags$br(),
                             "Heard of it but haven’t got the foggiest?", tags$br(), 
                             "Just need a refresher?", tags$br(""),
                             "This app provides an", tags$b("interactive step-by-step guide"), 
                             "to the basics of using Git for Version Control.")),
                box(title = "What is Version Control?", width = 12,
                    tags$div("Simply put:", tags$br(""),
                             tags$b(tags$em("Version control is a system that records changes 
                                             to a file or set of files over time so that you can 
                                             recall specific versions later.")),
                             tags$br(), tags$em("- Scott Chacon and Ben Straub"),
                             tags$br(""),
                             "Version control is very useful when collaborating on code 
                             and allows you to work on new features in an isolated environment.")),
                box(title = "What is Git?", width = 12,
                    tags$div(tags$b("Git is a version control system."), "It is a better and easier 
                             solution than other version control systems, e.g. Subversion 
                             and SourceSafe,", tags$br(), " and can be used through a command line/terminal or a GUI (Graphical User Interface). "
                             ))
              )),
      # SET UP PAGE
      tabItem(tabName = "setup",
              fluidRow(
                box(title = "setting up git bash to work in and explain using git bash and terminology")
              )),
      # WORKING WITH FILES PAGE
      tabItem(tabName = "workingwithfiles",
              fluidRow(
                box(title = "Working with Files", width = 12,
                    tags$div("It is important to understand how to navigate through files
                             in your system.",
                             tags$br(),
                             "This chapter covers creating and navigating working directories, as well as
                             giving you the chance to become familar with the command line.")),
                box(title = "Creating a Working Directory", width = 6,
                    tags$div("A ", tags$b("working directory")," is a location where you would like to work in.",
                             tags$br(), "Let's look at an example:",
                             tags$br(""), "I would like to set my working directory as the folder 'name'.
                             To do this, I use the command ", tags$code("cd"), " followed by the file path to 
                             the folder. In this case my file path is Users/name:",
                             tags$br(""),
                             tags$code("$ cd Users/name"),
                             tags$br(""),
                             "This does not return any output to the screen. To see my current working directory I run the command ",
                             tags$code("pwd"), " which gives the file path:",
                             tags$br(""),
                             tags$code("$ pwd"), tags$br(),
                             tags$code("/c/Users/name")
                             ))
              )),
      # BRANCHING PAGE
      tabItem(tabName = "branching",
              fluidRow(
                box(title = "Making a Commit", width = 12,
                    tags$div("When a change is made, you can commit this change by running",
                             tags$code("git commit"))),
                box(title = "Make commit on master branch", 
                   actionBttn(inputId = "run1", label = "Run", style = "fill")),
                box(title = "Diagramme1", grVizOutput(outputId = "diagramme1"), width = 6),
                box(title = "Make commit on bugFix branch", 
                    actionBttn(inputId = "run2", label = "Run", style = "fill")),
                box(title = "Diagramme2", grVizOutput(outputId = "diagramme2"), width = 6)
               )
      )
      
      )
    ),
  
  ############## skin
  
  skin = "yellow"
  
  
)

server <- function(input, output){
  
  # BRANCHING PAGE
  val1 <- eventReactive(input$run1,
                       flowchart1)
  output$diagramme1 <- renderGrViz(val1())
  val2 <- eventReactive(input$run2,
                       flowchart2)
  output$diagramme2 <- renderGrViz(val2())
  
}

shinyApp(ui, server)



