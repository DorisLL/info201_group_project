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
                  choices = list("HIGH POINT" = 1, "SLU/CASCADE" = 2, 
                                 "SANDPOINT" = 3, "LAKEWOOD/SEWARD PARK" = 4, 
                                 "DOWNTOWN COMMERCIAL" = 5,"BELLTOWN" = 6, 
                                 "SODO" = 7, "CAPITOL HILL" = 8,
                                 "BALLARD SOUTH" = 9, "WALLINGFORD" = 10, 
                                 "MAGNOLIA" = 11, "UNIVERSITY" = 12, 
                                 "NORTHGATE" = 13, "PIONEER SQUARE" = 14, 
                                 "CENTRAL AREA/SQUIRE PARK" = 15, 
                                 "BALLARD NORTH" = 16, "FAUNTLEROY SW" = 17,
                                 "LAKECITY" = 18, "EASTLAKE - EAST" = 19,
                                 "QUEEN ANNE" = 20, "MADISON PARK" = 21, 
                                 "ROXHILL/WESTWOOD/ARBOR HEIGHTS" = 22,
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
      plotOutput("graphone"),
      textOutput("graphone_intro")
    )
  )
)
