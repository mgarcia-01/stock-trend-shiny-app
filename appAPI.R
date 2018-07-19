### Functions for app


apiPath <- "~/documents/api_keys/alphavantage.csv"
apiDf <- read.csv(apiPath)
apiKey <- as.character(apiDf[1,1])
# url for json file
  #alphaURLJson <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=MSFT&apikey=",apiKey)
# download csv
ticker <- as.character("BSX")
#alphaURL <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=",ticker,"&interval=1min&apikey=",apiKey,"&datatype=csv")

alphaURL <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=",ticker,"&apikey=",apiKey,"demo&datatype=csv")
destFile <- paste0(getwd(),"/",ticker,".csv")
download.file(url = alphaURL, destfile = destFile)
stockdf <- read.csv(destFile)




daterange1 <- unique(as.Date(stockdf$timestamp))