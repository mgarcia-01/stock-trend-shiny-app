#This is used to run the app
library(shiny)
library(forecast)
library(plotly)
library(ggplot2)
suppressWarnings(source(paste0(getwd(),"/","appAPI.R")))
suppressWarnings(source(paste0(getwd(),"/","mvgavgfunc.R")))
suppressWarnings(source(paste0(getwd(),"/","timeserieslag.R")))
suppressWarnings(source(paste0(getwd(),"/","intervals.R")))

locldir <- as.character(getwd())
runApp(locldir)