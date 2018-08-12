#time series lag - percent change
timeSer <- function(dataframe = NULL){
  stockdf <- dataframe
  zlag <- zoo::zoo(stockdf$close)
  stockdf$mvgAvg <- movingAverage(x = stockdf$close, n = 90, centered = FALSE)
  stockdf$sm <- forecast::ma(stockdf$close, order = 90, centre = FALSE)
  stockdf$lag <- lag(x = zlag, k = -1, na.pad = TRUE)
  stockdf$pctchg <- round((stockdf$close-stockdf$lag)/stockdf$lag,3)
  stockdf <- stockdf[-1,]
  
  dateRange <- stockdf$BGN_DATEP
  startrange <- dateRange[1]
  endrange <- dateRange[length(dateRange)]
  ystart <- min(stockdf$pctchg)
  yend <- max(stockdf$pctchg)
  closestart <- min(stockdf$close)
  closeend <- max(stockdf$close)
  return(stockdf)
}