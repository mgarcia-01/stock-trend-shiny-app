#this gets data for server #


appServer <- shinyServer(function(input, output) {
  
  dataInput <- 
  output$plot <- renderPlot({
    stockdfPlot <- 
    stockdf[which(stockdf$BGN_DATEP>= input$dateRange| 
                    stockdf$BGN_DATEP<=input$dateRange),]
    plot(stockdf$BGN_DATEP, stockdf$close
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Closing Price")
    })
})
