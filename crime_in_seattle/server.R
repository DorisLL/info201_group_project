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

  output$plot <- renderPlot({
    if(is.null(input$allneighborhood)| is.null(input$allsubcat))
      return()
    selected_data <- filter(crime_data, crime_data$Year >= input$years[1], crime_data$Year <= input$years[2],
                            crime_data$Neighborhood %in% toupper(input$allneighborhood),
                            crime_data$Crime.Subcategory %in% toupper(input$allsubcat)
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
                       tolower(unique(crime_data$Neighborhood)))
  })
  
  output$select_type <- renderUI ({
    checkboxGroupInput("allsubcat", label = h3("Select categories of crime"),
                       tolower(unique(crime_data$Crime.Subcategory)), tolower(unique(crime_data$Crime.Subcategory)))
  })
  
})