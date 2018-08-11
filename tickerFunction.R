# ticker function 
 #this will be used in server file to provide reactive selection of stock symbols
#apiPath <- "~/documents/api_keys/alphavantage.csv"
setTicker <- function(tickersymbol = 'AMZN')(
{
  
  ticker <- as.character(tickersymbol)
  apiPath <- paste0(getwd(),"/","alphavantage.csv")
  apiDf <- read.csv(apiPath)
  apiKey <- as.character(apiDf[1,1])
  # url for json file
  #alphaURLJson <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=MSFT&apikey=",apiKey)
  # download csv
  
    # removed AMZN with expression
  
  #exponential moving average data
  emaStock <- paste0("https://www.alphavantage.co/query?function=EMA&symbol="
                     ,ticker,"&interval=1min&apikey="
                     ,apiKey
                     ,"&datatype=csv")
  
  #alphaURL <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=",ticker,"&interval=1min&apikey=",apiKey,"&datatype=csv")
  
  alphaURL <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol="
                     ,ticker
                     ,"&outputsize=full","&apikey="
                     ,apiKey
                     ,"demo&datatype=csv"
                     )
  
  destFile <- paste0(getwd(),"/",ticker,".csv")
  fileName <- paste0(ticker,".csv")
  
## from downloadstock function
  listFiles <- list.files()
  existFiles <- listFiles[which(listFiles == fileName)]
  if(length(existFiles) == 0){
    download.file(url = alphaURL, destfile = destFile)
  }
 stockdf <- read.csv(destFile)
 return(stockdf)
}
)

