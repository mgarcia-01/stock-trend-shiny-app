#this gets data for server #


appServer <- shinyServer(function(input, output) {
  
  dataInput <- reactive(
    {stockdf[which(as.character(stockdf$BGN_DATEP) >= input$dates[1] &
                     as.character(stockdf$BGN_DATEP) <= input$dates[2])
             ,]
    }
  )
  
  output$plot <- renderPlot({
    startrange <- min(dataInput()$BGN_DATEP)
    endrange <- max(dataInput()$BGN_DATEP)
    timeline <- c(startrange,endrange)
    closelim <- c(ystart,yend)
    
    plot(dataInput()$BGN_DATEP
         ,dataInput()$pctchg
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Price Percent Change"
         ,xlim = timeline
         ,ylim = closelim
         ,col = "dodger blue"
         ,lwd = 2
    )
          lines(x = dataInput()$BGN_DATEP
                ,y = dataInput()$upr
                ,type = "l"
                ,col = "orange"
                ,lwd = 1
                )
          lines(x = dataInput()$BGN_DATEP
                ,y = dataInput()$lwr
                ,type = "l"
                ,col = "orange"
                ,lwd = 1
              )
          lines(x = dataInput()$BGN_DATEP
                ,y = dataInput()$fit
                ,type = "l"
                ,col = "green"
                ,lwd = 1
          )
  })
})