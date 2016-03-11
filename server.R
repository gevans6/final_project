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
        customDF <- data.frame(Ages=character())
        yaxis <- 1
        for(i in 1:length(input$dfSelection)){
          if(input$dfSelection[i] == 1) {
          customDF <- combine_sets(customDF, allRaces)
        }
        if(input$dfSelection[i] == 2) {
          customDF <- combine_sets(customDF, asian)
        }
        if(input$dfSelection[i] == 3) {
          customDF <- combine_sets(customDF, asianCombo)
        }
        if(input$dfSelection[i] == 4) {
          customDF <- combine_sets(customDF, black)
        }
        if(input$dfSelection[i] == 5) {
          customDF <- combine_sets(customDF, blackCombo)
        }
        if(input$dfSelection[i] == 6) {
          customDF <- combine_sets(customDF, cFB)
        }
        if(input$dfSelection[i] == 7) {
          customDF <- combine_sets(customDF, foreign)
        }
        if(input$dfSelection[i] == 8) {
          customDF <- combine_sets(customDF, hispanic)
        }
        if(input$dfSelection[i] == 9) {
          customDF <- combine_sets(customDF, white)
        }
        if(input$dfSelection[i] == 10) {
          customDF <- combine_sets(customDF, whiteNonH)
        }
        if(input$dfSelection[i] == 11) {
          customDF <- combine_sets(customDF, whiteCombo)
        }
        if(input$dfSelection[i] == 12) {
          customDF <- combine_sets(customDF, whiteComboNonH)
        }
        }
        
  
        if(input$ySelection == 1) {
          yaxis <- "PercentTotalEnrolled"
        }
        if(input$ySelection == 2) {
          yaxis <- "PercentNurseKinder"
        }
        if(input$ySelection == 3) {
          yaxis <- "PercentElementary"
        }
        if(input$ySelection == 4) {
          yaxis <- "PercentHS"
        }
        if(input$ySelection == 5) {
          yaxis <- "PercentCollege"
        }
        if(input$ySelection == 6) {
          yaxis <- "PercentTotalNotEnrolled"
        }
        if(input$ySelection == 7) {
          yaxis <- "PercentHSGrad"
        }
        if(input$ySelection == 8) {
          yaxis <- "PercentNotHSGrad"
        }
        
        
        
    graph_SingleByAge(customDF, yaxis)  
  })
})
