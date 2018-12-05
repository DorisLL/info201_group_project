library(shiny)

navbarPage(
  "Criminal Activity",
  tabPanel("Graph 1",
           titlePanel("Crime Rates in Seattle"),
             sidebarPanel(
               helpText("You can see what kind of crimes occurred 
                        in a selected the neighborhood."),
               uiOutput("select_nh")),
             
             # Show a bar chart of neighborhood vs. subcatagories of crimes. 
             mainPanel(
               plotOutput("graphone"),
               br(),
               textOutput("graphone_intro")
             )
  ),
  tabPanel("Graph 2", 
           sidebarPanel(
           uiOutput("select_pc"),
           uiOutput("select_type"),
           sliderInput("years", h3("Years:"),
                       2008, 2018, 
                       c(2008, 2018))),
           mainPanel(
             plotOutput("plot"),
             br(),
             uiOutput("lowest_rate")
             )
           ),
  tabPanel("Graph 3", 
           sidebarPanel(
             uiOutput("select_timecrime")
           ),
           mainPanel(
             plotOutput("times"),
             br(),
             textOutput("times_intro")
           )
          ),
  tabPanel("About",
           titlePanel("Summary"),
           mainPanel(
             img(src = 'crime.jpg', height = 300, width = 500)
           )
           )
)