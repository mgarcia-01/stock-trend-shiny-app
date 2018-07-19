#this gets data for server #


appServer <- shinyServer(function(input, output) {
  
dateInput <- reactive(
  {
    
  }
)   
  
  output$plot <- renderPlot({
    
    plot(stockdf$BGN_DATEP, stockdf$close
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Closing Price")
    })
})
