library(shiny)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Crime Data"),
  
  sidebarLayout(
    sidebarPanel(
       uiOutput("select_nh"),
       uiOutput("select_type"),
       sliderInput("years", h3("Years:"),
                   2008, 2018, 
                   c(2008, 2018))
    ),
    
    mainPanel(
       plotOutput("plot")
    )
  )

  )
)