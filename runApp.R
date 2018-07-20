#This is used to run the app
library(shiny)
library(plotly)
locldir <- as.character(getwd())
suppressWarnings(
            runApp(locldir)
)