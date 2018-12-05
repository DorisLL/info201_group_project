library(shiny)

ui <- fluidPage(
  titlePanel("Crimes in Seattle"),
  sidebarLayout(
    sidebarPanel(
      helpText("You can see what kind of crimes occurred 
               in a selected the neighborhood."),
      uiOutput("select_nh"),
      uiOutput("select_pc"),
      uiOutput("select_type"),
      sliderInput("years", h3("Years:"),
                  2008, 2018, 
                  c(2008, 2018))),

    # Show a bar chart of neighborhood vs. subcatagories of crimes. 
    mainPanel(
      plotOutput("graphone"),
      br(),
      textOutput("graphone_intro"),
      br(),
      plotOutput("plot"),
      br(),
      uiOutput("lowest_rate")
    )
  )
)