library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
    dateRangeInput('dateRange',
                 label = 'Date range input: yyyy-mm-dd',
                 start = Sys.Date() - 2, end = Sys.Date() + 2
                  ),
  
  # Application title
  titlePanel("Stock Trend Analysis")
))
shinyApp(ui, server = function(input, output) { })