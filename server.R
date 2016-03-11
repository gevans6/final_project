library(shiny)
library(plotly)
library(dplyr)

source('graph_SingleByAge .R')

allRaces <- read.csv("498_data/Tab01-AllRaces.csv")
asian <- read.csv("498_data/Tab01-AsianAlone.csv")
asianCombo <- read.csv("498_data/Tab01-AsianAloneOrInCombination.csv")
black <- read.csv("498_data/Tab01-BlackAlone.csv")
blackCombo <- read.csv("498_data/Tab01-BlackAloneOrInCombination.csv")
cFB <- read.csv("498_data/Tab01-ChildrenOfForeignBorn.csv")
foreign <- read.csv("498_data/Tab01-ForeignBorn.csv")
hispanic <- read.csv("498_data/Tab01-Hispanic.csv")
white <- read.csv("498_data/Tab01-WhiteAlone.csv")
whiteNonH <- read.csv("498_data/Tab01-WhiteAloneNonHispanic.csv")
whiteCombo <- read.csv("498_data/Tab01-WhiteAloneOrInCombination.csv")
whiteComboNonH <- read.csv("498_data/Tab01-WhiteAloneOrInCombinationNonHispanic.csv")

shinyServer(function(input, output) {
  
  output$scatter <- renderPlotly({ 
        customDF<- data.frame(Ages=character())
        if(input$dfSelection == 1) {
          customDF <- combine_sets(customDF, allRaces)
        }
        if(input$dfSelection == 2) {
          customDF <- combine_sets(customDF, asian)
        }
        if(input$dfSelection == 3) {
          customDF <- combine_sets(customDF, asianCombo)
        }
        if(input$dfSelection == 4) {
          customDF <- combine_sets(customDF, black)
        }
        if(input$dfSelection == 5) {
          customDF <- combine_sets(customDF, blackCombo)
        }
        if(input$dfSelection == 6) {
          customDF <- combine_sets(customDF, cFB)
        }
        if(input$dfSelection == 7) {
          customDF <- combine_sets(customDF, foreign)
        }
        if(input$dfSelection == 8) {
          customDF <- combine_sets(customDF, hispanic)
        }
        if(input$dfSelection == 9) {
          customDF <- combine_sets(customDF, white)
        }
        if(input$dfSelection == 10) {
          customDF <- combine_sets(customDF, whiteNonH)
        }
        if(input$dfSelection == 11) {
          customDF <- combine_sets(customDF, whiteCombo)
        }
        if(input$dfSelection == 12) {
          customDF <- combine_sets(customDF, whiteComboNonH)
        }
  
  
    graph_SingleByAge(customDF, input$ySelection)
  })
})