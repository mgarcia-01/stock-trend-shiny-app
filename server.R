#this gets data for server #
suppressWarnings(source(paste0(getwd(),"/","appAPI.R")))
library(shiny)
source(paste0(getwd(),"/","appAPI.R"))

appServer <- shinyServer(function(input, output) {
  
  dateInput <- stockdf
  
          output$plot <- renderPlot({
            plot(stockdf$BGN_DATEP, stockdf$close
                 ,type = "l"
                 ,xlab = "Date"
                 ,ylab = "Closing Price")
            
          })
          
        })
