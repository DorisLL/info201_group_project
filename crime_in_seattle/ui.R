library(shiny)

#Set working directory
working_directory <- getwd()
setwd(working_directory)

#Import Data
seattle <- read.csv(file = 'data/updated_crime_data')

#Organize Neighborhood by name
place <- unique(updated_crime_data$Neighborhood)
neighborhoods <- list(place)

#Organize Crime types by name
crime <- unique(updated_crime_data$Crime.Subcategory)
crime_type <- list(crime)


# Define UI
ui <- fluidPage(
  titlePanel("Crime Rates in Seattle"),
  sidebarLayout(
    sidebarPanel(
      #Neighborhood 
      selectInput("select", label = h3("Neighborhood"),
                  choices = neighborhoods,
                  selected = 1),
      
      #Type of Crime
      selectInput("select", label = h3("Type of Crime"),
                  choices = crime_type,
                  selected = 1),
      
      #Time Period Range
      sliderInput("Range", label = h3("Year:"),  
                  ## unique(data$columnYouWant)
                  min = 2008, max = 2018, value = 2013)
    ),
    
    mainPanel(
      #plotOutput("distPlot")
    )
  )
)