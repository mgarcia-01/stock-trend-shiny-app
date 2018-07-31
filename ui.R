
# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
    # Application title
          titlePanel("Amazon Market Analysis"),
          
          sidebarLayout(
            sidebarPanel(
          
                    dateRangeInput('dates',
                                   label = 'Select Date Range: yyyy-mm-dd',
                                   #start = Sys.Date() - 2, end = Sys.Date()
                                   start = as.character(startrange)
                                   ,end = as.character(endrange)
                                   )
                    ,numericInput("lags", "Days lag:", 90, min = 1, max = 365)
                     #,verbatimTextOutput("value")
                    ,textInput("ticker","Ticker Symbol",value = "AMZN")
                ),
          mainPanel(verbatimTextOutput("ntext"),
                    plotOutput("plot"),
                    plotOutput("plot2"))
                        )
                          )
)