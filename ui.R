library(shiny)
library(plotly)
suppressWarnings(source(paste0(getwd(),"/","appAPI.R")))

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
    # Application title
  titlePanel("Stock Trend Analysis"),
  
  sidebarLayout(
    sidebarPanel(
  
  dateRangeInput('dateRange',
                 label = 'Select date range: yyyy-mm-dd',
                 #start = Sys.Date() - 2, end = Sys.Date()
                 start = as.character(startrange), end = as.character(endrange)
                 )
        ),
  mainPanel(plotOutput("plot"))
                )
                          )
)


## does not need this
#shinyApp(ui, server = function(input, output) { })