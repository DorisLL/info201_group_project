library(shiny)

navbarPage(
  "Criminal Activity",
  tabPanel("About",
           titlePanel("Overview"),
           mainPanel(
             img(src = 'crime.jpg', height = 300, width = 500),
             p("The data that we explored for our final group project 
               is ‘Crime Data’ data set, which includes crime reports 
               logged in the Departments Records Management System (RMS) 
               since 2008, downloaded from", 
               a("Data.gov.",
                href = "https://catalog.data.gov/dataset/crime-data-76bd0?fbclid=IwAR34NWjPQ1rvBMGHJqf21mUXiI35vi7ul8zNjMGkmAekaRXyxx-LYgQ7A_c"),
               "The data set is provided by the Seattle Police Department 
               with reports around the Seattle area and is updated daily."),
             p("Our goal is to inform to our target audience, students and 
               homeowners who primarily work/study in or inhabit the Seattle 
               Area, which areas are the least safe around Seattle so they 
               can be more careful around those parts of town."),
             p("This can be achieved through various interactive graphs that show:"),
             tags$ol(
               tags$li("Frequencies of each type of crime in a selected neighborhood
                       in Seattle"),
               tags$li("Crime rates of selected categories of crime in a selected 
                       precinct in Seattle"), 
               tags$li("Frequencies of a selected crime throughout the day ")
               ),
             br()
             )
  ), 
  tabPanel("Graph 1",
           titlePanel("Crime Rates in Seattle by Neighborhood"),
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
           titlePanel("Crime Rates in Seattle by Precinct"),
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
           titlePanel("Crime Rates in Seattle by Time"),
           sidebarPanel(
             uiOutput("select_timecrime")
           ),
           mainPanel(
             plotOutput("times"),
             br(),
             textOutput("times_intro")
           )
          )
)