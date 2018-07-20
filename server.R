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
    plot(dataInput()
         ,stockdf$close
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Closing Price"
         ,xlim = c(2001-01-01, 2018-01-01)
         ,ylim = c(-100,100)
    )
  })
})