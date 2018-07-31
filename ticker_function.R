# ticker function 
 #this will be used in server file to provide reactive selection of stock symbols

downloadStock <- function(){
  listFiles <- list.files()
  bsxFile <- listFiles[which(listFiles == "BSTX.csv")]
 }


apiPath <- "~/documents/api_keys/alphavantage.csv"
apiDf <- read.csv(apiPath)
apiKey <- as.character(apiDf[1,1])
# url for json file
#alphaURLJson <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=MSFT&apikey=",apiKey)
# download csv
ticker <- as.character("BSX")
alphaURL <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=",ticker,"&interval=1min&apikey=",apiKey,"&datatype=csv")

alphaURL <- paste0("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol="
                   ,ticker
                   ,"&outputsize=full","&apikey="
                   ,apiKey
                   ,"demo&datatype=csv"
)

destFile <- paste0(getwd(),"/",ticker,".csv")
fileName <- paste0(ticker,".csv")


## This function checks if the csv file for ticker symbol exists.
  # If it doesn't then it downloads new file
downloadStock <- function(){
  listFiles <- list.files()
  existFiles <- listFiles[which(listFiles == fileName)]
  if(length(existFiles) == 0){
    download.file(url = alphaURL, destfile = destFile)
  }
}