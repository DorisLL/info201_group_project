#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- fluidPage(
  titlePanel("Crimes in Seattle"),
  sidebarLayout(
    sidebarPanel(
      helpText("You can see what kind of crimes occurred 
               in a selected the neighborhood."),
      selectInput("neighborhood", label = h3("Select neighborhood"), 
                  choices = list("HIGH POINT" = "High Point", "SLU/CASCADE" = "SLU/Cascade", 
                                 "SANDPOINT" = "Sandpoint", "LAKEWOOD/SEWARD PARK" = "Lakewood/Seward Park", 
                                 "DOWNTOWN COMMERCIAL" = "Downtown Commercial","BELLTOWN" = "Belltown", 
                                 "SODO" = "SODO", "CAPITOL HILL" = "Capitol Hill",
                                 "BALLARD SOUTH" = "Ballard South", "WALLINGFORD" = "Wallingford", 
                                 "MAGNOLIA" = "Magnolia", "UNIVERSITY" = "University", 
                                 "NORTHGATE" = "Northgate", "PIONEER SQUARE" = "Pioneer Square", 
                                 "CENTRAL AREA/SQUIRE PARK" = "Central Area/Squire Park", 
                                 "BALLARD NORTH" = "Ballard North", "FAUNTLEROY SW" = "Fauntleroy SW",
                                 "LAKECITY" = "Lakecity", "EASTLAKE - EAST" = "Eastlake - East",
                                 "QUEEN ANNE" = "Queen Anne", "MADISON PARK" = "Madison Park", 
                                 "ROXHILL/WESTWOOD/ARBOR HEIGHTS" = "Roxhill/Westwood/Arbor Heights",
                                 "PHINNEY RIDGE" = 23, "MILLER PARK " = 24, 
                                 "ROOSEVELT/RAVENNA" = 25,
                                 "NORTH BEACON HILL" = 26, 
                                 "MADRONA/LESCHI" = 27, 
                                 "EASTLAKE - WEST " = 28, 
                                 "CHINATOWN/INTERNATIONAL DISTRICT" = 29,
                                 "NORTH DELRIDGE" = 30, "BITTERLAKE" = 31,
                                 "ALASKA JUNCTION" = 32, "GREENWOOD" = 33,
                                 "FIRST HILL" = 34, "SOUTH DELRIDGE" = 35,
                                 "NEW HOLLY" = 36, "GEORGETOWN" = 37,
                                 "RAINIER VIEW" = 38, "FREMONT" = 39,
                                 "JUDKINS PARK/NORTH BEACON HILL" = 40, 
                                 "RAINIER BEACH" = 41, "BRIGHTON/DUNLAP" = 42,
                                 "SOUTH PARK" = 43, "HIGHLAND PARK" = 44,
                                 "MORGAN" = 45, "MONTLAKE/PORTAGE BAY" = 46,
                                 "MID BEACON HILL" = 47, "COLUMBIA CITY" = 48,
                                 "GENESEE" = 49, "SOUTH BEACON HILL" = 50, 
                                 "NORTH ADMIRAL" = 51, "MOUNT BAKER" = 52, 
                                 "ALKI" = 53, "HILLMAN CITY" = 54, 
                                 "COMMERCIAL HARBOR ISLAND" = 55, 
                                 "PIGEON POINT" = 56, 
                                 "CLAREMONT/RAINIER VISTA" = 57, 
                                 "COMMERCIAL DUWAMISH" = 58), 
                  selected = 1)), 

    # Show a bar chart of neighborhood vs. subcatagories of crimes. 
    mainPanel(
      textOutput("graphone_intro"),
      br(),
      plotOutput("graphone")
    )
  )
)
