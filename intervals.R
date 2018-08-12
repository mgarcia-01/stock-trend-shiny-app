# confidence and prediction intervals

timeModel <- function(dataframe = NULL, interval = "confidence")
  {
  stockdf <- dataframe
  
  Model1 <- lm(pctchg ~ BGN_DATEP, data = stockdf)
  
  confInterval <- predict(Model1
                          , interval = "confidence"
                          , level = 0.95
  )
  predInteval <- predict(Model1
                          , interval = "prediction"
                          , level = 0.95
  )
  
  
  ## bind the main dataset to include intervals. sloppy fix later
  
  if(interval == "prediction"){
  stockdf <- cbind(stockdf, predInteval)}
    else{stockdf <- cbind(stockdf,confInterval)}
  return(stockdf)
}