#this gets data for server #


appServer <- shinyServer(function(input, output) {
  
dateInput <- reactive(
  {
    
  }
)   
  
  output$plot <- renderPlot({
    
    plot(stockdf[which(as.character(stockdf$BGN_DATEP) >= input$dates[1]|
                        as.character(stockdf$BGN_DATEP) <= input$dates[2] )
                 ,]
         ,stockdf$close
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Closing Price")
    })
})
