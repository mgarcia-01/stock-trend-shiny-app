#arima test
a <- arima(stockdf$close,c(1,0,0))
aRes <- a$residuals
