library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)

crime_data <- read.csv('data/updated_crime_data.csv', stringsAsFactors = FALSE) %>% data.frame()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  d <- reactive({
    chosen_neighborhood <- toupper(input$neighborhood)
    data <- filter(crime_data, Neighborhood == chosen_neighborhood)
    data
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
    p
  })
  
  output$graphone_intro <- renderText({
    paste0("This graph shows the frequencies of each crime subcategory for the ", input$neighborhood, " neighborhood.")
  })

  output$plot <- renderPlot({
    if(is.null(input$allprecinct)| is.null(input$allsubcat))
      return()
    selected_data <- filter(crime_data, crime_data$Year >= input$years[1], crime_data$Year <= input$years[2],
                            crime_data$Precinct %in% toupper(input$allprecinct),
                            crime_data$Crime.Subcategory %in% toupper(input$allsubcat)
    )
    data_use <- count(group_by(selected_data, Year, Precinct))
    ggplot(data_use, aes(Year, n, group = data_use$Precinct)) +
      ggtitle("Seattle Crime Rates") +
      xlab("Year") + ylab("Rate of Crime") +
      geom_line(aes(col = Precinct)) +
      geom_point(aes(col = Precinct))
  })

  output$select_nh <- renderUI({
    selectInput("neighborhood", label = h3("Select neighborhood"), 
                choices = tolower(unique(crime_data$Neighborhood)))
  })
  output$select_pc <-renderUI({
    checkboxGroupInput("allprecinct", label = h3("Select precincts"),
                       tolower(unique(crime_data$Precinct)))
  })
  
  output$select_type <- renderUI ({
    checkboxGroupInput("allsubcat", label = h3("Select categories of crime"),
                       tolower(unique(crime_data$Crime.Subcategory)), tolower(unique(crime_data$Crime.Subcategory)))
  })
  
  output$lowest_rate <- renderText ({
    if(is.null(input$allprecinct)| is.null(input$allsubcat))
      return()
    selected_data <- filter(crime_data, crime_data$Year >= input$years[1], crime_data$Year <= input$years[2],
                            crime_data$Precinct %in% toupper(input$allprecinct),
                            crime_data$Crime.Subcategory %in% toupper(input$allsubcat)
    )
    data_use <- count(group_by(selected_data, Year, Precinct))
    sum_pc <- data_use %>% 
      group_by(Precinct) %>% 
      summarise(sum(n))
    lowest_name <- filter(sum_pc, sum_pc$`sum(n)` == min(sum_pc$`sum(n)`))$Precinct
    highest_name <- filter(sum_pc, sum_pc$`sum(n)` == max(sum_pc$`sum(n)`))$Precinct
    paste("Within the selected precincts, ", lowest_name, 
          " Seattle has the lowest crime rate in general throughout the selected years (",
          input$years[1], "-", input$years[2], "), with the selected categories of crime. 
          In contrast, ", highest_name, " has the highest crime rate.")

  })
  
})
