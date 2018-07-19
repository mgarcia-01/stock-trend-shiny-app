### Functions for app


apiPath <- "~/documents/api_keys/alphavantage.csv"
apiDf <- read.csv(apiPath)
apiKey <- as.character(apiDf[1,1])
# url for json file
  #alphaURLJson <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=MSFT&apikey=",apiKey)
# download csv
ticker <- as.character("BSX")
#alphaURL <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=",ticker,"&interval=1min&apikey=",apiKey,"&datatype=csv")

alphaURL <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=",ticker,"&outputsize=full","&apikey=",apiKey,"demo&datatype=csv")
destFile <- paste0(getwd(),"/",ticker,".csv")

#downloadStock <- function(){
#  listFiles <- list.files()
#  bsxFile <- listFiles[which(listFiles == "BSTX.csv")]
 # if()}

## Already downloaded once ##
#download.file(url = alphaURL, destfile = destFile)
stockdf <- read.csv(destFile)


BGN_DATEP <- as.POSIXct(unlist(stockdf$timestamp), tz = "GMT")
BGN_MONTH <- strftime(stockdf$timestamp, "%m")
BGN_YEAR <- strftime(stockdf$timestamp, "%Y")
BGN_DATES <- data.frame(BGN_MONTH,BGN_YEAR,BGN_DATEP)
tmeventSeries <- cbind(BGN_DATES ,stockdf)
stockAgg <- aggregate(close ~ BGN_DATEP, tmeventSeries, FUN = mean)
stockdf <- stockAgg
rm(stockAgg)
dateRange <- stockdf$BGN_DATEP
startrange <- dateRange[1]
endrange <- dateRange[length(dateRange)]


#stockAgg <- aggregate(close ~ BGN_MONTH+ BGN_YEAR, tmeventSeries, FUN = mean)
#tmSeriesAgI <- aggregate(INJURIES~ BGN_MONTH+ BGN_YEAR, tmeventSeries, FUN = sum)
#tmSeriesAg <- merge(tmSeriesAgF,tmSeriesAgI, by = c("BGN_MONTH", "BGN_YEAR"))


