library(shiny)
library(ggplot2)
library(dplyr)
data <- read.csv(file = "data/updated_crime_data.csv")
shinyServer(function(input, output) {
  output$plot <- renderPlot({
    if(is.null(input$allneighborhood)| is.null(input$allsubcat))
      return()
    selected_data <- filter(data, data$Year >= input$years[1], data$Year <= input$years[2],
                            data$Neighborhood %in% toupper(input$allneighborhood),
                            data$Crime.Subcategory %in% toupper(input$allsubcat)
    )
    data_use <- count(group_by(selected_data, Year, Neighborhood))
    ggplot(data_use, aes(Year, n, group = data_use$Neighborhood)) +
      ggtitle("Seattle Crime Rates") +
      xlab("Year") + ylab("Rate of Crime") +
      geom_line(aes(col = Neighborhood)) +
      geom_point()
  })
  
  output$select_nh <-renderUI({
    checkboxGroupInput("allneighborhood", label = h3("Select neighborhood"),
                       tolower(unique(data$Neighborhood)))
  })
  
  output$select_type <- renderUI ({
    checkboxGroupInput("allsubcat", label = h3("Select categories of crime"),
                       tolower(unique(data$Crime.Subcategory)), tolower(unique(data$Crime.Subcategory)))
  })
  
})
