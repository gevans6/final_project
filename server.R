library(shiny)
library(plotly)
library(dplyr)

source('graph_SingleByAge .R')

shinyServer(function(input, output) {
  output$scatter <- renderPlotly({ 
    graph_SingleByAge(input$dfSelection, input$ySelection)
  })
})