#this gets data for server #
suppressWarnings(source(paste0(getwd(),"/","appAPI.R")))
library(shiny)


server <- shinyServer(function(input, output) {
  
          output$distPlot <- renderPlot({
            chartSeries(dataInput()
                        , theme = chartTheme("white")
                        ,type = "line"
                        , log.scale = input$log
                        , TA = NULL
                        )
            
          })
          
        })
