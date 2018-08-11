stockdf <- setTicker(tickersymbol = "AMZN")
BGN_DATEP <- as.POSIXct(unlist(stockdf$timestamp), tz = "GMT")
BGN_MONTH <- strftime(stockdf$timestamp, "%m")
BGN_YEAR <- strftime(stockdf$timestamp, "%Y")
BGN_DATES <- data.frame(BGN_MONTH,BGN_YEAR,BGN_DATEP)
tmeventSeries <- cbind(BGN_DATES ,stockdf)
stockAgg <- aggregate(close ~ BGN_DATEP, tmeventSeries, FUN = mean)
stockdf <- stockAgg
rm(stockAgg)








#stockAgg <- aggregate(close ~ BGN_MONTH+ BGN_YEAR, tmeventSeries, FUN = mean)
#tmSeriesAgI <- aggregate(INJURIES~ BGN_MONTH+ BGN_YEAR, tmeventSeries, FUN = sum)
#tmSeriesAg <- merge(tmSeriesAgF,tmSeriesAgI, by = c("BGN_MONTH", "BGN_YEAR"))