library(shiny)
library(ggplot2)
library(dplyr)

crime_data <- read.csv('data/updated_crime_data.csv', stringsAsFactors = FALSE) %>% data.frame()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  d <- reactive({
    chosen_neighborhood <- toupper(input$neighborhood)
    data <- filter(crime_data, Neighborhood == chosen_neighborhood)
    return(data)
  })
  
  output$graphone <- renderPlot({
    plot_data <- d()
    crime_subcategories <- plot_data$Crime.Subcategory
    crime_subcategories_count <- as.data.frame(table(crime_subcategories))
    crime_subcategories_count <- crime_subcategories_count[-1, ]
    names(crime_subcategories_count)[1] = "Subcategory"
    
    p <- ggplot(crime_subcategories_count) +
      geom_bar(mapping = aes(x = Subcategory, y = Freq), stat = "identity") +
      labs(title = "Frequencies of Crime Subcategories") +
      coord_flip()
    return(p)
  })
  
  output$graphone_intro <- renderText({
    paste0("This graph shows the frequencies of each crime subcategory for the ", input$neighborhood, " neighborhood.")
  })
  
})