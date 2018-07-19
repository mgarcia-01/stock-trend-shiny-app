library(shiny)


# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
    # Application title
  titlePanel("Stock Trend Analysis"),
  
  sidebarLayout(
  
  dateRangeInput('dateRange',
                 label = 'Select date range: yyyy-mm-dd',
                 #start = Sys.Date() - 2, end = Sys.Date()
                 start = as.character(startRange), end = as.character(endRange)
                 ),
  mainPanel(plotOutput("plot"))
                )
                          )
)

shinyApp(ui, server = function(input, output) { })