#this gets data for server #


appServer <- shinyServer(function(input, output) {
  
  dataInput <- reactive(
    {stockdf[which(as.character(stockdf$BGN_DATEP) >= input$dates[1] &
                     as.character(stockdf$BGN_DATEP) <= input$dates[2])
             ,]
    }
  )
  
  dataInput2 <- reactive(
    {optList <- as.numeric(c(1:365))
     optList[which(optList == input$lags)]
     }
  )
  #################
  dataInput3 <- reactive(
    {tickerSymbol <- as.character(input$ticker)}
    )
  
  ####################
  
output$plot <- renderPlot({
    startrange <- min(dataInput()$BGN_DATEP)
    endrange <- max(dataInput()$BGN_DATEP)
    timeline <- c(startrange,endrange)
    pctchglim <- c(ystart,yend)
    closelim <- c(closestart,closeend)
    

## does not need par function as the plots are not in same output.
## two outputs created vs 1.
    #par(mfrow=c(2,1), mai = c(0.80, 0.80, 0.1, 0.1), pty = "m")
    plot(dataInput()$BGN_DATEP
         ,dataInput()$pctchg
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Price Percent Change"
         ,xlim = timeline
         ,ylim = pctchglim
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
  output$plot2 <- renderPlot({
    startrange <- min(dataInput()$BGN_DATEP)
    endrange <- max(dataInput()$BGN_DATEP)
    timeline <- c(startrange,endrange)
    pctchglim <- c(ystart,yend)
    closelim <- c(closestart,closeend)
    stockdf$sm <- ma(stockdf$close, order = as.numeric(dataInput2())
                     ,centre = FALSE)
    
    #par(mfrow=c(2,1), mai = c(0.80, 0.80, 0.1, 0.1), pty = "m")
    plot(dataInput()$BGN_DATEP
         ,dataInput()$close
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Closing Price"
         ,xlim = timeline
         ,ylim = closelim
         ,col = "dodger blue"
         ,lwd = 2.75
    )
    #lines(x = dataInput()$BGN_DATEP
    #      ,y = dataInput()$mvgAvg
    #      ,type = "l"
    #      ,col = 54#"orange"
    #      ,lwd = 2
    #      )
    lines(x = stockdf$BGN_DATEP
          ,y= stockdf$sm
          ,col = "green"
          ,lwd = 2)
    
  })
})