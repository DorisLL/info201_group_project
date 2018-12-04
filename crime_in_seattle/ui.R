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
                                 "PHINNEY RIDGE" = "Phinney Ridge", "MILLER PARK " = "Miller Park", 
                                 "ROOSEVELT/RAVENNA" = "Roosevelt/Raveena",
                                 "NORTH BEACON HILL" = "North Beacon Hill", 
                                 "MADRONA/LESCHI" = "Madrona/Leschi", 
                                 "EASTLAKE - WEST " = "Eastlake - West", 
                                 "CHINATOWN/INTERNATIONAL DISTRICT" = "Chinatown/Internation District",
                                 "NORTH DELRIDGE" = "North Delridge", "BITTERLAKE" = "Bitterlake",
                                 "ALASKA JUNCTION" = "Alaska Junction", "GREENWOOD" = "Greenwood",
                                 "FIRST HILL" = "First Hill", "SOUTH DELRIDGE" = "South Delridge",
                                 "NEW HOLLY" = "New Holly", "GEORGETOWN" = "Georgetown",
                                 "RAINIER VIEW" = "Rainier View", "FREMONT" = "Fremont",
                                 "JUDKINS PARK/NORTH BEACON HILL" = "Judkins Park/North Beacon", 
                                 "RAINIER BEACH" = "Rainier Beach", "BRIGHTON/DUNLAP" = "Brighton/Dunlap",
                                 "SOUTH PARK" = "South Park", "HIGHLAND PARK" = "Highland Park",
                                 "MORGAN" = "Morgan", "MONTLAKE/PORTAGE BAY" = "Montlake/Portage Bay",
                                 "MID BEACON HILL" = "Mid Beacon Hill", "COLUMBIA CITY" = "Columbia City",
                                 "GENESEE" = "Genesee", "SOUTH BEACON HILL" = "South Beacon Hill", 
                                 "NORTH ADMIRAL" = "North Admiral", "MOUNT BAKER" = "Mount Baker", 
                                 "ALKI" = "Alki", "HILLMAN CITY" = "Hillman City", 
                                 "COMMERCIAL HARBOR ISLAND" = "Commercial Harbor Island", 
                                 "PIGEON POINT" = "Pigeon Point", 
                                 "CLAREMONT/RAINIER VISTA" = "Claremont/Rainier Vista", 
                                 "COMMERCIAL DUWAMISH" = "Commercial Duwamish"), 
                  selected = 1)), 

    # Show a bar chart of neighborhood vs. subcatagories of crimes. 
    mainPanel(
      plotOutput("graphone"),
      br(),
      textOutput("graphone_intro")
    )
  )
)
