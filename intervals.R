# confidence and prediction intervals

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
stockdf <- cbind(stockdf, predInteval)