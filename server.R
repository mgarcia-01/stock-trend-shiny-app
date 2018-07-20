#this gets data for server #


appServer <- shinyServer(function(input, output) {
  
  dataInput <- reactive(
    {stockdf[which(as.character(stockdf$BGN_DATEP) >= input$dates[1] &
                     as.character(stockdf$BGN_DATEP) <= input$dates[2])
             ,]
    }
  )
  
  output$plot <- renderPlot({
    
    timeline <- c(startrange,endrange)
    closelim <- c(ystart,yend)
    plot(dataInput()$BGN_DATEP
         ,dataInput()$close
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Closing Price"
         ,xlim = timeline
         ,ylim = closelim
         ,col = "dodger blue"
         ,lwd = 2
    )
    abline(v = mean(dataInput()$BGN_DATEP), col = "red", lwd = 2)
  })
})