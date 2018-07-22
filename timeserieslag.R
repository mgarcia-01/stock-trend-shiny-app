#time series lag - percent change
zlag <- zoo::zoo(stockdf$close)
stockdf$lag <- lag(x = zlag, k = -1, na.pad = TRUE)
stockdf$pctchg <- round((stockdf$close-stockdf$lag)/stockdf$lag,3)
stockdf <- stockdf[-1,]



dateRange <- stockdf$BGN_DATEP
startrange <- dateRange[1]
endrange <- dateRange[length(dateRange)]
ystart <- min(stockdf$pctchg)
yend <- max(stockdf$pctchg)