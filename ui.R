#load the packages
library(shiny)
library(forecast)
library(plotly)
library(ggplot2)

# source files for data wrangling

suppressWarnings(source(paste0(getwd(),"/","tickerFunction.R")))
suppressWarnings(source(paste0(getwd(),"/","appAPI.R")))
suppressWarnings(source(paste0(getwd(),"/","mvgavgfunc.R")))
suppressWarnings(source(paste0(getwd(),"/","timeserieslag.R")))
suppressWarnings(source(paste0(getwd(),"/","intervals.R")))


# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
    # Application title
          #titlePanel("Amazon Market Analysis"),
          titlePanel("Testing Shiny App"),
          sidebarLayout(
            sidebarPanel(
          
                    dateRangeInput('dates',
                                   label = 'Select Date Range: yyyy-mm-dd',
                                   #start = Sys.Date() - 2, end = Sys.Date()
                                   start = as.character(Sys.Date()-1825)
                                   ,end = as.character(Sys.Date())
                                   )
                    ,numericInput("lags", "Days lag:", 90, min = 1, max = 365)
                     #,verbatimTextOutput("value")
                    ,textInput("ticker","Ticker Symbol",value = "AMZN")
                ),
          mainPanel(verbatimTextOutput("ntext"),
                    plotOutput("plot"),
                    plotOutput("plot2")
                    )
          #,output$page1 <- renderUI({
          #                  inclRmd("./page1.Rmd")}
          #                  )
                        ),
          hr(),
          print("Copyright Michael Garcia 2018. All Rights Reserved.")
                          )
)