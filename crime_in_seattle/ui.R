library(shiny)

navbarPage(
  "Criminal Activity",
  tabPanel("Graph 1",
           titlePanel("Crime Rates in Seattle"),
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
  ),
  tabPanel("Graph 2", "This panel is intentionally left blank"),
  tabPanel("About", "This panel is intentionally left blank")
)