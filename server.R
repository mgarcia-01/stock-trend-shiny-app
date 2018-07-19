#this gets data for server #
suppressWarnings(source(paste0(getwd(),"/","appAPI.R")))
library(shiny)


appServer <- shinyServer(function(input, output) {
  
          output$plot <- renderPlot({
            chartSeries(dataInput()
                        , theme = chartTheme("white")
                        ,type = "line"
                        , log.scale = input$log
                        , TA = NULL
                        )
            
          })
          
        })
