#this gets data for server #


appServer <- shinyServer(function(input, output) {
  
  dataInput3 <- reactive({
    a <- as.data.frame(dataframePrep(tickersym = input$ticker))
    b <- timeSer(dataframe = a)
    c <- timeModel(dataframe = b, interval = 'confidence')
    stockdf <- c
    stockdf
    }
    )
#stockdf <- dataInput3()

  
  dataInput <- reactive(
    {dataInput3()[which(as.character(dataInput3()$BGN_DATEP) >= input$dates[1] &
                     as.character(dataInput3()$BGN_DATEP) <= input$dates[2])
             ,]
    }
  )
  
  dataInput2 <- reactive(
    {optList <- as.numeric(c(1:730))
     optList[which(optList == input$lags)]
     }
  )
  #################
  #dataInput3 <-
  
  #################
  
  #dataInput4 <- reactive(
  #  {stockdf$sm <- ma(stockdf$close, order = as.numeric(dataInput2())
  #                    ,centre = FALSE)
  #   stockdf[complete.cases(stockdf),]}
  #  )
  dataInput5 <- reactive(
    {stockdf <- dataInput()
     stockdf$mvavg <- movingAverage(stockdf$close
                                    , n = as.numeric(dataInput2())
                                    , centered = FALSE)
     stockdf
    }
  )
  
output$plot <- renderPlot({
  dateRange <- dataInput5()$BGN_DATEP
  startrange <- dateRange[1]
  endrange <- dateRange[length(dateRange)]
  ystart <- min(dataInput5()$pctchg)
  yend <- max(dataInput5()$pctchg)
  closestart <- min(dataInput5()$close)
  closeend <- max(dataInput5()$close)
  
      startrange <- min(dataInput5()$BGN_DATEP)
      endrange <- max(dataInput5()$BGN_DATEP)
      timeline <- c(startrange,endrange)
      pctchglim <- c(ystart,yend)
      closelim <- c(closestart,closeend)
    

## does not need par function as the plots are not in same output.
## two outputs created vs 1.
    #par(mfrow=c(2,1), mai = c(0.80, 0.80, 0.1, 0.1), pty = "m")
    plot(dataInput5()$BGN_DATEP
         ,dataInput5()$pctchg
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Price Percent Change"
         ,xlim = timeline
         ,ylim = pctchglim
         ,col = "dodger blue"
         ,lwd = 2
    )
    
          lines(x = dataInput5()$BGN_DATEP
                ,y = dataInput5()$upr
                ,type = "l"
                ,col = "orange"
                ,lwd = 1
                )
          lines(x = dataInput5()$BGN_DATEP
                ,y = dataInput5()$lwr
                ,type = "l"
                ,col = "orange"
                ,lwd = 1
              )
          lines(x = dataInput5()$BGN_DATEP
                ,y = dataInput5()$fit
                ,type = "l"
                ,col = "green"
                ,lwd = 1
          )
  })
  output$plot2 <- renderPlot({
    dateRange <- dataInput5()$BGN_DATEP
    startrange <- dateRange[1]
    endrange <- dateRange[length(dateRange)]
    ystart <- min(dataInput5()$pctchg)
    yend <- max(dataInput5()$pctchg)
    closestart <- min(dataInput5()$close)
    closeend <- max(dataInput5()$close)
    
      startrange <- min(dataInput5()$BGN_DATEP)
      endrange <- max(dataInput5()$BGN_DATEP)
      timeline <- c(startrange,endrange)
      pctchglim <- c(ystart,yend)
      closelim <- c(closestart,closeend)
  #  stockdf$sm <- ma(stockdf$close, order = as.numeric(dataInput2())
  #                   ,centre = FALSE)
    
    
    
    #par(mfrow=c(2,1), mai = c(0.80, 0.80, 0.1, 0.1), pty = "m")
    plot(dataInput5()$BGN_DATEP
         ,dataInput5()$close
         ,type = "l"
         ,xlab = "Date"
         ,ylab = "Closing Price"
         ,xlim = timeline
         ,ylim = closelim
         ,col = "dodger blue"
         ,lwd = 3.25
    )
    lines(x = dataInput5()$BGN_DATEP
          ,y = dataInput5()$mvavg
         ,type = "l"
         ,col = "orange" #54
         ,lwd = 3
          )
    
  })
})